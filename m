Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655EC363872
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:07:24 +0200 (CEST)
Received: from localhost ([::1]:41104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGVf-0003j1-Fc
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGH1-0003Uc-H9
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:15 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGz-0000rD-Se
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:15 -0400
Received: by mail-wr1-x434.google.com with SMTP id g9so16017368wrx.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKUW8gAMAxhtFOb8uojubp49vr/t6a7goYqTsVJzhpA=;
 b=Br4VhlotSFKwfy1zcV6R+apuqIeF4OZk2ZdszZeT1izWbx2jzkkCufRXH2eJizf5G4
 vx6kPhEhKCWpjbFLQxBn1ib7pqQCgorooKQHvr9miaVUvO3IXGVogDlc9H6BJRmoBP5a
 aqVR0BZOtpAlotwrW2LSuR3k5BPoLqie7xFRlpsRHGtla+kEtWm2RcdrzI4j/lXPVSA9
 NsR79jIMCIbnwr0OYUJUvbcEfUQCHk79PvExda53fvuZQOG4fg+tzVGaNd9uk8OWwpMf
 f7p1dAoZTypIQ3hh3W+8TnPjPvn96I9HxGsK4CmPoeN3fQ4EgFGjJkLlpFJ1aZnmwWB0
 XCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xKUW8gAMAxhtFOb8uojubp49vr/t6a7goYqTsVJzhpA=;
 b=iGfABGSYN/NunaURFfMGIAyZM4QLicgZsWfJZQYuZr79f8/z/16iMKELQFcL6uVWoX
 lwgnewl6bbuJgFonqy3UTpRuzWRa+1ypm+WBiD3TZ2A0ygbub+uvD2/HUQYcsvB3F/rD
 5P0q37GaWGp7q0clWmqYBzokUySbnwkzwt6KgcmFXuEFrE6r3O6wHpF/Ne34ztWJmCJI
 wLlLTyQ4IFNKY09kEnlc2HWHLCBktwY5j9j78GTCTrrxxS6qpUV305ASAvhTTabuLO9s
 MIjJmdVk2CQvOZGd06iT/M47zxn71+TFGGCOI8P1+Ayp8Sk26ka8PpqHgL1S3w+FRnpv
 gXuQ==
X-Gm-Message-State: AOAM530XdtCLcxxNKdMJTtOPBWBHPOg2o9cGRc+yQQqwARxEii0Z1F7P
 hGP+mkKQm+IV92gPgS/q7d+vs+z12Ucxww==
X-Google-Smtp-Source: ABdhPJyXug3UJ1O4hk124+dasIkuzLbFMgdDQtaksxywbJ179SlkwpuCW34RLYQiGJqhPvMC2BWoTw==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr10843494wrz.47.1618786332387; 
 Sun, 18 Apr 2021 15:52:12 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o4sm173390wrn.81.2021.04.18.15.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:52:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/29] target/mips: Move sysemu specific files under
 sysemu/ subfolder
Date: Mon, 19 Apr 2021 00:50:44 +0200
Message-Id: <20210418225058.1257014-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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


