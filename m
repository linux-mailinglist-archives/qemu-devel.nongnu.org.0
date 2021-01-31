Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F3C309DDB
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 17:47:55 +0100 (CET)
Received: from localhost ([::1]:51910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6FtC-0001cG-T2
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 11:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpi-0008AK-SK; Sun, 31 Jan 2021 11:44:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fph-0001TN-DP; Sun, 31 Jan 2021 11:44:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id y187so11178079wmd.3;
 Sun, 31 Jan 2021 08:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LWcS/B5Wc5Bm+4irRgdKOqKVWu12IJGBF6ND+Mb33fs=;
 b=anoCizJ7OAjnCNZnGdVmDBAHuktDHRQIsqoI5jgJYZn0zabHpm+jNdkCc+vqnzx63K
 9Ue3/lGyWMfxiEL+PbGytv660/CWvKx0LtvBq6SHX4el2j5FHGltHuwJ3nXA8JOTYy8Y
 iXZx4FrY+V8E62QX1y0RXHieCv8z5Zseev1NXebkXSgdUQN/FPNrg1cR6Q4VXnF9gzyV
 HQwP4YXE9tKiVKXaYoXs7q352dgP12TfcJ5EujAmVbHflq8m71fk9M+lvZLlSWZyvTnW
 HatxuF37Yb/ik2lUQO153PgGoWYpKWOiQ9jGtF+uecCTryM5nYTdMtlPD/IDQ5KjlCuY
 tvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LWcS/B5Wc5Bm+4irRgdKOqKVWu12IJGBF6ND+Mb33fs=;
 b=KRNFPmQXfxcaFa1coc4USFx9pp1JNnXY9d3w5DeWLZvqYje0+yJeg9FW1awcN3wKYx
 sLlna6FEHnXkgQXTndr35ikWHBbrRO4M/OlhFnjTba9oDXAVUGqetntP5uHbZbrS+6UH
 0mNKZ+mncIQ5WBKJVcZ+LwchrOCqwcD62/fhzJcy8vOoLrUMQGqbH/zvCUVXCZhZHY2e
 fbRuDaR+I57g/GL7b8MX2HuYOTtVXG/KGVnl93Nd62WCma3cpJqt7SMuCdWWUq3QUDF2
 NfupKaQrUTejgnjv09qWSmGP85J3iCe+kK61xLQeE1qZ84EuRVhIkNd1Ns825VEDCTRB
 vBqQ==
X-Gm-Message-State: AOAM531XC/KMfOJLbFpSUE909uL/mBci3v6II5u5RAGbrEXM9JiKgIRa
 pAomFz8+wc/y2foXPR8Db2m9UeppFBs=
X-Google-Smtp-Source: ABdhPJxYIw/qvvO3O2JOAKYBup7Fp378tFGnJbB6mqrew5n+HG+MMMbyz42p5+bVyP5zlgZbtYsqgg==
X-Received: by 2002:a1c:7211:: with SMTP id n17mr3899005wmc.102.1612111455278; 
 Sun, 31 Jan 2021 08:44:15 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id b13sm22561953wrt.31.2021.01.31.08.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 08:44:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/arm: Use Kconfig 'default y' syntax instead of
 default-configs
Date: Sun, 31 Jan 2021 17:44:02 +0100
Message-Id: <20210131164406.349825-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131164406.349825-1-f4bug@amsat.org>
References: <20210131164406.349825-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Machines can be automatically selected using the Kconfig
'default y' syntax. This change allow deselecting these
machines without having to modify default-configs/ files.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/aarch64-softmmu.mak | 3 ---
 default-configs/devices/arm-softmmu.mak     | 2 --
 hw/arm/Kconfig                              | 4 ++++
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/default-configs/devices/aarch64-softmmu.mak b/default-configs/devices/aarch64-softmmu.mak
index a4202f56817..a94c7786919 100644
--- a/default-configs/devices/aarch64-softmmu.mak
+++ b/default-configs/devices/aarch64-softmmu.mak
@@ -2,6 +2,3 @@
 
 # We support all the 32 bit boards so need all their config
 include arm-softmmu.mak
-
-CONFIG_XLNX_VERSAL=y
-CONFIG_SBSA_REF=y
diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0fc80d7d6df..7d55c156bab 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -3,14 +3,12 @@
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
-CONFIG_ARM_VIRT=y
 CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
 CONFIG_REALVIEW=y
 CONFIG_VEXPRESS=y
 CONFIG_ZYNQ=y
 CONFIG_NPCM7XX=y
-CONFIG_RASPI=y
 CONFIG_SABRELITE=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 768830cc28c..043710be3df 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,5 +1,6 @@
 config ARM_VIRT
     bool
+    default y if ARM
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VFIO_AMD_XGBE
@@ -224,6 +225,7 @@ config REALVIEW
 
 config SBSA_REF
     bool
+    default y if AARCH64
     imply PCI_DEVICES
     select AHCI
     select ARM_SMMUV3
@@ -341,6 +343,7 @@ config ALLWINNER_H3
 
 config RASPI
     bool
+    default y if ARM
     select FRAMEBUFFER
     select PL011 # UART
     select SDHCI
@@ -382,6 +385,7 @@ config XLNX_ZYNQMP_ARM
 
 config XLNX_VERSAL
     bool
+    default y if AARCH64
     select ARM_GIC
     select PL011
     select CADENCE
-- 
2.26.2


