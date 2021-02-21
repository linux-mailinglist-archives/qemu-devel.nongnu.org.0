Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02016320E26
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:06:01 +0100 (CET)
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDwrY-0006gG-1y
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlN-0000mB-U5; Sun, 21 Feb 2021 16:59:37 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlM-0000lF-8w; Sun, 21 Feb 2021 16:59:37 -0500
Received: by mail-wr1-x433.google.com with SMTP id v1so17077129wrd.6;
 Sun, 21 Feb 2021 13:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AhAmFnOhivCLWQNmcu5zh+TK35CPBEArBmFuQg4srh8=;
 b=R28aeY9iGQ5Uc0rqjSe1NgPPgPWUs/C8rXuQ7pHNcAg1a8ZF4h0933Cw+evCfIhYtd
 KWGbj+4sDWEnWEx4vphUf8FhwGUODB/j+Zsf/4oMX3BSIqz7K3TbKJVcfeimShjlGJfM
 6FCxgIgvNsMzWbWQVVmS2/Sq5OP8+/3apRtUSKm6xZynd4eA+Bl1WenuE3uogDJ5V/a0
 LW0w2a3Rm3A6jlSdCpQw5MQZJF9AOvKm7cmHPR9dx2MNRo2NnrBwkR3UDpWfUH1ci0C/
 cJ7vmL6tLYF4uwtvG1otY+bDdskpGNfhTodfA8/2I5rjKHybd2Ue6/IXwRI57jIjLa4U
 bbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AhAmFnOhivCLWQNmcu5zh+TK35CPBEArBmFuQg4srh8=;
 b=Mlw3FbMcFyIMCwPJ8BALZSK9b1gy1OpyVgLSlHQ9FoLf0MJI+k2O38wYprsH6eMzLU
 L3IcVzClg9Ihm9AdHTsWoofIoFcSCPP4CA5lCXcv4O2s6Hf8gNYbchNSeE8cl9EW5bmG
 FGOtjcubONV4ewGreVb2fU47ciM5Nb2BgMusxjKld0ch6fk74ukqV66e2okSPQ4hizks
 cpzcwLl+V+3qItzylCQdfLFUyHMQG0WuUGSXdC53QsObKBl/D2gfk5Y+TgR2TgEsSiIc
 826lGIY9mpgc7nc8q9Roec/g6nE9zVW3w2+3HXOIiI8pHMlJi22lKCP+75RynQb1g8QF
 xBjg==
X-Gm-Message-State: AOAM531/KB6d4xhg1H07Jb/BKF8MXThGHGao+wtp1ofG79G2SKPIeAeA
 RewLR3JjJ+3x2TZ3Uzu7g/Rnq638Er8=
X-Google-Smtp-Source: ABdhPJwLXWRJCkNvpxPjI6OUs7w2qd8KbimHAiQk+BWfUUl1oguioDtW+9BxeaX1rAHgorGrlGvhSQ==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr19713620wrr.198.1613944773923; 
 Sun, 21 Feb 2021 13:59:33 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i15sm20920548wmq.26.2021.02.21.13.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 13:59:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/8] hw/intc: Introduce SH_INTC Kconfig entry
Date: Sun, 21 Feb 2021 22:59:10 +0100
Message-Id: <20210221215915.2568943-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221215915.2568943-1-f4bug@amsat.org>
References: <20210221215915.2568943-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'SH4' config for architecture
specific features. Add more fine-grained selection by adding
a CONFIG_SH_INTC selector for the SH4 interrupt controller.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/Kconfig     | 3 +++
 hw/intc/meson.build | 2 +-
 hw/sh4/Kconfig      | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index c18d11142a8..66bf0b90b47 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -53,6 +53,9 @@ config OMPIC
 config PPC_UIC
     bool
 
+config SH_INTC
+    bool
+
 config RX_ICU
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 53cba115690..b3d9345a0d2 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -47,7 +47,7 @@
 specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
-specific_ss.add(when: 'CONFIG_SH4', if_true: files('sh_intc.c'))
+specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 0452b4624ae..c2008c6a0d2 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -19,6 +19,7 @@ config SHIX
 
 config SH7750
     bool
+    select SH_INTC
 
 config SH4
     bool
-- 
2.26.2


