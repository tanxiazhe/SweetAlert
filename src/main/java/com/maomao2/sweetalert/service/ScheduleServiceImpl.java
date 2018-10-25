package com.maomao2.sweetalert.service;

import com.maomao2.sweetalert.dto.ScheduleJobResponse;
import com.maomao2.sweetalert.entity.Mail;
import com.maomao2.sweetalert.job.MailJob;
import com.maomao2.sweetalert.job.WatchStockMarketJob;
import org.quartz.CronScheduleBuilder;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.UnableToInterruptJobException;
import org.quartz.impl.matchers.GroupMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class ScheduleServiceImpl implements ScheduleService {
  private final Logger logger = LoggerFactory.getLogger(this.getClass());

  @Autowired
  Scheduler scheduler;

  @Override
  public void scheduleJob(Mail mail, Date schedulerDate) {
    JobDetail emailJob = buildEmailJob(mail);
    Trigger trigger = buildTrigger(emailJob, schedulerDate);
    try {
      scheduler.scheduleJob(emailJob, trigger);
    } catch (SchedulerException e) {
      logger.error("Schedule Job failed", e);
    }
    logger.info("Schedule job succeed");
  }

  @Override
  public ScheduleJobResponse scheduleJob(String jobName, String jobGroup, String cronExp) {
    JobKey jobKey = new JobKey(jobName, jobGroup);
    try {
      if (scheduler.checkExists(jobKey)) {
        logger.error("Job name and group exist.Please use another one");
        return new ScheduleJobResponse(false, jobName, jobGroup,
            "Job name and group exist.Please use another one");
      }

      CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(cronExp);

      JobDataMap jobDataMap = new JobDataMap();
      JobDetail cronJobDetail =
          buildCronJobDetail(jobName, jobGroup, WatchStockMarketJob.class, jobDataMap);

      Trigger trigger = buildCronJobTrigger(cronJobDetail, cronScheduleBuilder);
      scheduler.scheduleJob(cronJobDetail, trigger);
    } catch (SchedulerException e) {
      logger.error("Error scheduling job", e);
      return new ScheduleJobResponse(false, jobName, jobGroup,
          "Error scheduling email. Please try later!");
    }

    logger.info("Schedule job name {}  job group {} succeed", jobName, jobGroup);
    return new ScheduleJobResponse(true, jobName, jobGroup, "Schedule job succeed.");
  }

  @Override
  public ScheduleJobResponse unScheduleJob(String jobName, String jobGroup) {
    TriggerKey triggerKey = new TriggerKey(jobName, jobGroup);
    try {
      scheduler.unscheduleJob(triggerKey);
    } catch (SchedulerException e) {
      logger.error("Error scheduling job", e);
      return new ScheduleJobResponse(false, jobName, jobGroup,
          "Error scheduling job. Please try later!");
    }

    logger.info("Unschedule job name {}  job group {} succeed", jobName, jobGroup);
    return new ScheduleJobResponse(true, jobName, jobGroup, "Unschedule job succeed.");
  }

  @Override
  public ScheduleJobResponse interruptJob(String jobName, String jobGroup) {
    JobKey jobKey = new JobKey(jobName, jobGroup);
    try {
      scheduler.interrupt(jobKey);
    } catch (UnableToInterruptJobException e) {
      logger.error("Error scheduling job", e);
      return new ScheduleJobResponse(false, jobName, jobGroup,
          "Error scheduling job. Please try later!");
    }
    logger.info("Interrupt job name {}  job group {} succeed", jobName, jobGroup);
    return new ScheduleJobResponse(true, jobName, jobGroup, "Interrupt job succeed.");
  }

  @Override
  public ScheduleJobResponse pauseJob(String jobName, String jobGroup) {
    JobKey jobKey = new JobKey(jobName, jobGroup);
    try {
      scheduler.pauseJob(jobKey);
    } catch (SchedulerException e) {
      logger.error("Error scheduling job", e);
      return new ScheduleJobResponse(false, jobName, jobGroup,
          "Error scheduling job. Please try later!");
    }
    logger.info("Pause job name {}  job group {} succeed", jobName, jobGroup);
    return new ScheduleJobResponse(true, jobName, jobGroup, "Pause job succeed.");
  }

  @Override
  public ScheduleJobResponse resumeJob(String jobName, String jobGroup) {
    JobKey jobKey = new JobKey(jobName, jobGroup);
    try {
      scheduler.resumeJob(jobKey);
    } catch (SchedulerException e) {
      logger.error("Error scheduling job", e);
      return new ScheduleJobResponse(false, jobName, jobGroup,
          "Error scheduling job. Please try later!");
    }
    logger.info("Resume job name {}  job group {} succeed", jobName, jobGroup);
    return new ScheduleJobResponse(true, jobName, jobGroup, "Resume job succeed.");
  }

  @Override
  public ScheduleJobResponse deleteJob(String jobName, String jobGroup) {
    JobKey jobKey = new JobKey(jobName, jobGroup);
    try {
      scheduler.deleteJob(jobKey);
    } catch (SchedulerException e) {
      logger.error("Error scheduling job", e);
      return new ScheduleJobResponse(false, jobName, jobGroup,
          "Error scheduling job. Please try later!");
    }

    logger.info("Delete job name {}  job group {} succeed", jobName, jobGroup);
    return new ScheduleJobResponse(true, jobName, jobGroup, "Delete job succeed.");
  }

  @Override
  public List<ScheduleJobResponse> getJobList() {
    List<ScheduleJobResponse> scheduleJobResponses = new ArrayList<>();
    try {

      for (String groupName : scheduler.getJobGroupNames()) {
        for (JobKey jobKey : scheduler.getJobKeys(GroupMatcher.jobGroupEquals(groupName))) {
          Trigger trigger = scheduler.getTriggersOfJob(jobKey).get(0);
          ScheduleJobResponse scheduleJobResponse =
              new ScheduleJobResponse(jobKey.getName(), jobKey.getGroup(), trigger.getDescription(),
                  trigger.getPreviousFireTime(), trigger.getNextFireTime());
          scheduleJobResponses.add(scheduleJobResponse);
        }
      }
    } catch (SchedulerException e) {
      logger.error("Error scheduling job", e);
    }

    logger.info("Get job List. ");
    return scheduleJobResponses;
  }

  private JobDetail buildCronJobDetail(String jobName, String jobGroup, Class<? extends Job> job,
      JobDataMap jobDataMap) {
    return JobBuilder.newJob(job).withIdentity(jobName, jobGroup).storeDurably()
        .setJobData(jobDataMap).build();
  }

  private Trigger buildCronJobTrigger(JobDetail jobDetail,
      CronScheduleBuilder cronScheduleBuilder) {

    return TriggerBuilder.newTrigger().forJob(jobDetail)
        .withIdentity(jobDetail.getKey().getName(), "cron-triggers")
        .withSchedule(cronScheduleBuilder).withDescription("Cron Triggers").build();
  }

  private JobDetail buildEmailJob(Mail mail) {
    JobDataMap jobDataMap = new JobDataMap();
    jobDataMap.put("mail", mail);
    return JobBuilder.newJob(MailJob.class).withIdentity(UUID.randomUUID().toString(), "email-jobs")
        .withDescription("Send Simple Email Job").usingJobData(jobDataMap).storeDurably().build();
  }

  private Trigger buildTrigger(JobDetail jobDetail, Date schedulerDate) {
    return TriggerBuilder.newTrigger().forJob(jobDetail)
        .withIdentity(jobDetail.getKey().getName(), "email-triggers").startAt(schedulerDate)
        .withSchedule(
            SimpleScheduleBuilder.simpleSchedule().withMisfireHandlingInstructionFireNow())
        .withDescription("Send Email Trigger").build();
  }
}
