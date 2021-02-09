Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B81314D99
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:56:28 +0100 (CET)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Qh1-0002uC-Ew
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9Qff-0002OE-Ot; Tue, 09 Feb 2021 05:55:03 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9Qfd-0005d1-Ok; Tue, 09 Feb 2021 05:55:03 -0500
Received: by mail-ej1-x62a.google.com with SMTP id f14so30508673ejc.8;
 Tue, 09 Feb 2021 02:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=P/ly+8lO7GHDefJgMR7mC5hr1z+tDL7329TuCx7q6EE=;
 b=jcNmfHxX2U7zu50WgfXytx24hiHHL8gt+NZ98YlkEXm6/fDV5yYOjQ0mdlpCjxY6BD
 gW6Ae8wdcXaDcatkXioWEhq1ndV/id0WTYE8C99d1FCH0Mq3O23/z49Qn5EqXGvV8HGA
 cRnPv//lCKSrlQ7a/Hkpx9jNzpaC8rg3F0M5EJRXk574UOmb29a7dtZ77ObViIitcsBR
 5B8autBQbzF1O8yUVLHWv2Dnz0iOqWW7cWoJmyoalnQibig/0/DO218YstcW3Wp/R3Dx
 s6AtfEThRVfSGek5RHX/9GKU5yrZK3VvVr6MBjRyEbzy4oeR2B4byOx5m9SsFvKG6BmJ
 OPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=P/ly+8lO7GHDefJgMR7mC5hr1z+tDL7329TuCx7q6EE=;
 b=HmQk3nNaKydGMXMfZFgQJmAMLxOE9ikdbMRw9KzI/d3mNEFELKfFgCF1JAyYsFS6SH
 LqNO9raTSVMk3RnmP/acR4U+K+SMsrLhFMit5SDuImmwnv7zEI/MJQ93ZULWjyp/3f7A
 o0yLJh4XYS02rfiGj8S7lqniwyRfESDs6wbVpWSR1voiqCw4GuyfQewr6ddUxPZ0gWTL
 JOKwDm4vwIPoXavlQNKUOSzo7ZxcsQP7ApZGhfcznYxN0W5fWNDU9m5IEcv5R7AvZRlb
 IJy0vj0a+OGDbs6uETAdtSae6TSGbrJLDcSEStqnQ/ijfxuWYM3oT24z8MD+dbm70AkJ
 jXsw==
X-Gm-Message-State: AOAM530U+oiZykRmUE4dYXDic05zqXaNiOJ9Gix+ghjixBr8tMZIClN1
 BceQGoK5quiKnKVzWzUnq9g=
X-Google-Smtp-Source: ABdhPJwiShmPeR5oCdOQQjIyzGm990KVXDUHtmC0fNLmOLj5IV/GosCzlTwrLDbBR7Z4LkCivlLG6A==
X-Received: by 2002:a17:906:ad9:: with SMTP id
 z25mr21929680ejf.513.1612868099455; 
 Tue, 09 Feb 2021 02:54:59 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id g4sm11498872edv.59.2021.02.09.02.54.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2021 02:54:59 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH] hw/sd: sdhci: Do not transfer any data when command fails
Date: Tue,  9 Feb 2021 18:54:45 +0800
Message-Id: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-stable@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the end of sdhci_send_command(), it starts a data transfer if
the command register indicates a data is associated. However the
data transfer should only be initiated when the command execution
has succeeded.

Cc: qemu-stable@nongnu.org
Fixes: CVE-2020-17380
Fixes: CVE-2020-25085
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Sergej Schumilo (Ruhr-University Bochum)
Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
Reported-by: Simon Wrner (Ruhr-University Bochum)
Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/sd/sdhci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 8ffa539..0450110 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -326,6 +326,7 @@ static void sdhci_send_command(SDHCIState *s)
     SDRequest request;
     uint8_t response[16];
     int rlen;
+    bool cmd_failure = false;
 
     s->errintsts = 0;
     s->acmd12errsts = 0;
@@ -349,6 +350,7 @@ static void sdhci_send_command(SDHCIState *s)
             trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
                                    s->rspreg[1], s->rspreg[0]);
         } else {
+            cmd_failure = true;
             trace_sdhci_error("timeout waiting for command response");
             if (s->errintstsen & SDHC_EISEN_CMDTIMEOUT) {
                 s->errintsts |= SDHC_EIS_CMDTIMEOUT;
@@ -369,7 +371,7 @@ static void sdhci_send_command(SDHCIState *s)
 
     sdhci_update_irq(s);
 
-    if (s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
+    if (!cmd_failure && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
         s->data_count = 0;
         sdhci_data_transfer(s);
     }
-- 
2.7.4


