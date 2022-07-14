Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD90B575463
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:06:00 +0200 (CEST)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3Dr-0005Xi-ID
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wFnQYggKCtEJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1oC38u-0007UF-RD
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:52 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:33446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wFnQYggKCtEJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1oC38r-0005iz-K3
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:52 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 a127-20020a624d85000000b00525950b1feeso1509461pfb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
 b=G7IYwQ5h1bHSdQ3N/q8pFT24ntNQ5vvXIm8atu3VilaUa26UORR7UxTJOmJEglp7A7
 6G1KcQ1bBoEZxO+Qjc8RVxYb1UY1ABt8RnVNbJW8clf/88gUOH1japMiNdsnZsrybX96
 d4JV4me52Klxm9iz0hKhwosK9xudupOJNE0V89fvvUvRmaszOPUhlG5y16qzhZERXThG
 DqDzM7gldaDksPHx1GqLhnnb62NTljnlzvIue87+UPARA730QsPmSP8Hdrldp9P8PjmD
 kUQJI3VYgDlV0rb11APm6Z94qwYbOjMwTAqAzpGpADoQIq44O8JbJklhereGmi3qcdNl
 WXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
 b=Gec0WcntFL4UIu8fG5cMxcOkOS0qJ4o5AJ3wXc61bbqdqdYqWBMdiz4E1LIrORxga4
 ULCv5mV23LfZPKxvgYAFA0SATxR17UfLW8WFXxeO1paYgCLisDHFSQMFGFvC3j/A2/JE
 OF9VohuhP8IxhDdRfMt8ktDlujUZSm/hk+xcsIBK9+JPZko2KGge9cyYy8vZqVefgYpv
 LcPx40g/RV4/cd9hOuJeYEIma9GHPSwNyS6HnOTwzGKuTJtDYyhfEZ5xv/DxqXy1EV72
 MzDvJ0QHWztTShL0IPSU71DF5gvuUPrbCjP3ZdMBSNlSSdEL9kJNmxOaUFfRLHL0Uldf
 peSA==
X-Gm-Message-State: AJIora+KqfpOC1pq5SKyGT+MoLx4sNGkbc0qBYh4Ww3CZfpQDCfcjA/6
 x69EVq+o0MZ/JCYNQ56aJtQgsWfstNNU1A==
X-Google-Smtp-Source: AGRyM1uTCQuQVoMM2MJa9nkI7Kl1dQkrfzwWJgbfm3ZpXOPKcnYgDI/8BMVPrr6zZZgCBIy/YOcBe3FZlTzy0A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:3346:0:b0:52a:c0cb:ae8 with SMTP id
 z67-20020a623346000000b0052ac0cb0ae8mr9452245pfz.37.1657821632780; Thu, 14
 Jul 2022 11:00:32 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:00:03 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 5/8] blockdev: Add a new IF type IF_OTHER
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3wFnQYggKCtEJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This type is used to represent block devs that are not suitable to
be represented by other existing types.

A sample use is to represent an at24c eeprom device defined in
hw/nvram/eeprom_at24c.c. The block device can be used to contain the
content of the said eeprom device.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 blockdev.c                | 4 +++-
 include/sysemu/blockdev.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 9230888e34..befd69ac5f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -82,6 +82,7 @@ static const char *const if_name[IF_COUNT] = {
     [IF_MTD] = "mtd",
     [IF_SD] = "sd",
     [IF_VIRTIO] = "virtio",
+    [IF_OTHER] = "other",
     [IF_XEN] = "xen",
 };
 
@@ -726,7 +727,8 @@ QemuOptsList qemu_legacy_drive_opts = {
         },{
             .name = "if",
             .type = QEMU_OPT_STRING,
-            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio)",
+            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio,"
+                    " other)",
         },{
             .name = "file",
             .type = QEMU_OPT_STRING,
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 3211b16513..d9dd5af291 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -21,6 +21,7 @@ typedef enum {
      */
     IF_NONE = 0,
     IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
+    IF_OTHER,
     IF_COUNT
 } BlockInterfaceType;
 
-- 
2.37.0.170.g444d1eabd0-goog


