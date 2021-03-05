Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A990A32EC97
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 14:56:41 +0100 (CET)
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIAwZ-0000Yt-Uj
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 08:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIAuw-0007Zd-6P
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:54:58 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIAuu-00078I-G3
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:54:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e10so2146249wro.12
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 05:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLhT5yRnuoIEU1XA0pFOiHczGY3mdHoPZzEBcQmsVWI=;
 b=DzdKwSDl76bFnnNEBW3bgq1kmMJcZ1ylWU+vH/adZuEoU9LuQKicVpkU/ggBZFCgSa
 SZAh1evWgYm2G5Bmp55Frlesm0jhY7PMlICBbvvz7uf0VPBqBP7ttpXL/CbIGvGjGV6b
 +vElUUfq/LWyy/GPSNIMcnhkFt4zdk8R4P1gzPPkHvajd7bJ/WU93DM/gn0EcgKCX3/I
 I2joCP65KgFlqvGdkIbStrIDV6w4xv9dx+kmsOXq4npB22qSlBqbLM/XQcMs+75PAXus
 o2TeLp41TZE3WNy4DGVZqZRxFQ2SLL3KLKvNnPWRBjXZsfa4NAE9cPQUX7KVlefo/ltB
 wOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLhT5yRnuoIEU1XA0pFOiHczGY3mdHoPZzEBcQmsVWI=;
 b=JDtF26p8pYjqQoHpFvp+/nfqGGpWQH4c3T7Fs88mMrXEXoPrdNzW+vQtnUYTnmNJF3
 q/mWBDz3oqoKB5wfN4hdjmPs9zomOemiG0+qkgTubLeXsHvccyADmiV5rtCMRPA9P3fj
 oPNAGDJMUhCBRH6DhkrxFkYLWaigprBfbwgIYJ0rJSvmJRxtlHnwVpNL5RsLY5TLqkXF
 MFDyrNl82xurMnZU4vqBQZFvcSAp6LY3nBQ/1/oSaZaQ7GMjFJsFym0L0pq4Ur3uHR/g
 w4VifTlW4U99u9lFBF6bbGJKCDmm9DJC3lWJ9uqTgwItMgzARKFD1SbciJiR9NsPeCO9
 XEQw==
X-Gm-Message-State: AOAM532w4fYQ3PUb9OQe5ATwDgs+I1+YhCphu2B7veKLU4CflENDZ2bK
 /B/Q0FNUTYjoOwodSj3q5MnSIw==
X-Google-Smtp-Source: ABdhPJzd6xEtwGvy3SUZZ0y7+VVer8WLOa2gly/+AexSdvoZNDtSo/gMnnluIVYaaU9nP2ToE50aNw==
X-Received: by 2002:a5d:6991:: with SMTP id g17mr9486689wru.172.1614952495056; 
 Fri, 05 Mar 2021 05:54:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s23sm4479324wmc.35.2021.03.05.05.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 05:54:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E3DF1FF8C;
 Fri,  5 Mar 2021 13:54:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/3] semihosting: Move hw/semihosting/ -> semihosting/
Date: Fri,  5 Mar 2021 13:54:50 +0000
Message-Id: <20210305135451.15427-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305135451.15427-1-alex.bennee@linaro.org>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
---
 meson.build                                       | 1 +
 {hw/semihosting => semihosting}/common-semi.h     | 0
 {hw/semihosting => semihosting}/arm-compat-semi.c | 0
 {hw/semihosting => semihosting}/config.c          | 0
 {hw/semihosting => semihosting}/console.c         | 0
 Kconfig                                           | 1 +
 MAINTAINERS                                       | 2 +-
 hw/Kconfig                                        | 1 -
 hw/meson.build                                    | 1 -
 {hw/semihosting => semihosting}/Kconfig           | 0
 {hw/semihosting => semihosting}/meson.build       | 0
 11 files changed, 3 insertions(+), 3 deletions(-)
 rename {hw/semihosting => semihosting}/common-semi.h (100%)
 rename {hw/semihosting => semihosting}/arm-compat-semi.c (100%)
 rename {hw/semihosting => semihosting}/config.c (100%)
 rename {hw/semihosting => semihosting}/console.c (100%)
 rename {hw/semihosting => semihosting}/Kconfig (100%)
 rename {hw/semihosting => semihosting}/meson.build (100%)

diff --git a/meson.build b/meson.build
index 07bc23129a..3578692315 100644
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
index 37ddf90669..90118a537a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3226,7 +3226,7 @@ F: qapi/rdma.json
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


