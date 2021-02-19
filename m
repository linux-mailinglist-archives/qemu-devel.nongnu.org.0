Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421631F8A9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:53:24 +0100 (CET)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4Lb-0004wk-9J
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD4Jm-0003kl-QI; Fri, 19 Feb 2021 06:51:30 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:32770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD4Jl-00051E-0e; Fri, 19 Feb 2021 06:51:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id 7so8031481wrz.0;
 Fri, 19 Feb 2021 03:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ehU3rFuRVd4QZVwHIfWveB91vZLKzZIejCbnvo8QfBg=;
 b=bINQD5hvj0P81p6E1UpMuB8p0R4+IHraVebKu0VlGnCqp4OZPTJKxQzVbLLtKEkoNU
 PB79Ed3vdKCJFk56uMk5DObvWIMAA/DMvavKdW5cBZyCNElRnazsw+WbLiZxTShyZP7C
 MxMFebi0q8YJo+1V6uoSGVinEFYCHrkQnO2mP9VZfORwCrHKNqg8BaUPjCV4WiuDl4R2
 03I2xLL2EyoyYgCbeY9iy2AoO3HX7+S3j09JYxCg/+yqwkmSODi/e9CELXCUiQWj185y
 9Eq5UMbB1FjFZbmRxocwDjpxOvD4HI9U89lMxI+Y3paHojmBloooVEXTLXMmfsEYHVyi
 d3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ehU3rFuRVd4QZVwHIfWveB91vZLKzZIejCbnvo8QfBg=;
 b=SI8jhNCuIgDyICrtkt8hISrTSjoJRCFjh9mqVP3VsuOG8KWHAtkQ0aq5XSbBAcD0md
 N7wWOtPJAyX4GKLzM8JpgnnlGuKp8eBHb8paZqmTI7z72XK2KbjHv+ZDdeT1BY7C6++H
 jc+H1OQWafkNL/e4Sk8sb/Yv7V/6wd+tKhUKmWAFdR4FseC5WP11H6Lbt3KCspLy5tlr
 +M+cOvFF877NJPUKd5s7tUYJh3K9qtn1EyBX2rkn3jgXZ4SB9DFZGIXgSjGv9ooYWKnr
 UgKrAZ2qjZsMlzUxRatuvucVqGvwviyouRCFOOXabtmgVYqTnFN7CW8b6WC2TUNi3+3U
 3bYQ==
X-Gm-Message-State: AOAM532jW8nqyabwafOVfzIngSwHnFDb9sZs8clkFH31Hb0RhqLtUIzc
 ZRaF7ClnkQAqDpsGOTOs07kiWy9pE+w=
X-Google-Smtp-Source: ABdhPJxZXR5Cm87tqS1BnUvBazH0NhCC3y/jJbEhUe/kcFQJmsBQ94NE7vEmpHgrSi2boBkJV5WPPA==
X-Received: by 2002:adf:de91:: with SMTP id w17mr346705wrl.341.1613735486298; 
 Fri, 19 Feb 2021 03:51:26 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b72sm11934542wmd.4.2021.02.19.03.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:51:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/xlnx-zynqmp: Remove obsolete 'has_rpu' property
Date: Fri, 19 Feb 2021 12:51:23 +0100
Message-Id: <20210219115123.1938686-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We hint the 'has_rpu' property is no longer required since commit
6908ec448b4 ("xlnx-zynqmp: Properly support the smp command line
option") which was released in QEMU v2.11.0.

3 years later we feel safe enough to remove it without using the
usual deprecation policy.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/xlnx-zynqmp.h | 2 --
 hw/arm/xlnx-zynqmp.c         | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 6f45387a173..0678b419a23 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -115,8 +115,6 @@ struct XlnxZynqMPState {
     bool secure;
     /* Has the ARM Virtualization extensions?  */
     bool virt;
-    /* Has the RPU subsystem?  */
-    bool has_rpu;
 
     /* CAN bus. */
     CanBusState *canbus[XLNX_ZYNQMP_NUM_CAN];
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 881847255b4..46030c1ef81 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -443,11 +443,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (s->has_rpu) {
-        info_report("The 'has_rpu' property is no longer required, to use the "
-                    "RPUs just use -smp 6.");
-    }
-
     xlnx_zynqmp_create_rpu(ms, s, boot_cpu, &err);
     if (err) {
         error_propagate(errp, err);
@@ -646,7 +641,6 @@ static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
     DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
     DEFINE_PROP_BOOL("virtualization", XlnxZynqMPState, virt, false),
-    DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
     DEFINE_PROP_LINK("ddr-ram", XlnxZynqMPState, ddr_ram, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_LINK("canbus0", XlnxZynqMPState, canbus[0], TYPE_CAN_BUS,
-- 
2.26.2


