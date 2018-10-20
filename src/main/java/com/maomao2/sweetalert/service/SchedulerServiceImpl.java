package com.maomao2.sweetalert.service;

import com.maomao2.sweetalert.entity.Mail;
import com.maomao2.sweetalert.job.MailJob;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

@Service
public class SchedulerServiceImpl implements SchedulerService {
  private final Logger logger = LoggerFactory.getLogger(this.getClass());

  @Autowired
  Scheduler scheduler;

  @Override
  public void schedulerJob(Mail mail, Date schedulerDate) {
    JobDetail emailJob = buildEmailJob(mail);
    Trigger trigger = buildTrigger(emailJob,schedulerDate);
    try {
      scheduler.scheduleJob(emailJob, trigger);
    } catch (SchedulerException e) {
      logger.error("Schedule Job failed",e);
    }
    logger.info("Schedule job succeed");
  }

  private JobDetail buildEmailJob(Mail mail) {
    JobDataMap jobDataMap = new JobDataMap();
    jobDataMap.put("mail", mail);
    return JobBuilder.newJob(MailJob.class).withIdentity(UUID.randomUUID().toString(), "email-jobs")
        .withDescription("Send Simple Email Job").usingJobData(jobDataMap).storeDurably().build();
  }

  private Trigger buildTrigger(JobDetail jobDetail, Date schedulerDate) {
    return TriggerBuilder.newTrigger().forJob(jobDetail)
        .withIdentity(jobDetail.getKey().getName(), "email-triggers")
        .startAt(schedulerDate)
        .withSchedule(SimpleScheduleBuilder.simpleSchedule().withMisfireHandlingInstructionFireNow())
        .withDescription("Send Email Trigger").build();
  }
}
