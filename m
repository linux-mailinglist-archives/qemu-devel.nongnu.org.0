Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2A6601806
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:48:37 +0200 (CEST)
Received: from localhost ([::1]:46342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW6F-0006FW-Ia
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfn-0002bc-AZ; Mon, 17 Oct 2022 15:21:17 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:45859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfl-0002u7-NM; Mon, 17 Oct 2022 15:21:15 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-132fb4fd495so14363392fac.12; 
 Mon, 17 Oct 2022 12:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTqaPV4ZyrwDDKTrBGHMOV/nBzVWSJQdis08EWydlqk=;
 b=mylvi1YH1IUYnxBeyTlVfwcHc/x1UU4N0VWJFhP7Oult6t8Ay7WXmWdi9VJzbhMGnk
 S0cOgXPyicznqQfwymwmtoBTUwp/4afFn8s3UUwwakwhun/K/8/JRP72qMdu+nDUevxi
 EMu0o8l0WfTYz5s57gTCJpBy41GTAaQG/0W4OA8baS18ZVaqgdJmlWUt//uR4ZDaz5BY
 FVUwe/HGGh0HmBztmv2rGq8nJwo/MpKP6r5yacHj3mVJCJM0E3NGoe8hwJoyga1ipnGh
 qm2PCINXYwkNc3/9ML1PQ8hPsOgEkN2Fjsq96DCO5gmb8EocCxgTLh8VAVjwVd/7/5lm
 my+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTqaPV4ZyrwDDKTrBGHMOV/nBzVWSJQdis08EWydlqk=;
 b=Y0Rl6BGr6r+3OVpmWbDSqyrBFX0em/ljuWKQk0LFxK1RCKhRZcYpPs7gX18TpvVKvV
 O6aOpWBm5Vghc0bgymo2ZvD6biLlQHaiwps2CxqPO/XKDo0KQAFI+gKBXY6xvbrqWz7p
 IvEjK9EeBs8mEqMMSJ/1xWsAI8zWWyjVfumZ04rdvg6o7hc3DZLZ5nN+UaZ0s1V5qFvT
 KsEC6UUsgIU5vdU3skdID0q4SoGJAUxwHIYGTO4F/QamRWm9uwPeRDI6ZrvhnIu4u2u/
 spIRPy6QIVtJFxT+W+zl4Xbm9XaZW+PVRECBWqMLTBCbQMUnoYt6gnNle9wIW6TI5XGE
 1kCw==
X-Gm-Message-State: ACrzQf2sTRzxeYZGD3mTjy1lbV6cyBq7xM38KwixblblnvoULQB1FcEu
 +idXJ3y53Qbkv9l9BXUmS2sAYv7zClg=
X-Google-Smtp-Source: AMsMyM7HXlX2Q8g2LD8z+xhT8mxjkOHQfOdI/yJGpJAE1jNKkY64L1lryo7TYEV7WKnWoM5uLresfw==
X-Received: by 2002:a05:6870:c182:b0:12a:e54e:c6e8 with SMTP id
 h2-20020a056870c18200b0012ae54ec6e8mr16027315oad.207.1666034472500; 
 Mon, 17 Oct 2022 12:21:12 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 21/38] hw/gpio/meson: Introduce dedicated config switch for
 hw/gpio/mpc8xxx
Date: Mon, 17 Oct 2022 16:19:52 -0300
Message-Id: <20221017192009.92404-22-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Having a dedicated config switch makes dependency handling cleaner.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221003203142.24355-3-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/gpio/Kconfig     | 3 +++
 hw/gpio/meson.build | 2 +-
 hw/ppc/Kconfig      | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index f0e7405f6e..d2cf3accc8 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -8,6 +8,9 @@ config PL061
 config GPIO_KEY
     bool
 
+config GPIO_MPC8XXX
+    bool
+
 config GPIO_PWR
     bool
 
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 7bd6a57264..b726e6d27a 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -1,5 +1,5 @@
-softmmu_ss.add(when: 'CONFIG_E500', if_true: files('mpc8xxx.c'))
 softmmu_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
+softmmu_ss.add(when: 'CONFIG_GPIO_MPC8XXX', if_true: files('mpc8xxx.c'))
 softmmu_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
 softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
 softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 22a64745d4..791fe78a50 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -124,6 +124,7 @@ config E500
     imply AT24C
     imply VIRTIO_PCI
     select ETSEC
+    select GPIO_MPC8XXX
     select OPENPIC
     select PLATFORM_BUS
     select PPCE500_PCI
-- 
2.37.3


