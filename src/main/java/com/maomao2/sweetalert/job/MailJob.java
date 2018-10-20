package com.maomao2.sweetalert.job;

import com.maomao2.sweetalert.entity.Mail;
import com.maomao2.sweetalert.service.MailService;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class MailJob extends QuartzJobBean {
  private final Logger logger = LoggerFactory.getLogger(this.getClass());

  @Autowired
  private MailService mailService;

  @Override
  protected void executeInternal(JobExecutionContext jobExecutionContext)
      throws JobExecutionException {
    logger.info("prepare to extract parameters");
    mailService.sendSimpleEmail((Mail)(jobExecutionContext.getMergedJobDataMap().get("mail")));
  }
}
