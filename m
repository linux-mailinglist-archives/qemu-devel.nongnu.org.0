Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E7E320E29
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:09:44 +0100 (CET)
Received: from localhost ([::1]:51688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDwv9-0001hM-FK
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlZ-0000vY-QH; Sun, 21 Feb 2021 16:59:50 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlX-0000pd-4m; Sun, 21 Feb 2021 16:59:49 -0500
Received: by mail-wr1-x42c.google.com with SMTP id b3so17078653wrj.5;
 Sun, 21 Feb 2021 13:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8NQxzvw/rLDcJlmgmZNjYJ+dqWkqgHbVTMWeNA+d6sI=;
 b=NDfg6lSiM/pvWkhHQ9VupA70aqLuyv5PU/e/9uC3eCNMvK75dqfPLlVopwjJF3coK4
 rdnNBc5CDL+YgsFbOywsAp7u8t6k0Szk143lBTq69ckmVHy31f61ZsPHhbI/a5xSRHda
 ujNTJK2D5UboU3/3qooIHQZ6kArIcTyPoSjdf1MCimM0rt/LhWBp4n9froqjCWvk093k
 usk1x1eZMHSkMy6ye/t32HHslfMuOsl0OfE/CsTt7uISuVCcXb2P1Wj8GJmgZts6mSpY
 DjLCw8e8IA3McBE7tTXJhQ1ShFxpeHrrXxdUwUiTKwbcwUZZOF83fvcG2pMsEhJWzi4t
 n9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8NQxzvw/rLDcJlmgmZNjYJ+dqWkqgHbVTMWeNA+d6sI=;
 b=P+eREYWUhiJxnUB8z0llJl8OM6ekC8XQzUn0UjFXvHcJxslzVDFJ6NBZk7u1cWURN5
 cVZKa7TK7kLgYk30nVY8z7jhksn1WIjEmZWiiO8eFHCcNWZALz0jNI3GRbOVgNaEjgBy
 D5rMAuq+OU4L7PkUtJOx5Y59No4cZfoVd43CTfqq5tDMcz1+Xv1Xbc9mTtbyRWUrqCsk
 yAu/SvfBHfMjyJgeSGyakOBJWs48t0LSK6R/XfI021x+9v6w7KS0I5BnFP4vvAOOjPDQ
 jn1Fgi9z0SZ1JAmx6dcamRFgO2qPkMsPIkfZk4sjtUqiljyOso0wyn7rfi51Lrg2IpQ+
 PPpA==
X-Gm-Message-State: AOAM533L48JcDIsCtgSze+4fCJgL1RCh1emOixNgC61ugwNPopSDOdrc
 EoSC9ym+ZsaRAQ7b5ZyuJ0KUlX+UKtU=
X-Google-Smtp-Source: ABdhPJzDaRRK4T0LzdpaZZocbvDyJfcYsC1QoWdkWtFQc/F8xXpumGXsCKQiASmi0tFjv/qbykTbvQ==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr18904925wrm.13.1613944784558; 
 Sun, 21 Feb 2021 13:59:44 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q24sm22884470wmq.24.2021.02.21.13.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 13:59:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/8] hw/timer: Introduce SH_TIMER Kconfig entry
Date: Sun, 21 Feb 2021 22:59:12 +0100
Message-Id: <20210221215915.2568943-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221215915.2568943-1-f4bug@amsat.org>
References: <20210221215915.2568943-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
a CONFIG_SH_TIMER selector for the SH4 timer control unit.

Add the missing MAINTAINERS entries.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS          | 2 ++
 hw/sh4/Kconfig       | 2 +-
 hw/timer/Kconfig     | 4 ++++
 hw/timer/meson.build | 2 +-
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b53a937714a..a03557f4f7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1391,6 +1391,7 @@ S: Odd Fixes
 F: hw/char/sh_serial.c
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
+F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
 Shix
@@ -1400,6 +1401,7 @@ S: Odd Fixes
 F: hw/char/sh_serial.c
 F: hw/sh4/shix.c
 F: hw/intc/sh_intc.c
+F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
 SPARC Machines
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 47240aa97b7..e569470a614 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -21,7 +21,7 @@ config SH7750
     bool
     select SH_INTC
     select SH_SCI
+    select SH_TIMER
 
 config SH4
     bool
-    select PTIMER
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 8749edfb6a5..18936ef55bf 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -36,6 +36,10 @@ config CMSDK_APB_DUALTIMER
     bool
     select PTIMER
 
+config SH_TIMER
+    bool
+    select PTIMER
+
 config RENESAS_TMR
     bool
 
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index be343f68fed..26c2701fd78 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -30,7 +30,7 @@
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_ost.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_timer.c'))
+softmmu_ss.add(when: 'CONFIG_SH_TIMER', if_true: files('sh_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
-- 
2.26.2


