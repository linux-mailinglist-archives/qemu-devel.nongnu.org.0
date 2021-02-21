Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC47C320E75
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 00:00:04 +0100 (CET)
Received: from localhost ([::1]:33762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDxhr-0004bN-S4
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 18:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxec-0001XY-Ib; Sun, 21 Feb 2021 17:56:42 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxea-0000cU-TC; Sun, 21 Feb 2021 17:56:42 -0500
Received: by mail-wm1-x335.google.com with SMTP id a207so12742609wmd.1;
 Sun, 21 Feb 2021 14:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qoEH2mbQRDdxzMa/ghQzb66wEbZTfz7ohThejLZ8MvQ=;
 b=bAG6HNVlpuZvtQE3obNXaAifT8CpcPTcu5gWNg/fMHkpvG53FFhsBypGrHUJKy4fnY
 UaS3DCL+uqDbJd29JgX8kRcSc0+ETtUWlCECVZrJrnR5KWk93o/8rgabVpHvzYVIOyyX
 n9Wpv8l0YxEOj9tigyjx9jhFWHUc3IyoWTSRerWILB+oV9Rg52K7bca0jaxoWJ3NQwSm
 WDOu3T3nQqcmNB2wNB41PnqnnCG8gETZD4+/54sBy+eWgKJtvti1PT+h0BlVqsTVWjP5
 SG3LzOHZF6P/10DpX7nk5MLeTKIyXM/0glOb/BtWd3G1m8iPVpOynbBEwBjpiT0xOx+l
 1vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qoEH2mbQRDdxzMa/ghQzb66wEbZTfz7ohThejLZ8MvQ=;
 b=eIfp53A+yGKJ32nhUwEPh+sQ6+WpW0qtNOrqktGA9in422t7UuuEjt4Xc2EybQVCrQ
 yTvNvQNiKrMBFuFN6e02aPbu1GUVmEdQcveGCFt5oUEXt3rWB3Yq8eWn15+P6I4lXfr+
 nn72vCpqjN7w7ddQhzMaGL6puDwIZq+xBqBUzXWWPfqQdScc9dRkZvSMl2er4bUeZR+E
 CgMD+/S6FEFAO1Lpr5fT0FIX2Izia5H9mSm4oQy8lH895nnHEhOswYEHgWiJREnxwGOn
 IPnFDnyPZT5C3ax4AZ7oGmKSWOaJR04KLa6/fXfTmE83gtl5i7X58yfcdZZpUJjGNin0
 jFxg==
X-Gm-Message-State: AOAM533Af/NEnPd9XJTIpTwa6zswaTHnDlzNddsuReStZwVgNkV51T/i
 DtAyNTR/IAK96QiXqF8/DofoMMdihKY=
X-Google-Smtp-Source: ABdhPJx1ixZEGjUORsnD3IHhNJdyljgT125f4C7Fp2sFiMOuYMpS7cVcHObeoUTWb3ymC/A07lHvdA==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr7280726wma.45.1613948199049; 
 Sun, 21 Feb 2021 14:56:39 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b6sm12107080wrq.56.2021.02.21.14.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 14:56:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] hw/lm32/Kconfig: Rename CONFIG_LM32 ->
 CONFIG_LM32_DEVICES
Date: Sun, 21 Feb 2021 23:56:25 +0100
Message-Id: <20210221225626.2589247-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221225626.2589247-1-f4bug@amsat.org>
References: <20210221225626.2589247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
specific features. As CONFIG_LM32 is only used to select
peripherals, rename it CONFIG_LM32_DEVICES.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/meson.build  | 4 ++--
 hw/intc/meson.build  | 2 +-
 hw/lm32/Kconfig      | 4 ++--
 hw/timer/meson.build | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/char/meson.build b/hw/char/meson.build
index 196ac91fa29..b95e8958514 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -8,8 +8,8 @@
 softmmu_ss.add(when: 'CONFIG_IPACK', if_true: files('ipoctal232.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_juart.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_uart.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_juart.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_uart.c'))
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-uart.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_uart.c'))
 softmmu_ss.add(when: 'CONFIG_PARALLEL', if_true: files('parallel.c'))
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 53cba115690..b2c4c085af9 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -14,7 +14,7 @@
 softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
 softmmu_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_pic.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_pic.c'))
 softmmu_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
 softmmu_ss.add(when: 'CONFIG_PL190', if_true: files('pl190.c'))
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_intc.c'))
diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index 20c36edc402..518c84ed508 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -1,4 +1,4 @@
-config LM32
+config LM32_DEVICES
     bool
     select PTIMER
 
@@ -14,5 +14,5 @@ config MILKYMIST
 
 config LM32_EVR
     bool
-    select LM32
+    select LM32_DEVICES
     select PFLASH_CFI02
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index be343f68fed..52723f34c42 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -19,7 +19,7 @@
 softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_timer.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_timer.c'))
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sysctl.c'))
 softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
-- 
2.26.2


