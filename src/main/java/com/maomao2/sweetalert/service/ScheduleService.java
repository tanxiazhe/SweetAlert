package com.maomao2.sweetalert.service;

import com.maomao2.sweetalert.dto.ScheduleJobResponse;
import com.maomao2.sweetalert.entity.Mail;

import java.util.Date;
import java.util.List;

public interface ScheduleService {
  void scheduleJob(Mail mail, Date schedulerDate);

  ScheduleJobResponse scheduleJob(String jobName, String jobGroup, String cronExp);

  ScheduleJobResponse unScheduleJob(String jobName, String jobGroup);

  ScheduleJobResponse interruptJob(String jobName, String jobGroup);

  ScheduleJobResponse pauseJob(String jobName, String jobGroup);

  ScheduleJobResponse resumeJob(String jobName , String jobGroup);

  ScheduleJobResponse deleteJob(String jobName, String jobGroup);

  List<ScheduleJobResponse> getJobList();
}
