Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10423636CE
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:46:57 +0200 (CEST)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAZU-0006tx-PX
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALc-0003Lz-SS
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALb-0004g0-Eq
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:36 -0400
Received: by mail-wr1-x430.google.com with SMTP id j5so30549548wrn.4
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EC/YuwfoseOyvD144pVSztd6jw9F+XQHfnLXaltljyY=;
 b=ojM4zLgsLyyBcELXdMFX7K5CY/nKrnwfEfITnX9Cp5h7Mv/Zu7MqCztK7fTgVGEEBx
 eiKnTf2ernbhfZk/9arJj/4a2fCcFh6YJMwxD+K/QgVhdtmAreyZQu94/FTARbtDSp3G
 S3JdVnIaWo1ykb6eFdOziz0xpBD3XyUrraUmIBOp+ZRqDuel2elJoU83iAC94ZGQNRhp
 nV9TuJpJQvgEs/re6YuuqjcR+aExIAAYxLLFmuWEzSkCAZG8v7AXnUIQDp5aTrWPlRxf
 OfJcIfVCDHOY51SSJhFR5cUQVavrl5Zao7hLph+iPhvF85bXYcEakM8xy0yfEd8BkuBv
 9drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EC/YuwfoseOyvD144pVSztd6jw9F+XQHfnLXaltljyY=;
 b=WVu/W39gp+yS6BbdLu51mxbbfSEKSuTLOhcocGKwAPkrCJMn6YY43wl0l8TNsNzoFx
 5a+ODpiVUZgHtsDtIdvrGg/mqHeRQFOpL1cXJxMVNoJgDQjTE02l2Sw2HNHUxXwaKB0W
 OjxOGS4XoOMQIyJmWoP1wQUvfHjfAFbF02LU+SaGe81GraepojIHy0iWssLT5aqcYWoI
 1MeXKCU9rVrAA1eq1cN4SVFjCxDl9yGXMghKS8a4gS2F5efj3k2b8aC+yuRQrBdRaWuM
 /w4iI3YYDFjDDWiP3LH3RfsxOxLY1s5r4cqizYsWambnBv8dDJiSCw8wsQfJkDl0t2vu
 aY6g==
X-Gm-Message-State: AOAM533hEzusdcJPcesbgxQsggbsNLvzDomy94E0W+ZhSv6KeVv1dzMe
 vGcqCjx+PmuphGzYqSoOOLVHqNCTRwHfHQ==
X-Google-Smtp-Source: ABdhPJxGsMQOavYk9oJdZyMP49sY3J+yA1uI0VACZulxGa00GWU0LlaKZWTlBw60I/II1bybEpvh5A==
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr9829399wrr.358.1618763553999; 
 Sun, 18 Apr 2021 09:32:33 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h1sm17129526wml.38.2021.04.18.09.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:32:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/26] target/mips: Move sysemu specific files under sysemu/
 subfolder
Date: Sun, 18 Apr 2021 18:31:20 +0200
Message-Id: <20210418163134.1133100-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/{ => sysemu}/addr.c      |  0
 target/mips/{ => sysemu}/cp0_timer.c |  0
 target/mips/{ => sysemu}/machine.c   |  0
 target/mips/meson.build              | 12 ++++++------
 target/mips/sysemu/meson.build       |  5 +++++
 5 files changed, 11 insertions(+), 6 deletions(-)
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


