Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F0E5B9ECB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:29:12 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqne-00053s-Jj
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkX-0007ng-5z; Thu, 15 Sep 2022 11:25:57 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkV-0007Ej-Kg; Thu, 15 Sep 2022 11:25:56 -0400
Received: by mail-ed1-x52b.google.com with SMTP id x94so10170467ede.11;
 Thu, 15 Sep 2022 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=50TUYZdhxcE2QyHZaGH/ScNbe0XiEUIkUKaPSlGCa0A=;
 b=aKVLIMBI4yGaxfx2okhNy+odBYomGP4HdAEocxUNp1W2e/hXC78taat0ESnfQpCe0y
 59bs6/sa7KW6RYx8XG6p+mqRZNJJZIXgJ84gRmEMv86eua+W/HJUSL3ObBXvir15jxNC
 x9tuJLftl9P1BEGCD9qu4NiCx7dznEB1gd+arEmS1ioifrjKap0vdAoR/3p104ZVHN6t
 +xkCcpCkamcvruQAjnDOpnJ7rPSKIgv4A0OYnrN2YMor5UriWOBoDu8xEpvLtR+dXQ+s
 U1rQL25OrAf9vNLkVNOSDtW3bYHDlAyjgJB1uyiQZbKMHPrIz4jtIxul9iYOCo2iDM62
 5bYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=50TUYZdhxcE2QyHZaGH/ScNbe0XiEUIkUKaPSlGCa0A=;
 b=f8eL3+P7N4rS1yF7dOLeSk5xPJTEDAoKY/WOo9whfcYjQeuNrM5WKY8V/EFYxFcrvC
 owiK0MxLydP6gZIiuhH2kG/jAOrf3KhkhftEXGKD6XVATPZ2TQmI/0laefNeo8K3suP2
 trZLKPu8oLsEMn4nnbnKF3yfuMqR9vN3T3WkAFRHkNco0On8cu+ckCmN9YUx7lu4pp6C
 Os+wy2h4ndQcxCiA8VddJnMKdr9e+T65IsK40I13BvlEyJH0+1RQj6BYRcospPJP0eUP
 a2YdtioEf2vEWV+sWnVOlwjMB3yzdU7emEED2ceymdcRi/yPCgK+8kj0YAflThgzbjU5
 vPPg==
X-Gm-Message-State: ACrzQf1QeviqiwDLLhBg/7Il3SDefWqIA6WVu038EUABVrQPutBaE0sH
 Y+Jsa+/eFOSqKmVd2iabb5LWXaIX5c4=
X-Google-Smtp-Source: AMsMyM7vjhXNRu3X7hCUA5yqEpJk/OY2n7kBet4ZKwZN/fxFTt94rta4bsIc+QQdFl8EFS+mKgpNFw==
X-Received: by 2002:a05:6402:40c2:b0:44f:963d:1ab4 with SMTP id
 z2-20020a05640240c200b0044f963d1ab4mr322608edb.319.1663255553229; 
 Thu, 15 Sep 2022 08:25:53 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:25:52 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 02/11] hw/gpio/meson: Introduce dedicated config switch for
 hw/gpio/mpc8xxx
Date: Thu, 15 Sep 2022 17:25:11 +0200
Message-Id: <20220915152520.21948-3-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Having a dedicated config switch makes dependency handling cleaner.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
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


