Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9943C334331
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:38:22 +0100 (CET)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1qn-0006KV-7g
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1GM-0004lv-62
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:42 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1GC-0002pU-IS
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:41 -0500
Received: by mail-ej1-x62f.google.com with SMTP id r17so39677106ejy.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wCThXbMA7Fymd9SdnPM7KHKkPElYc6GGZP5jhClwnG8=;
 b=CqsQknLHM/RcYusFg9EOkS1/stQ/uotXUZWgIYCaIrmWnxOMLH1rlrsNHyp35+G7cZ
 0VbojtyX9yqct++7ALvMaxqDfshjsFoNShRTqqc9MW/VVSgfWsMG51Zri+QITVohVS0I
 b+YrCjlOgqPzNPyDQDT+V2AZGbt+WiHToMYRlFLWrbW33pdUe5/RIfRXfX8XhMyuO8Cg
 /1QUrLI2TIAr1Wbzp5OsP8gakrkYoEtBMsDyy1wbgW7lzxmHcMVrZw1JP+j7g4GOgrVH
 +uU4Lq6CfHJXa3VQy0WUhvH7fVLd1paIL7DZDAS2vFkNUde6dQgl5S6zmSjNVhfcvyk3
 smtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wCThXbMA7Fymd9SdnPM7KHKkPElYc6GGZP5jhClwnG8=;
 b=GPJvEqPnUHPy4Z6xy8idNwf0kaxHsAt45t1S9xNEqPbdYvNnc2xs25ApIN2Jhf6jD9
 UvMVEn57LauUxOYreVwhMJxnDsXhM9m4ur7LWOsW/XawMv+gWLlwMJelRhbUbumPiM70
 ExA4wM7u6wUk6cXOA+uZw18pY3UT1ZraRg6SPsW3CTVqCXfpHmMxKczXS5KuIabY1vf6
 gI2+R2ipyHSTcXIP+hT44JDrzQeo/4LrscbVBjRrBbh+prekiPZPTyp9p6XWsp3AOI6A
 uTtC/uTgfrAgdVrA31s4GEiboC3bdizRKb/i/fjMKb0LuxUEA0aP4Cj2tDz4ey47KEt8
 rJEA==
X-Gm-Message-State: AOAM5311DEn4wgpRURBpryqn39Op0Vc2Rdoytka6SKVm9/aM05us24bU
 Q80S5WYyvI69SNXKxiUQLMoUVw==
X-Google-Smtp-Source: ABdhPJzEsFmPndGL/SC3WF7kukuO9b/pxwIBNbZo4458c1xu1sDSGvnLYb6VqrctmgM31jTNO6iP5w==
X-Received: by 2002:a17:906:3ac3:: with SMTP id
 z3mr4502580ejd.106.1615392023221; 
 Wed, 10 Mar 2021 08:00:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m7sm10164219ejk.52.2021.03.10.08.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 436381FF9E;
 Wed, 10 Mar 2021 16:00:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 15/15] semihosting: Move hw/semihosting/ -> semihosting/
Date: Wed, 10 Mar 2021 16:00:02 +0000
Message-Id: <20210310160002.11659-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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
index adeec153d9..a7d2dd429d 100644
--- a/meson.build
+++ b/meson.build
@@ -1951,6 +1951,7 @@ subdir('migration')
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
index c5ff881892..3456993062 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3249,7 +3249,7 @@ F: qapi/rdma.json
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


