Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B689612D97
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:38:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGuQ-0001qI-Q9; Sun, 30 Oct 2022 18:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsd-0005Ig-5P
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:34:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsY-0000OG-Vg
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:34:09 -0400
Received: by mail-wr1-x434.google.com with SMTP id z14so13655069wrn.7
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AeceXebbTCqhMDIWf5l9/ntivZNvVvQcs82WFQga+Os=;
 b=V4tFbjwxvmJKhE5MKcOLVoR49P/MomlsVikisBs0OdQ+8+NpkRR/phsqKe1dmQ5D8O
 O+xJCxO/hwEOdvCTru+bCIOBFb2q2gD4L00O4CixBv8sd/5BCTJsdC5UY0+1l5+kYKOW
 r+8QeY4eEOIjDTPRwhmLjEcscNjkJmm4aZC+FZ0XPuLrZYIARYvibnLYtxwUrA/Bbjqw
 5RsMdo3m+fnvDtNMam941/ZPgjMafv/mX7zY1lFI4mh5qkffEi/rcvtgAYcXda/lkXqv
 FKA1G0mL3EXFoeSMLgTALntYUPOEY0ZpFeiyn47z2/+2YC/jsnDtccmw58fnTfHhddja
 blcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AeceXebbTCqhMDIWf5l9/ntivZNvVvQcs82WFQga+Os=;
 b=SpUQNnickBi42KjhmfqCVuTBVVrNyY3HTVuBVVfko9XI4AkyrrW/GmCD0QCepAliwc
 N/DKcKE4Gksc9q+a1I1jW1pA8RpP2Vy3tyoJrOWnWCT9nnRl7XOsqgucs+LzNPQawe+x
 RVvEOmgA8lkqSWlbqGuR6+5bKB9p4i66wIq8HwlajCeTcEAoJKb1X4CNsXlyLCKHfN2T
 voBxTvBjAMNiwJO9rhDloPXlGSEq9MFzm85wPCk/U7c5GlgVxw4vSp4I6qBX4tpcbV4N
 3ayQRiak3WlztDAX7emahB3iduGV6+K5hkYg9mH9vXsduMoJX2Vt3MePi6ME/7gVxePe
 QjQQ==
X-Gm-Message-State: ACrzQf1vDsjBddq5aIuukL6Fe5QqT01dqD2zleHVmNvAr3xNZBr0dw/j
 63ykrWffMbr/S5zGMBVDCpZIS1w/crm+lw==
X-Google-Smtp-Source: AMsMyM5nxW6i+7zoiZxl7UKFYQVCGL4kO4G5iYCvDS6o2ikvsA5v4uaYHSQ/cJesdBbjVZVh4eHWeg==
X-Received: by 2002:a05:6000:1a85:b0:230:f67b:da03 with SMTP id
 f5-20020a0560001a8500b00230f67bda03mr6334114wry.296.1667169245455; 
 Sun, 30 Oct 2022 15:34:05 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bp7-20020a5d5a87000000b00236545edc91sm5288696wrb.76.2022.10.30.15.34.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:34:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 49/55] hw/isa/Kconfig: Fix dependencies of piix4 southbridge
Date: Sun, 30 Oct 2022 23:28:35 +0100
Message-Id: <20221030222841.42377-50-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-27-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 configs/devices/mips-softmmu/common.mak | 1 -
 hw/isa/Kconfig                          | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index d2202c839e..416161f833 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -23,7 +23,6 @@ CONFIG_APM=y
 CONFIG_I8257=y
 CONFIG_PIIX4=y
 CONFIG_IDE_ISA=y
-CONFIG_IDE_PIIX=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_I8259=y
 CONFIG_MC146818RTC=y
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 60aad28800..18b5c6bf3f 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -40,7 +40,13 @@ config PIIX4
     bool
     # For historical reasons, SuperIO devices are created in the board
     # for PIIX4.
+    select ACPI_PIIX4
+    select I8254
+    select I8257
+    select I8259
+    select IDE_PIIX
     select ISA_BUS
+    select MC146818RTC
     select USB_UHCI
 
 config VT82C686
-- 
2.37.3


