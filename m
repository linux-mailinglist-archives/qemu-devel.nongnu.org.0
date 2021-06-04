Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7872839BCE8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:20:03 +0200 (CEST)
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCYE-00006Q-5l
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCI4-0008Ny-7X
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHd-0005qK-JY
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id u7so4384708wrs.10
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/YG66hyD1VOf/fOI4qw/ZTnuURBGgVxAEUhf5rfH4Y0=;
 b=fC6Z4tu+Pi3NnHTTj1S95aaBJf3XfPsnkTphTm3RJjD9o+QNOsVgm5+CQjJfyd/Dg5
 9OGU/p8Bks+cAY+zoQLH9We4C7sZ4Z0aGsBQ3/HuSvmqop3xpF5PJ4PaSxq7OA3b0zR7
 qi3pjjl6cbWqRNsaBJZ3nc8Y7v4fq05u+nGUQUrI1/qHk1VJp1mJYv2u0Oa2MswHYHNH
 XHFwNy0XxbKpSK9lnXN9sJBLlyheeBYHkfNUh6Mfd7UBMVjuJCdimNpaKaMgudOU9W3B
 bDlb9dOz5UVokJn+7Qj6z+52HyHAsa0ObA3nDgEXyQevHJE0jGD/weNGp9eUlgM1zHkV
 xYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/YG66hyD1VOf/fOI4qw/ZTnuURBGgVxAEUhf5rfH4Y0=;
 b=iYQ7S68iJbwXjm422NppglgOwbABL4rvo2MA8m8XukRkqTldtSF6pnFhR6Opl8mE5Y
 ncJNzFq2q6uGyL49JJKyLY82M8TY3WEMr5m26eGYHfYmD4CyCMS4M5HA79FoxDXQfi4i
 /fbwyXjl64dbasbbnp3fs76TPsjJ5TEefCwAtsLPsoPWN23pOl14XTcq8z5Mk8khI9MM
 G4Zb3tKzofGkucgV0rSzafRZaXtdnJaB3jV50i+5m5xgZHDAwEeSYgl1xKicTxbE6dMW
 hwex5cWFVnAfxOjThaRokZRnb36nTxX5mgC+bURxebxqaUecN9sAkIi9wWE/LrcVCPMK
 NSYQ==
X-Gm-Message-State: AOAM532speN1Dqmx4QLpl/tUf3vb37yzmTsaGJZtFQqiZ+jOhvMNqOn2
 WXW1Cm9Pe10Vdc2c+VnyuuZ8FA==
X-Google-Smtp-Source: ABdhPJxoNh4ZssVD5lwFM3Dx5OLmXna9H8Fq7cYBY7tnC0SQE6H+rLqFNc9rVxR8bEvO5OPslTURRQ==
X-Received: by 2002:adf:f98a:: with SMTP id f10mr4644621wrr.143.1622822572137; 
 Fri, 04 Jun 2021 09:02:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm6843694wrp.21.2021.06.04.09.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C56E20021;
 Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 94/99] target/arm: move CONFIG_V7M out of default-devices
Date: Fri,  4 Jun 2021 16:53:07 +0100
Message-Id: <20210604155312.15902-95-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently select CONFIG_V7M for a bunch of our m-profile devices.
The last sticking point is translate.c which cannot be compiled
without expecting v7m support. Express this dependency in Kconfig
rather than in default devices as a stepping stone to a fully
configurable translate.c.

While we are at it we also need to select ARM_COMPATIBLE_SEMIHOSTING
as that is implied for M profile machines.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 default-configs/devices/arm-softmmu.mak | 3 ---
 hw/arm/Kconfig                          | 3 +++
 target/arm/tcg/sysemu/meson.build       | 5 ++++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c..4114aa9e35 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -1,8 +1,5 @@
 # Default configuration for arm-softmmu
 
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=y
-
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 67723d9ea6..afaf807c92 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -296,7 +296,10 @@ config ZYNQ
 
 config ARM_V7M
     bool
+    # currently v7M must be included in a TCG build due to translate.c
+    default y if TCG && (ARM || AARCH64)
     select PTIMER
+    select ARM_COMPATIBLE_SEMIHOSTING
 
 config ALLWINNER_A10
     bool
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
index 56e4b5ccea..520f305deb 100644
--- a/target/arm/tcg/sysemu/meson.build
+++ b/target/arm/tcg/sysemu/meson.build
@@ -1,7 +1,10 @@
 arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'debug_helper.c',
-  'm_helper.c',
   'mte_helper.c',
   'tcg-cpu.c',
   'tlb_helper.c',
 ))
+
+arm_softmmu_ss.add(when: 'CONFIG_ARM_V7M', if_true: files(
+  'm_helper.c',
+))
-- 
2.20.1


