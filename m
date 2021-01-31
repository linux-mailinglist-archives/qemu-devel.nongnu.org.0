Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB18309B89
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:17:28 +0100 (CET)
Received: from localhost ([::1]:41536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6AjP-0006D2-Pf
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Afp-00026B-KN; Sun, 31 Jan 2021 06:13:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Afn-0006Og-TN; Sun, 31 Jan 2021 06:13:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o10so9598517wmc.1;
 Sun, 31 Jan 2021 03:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fYQAVaNNfllVHQX0jOIMlQzoC4zDZBjKHd4G1bFe6gE=;
 b=VtsFlqIBtqo1kXig1EeJWLBVRMox9I8WX2P/8PRWsWkbAckwzpSZIZoFEczXG6Wgnb
 6SlPCptAu7PFm3akwbHlaYFbePl01zvC4eLGG4ahfyOye7dl6CjxQG9/jWwiXEXCwy4L
 dtWnpYz97KrNvOFHlKNsDfYtBehZOBkcb+HScuBj9Wf6aezOwyKRQ9pbeA+hkuCnRBfR
 5qPKsGkUfJxuuRsgpjNRxZ6hMnOoJnqHu+Arh2e5cJnS5kl8bRmds/aqfboawpLoczrl
 F7GoyE9FJyOqHTjCdvVg5KKNA6+XWYVt/aivp0giwV6JgDm1J+v0aKkfHzXE7d2EKpoa
 go5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fYQAVaNNfllVHQX0jOIMlQzoC4zDZBjKHd4G1bFe6gE=;
 b=tjMQJCCWMmnl2OJ0aX/ht8I5AZEiJCLMoO/u2r3ce2vlI/yY6igJyKv1RoyFObHR1u
 jL25MEZ0xLpHm46pZB2eSmnj2oBzP+9qkMnTiNNQbK10qxD/xdvs7AMCWAs38/ajIl8G
 cxLRBgS4PTqyols+b5gojEL1es+ysT1YzBY7uqnjfZJkF0WNMxIuopY1XYOfXABnVcTr
 tJ4twgeMH0oMOqpF+tSTgdJVW3cDDZv2holp/g9gVPU2tGuoq8C/c+LZY82OTOdTjGCA
 pcxr7JviB9Ksx/U4UhdVA12ALLDOrgEdIu+6kYdzfvEno3VpYbQtn6wUhL3/4uKQU7nP
 gTjw==
X-Gm-Message-State: AOAM530eDU5yWGxwzNbG+bIVaLZQsh/SkrdSPjRTDM8lynBmbvGK3crQ
 Wma3OK3X3OfLdyyDGE/YLS6KYYyR0mo=
X-Google-Smtp-Source: ABdhPJygYyM+WH/1+ddpYuuvNeuUZ11kFCnNJRQVgkKeFFsZxyw0wUwCZKD+WJAIXr4jn58+npJiTQ==
X-Received: by 2002:a05:600c:4fc2:: with SMTP id
 o2mr10585388wmq.90.1612091620427; 
 Sun, 31 Jan 2021 03:13:40 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id x81sm18641566wmg.40.2021.01.31.03.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:13:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 03/10] hw/sh4/Kconfig: Rename CONFIG_LM32 ->
 CONFIG_LM32_PERIPHERALS
Date: Sun, 31 Jan 2021 12:13:09 +0100
Message-Id: <20210131111316.232778-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'LM32' config for architecture
specific features. As CONFIG_LM32 is only used to select
peripherals, rename it CONFIG_LM32_PERIPHERALS.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/meson.build  | 4 ++--
 hw/intc/meson.build  | 2 +-
 hw/lm32/Kconfig      | 4 ++--
 hw/timer/meson.build | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/char/meson.build b/hw/char/meson.build
index 3b8cb6a2f5b..b05dcc41c59 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -8,8 +8,8 @@
 softmmu_ss.add(when: 'CONFIG_IPACK', if_true: files('ipoctal232.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_juart.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_uart.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_PERIPHERALS', if_true: files('lm32_juart.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_PERIPHERALS', if_true: files('lm32_uart.c'))
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-uart.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_uart.c'))
 softmmu_ss.add(when: 'CONFIG_PARALLEL', if_true: files('parallel.c'))
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index b05bab2f4b6..bfaab908ac7 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -14,7 +14,7 @@
 softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
 softmmu_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_pic.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_PERIPHERALS', if_true: files('lm32_pic.c'))
 softmmu_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
 softmmu_ss.add(when: 'CONFIG_PL190', if_true: files('pl190.c'))
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_intc.c'))
diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index 20c36edc402..5867f4db0cf 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -1,4 +1,4 @@
-config LM32
+config LM32_PERIPHERALS
     bool
     select PTIMER
 
@@ -14,5 +14,5 @@ config MILKYMIST
 
 config LM32_EVR
     bool
-    select LM32
+    select LM32_PERIPHERALS
     select PFLASH_CFI02
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index d3f53dce400..36ca0d34942 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -19,7 +19,7 @@
 softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_timer.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_PERIPHERALS', if_true: files('lm32_timer.c'))
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sysctl.c'))
 softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
-- 
2.26.2


