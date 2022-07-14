Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB162575521
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:35:09 +0200 (CEST)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3g4-00047p-NR
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3N2DQYggKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZL-0004Sv-PZ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:12 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:46603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3N2DQYggKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZI-0007kv-UY
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:11 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 o5-20020a170902d4c500b0016c643623e8so583117plg.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
 b=TsjDMTFyTE6prRqAJ2cjQUdwmtvh1yxWKiWHGVHGAWCa+wb05IpZDy5f0UOa1VWDkx
 6bxxwbGBJ8R0TuS3iXBvW/0jMC4fOLh6GUNBVkSBBCRy+e97hSNrWCcDQ+L2wPx5n6k7
 cpw4K98+VUlk3aqIJ7fi9QgiH2lu9KwmmKiyqHppUr0l1Klpa9EFJvL0AOUlSVAjNRLN
 iinNzSVFa1ovK0Ql2Cg8ot0N13IJi6OWzo3t7dyPw61Hdl4jyo6X7IWeL7kVnGop5fCq
 waQ73caFoqB7hGQcTwjlq9BAgXzyMP6ymsbJ4EawiAM9YWYRrjalk3K7VB/Jdd6dq3IZ
 FdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
 b=tEVO/WyDFrdLASJFtTcIWCu9cb4aCCAOkf5WUv+9akSSu9Vh4JLPz9eyt/yvKhBJjA
 rct3g+OlugTkN/J6iGCxTndj9TuO1nuT85mUvngfSRzXiZlhQ4RedUK9dWc044EgRv2h
 f0EMlUPgfjFB6Oj/VZdmHJGe+tWTGnSBYU7neTmlAbITX9E5trU3PDvpnnjh3ZnU8yqp
 I2pXTW2skHEkYtT1qy4fJD2H+yI94m+/ntRAWK9G0zWKmHkjwsmtgju7RlVKQPQJqPh6
 PzdnHlcWTx0g/N2c70YGM0aqB1V+NE9jsatnJvfI2xuw+lvJ9GneiJ+RXxYnBnjgUO0T
 Pyqw==
X-Gm-Message-State: AJIora+MzkznrJmX0ZuMi2oo6cU1wlHMiDHos53dF+9TUpfaDbqxLFg/
 mdioORhQUHsWnaWpRcPxSM1yhfAZ2NvaJw==
X-Google-Smtp-Source: AGRyM1ufDam9QlwSSz2aRCgjbZTY052xlgvZ5VOzieTmj3DRnnZ9eazqfbEFSk4e7SO+kcTgMeRiaKhWd30S+g==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:408f:b0:1d1:d1ba:2abb with SMTP
 id l15-20020a17090a408f00b001d1d1ba2abbmr17792151pjg.152.1657823287351; Thu,
 14 Jul 2022 11:28:07 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:44 -0700
In-Reply-To: <20220714182756.85664-1-wuhaotsh@google.com>
Message-Id: <20220714182756.85664-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182756.85664-1-wuhaotsh@google.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3N2DQYggKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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


