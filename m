Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB434364A92
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:29:25 +0200 (CEST)
Received: from localhost ([::1]:49778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZaG-0000Tv-VB
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQw-0007c3-OG
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQv-0001UY-2A
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:46 -0400
Received: by mail-wm1-x329.google.com with SMTP id k128so18819923wmk.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKUW8gAMAxhtFOb8uojubp49vr/t6a7goYqTsVJzhpA=;
 b=SBSCySL3R4vmKpg0/lpqQJjH/a9RjJQZx/4vdL0NHIslnaxxbCm7jy8BOUCGNYCYvZ
 3EnDbHbpFuEa0uJheAhE/tDHdkmv8q4E5V4/No4HuBqSK1rswWBzsUfuV+PEuZE2i0XQ
 z3kGEfE0uyz1j2ugu3LglV8WkE+RcKSXDQhXj2Fu2jXtNpo+a2n0WTqFcnxFnB74z03Z
 OUgcUKxwsQKQQ2n1BFphDFLvJrA0D8vkAx+pi9tqBfqbTz2DE4xnYv3gDYTCm8T2bvbw
 5gyCcWGeeRtJ65CqWh/b1eHw0rKzFdFL5hXSW8MF3gzBE8WotWtvbE1dTUFg3IEcNFfH
 hOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xKUW8gAMAxhtFOb8uojubp49vr/t6a7goYqTsVJzhpA=;
 b=P0x9M3zjOZIOqBCHZyh1CKLB+m3fu/OLV6w+d+n1C6mCNJXZ6B/cKZgVTiZ4lcXrU0
 ca6rZwPPvRe20JxcQ/yEHliKJqjW8/8U3wjPPlyJ/4pD8h7F7WsxLSW/hn4kNg1g2YAI
 J8ONbSF/uLPpLebMY1A8wDy2saeLOMyu4RujEnuDWz+IqWlYnKB0TW3jB85K19kszX2o
 cuHNHJ+Q4n0akYGsv29XXxZ/2L9qZPrhYcoRIpcG2toCcNx/y994wVm7Ag+gNoizwZ0i
 /xSn4HzAl4QA08rNmk4Gbk0v1dZ2IUHiSq0yUG43DnkdHZEQGK6VeUIonPZ6zLsk2uM/
 c3Tw==
X-Gm-Message-State: AOAM531zYq1r8X62JmJPn9tci4lRwfltkkoddOuceBTEt4PKauOUMWJ7
 eig4yv5WHvRDlGso/5mGQ5VUZkczDRDuHw==
X-Google-Smtp-Source: ABdhPJwpEUjFo1w72G+ZkdlzI5RZOgSAAvYzSgVtdZDTpFV6aZDt0nFzBfJtlVOXYX6TeZe3pNbYmA==
X-Received: by 2002:a1c:658a:: with SMTP id z132mr556286wmb.39.1618859983551; 
 Mon, 19 Apr 2021 12:19:43 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 61sm25889949wrm.52.2021.04.19.12.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:19:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/30] target/mips: Move sysemu specific files under
 sysemu/ subfolder
Date: Mon, 19 Apr 2021 21:18:09 +0200
Message-Id: <20210419191823.1555482-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
v2: Update MAINTAINERS
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


