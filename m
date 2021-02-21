Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEAC320E6D
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:58:02 +0100 (CET)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDxft-0002mF-PN
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxeX-0001NO-OJ; Sun, 21 Feb 2021 17:56:37 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxeW-0000Zr-3P; Sun, 21 Feb 2021 17:56:37 -0500
Received: by mail-wr1-x435.google.com with SMTP id h98so12352514wrh.11;
 Sun, 21 Feb 2021 14:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxFFuRHhcoSHA/Qg7nBmJ5yFviRbeYpeHFIYqJuSlbI=;
 b=TUpYHS9ts7OfLxC+GOIEUsmcck19wm2oOdC8pEvRQyUN7TzuaK2V3Fb7uH9MRvwGG/
 rysNGxQwQaMbg0GmD3an97Ai4hXmwSpcVcsIpRRoOjfKxg7yTTnUHq9XKR7ejZ/F6TRF
 d3TfssaDkiY/AoBTF8Wks1QXhgebjlbkoKu7PysHzMMuNl1si9UrF3CWkw3xGSip8tAN
 Cj/KiGd1Baw9VIMv34cJprWgWyxy0bzyezMnGsHUPQkWMw4yQGpUU4Cp85EN9ahJn5p1
 EfsAT+Qzep/QjjBCX++nCTZyA4Q9dmu3OiODi9YbsmTzdV9b3Ii3MmZcT/NZaqTr40Qv
 r3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FxFFuRHhcoSHA/Qg7nBmJ5yFviRbeYpeHFIYqJuSlbI=;
 b=FySy2mkCYAw1GGG+FA1SeVScu+2wTf2khs34hk4TunTp2xwLeonevzLwl3+2kNzGr1
 jaqwEin2Kg8QtVSIZLYtPH8gxe10DDwD+TpmGyF6CB6cWPffEJNmqhaWBbPs9DXX/+z8
 +SN2Er/RMKopj274WETTBwzFQPR4VA92Ry4vK2cc0aBskv1Fs2JWHDHmZOXyoX9Uc2Yo
 EzkLrUXmVPY1giF1FyTHKB1U6ljfLCQa0VWIpLZcSvIEuL8i1U/oZqHTA4rM6Ly5/mJF
 BosA9WSHx/ORdKbh6tllwi3hpZJ9UUEnhrfqC8S6nmvbwI3HgK0EcYUNYsVOoR/HAuy6
 1PIA==
X-Gm-Message-State: AOAM530CfXTl/Kob50SNVjd+NJFIeMBzyyyUJ789A8BWR/tFMZXLFUBE
 TIGfqmrpryQS4ugKkgySDu6r4NkSak4=
X-Google-Smtp-Source: ABdhPJwGTSjz/RC1fmpFxHcYGo03lD8TSjrvlHqbtfN6RXsClbj5/pj4sg6hb01IUz/2sYfP562lTA==
X-Received: by 2002:a5d:4a09:: with SMTP id m9mr13729276wrq.310.1613948194127; 
 Sun, 21 Feb 2021 14:56:34 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x12sm303071wrq.84.2021.02.21.14.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 14:56:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for
 lm32-evr/uclinux boards
Date: Sun, 21 Feb 2021 23:56:24 +0100
Message-Id: <20210221225626.2589247-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221225626.2589247-1-f4bug@amsat.org>
References: <20210221225626.2589247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'LM32' config for architecture
specific features. Introduce CONFIG_LM32_EVR to select the
lm32-evr / lm32-uclinux boards.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/lm32-softmmu.mak | 2 +-
 hw/lm32/Kconfig                          | 6 +++++-
 hw/lm32/meson.build                      | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/lm32-softmmu.mak b/default-configs/devices/lm32-softmmu.mak
index 115b3e34c98..1bce3f6e8b6 100644
--- a/default-configs/devices/lm32-softmmu.mak
+++ b/default-configs/devices/lm32-softmmu.mak
@@ -8,5 +8,5 @@ CONFIG_SEMIHOSTING=y
 
 # Boards:
 #
-CONFIG_LM32=y
+CONFIG_LM32_EVR=y
 CONFIG_MILKYMIST=y
diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index ed2e3060b04..20c36edc402 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -1,7 +1,6 @@
 config LM32
     bool
     select PTIMER
-    select PFLASH_CFI02
 
 config MILKYMIST
     bool
@@ -12,3 +11,8 @@ config MILKYMIST
     select FRAMEBUFFER
     select SD
     select USB_OHCI
+
+config LM32_EVR
+    bool
+    select LM32
+    select PFLASH_CFI02
diff --git a/hw/lm32/meson.build b/hw/lm32/meson.build
index 8caf0a727ff..42d6f8db3d9 100644
--- a/hw/lm32/meson.build
+++ b/hw/lm32/meson.build
@@ -1,6 +1,6 @@
 lm32_ss = ss.source_set()
 # LM32 boards
-lm32_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_boards.c'))
+lm32_ss.add(when: 'CONFIG_LM32_EVR', if_true: files('lm32_boards.c'))
 lm32_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist.c'))
 
 hw_arch += {'lm32': lm32_ss}
-- 
2.26.2


