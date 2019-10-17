Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2ADB9FE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 01:00:50 +0200 (CEST)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLElE-0002ym-Rp
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 19:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41150)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLEix-0000qk-Kh
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 18:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLEiw-0002TX-EI
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 18:58:27 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44655)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLEiw-0002T9-89; Thu, 17 Oct 2019 18:58:26 -0400
Received: by mail-wr1-x444.google.com with SMTP id z9so4113327wrl.11;
 Thu, 17 Oct 2019 15:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t7hE2pbrub3AVEyc/oyjS4UfKKd4rj51NgMEOKFwXuo=;
 b=ROSJNBj9NIYbxCGEa9n1K+Z/LmM8lEn6jZDK1g2cxFCGxspV5/IGcOlSFAdkuICAuL
 vr6dZBsoioZvtHdlny1x291ENAxZqqiGhD2yWUvHlzbALUaoAtAK293O4bF0qGCsVqKf
 LCRYpNttNFhN22zeNcay6GMekvpfvct9aiyv48czYze3g+tlppxsBkd+2g0Ae0M7UI52
 97ZUEhyRS11K0v095jRGFpeNCncdVlokgettfykPmNDeqGzKlxFvv04JwZ/s9kqe5OOp
 UmdERcIispieNDbxCImOgf9Gk9QuFQnTzLvfwUg1ySpdK6OyVCM8Yg3J5Wqt7fYGMaR5
 QEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=t7hE2pbrub3AVEyc/oyjS4UfKKd4rj51NgMEOKFwXuo=;
 b=fJVT3UU12TAK2c1EZQI3kFenUuVYDEp7vVJ96sJ9D1K7ZhC0f95/4zdQf6kHCIGMCE
 Y18unW54UHqjksaXb8aBJYUNmgdGq+3L39PiJxQKjY9EXiCQzA1qooydpJq1i32e1pAE
 geS9QYYSdoE0n/3nSmj9CGQATYkMIkq2nWtUr7gv2NZ3Hu6YdnCYdTaNtQtEl4OJLcPa
 4mgCgQ1tg6D8sNBWTmms00KYh1+OE7eNvBeEBUTMR57nZbXEA/9EBsBPTGwxQ0qpymWD
 +5R363sD2WGRovNN7jwQ/mL5r6aHLaVx67FroVEPYVQzTXAj+njrKXUw8Pr8DVEE6EZK
 Bo3Q==
X-Gm-Message-State: APjAAAU50J1qzUSS/A4iHwVCdrusUmDP6WqFDLD6xCiIOWq8QwT8wDsV
 7Vh0SLUO6tEnAkk6y5MtCFBPSSX3
X-Google-Smtp-Source: APXvYqybOmPVI29DIxX+kUeJo9YjlIIsoOFSj0bhpMgVQ9dBqh2haezma/RGuLRGZPROiQZheMBnjQ==
X-Received: by 2002:a5d:4808:: with SMTP id l8mr4914803wrq.118.1571353104959; 
 Thu, 17 Oct 2019 15:58:24 -0700 (PDT)
Received: from localhost.localdomain (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id m18sm3993873wrg.97.2019.10.17.15.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 15:58:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/10] hw/arm/raspi: Use AddressSpace when using
 arm_boot::write_secondary_boot
Date: Fri, 18 Oct 2019 00:57:58 +0200
Message-Id: <20191017225800.6946-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191017225800.6946-1-f4bug@amsat.org>
References: <20191017225800.6946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Pekka Enberg <penberg@iki.fi>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Pete Batard <pete@akeo.ie>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Clement Deschamps <clement.deschamps@antfield.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

write_secondary_boot() is used in SMP configurations where the
CPU address space might not be the main System Bus.
The rom_add_blob_fixed_as() function allow us to specify an
address space. Use it to write each boot blob in the corresponding
CPU address space.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index a12459bc41..569d85c11a 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -60,12 +60,14 @@ static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
     QEMU_BUILD_BUG_ON((BOARDSETUP_ADDR & 0xf) != 0
                       || (BOARDSETUP_ADDR >> 4) >= 0x100);
 
-    rom_add_blob_fixed("raspi_smpboot", smpboot, sizeof(smpboot),
-                       info->smp_loader_start);
+    rom_add_blob_fixed_as("raspi_smpboot", smpboot, sizeof(smpboot),
+                          info->smp_loader_start,
+                          arm_boot_address_space(cpu, info));
 }
 
 static void write_smpboot64(ARMCPU *cpu, const struct arm_boot_info *info)
 {
+    AddressSpace *as = arm_boot_address_space(cpu, info);
     /* Unlike the AArch32 version we don't need to call the board setup hook.
      * The mechanism for doing the spin-table is also entirely different.
      * We must have four 64-bit fields at absolute addresses
@@ -92,10 +94,10 @@ static void write_smpboot64(ARMCPU *cpu, const struct arm_boot_info *info)
         0, 0, 0, 0
     };
 
-    rom_add_blob_fixed("raspi_smpboot", smpboot, sizeof(smpboot),
-                       info->smp_loader_start);
-    rom_add_blob_fixed("raspi_spintables", spintables, sizeof(spintables),
-                       SPINTABLE_ADDR);
+    rom_add_blob_fixed_as("raspi_smpboot", smpboot, sizeof(smpboot),
+                          info->smp_loader_start, as);
+    rom_add_blob_fixed_as("raspi_spintables", spintables, sizeof(spintables),
+                          SPINTABLE_ADDR, as);
 }
 
 static void write_board_setup(ARMCPU *cpu, const struct arm_boot_info *info)
-- 
2.21.0


