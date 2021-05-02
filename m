Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F4F370E12
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:54:26 +0200 (CEST)
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFMP-0003pv-2I
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmo-0006OD-5W
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmm-0007sY-H0
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:37 -0400
Received: by mail-wm1-x329.google.com with SMTP id n205so1036761wmf.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WVwQyksNWdrjcIF4p/5zEaubeV4UBzzGXqsE5aq1wp8=;
 b=cA2MVBQRllmo5GnPyUjN4Rrw/hLsoJPmJ9xJKtavWGnuN+/gi8g2Qrav3At1L8WxUt
 QUyw5dmnJiElMhza0VnSjcl1blw2ZM3lMZUloY5cWPfMHX5LP4Mgqml8AEcQHpMnVPGb
 ksNJUAL2xFvbO8P5Jp9JQ3C5+UFNzrnIuDoVVLEBGji144iVIEXYDHZ91pC+V5Ay4A60
 h9Z6NkM8RWLvTMqwFDmYE6ajjw1fazNyWj4zatQNmg3wPyWfhjiv4aSB3Cy3KY9aayc/
 U7jJ/+ChiTKyl0gzivq/UkaLGRJBSJM8oWtzm8nPMh5R15wELGJ8qTHCSVB9TvChxPO6
 S5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WVwQyksNWdrjcIF4p/5zEaubeV4UBzzGXqsE5aq1wp8=;
 b=tmr5gFNluLwX0TS2jzcU92QeiD8b5VB1wim5u2+3SVy6X2c6ZbdxhkYot4SZNJLnu5
 vPTjbDMqMO+z81v9eNn9ZYQoWvqB1U1bbvnjtoSdFtSzgV58iRihocJLXW0Rhqtv7sCE
 U+eaZXGVGYrJcIwoUgSWNqe9reo1piAykWQWVqxfAK7kzpV05JPi65Xd3V3qbFGhY8IB
 pR7qQGqecIBrkmzO1rxlk61wQIae/NDeG0cFZpOd5VNrpeU31jPahUZEVetbopT/lRNc
 4pRTLpongNA3KtNKP3PXR2x+uEOXOMjTkS0fkGrsxHGIDVYgyY1Pmz2HrGL8ubyviOW6
 yE9w==
X-Gm-Message-State: AOAM532DkNBKdDhXilvZLSXYoAVTr8cMJ602VQV6olA+93GA/XOTPu8h
 bE9m2uGu03GkjTvnGfYNXIUQbnywgu86LBzD
X-Google-Smtp-Source: ABdhPJwoLdQBKsbqRVvY5uzW2cWlOTCQsV+BbvKx77L21dtdXqKCeTrQ1d9hNwJ4Lvy6+locdqg1Ew==
X-Received: by 2002:a05:600c:4ec9:: with SMTP id
 g9mr27135746wmq.145.1619972254959; 
 Sun, 02 May 2021 09:17:34 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id x64sm8813903wmg.46.2021.05.02.09.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:17:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/36] target/mips: Move sysemu specific files under sysemu/
 subfolder
Date: Sun,  2 May 2021 18:15:24 +0200
Message-Id: <20210502161538.534038-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Message-Id: <20210428170410.479308-17-f4bug@amsat.org>
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
index 4c05ff8bbab..8e4e3298104 100644
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


