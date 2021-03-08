Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589163310F4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:37:01 +0100 (CET)
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJH0G-0007IM-Du
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGO9-0007SH-Cp
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:57:37 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGO6-0003x1-Tz
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:57:37 -0500
Received: by mail-wr1-x436.google.com with SMTP id e10so11515446wro.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbHIRkW5mOeLd+eNU43aSU4kAGhV/trcLXwzgkkHJ4w=;
 b=NEan6uhHObg/wVt3s2hDI0RbyI5AX+F8r5+SVn5YXX5qfCZZ2/bTHG581NI9nNqWi4
 BkMvfwv67akZ7WosCwXVlQ+U4FNPkf7LFVKG7qf7NlCZ1QZ9j7XNVQ/1Z81GuBzgNdCe
 NKPmiN1YC3kY/5DISlrvH17WGUzLtgHEdZWllx1WpBY3o/qo/YNXDRRRQFFCs2dJsC4e
 H9mI7nbFaDYKK1DyvuPPJI7nofREZgLRqjbFGFsVDAZny5nx+/5Yka6O65BSi9h3Mz4y
 X0ZxNMZuyGRsmQHwlWBcBAbxqS907vichhgKfuCh76roZtUVnTB3XPmpPLeQSteP2H5s
 riUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbHIRkW5mOeLd+eNU43aSU4kAGhV/trcLXwzgkkHJ4w=;
 b=fK4S98Pcs/7wLAPWaETJPj886aUBWrxryVSYkWtuVtIItjnf0wIPDcHOtI4jkt5P27
 Tm7FZFsexWoy6rJe9KM1nPefri5a/Eikakn6caCGaH3z+YxiScC2nbvBbz49YzQYE6UQ
 GBNnH4qR8eVBsRBqUR1/5u7FsMU6h6D6xPyXA/hOz7gIS09lobrwpCcHGVLW3L0gU5v5
 0R3NELVfg7c4bFRkK2iKsQyjagSWwRbXGHPa4e3tnO4FKj4rlXkw2f1odSKwuNbX/G8v
 AveJN5JssoPykVOKoc7xJ/NpmVPu18MyUGkSE4Gll+23dqIfwJnLKezA5yRiXkOlg12/
 rasQ==
X-Gm-Message-State: AOAM533AZrdscCjDBdTDxZdh1fhMPYvNBJQVBof/0gUyjNsMc9QapPdt
 v+jMUi/gbEcnLaQimH1k3KNfbw==
X-Google-Smtp-Source: ABdhPJy/VvJYAHTKua0RuG1Oi4NCLT/r9BYJWmOb0RfOTD0Otu9TL4ILZdoiCbnph3v3+04ai26FbQ==
X-Received: by 2002:adf:e94a:: with SMTP id m10mr22811282wrn.55.1615211853573; 
 Mon, 08 Mar 2021 05:57:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c128sm19542433wma.37.2021.03.08.05.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:57:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB43A1FFA5;
 Mon,  8 Mar 2021 13:51:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 18/18] semihosting: Move hw/semihosting/ -> semihosting/
Date: Mon,  8 Mar 2021 13:51:04 +0000
Message-Id: <20210308135104.24903-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

With the exception of hw/core/, the hw/ directory only contains
device models used in system emulation. Semihosting is also used
by user emulation. As a generic feature, move it out of hw/ directory.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210226131356.3964782-3-f4bug@amsat.org>
Message-Id: <20210305135451.15427-3-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 81d760d6e8..16dbb6fc12 100644
--- a/meson.build
+++ b/meson.build
@@ -1939,6 +1939,7 @@ subdir('migration')
 subdir('monitor')
 subdir('net')
 subdir('replay')
+subdir('semihosting')
 subdir('hw')
 subdir('accel')
 subdir('plugins')
diff --git a/hw/semihosting/common-semi.h b/semihosting/common-semi.h
similarity index 100%
rename from hw/semihosting/common-semi.h
rename to semihosting/common-semi.h
diff --git a/hw/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
similarity index 100%
rename from hw/semihosting/arm-compat-semi.c
rename to semihosting/arm-compat-semi.c
diff --git a/hw/semihosting/config.c b/semihosting/config.c
similarity index 100%
rename from hw/semihosting/config.c
rename to semihosting/config.c
diff --git a/hw/semihosting/console.c b/semihosting/console.c
similarity index 100%
rename from hw/semihosting/console.c
rename to semihosting/console.c
diff --git a/Kconfig b/Kconfig
index bf694c42af..d52ebd839b 100644
--- a/Kconfig
+++ b/Kconfig
@@ -2,3 +2,4 @@ source Kconfig.host
 source backends/Kconfig
 source accel/Kconfig
 source hw/Kconfig
+source semihosting/Kconfig
diff --git a/MAINTAINERS b/MAINTAINERS
index 99e9874fd2..8956bd2f32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3242,7 +3242,7 @@ F: qapi/rdma.json
 Semihosting
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
-F: hw/semihosting/
+F: semihosting/
 F: include/semihosting/
 
 Multi-process QEMU
diff --git a/hw/Kconfig b/hw/Kconfig
index 8ea26479c4..ff40bd3f7b 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -31,7 +31,6 @@ source remote/Kconfig
 source rtc/Kconfig
 source scsi/Kconfig
 source sd/Kconfig
-source semihosting/Kconfig
 source smbios/Kconfig
 source ssi/Kconfig
 source timer/Kconfig
diff --git a/hw/meson.build b/hw/meson.build
index e615d72d4d..8ba79b1a52 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -30,7 +30,6 @@ subdir('rdma')
 subdir('rtc')
 subdir('scsi')
 subdir('sd')
-subdir('semihosting')
 subdir('smbios')
 subdir('ssi')
 subdir('timer')
diff --git a/hw/semihosting/Kconfig b/semihosting/Kconfig
similarity index 100%
rename from hw/semihosting/Kconfig
rename to semihosting/Kconfig
diff --git a/hw/semihosting/meson.build b/semihosting/meson.build
similarity index 100%
rename from hw/semihosting/meson.build
rename to semihosting/meson.build
-- 
2.20.1


