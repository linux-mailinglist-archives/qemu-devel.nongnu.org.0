Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6EC2E879E
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 15:26:54 +0100 (CET)
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvhrp-0003O4-Se
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 09:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvg01-0007hI-KL
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 07:27:13 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvfzz-00007J-Be
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 07:27:12 -0500
Received: by mail-ed1-x536.google.com with SMTP id u19so22114522edx.2
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 04:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K/htrcXeCpjvrhOLbTXk+fyb4hY+QV9O4MANPprpwYk=;
 b=TZi7DUWGk4ZG3dPivCJGpJzR5e2J69NiHE5T/VqrntcuZp7N893cyOTmWrKkY3aCky
 ToJ+LNI01DC3xIvYEXPBdGvdcJ/ygcpCbKm/389flYKqGpwwzhIpZuMrdiK59D+7dif4
 TJWNeHoK3WVrN612sQKbZr1t6X1DIRaUh9mneFR+HORcE0WKK46nID5yslB679Wh4XQZ
 em5m9AHqE7sAkd0kXLuY/wLIFGszw+xc38YyM3AMQmMuc290YC9DnDUUpS2EWiH/gg94
 SswJwiAraW0ce0QE4+OG/wAmIBjWdF2AJ6rmZbo3GMrP1Ss9D9CmcBkOYhJd8bDsyYx7
 7/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K/htrcXeCpjvrhOLbTXk+fyb4hY+QV9O4MANPprpwYk=;
 b=s6DMGETd9DauKRtEvpqypQh2UY27Uvo7xsURAY7dSmFeR3b4Lv9UWSgsKvat1yDTDI
 VCu2XlJkiZ461fPWJ520/l9NcrY2hJv74eVp1V3zmkjfozoWFrqdB5Mf43UKw37kYLeI
 7zH4Ek862lPf+lVRGeA412HISA/q8Vc2yqwSoi/ZmaPe02WTvbFCFjM/Pey8ZSEjoOkq
 wEyaJ2uk03hM6ADriNJ1FEOmJOAiBKa7piAkAtxn7KgebXqHfFJYJIXyC5VB+mAPx0R5
 Uz/eB3ozEsNZEHVg6GviKq/07+BwyDmaqAo/XR1Nine9kFjlg73sqopsly5gN6czt5hd
 YEhA==
X-Gm-Message-State: AOAM533ldb6Hfw39ZbsCsG0gzYK+Ei/BEjnudmMELAlZb+NC1OBU56eK
 iQiu+jpqcYA7wXlM06fwPOEsOg0A1z6Dd809h7okLQ==
X-Google-Smtp-Source: ABdhPJxIpHG8PtuaKwTfEQ39j/YAA447IE4HHQ2v/KqJUAbJF4H0fURvH+JY4Kp0wW7ZMCr6QAjzEw8bO8BrGACpy6s=
X-Received: by 2002:aa7:d1c2:: with SMTP id g2mr64152680edp.8.1609590428960;
 Sat, 02 Jan 2021 04:27:08 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
From: Pragnesh Patel <pragnesh.patel@sifive.com>
Date: Sat, 2 Jan 2021 17:56:56 +0530
Message-ID: <CAN8ut8Lt8dbmayZE9YCzVpoddaTefnoFazKqB=CvP9DTAF+n1Q@mail.gmail.com>
Subject: Re: [PATCH 00/22] hw/riscv: sifive_u: Add missing SPI support
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=pragnesh.patel@sifive.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 02 Jan 2021 09:24:39 -0500
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
Cc: qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi BIn,

1) Please rebase this series on master.

2) When i tried to boot from SD card image it shows below,

pragneshp:sifive-qemu$ ./build/riscv64-softmmu/qemu-system-riscv64 -M
sifive_u,msel=11 -m 4G -nographic -bios
~/opensource/u-boot/spl/u-boot-spl.bin -device
sd-card,spi=true,drive=mycard -drive
file=~/opensource/u-boot/fsbl.gpt,id=mycard,format=raw,if=none
qemu-system-riscv64: -device sd-card,spi=true,drive=mycard: Drive
'mycard' is already in use by another device


I hacked the qemu code temporary and able to boot U-Boot from SD card,
below is my hack

pragneshp:sifive-qemu$ git diff
diff --git a/block/block-backend.c b/block/block-backend.c
index ce78d30794..cfa739fa40 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -888,10 +888,11 @@ void blk_get_perm(BlockBackend *blk, uint64_t
*perm, uint64_t *shared_perm)
  */
 int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
 {
+#if 0
     if (blk->dev) {
         return -EBUSY;
     }
-
+#endif

After applying this hack, I was able to boot U-Boot from Sd card

Bootlogs:

pragneshp:sifive-qemu$ ./build/riscv64-softmmu/qemu-system-riscv64 -M
sifive_u,msel=11 -m 4G -nographic -bios
~/opensource/u-boot/spl/u-boot-spl.bin -device
sd-card,spi=true,drive=mycard -drive
file=~/opensource/u-boot/fsbl.gpt,id=mycard,format=raw,if=none

U-Boot SPL 2020.10-rc5-00007-gf9aadb57b1 (Dec 29 2020 - 17:48:05 +0530)
Trying to boot from MMC1


U-Boot 2020.10-rc5-00007-gf9aadb57b1 (Dec 29 2020 - 17:48:05 +0530)

CPU:   rv64imafdc
Model: SiFive HiFive Unleashed A00
DRAM:  4 GiB
MMC:   spi@10050000:mmc@0: 0
Loading Environment from SPIFlash... Invalid bus 0 (err=-19)
*** Warning - spi_flash_probe_bus_cs() failed, using default environment

In:    serial@10010000
Out:   serial@10010000
Err:   serial@10010000
Net:   eth0: ethernet@10090000
Hit any key to stop autoboot:  0
=>

Thanks for the series.

On Thu, Dec 31, 2020 at 5:00 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds the missing SPI support to the `sifive_u` machine in the QEMU
> mainline. With this series, upstream U-Boot for the SiFive HiFive Unleashed
> board can boot on QEMU `sifive_u` out of the box. This allows users to
> develop and test the recommended RISC-V boot flow with a real world use
> case: ZSBL (in QEMU) loads U-Boot SPL from SD card or SPI flash to L2LIM,
> then U-Boot SPL loads the payload from SD card or SPI flash that is a
> combination of OpenSBI fw_dynamic firmware and U-Boot proper.
>
> The m25p80 model is updated to support ISSI flash series. A bunch of
> ssi-sd issues are fixed, and writing to SD card in SPI mode is supported.
>
> reST documentation for RISC-V is added. Currently only `sifive_u`
> machine is documented, but more to come.
>
>
> Bin Meng (22):
>   hw/block: m25p80: Add ISSI SPI flash support
>   hw/block: m25p80: Add various ISSI flash information
>   hw/sd: ssi-sd: Fix incorrect card response sequence
>   hw/sd: sd: Support CMD59 for SPI mode
>   hw/sd: sd: Drop sd_crc16()
>   util: Add CRC16 (CCITT) calculation routines
>   hw/sd: ssi-sd: Suffix a data block with CRC16
>   hw/sd: ssi-sd: Support multiple block read (CMD18)
>   hw/sd: ssi-sd: Use macros for the dummy value and tokens in the
>     transfer
>   hw/sd: sd: Remove duplicated codes in single/multiple block read/write
>   hw/sd: sd: Allow single/multiple block write for SPI mode
>   hw/sd: sd.h: Cosmetic change of using spaces
>   hw/sd: Introduce receive_ready() callback
>   hw/sd: ssi-sd: Support single block write
>   hw/sd: ssi-sd: Support multiple block write
>   hw/ssi: Add SiFive SPI controller support
>   hw/riscv: sifive_u: Add QSPI0 controller and connect a flash
>   hw/riscv: sifive_u: Add QSPI2 controller and connect an SD card
>   hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to decimal value
>   docs/system: Sort targets in alphabetical order
>   docs/system: Add RISC-V documentation
>   docs/system: riscv: Add documentation for sifive_u machine
>
>  docs/system/riscv/sifive_u.rst | 336 +++++++++++++++++++++++++++++++++
>  docs/system/target-riscv.rst   |  72 +++++++
>  docs/system/targets.rst        |  20 +-
>  include/hw/riscv/sifive_u.h    |   9 +-
>  include/hw/sd/sd.h             |  44 ++---
>  include/hw/ssi/sifive_spi.h    |  47 +++++
>  include/qemu/crc-ccitt.h       |  33 ++++
>  hw/block/m25p80.c              |  51 ++++-
>  hw/riscv/sifive_u.c            |  91 +++++++++
>  hw/sd/core.c                   |  13 ++
>  hw/sd/sd.c                     |  82 +-------
>  hw/sd/ssi-sd.c                 | 127 +++++++++++--
>  hw/ssi/sifive_spi.c            | 290 ++++++++++++++++++++++++++++
>  util/crc-ccitt.c               | 127 +++++++++++++
>  hw/riscv/Kconfig               |   3 +
>  hw/ssi/Kconfig                 |   4 +
>  hw/ssi/meson.build             |   1 +
>  util/meson.build               |   1 +
>  18 files changed, 1232 insertions(+), 119 deletions(-)
>  create mode 100644 docs/system/riscv/sifive_u.rst
>  create mode 100644 docs/system/target-riscv.rst
>  create mode 100644 include/hw/ssi/sifive_spi.h
>  create mode 100644 include/qemu/crc-ccitt.h
>  create mode 100644 hw/ssi/sifive_spi.c
>  create mode 100644 util/crc-ccitt.c
>
> --
> 2.25.1
>
>

