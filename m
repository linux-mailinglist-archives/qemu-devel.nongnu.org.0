Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6736DE24
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:22:13 +0200 (CEST)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnt7-0001YC-0j
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndO-0000Yd-5s
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:58 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndM-0006T4-EQ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k14so13909124wrv.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Pw61SyIs2pPxJ556dFiJw8eBQVZJG1ECBOw/xVsIRc=;
 b=lGoBYgDcoMNRNFT6oNpSUS8+oknGkn6/MSiVENlkehBs8T27n1R1LCkiWawqaS8kVL
 cX+un8M22WWgVt8xziSMmyZCW/hWt4cK8Go2ANP93Iw0OH4W1vw/bPDT57AYax4xuUCU
 S5I4PJK3FYLpUsgMMEEv6McCdYG7jKj1bLMaibB/EUtjo6lZ6ILSRI/VVBE4PzP3nXTR
 6s5L3PWHh4basTYfE2GYqfix8kR0HPPluZGw3qghbfGrReCsdH9w2AG0p6UaWiAweD+c
 sGMAjFjKYDYl0ZgbZHUBKOEm1aE1r6BtZZccPOUEf6YZ6CuyixBkeXtj/+UVQIB9iITu
 n0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2Pw61SyIs2pPxJ556dFiJw8eBQVZJG1ECBOw/xVsIRc=;
 b=ZFX4F7oGYnPHbVna47eEpDvi5iJgk9OELYVDdE8Fo9yHn3QifH+ufhvri3LGVUTOHY
 NmeHjUXFlWiuaKd8ZK9O4I/R5dQVvEcycZHJ3QR15LIemAIJ2j7+EbnpvudxgWVVDSkn
 cNrTmyB2oVr1VVbAGZWcNi/qH9DBgPhgjm3WCSW1kCVSVHJPa91CzoKxqHzfqdMFDYKN
 hnp3KZh3BJcaqYlBUUYWMRC+3pi3lLRcGEz4nyM1ancSQ5rAft+3o+zeNnqLOcURXb3i
 o5AVhajql2VuUVTcdOzwjxKby+tTTbSGIaXMaWBrDLHvwVKPphFny973BYb+qmOgc5Iz
 bVBg==
X-Gm-Message-State: AOAM532Dt2rDbhUN+dLHE4oigMLrMBQ7CLl1KZuh1PtqBLExPgWcE+FH
 Cwpf/hyQlXaPRgmOob+5Sn6rOjLFFfkwTw==
X-Google-Smtp-Source: ABdhPJwuZx115aouP8WME0Yn/0ZEOza+zILNTWAkOVzTZfsswgqG5pfAP3b/tVrWeX6OZsUMGn/q6Q==
X-Received: by 2002:adf:f1cf:: with SMTP id z15mr11280927wro.97.1619629554927; 
 Wed, 28 Apr 2021 10:05:54 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k16sm315548wmi.44.2021.04.28.10.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:05:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/30] target/mips: Move sysemu specific files under
 sysemu/ subfolder
Date: Wed, 28 Apr 2021 19:03:56 +0200
Message-Id: <20210428170410.479308-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move sysemu-specific files under the new sysemu/ subfolder
and adapt the Meson machinery.
Update the KVM MIPS entry in MAINTAINERS.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/{ => sysemu}/addr.c      |  0
 target/mips/{ => sysemu}/cp0_timer.c |  0
 target/mips/{ => sysemu}/machine.c   |  0
 MAINTAINERS                          |  3 ++-
 target/mips/meson.build              | 12 ++++++------
 target/mips/sysemu/meson.build       |  5 +++++
 6 files changed, 13 insertions(+), 7 deletions(-)
 rename target/mips/{ => sysemu}/addr.c (100%)
 rename target/mips/{ => sysemu}/cp0_timer.c (100%)
 rename target/mips/{ => sysemu}/machine.c (100%)
 create mode 100644 target/mips/sysemu/meson.build

diff --git a/target/mips/addr.c b/target/mips/sysemu/addr.c
similarity index 100%
rename from target/mips/addr.c
rename to target/mips/sysemu/addr.c
diff --git a/target/mips/cp0_timer.c b/target/mips/sysemu/cp0_timer.c
similarity index 100%
rename from target/mips/cp0_timer.c
rename to target/mips/sysemu/cp0_timer.c
diff --git a/target/mips/machine.c b/target/mips/sysemu/machine.c
similarity index 100%
rename from target/mips/machine.c
rename to target/mips/sysemu/machine.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c59..0620326544e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -404,7 +404,8 @@ F: target/arm/kvm.c
 MIPS KVM CPUs
 M: Huacai Chen <chenhuacai@kernel.org>
 S: Odd Fixes
-F: target/mips/kvm.c
+F: target/mips/kvm*
+F: target/mips/sysemu/
 
 PPC KVM CPUs
 M: David Gibson <david@gibson.dropbear.id.au>
diff --git a/target/mips/meson.build b/target/mips/meson.build
index ca3cc62cf7a..9a507937ece 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -7,6 +7,7 @@
 ]
 
 mips_user_ss = ss.source_set()
+mips_softmmu_ss = ss.source_set()
 mips_ss = ss.source_set()
 mips_ss.add(files(
   'cpu.c',
@@ -14,6 +15,11 @@
   'gdbstub.c',
   'msa.c',
 ))
+
+if have_system
+  subdir('sysemu')
+endif
+
 mips_tcg_ss = ss.source_set()
 mips_tcg_ss.add(gen)
 mips_tcg_ss.add(files(
@@ -41,12 +47,6 @@
 
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
-mips_softmmu_ss = ss.source_set()
-mips_softmmu_ss.add(files(
-  'addr.c',
-  'cp0_timer.c',
-  'machine.c',
-))
 mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'cp0_helper.c',
   'mips-semi.c',
diff --git a/target/mips/sysemu/meson.build b/target/mips/sysemu/meson.build
new file mode 100644
index 00000000000..f2a1ff46081
--- /dev/null
+++ b/target/mips/sysemu/meson.build
@@ -0,0 +1,5 @@
+mips_softmmu_ss.add(files(
+  'addr.c',
+  'cp0_timer.c',
+  'machine.c',
+))
-- 
2.26.3


