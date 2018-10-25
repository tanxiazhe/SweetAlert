package com.maomao2.sweetalert.controller;

import com.maomao2.sweetalert.entity.Mail;
import com.maomao2.sweetalert.service.ScheduleService;
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
public class EmailJobScheduleController {
  private final Logger logger = LoggerFactory.getLogger(this.getClass());

  @Autowired
  private ScheduleService scheduleService;

  @PostMapping
  public void scheduleEmail(@RequestBody Mail mail) {
    Date schedulerDate = mail.getDate();
    Date currentDateTime = new Date();
    if (schedulerDate.before(currentDateTime)) {
      logger.error("dateTime must be after current time");
      return;
    }
    logger.info("Prepare to scheduler job");
    scheduleService.scheduleJob(mail,schedulerDate);
  }
}
