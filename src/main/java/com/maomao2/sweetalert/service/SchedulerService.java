package com.maomao2.sweetalert.service;

import com.maomao2.sweetalert.entity.Mail;

import java.util.Date;

public interface SchedulerService {
  void schedulerJob(Mail mail, Date schedulerDate);
}
