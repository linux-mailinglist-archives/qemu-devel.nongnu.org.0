Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D01336A47
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 03:59:35 +0100 (CET)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKBXx-0008A9-Sa
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 21:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKBWa-0007jS-Eu
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 21:58:08 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:48323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKBWX-0001PT-F6
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 21:58:07 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2692566|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.049416-0.00090632-0.949678;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=1; RT=1; SR=0; TI=SMTPD_---.JjFZW75_1615431474; 
Received: from 30.225.208.101(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JjFZW75_1615431474)
 by smtp.aliyun-inc.com(10.147.41.187);
 Thu, 11 Mar 2021 10:57:54 +0800
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: Question about edge-triggered interrupt
Message-ID: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
Date: Thu, 11 Mar 2021 10:57:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------2A37D73EBEE6FB3C4F08A402"
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------2A37D73EBEE6FB3C4F08A402
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi folks,

Currently, I am writing an interrupt controller (CLIC) for RISC-V. I 
can't find a good way to process edge-triggered interrupt.

According to edge-triggered definition, if I select an edge-triggered  
interrupt to serve , it will clean its pending status. However after 
serving the interrupt,  there is no chance to select other pending 
interrupts.

I have two methods.

 1. One is to add a timer for interrupt controller, so that every
    pending interrupt can be served at some point.
 2. The other is that  always pull a pending interrupt to serve at the
    interrupt return instruction.

But both are not so good. The first one we can not server the interrupts 
immediately. The second one we have to add some
code when executing the guest code.

I want to know if there is a better way to handle edge-triggered 
interrupt on QEMU.

Thanks very much for your reading and look forward to your response.

Zhiwei



--------------2A37D73EBEE6FB3C4F08A402
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi folks,<br>
    <br>
    Currently, I am writing an interrupt controller (CLIC) for RISC-V. 
    I can't find a good way to process edge-triggered interrupt.<br>
    <br>
    According to edge-triggered definition, if I select an
    edge-triggered  interrupt to serve , it will clean its pending
    status. However after serving the interrupt,  there is no chance to
    select other pending interrupts.<br>
    <br>
    I have two methods. <br>
    <ol>
      <li>One is to add a timer for interrupt controller, so that every
        pending interrupt can be served at some point.</li>
      <li>The other is that  always pull a pending interrupt to serve at
        the interrupt return instruction.</li>
    </ol>
    But both are not so good. The first one we can not server the
    interrupts immediately. The second one we have to add some<br>
    code when executing the guest code.<br>
    <br>
    I want to know if there is a better way to handle edge-triggered
    interrupt on QEMU.<br>
    <br>
    Thanks very much for your reading and look forward to your 
    response.<br>
    <br>
    Zhiwei<br>
    <br>
    <br>
  </body>
</html>

--------------2A37D73EBEE6FB3C4F08A402--

