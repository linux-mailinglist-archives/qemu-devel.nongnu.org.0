Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A398241455
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 02:54:41 +0200 (CEST)
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5IYq-0003L5-82
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 20:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3aeoxXwsKCgYnyqottksuktmuumrk.iuswks0-jk1krtutmt0.uxm@flex--hskinnemoen.bounces.google.com>)
 id 1k5IR4-0007VG-8o
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 20:46:38 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:36705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3aeoxXwsKCgYnyqottksuktmuumrk.iuswks0-jk1krtutmt0.uxm@flex--hskinnemoen.bounces.google.com>)
 id 1k5IR1-0004kl-T1
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 20:46:37 -0400
Received: by mail-pg1-x54a.google.com with SMTP id e3so7714905pgs.3
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=77MzROSny901jeDfoK8saH4ylZZBqxvesEflSfZJQLU=;
 b=D1bVMwh5IiM4bKD+2aKArKX03ILS+T/P5j/w8GQ58TslXC09EvD5ZqftPpvus1PKYs
 Zl39mqT4yrMkZZ9qfuxVdzH5Wg0CixHWbU5V/DHURSx8r9XOmYtVHFLsI62WrlO9F6dl
 RYTpbTuf5p4w9ae6YMHIxd8GN2ezGKq8Fzm1xktm32zZzmXWMpivK3nLAnX2TgjMPzg2
 DNA0+UkUQabY4QbBX1e+ktGp0j+eOiDIcf+xKX5vP7VRGwldwxn2+vNCzon4U/G4PikO
 2LWM2n0/en/BS4ZA6tuJf+bgLEfoV5JOWw8fiLAKkG4HAb0WyOAJc8QZHacXvyQImOk+
 PXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=77MzROSny901jeDfoK8saH4ylZZBqxvesEflSfZJQLU=;
 b=mOP+9Z37x0fJLEY8pgHH8RKDVGjRf1/NRYoOdfp4q7RUQRa2K7PxVUMGCx2LV7T0Vp
 tKaS7ihxu9UyF9qpLukTQTmI9W39kdPY317PDhYFfG+T+iWoiVqT3MPBubYjF7YkFHC3
 cIFTvn+EXMi+usyEfqnE8DLA8E764QmJ8gdoipUTdGq9M3cTuQrQEwJAOhk75LtQd8bi
 5k12DRtrJCrTeU8p31IuZYhLJDDrJ9gWvmO0PvlcEUj5PKspdHhhtrn2s0yCJqyTdFhM
 IEy3yGNBaj3XjARqoryFzscn6bfOBPbhAomRQCTf1vJxHWrAr0vZgjab+zCMQZaTWr+W
 k2sQ==
X-Gm-Message-State: AOAM533z3ZczBmEHwlOWXUCfz717J376KILDmD1PTZyBhaFtTweEJ9RA
 noBYATrW9WRzIyQyRMcEL1y7ZH7/taU7J7uCYg==
X-Google-Smtp-Source: ABdhPJxQqi0Q3x338Y2q8W1iCHugQpKGbAJvHyzygmhI9nyG+X+DsOpnd1XGTyXTDyPddvw4mpiA57B6/ajcwHsIpw==
X-Received: by 2002:a17:90a:f014:: with SMTP id
 bt20mr284137pjb.0.1597106793494; 
 Mon, 10 Aug 2020 17:46:33 -0700 (PDT)
Date: Tue, 11 Aug 2020 00:46:06 +0000
In-Reply-To: <20200811004607.2133149-1-hskinnemoen@google.com>
Message-Id: <20200811004607.2133149-13-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200811004607.2133149-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH v7 12/13] docs/system: Add Nuvoton machine documentation
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3aeoxXwsKCgYnyqottksuktmuumrk.iuswks0-jk1krtutmt0.uxm@flex--hskinnemoen.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 docs/system/arm/nuvoton.rst | 90 +++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst  |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 docs/system/arm/nuvoton.rst

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
new file mode 100644
index 0000000000..36bf901122
--- /dev/null
+++ b/docs/system/arm/nuvoton.rst
@@ -0,0 +1,90 @@
+Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that ar=
e
+designed to be used as Baseboard Management Controllers (BMCs) in various
+servers. They all feature one or two ARM Cortex A9 CPU cores, as well as a=
n
+assortment of peripherals targeted for either Enterprise or Data Center /
+Hyperscale applications. The former is a superset of the latter, so NPCM75=
0 has
+all the peripherals of NPCM730 and more.
+
+.. _Nuvoton iBMC: https://www.nuvoton.com/products/cloud-computing/ibmc/
+
+The NPCM750 SoC has two Cortex A9 cores and is targeted for the Enterprise
+segment. The following machines are based on this chip :
+
+- ``npcm750-evb``       Nuvoton NPCM750 Evaluation board
+
+The NPCM730 SoC has two Cortex A9 cores and is targeted for Data Center an=
d
+Hyperscale applications. The following machines are based on this chip :
+
+- ``quanta-gsj``        Quanta GSJ server BMC
+
+There are also two more SoCs, NPCM710 and NPCM705, which are single-core
+variants of NPCM750 and NPCM730, respectively. These are currently not
+supported by QEMU.
+
+Supported devices
+-----------------
+
+ * SMP (Dual Core Cortex-A9)
+ * Cortex-A9MPCore built-in peripherals: SCU, GIC, Global Timer, Private T=
imer
+   and Watchdog.
+ * SRAM, ROM and DRAM mappings
+ * System Global Control Registers (GCR)
+ * Clock and reset controller (CLK)
+ * Timer controller (TIM)
+ * Serial ports (16550-based)
+ * DDR4 memory controller (dummy interface indicating memory training is d=
one)
+ * OTP controllers (no protection features)
+ * Flash Interface Unit (FIU; no protection features)
+
+Missing devices
+---------------
+
+ * GPIO controller
+ * LPC/eSPI host-to-BMC interface, including
+
+   * Keyboard and mouse controller interface (KBCI)
+   * Keyboard Controller Style (KCS) channels
+   * BIOS POST code FIFO
+   * System Wake-up Control (SWC)
+   * Shared memory (SHM)
+   * eSPI slave interface
+
+ * Ethernet controllers (GMAC and EMC)
+ * USB host (USBH)
+ * USB device (USBD)
+ * SMBus controller (SMBF)
+ * Peripheral SPI controller (PSPI)
+ * Analog to Digital Converter (ADC)
+ * SD/MMC host
+ * Random Number Generator (RNG)
+ * PECI interface
+ * Pulse Width Modulation (PWM)
+ * Tachometer
+ * PCI and PCIe root complex and bridges
+ * VDM and MCTP support
+ * Serial I/O expansion
+ * LPC/eSPI host
+ * Coprocessor
+ * Graphics
+ * Video capture
+ * Encoding compression engine
+ * Security features
+
+Boot options
+------------
+
+The Nuvoton machines can boot from an OpenBMC firmware image, or directly =
into
+a kernel using the ``-kernel`` option. OpenBMC images for `quanta-gsj` and
+possibly others can be downloaded from the OpenPOWER jenkins :
+
+   https://openpower.xyz/
+
+The firmware image should be attached as an MTD drive. Example :
+
+.. code-block:: bash
+
+  $ qemu-system-arm -machine quanta-gsj -nographic \
+      -drive file=3Dimage-bmc,if=3Dmtd,bus=3D0,unit=3D0,format=3Draw
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 4c5b0e4aab..4c0da725ee 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -86,6 +86,7 @@ undocumented; you can get a complete list by running
    arm/musicpal
    arm/gumstix
    arm/nseries
+   arm/nuvoton
    arm/orangepi
    arm/palm
    arm/xscale
--=20
2.28.0.236.gb10cc79966-goog


