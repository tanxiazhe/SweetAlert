package com.maomao2.sweetalert.controller;

import com.maomao2.sweetalert.entity.Mail;
import com.maomao2.sweetalert.service.SchedulerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("/Schedulers")
public class EmailJobSchedulerController {
  private final Logger logger = LoggerFactory.getLogger(this.getClass());

  @Autowired
  private SchedulerService schedulerService;

  @PostMapping
  public void schedulerEmail(@RequestBody Mail mail) {
    Date schedulerDate = mail.getDate();
    Date currentDateTime = new Date();
    if (schedulerDate.before(currentDateTime)) {
      logger.error("dateTime must be after current time");
      return;
    }
    logger.info("Prepare to scheduler job");
    schedulerService.schedulerJob(mail,schedulerDate);
  }
}
