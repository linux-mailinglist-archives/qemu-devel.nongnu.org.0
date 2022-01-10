Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA9489862
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 13:15:43 +0100 (CET)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6taQ-0006NG-12
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 07:15:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6tVy-00042b-ID
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:11:06 -0500
Received: from [2607:f8b0:4864:20::129] (port=39820
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6tVw-0005Z7-4T
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:11:06 -0500
Received: by mail-il1-x129.google.com with SMTP id o1so10978735ilo.6
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 04:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FjZApGzH23wXhD5T3jKVx+nIkJg8nv6qRUWT6aHnzcI=;
 b=TSKVlU+D2oyy5qV+DRVjQfi9SjWchjg3Slv9zPnt6pWVuIyFuAh1dDtip/FvLyDgui
 6rkz4GzWk4lBsl7K+MGYxEalnCUr+H6OLht5qf2zCzvH4OMAPXP2CaQqGwSgx8SppbQB
 cfHPO8uDSd0U6+ruQDoS2goMBuZ3lnkvNXxin2Wv/M0tpZFWiqkPya1uO62o/b58USsF
 PwWMbDidKCjOBYQS3IOh35B8aYC9VRVIcJZ0GwluB1QDGXAxNZ5JOLfbHwQdfGEWLkAf
 jabIzUWScMGppYSaWTF94CcRvtGl3YnLGTHAzUmQHkXI53/IGmH0XxUSajgm/xFyH6p3
 XdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FjZApGzH23wXhD5T3jKVx+nIkJg8nv6qRUWT6aHnzcI=;
 b=YKZE84xceAMybHXf2snqR4zcWW37qou7W6aMXbNlRiPALSNJ0JfxGDMVxe5TUU736u
 BJL9jHWF+PsREILBTbQ09yGm+wqCyy43547yrv+qD2TQBLqoOVLQFQK6egWYaxwQ1jqA
 Flj+v5e8SLU8U1CSrYWw9j9rUK6dXMcS4VAZFxZNLcNfLmX6P6dKzXmpD2Ibsbi9/K2c
 MQNkJGRVQSLiyBE86+Yh6f6A5/+xa8DY2WmtBst1HK9JflG8IO2TItq5hiV1Li2MVG5o
 oXCiAuUvjfIN4raYTPs3MUiUmwRow9j81TErmag3jJ04f/boJ1K+8J3MDLGKDkTiAHnt
 cKlg==
X-Gm-Message-State: AOAM533Xxw1/AsIcea8fcrmESKtQk6e0yZbgIzBquUzvqL4dbDbEMpG/
 0zvLP1RvbUG9BSRCkJKW3UPE7MlPKTArwepGcbE=
X-Google-Smtp-Source: ABdhPJzvxqyKD6tBR1T5euLs+1PNtytfPZj4ov5e33Szo8ebd+WXQfZcITumjXj7NkEbe8ValiOXi1bHOqzfgWtgmFw=
X-Received: by 2002:a05:6e02:1806:: with SMTP id
 a6mr32620881ilv.221.1641816662783; 
 Mon, 10 Jan 2022 04:11:02 -0800 (PST)
MIME-Version: 1.0
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
In-Reply-To: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jan 2022 22:10:36 +1000
Message-ID: <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
Subject: Re: /usr/shared/qemu binaries
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 8:16 PM Liviu Ionescu <ilg@livius.net> wrote:
>
> I successfully built two QEMU 6.2 binary packages, one with Arm and one w=
ith RISC-V, each with standalone variants for Linux Intel, Linux Arm, Windo=
ws Intel, macOS Intel and macOS Arm.
>
> Each package includes only the relevant executables (qemu-system-arm/aarc=
h64 and respectively qemu-system-riscv32/riscv64).
>
> However I noticed that the `make install` also creates a `.../shared/qemu=
` folder with more than 200 MB of binaries.
>
>
> Given that my binary packages are intended to be installed as dependencie=
s during tests, I think it would be a waste of bandwidth to include all tho=
se binaries in all distributions.
>
>
> However I don't know if any of those binaries are internally referred by =
various configuration options, and I'm concerned that simply removing the b=
inaries will result in failures to start the emulation. For bare-metal emul=
ation I expect none, but for Linux emulation there might be some (unfortuna=
tely my experience with emulating Linux is poor, and I cannot tell).
>
>
> If there are such cases, could you suggest which binaries are mandatory f=
or inclusion in the QEMU Arm package and which in the QEMU RISC-V package, =
if any?
>
> Also, is there a configuration option to disable the inclusion of those b=
inaries?
>
>
> Thank you,
>
> Liviu
>
>
> ------------------------------------------------------------------
>
> p.s. For completeness, I added the list of files generated by my build of=
 qemu-system-arm/aarch64 6.2.0:
>
>
> ilg@wks qemu-arm % du -s -m share/qemu
> 221     share/qemu
>
> ilg@wks qemu-arm % ls -l share/qemu
> total 448560
> -rw-r--r--   1 ilg  staff       850 Jan  7 14:50 QEMU,cgthree.bin
> -rw-r--r--   1 ilg  staff      1402 Jan  7 14:50 QEMU,tcx.bin
> -rw-r--r--   1 ilg  staff      3211 Jan  7 14:50 bamboo.dtb
> -rw-r--r--   1 ilg  staff    262144 Jan  7 14:50 bios-256k.bin
> -rw-r--r--   1 ilg  staff    131072 Jan  7 14:50 bios-microvm.bin
> -rw-r--r--   1 ilg  staff    131072 Jan  7 14:50 bios.bin
> -rw-r--r--   1 ilg  staff      9779 Jan  7 14:50 canyonlands.dtb
> -rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-aarch64-code.fd
> -rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-arm-code.fd
> -rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-arm-vars.fd
> -rw-r--r--   1 ilg  staff   3653632 Jan  7 14:52 edk2-i386-code.fd
> -rw-r--r--   1 ilg  staff   3653632 Jan  7 14:52 edk2-i386-secure-code.fd
> -rw-r--r--   1 ilg  staff    540672 Jan  7 14:52 edk2-i386-vars.fd
> -rw-r--r--   1 ilg  staff     42903 Jan  7 14:50 edk2-licenses.txt
> -rw-r--r--   1 ilg  staff   3653632 Jan  7 14:52 edk2-x86_64-code.fd
> -rw-r--r--   1 ilg  staff   3653632 Jan  7 14:52 edk2-x86_64-secure-code.=
fd
> -rw-r--r--   1 ilg  staff    159232 Jan  7 14:50 efi-e1000.rom
> -rw-r--r--   1 ilg  staff    159232 Jan  7 14:50 efi-e1000e.rom
> -rw-r--r--   1 ilg  staff    159232 Jan  7 14:50 efi-eepro100.rom
> -rw-r--r--   1 ilg  staff    157696 Jan  7 14:50 efi-ne2k_pci.rom
> -rw-r--r--   1 ilg  staff    157696 Jan  7 14:50 efi-pcnet.rom
> -rw-r--r--   1 ilg  staff    160768 Jan  7 14:50 efi-rtl8139.rom
> -rw-r--r--   1 ilg  staff    160768 Jan  7 14:50 efi-virtio.rom
> -rw-r--r--   1 ilg  staff    156672 Jan  7 14:50 efi-vmxnet3.rom
> drwxr-xr-x   8 ilg  staff       256 Jan  7 14:53 firmware
> -rw-r--r--   1 ilg  staff    757144 Jan  7 14:50 hppa-firmware.img
> drwxr-xr-x  36 ilg  staff      1152 Jan  7 14:53 keymaps
> -rw-r--r--   1 ilg  staff      9216 Jan  7 14:50 kvmvapic.bin
> -rw-r--r--   1 ilg  staff      1024 Jan  7 14:50 linuxboot.bin
> -rw-r--r--   1 ilg  staff      1536 Jan  7 14:50 linuxboot_dma.bin
> -rw-r--r--   1 ilg  staff      1024 Jan  7 14:50 multiboot.bin
> -rw-r--r--   1 ilg  staff      1024 Jan  7 14:50 multiboot_dma.bin
> -rw-r--r--   1 ilg  staff       768 Jan  7 14:50 npcm7xx_bootrom.bin
> -rw-r--r--   1 ilg  staff    696912 Jan  7 14:50 openbios-ppc
> -rw-r--r--   1 ilg  staff    382048 Jan  7 14:50 openbios-sparc32
> -rw-r--r--   1 ilg  staff   1593408 Jan  7 14:50 openbios-sparc64

Most of these seem to be for other architectures besides ARM/RISC-V.
My guess would be keep *arm*/*aarch64*, keymaps, npcm7xx_bootrom.bin,
efi-* and linuxboot*/multiboot*. That should ensure that everything
works for you, but I'm just guessing here.

> -rw-r--r--   1 ilg  staff     78680 Jan  7 14:50 opensbi-riscv32-generic-=
fw_dynamic.bin
> -rw-r--r--   1 ilg  staff    727464 Jan  7 14:50 opensbi-riscv32-generic-=
fw_dynamic.elf
> -rw-r--r--   1 ilg  staff     75096 Jan  7 14:50 opensbi-riscv64-generic-=
fw_dynamic.bin
> -rw-r--r--   1 ilg  staff    781264 Jan  7 14:50 opensbi-riscv64-generic-=
fw_dynamic.elf

If you want to boot Linux on RISC-V QEMU you will need OpenSBI. You
can either use these or build and supply your own binaries.

> -rw-r--r--   1 ilg  staff    153728 Jan  7 14:50 palcode-clipper
> -rw-r--r--   1 ilg  staff      9882 Jan  7 14:50 petalogix-ml605.dtb
> -rw-r--r--   1 ilg  staff      8161 Jan  7 14:50 petalogix-s3adsp1800.dtb
> -rw-r--r--   1 ilg  staff      1536 Jan  7 14:50 pvh.bin
> -rw-r--r--   1 ilg  staff     67072 Jan  7 14:50 pxe-e1000.rom
> -rw-r--r--   1 ilg  staff     61440 Jan  7 14:50 pxe-eepro100.rom
> -rw-r--r--   1 ilg  staff     61440 Jan  7 14:50 pxe-ne2k_pci.rom
> -rw-r--r--   1 ilg  staff     61440 Jan  7 14:50 pxe-pcnet.rom
> -rw-r--r--   1 ilg  staff     61440 Jan  7 14:50 pxe-rtl8139.rom
> -rw-r--r--   1 ilg  staff     60416 Jan  7 14:50 pxe-virtio.rom
> -rw-r--r--   1 ilg  staff     65536 Jan  7 14:50 qboot.rom
> -rw-r--r--   1 ilg  staff    154542 Jan  7 14:50 qemu-nsis.bmp
> -rw-r--r--   1 ilg  staff     18752 Jan  7 14:50 qemu_vga.ndrv
> -rw-r--r--   1 ilg  staff     50936 Jan  7 14:50 s390-ccw.img
> -rw-r--r--   1 ilg  staff     79688 Jan  7 14:50 s390-netboot.img
> -rw-r--r--   1 ilg  staff      4096 Jan  7 14:50 sgabios.bin
> -rw-r--r--   1 ilg  staff   2528128 Jan  7 14:50 skiboot.lid
> -rw-r--r--   1 ilg  staff    991744 Jan  7 14:50 slof.bin
> -rw-r--r--   1 ilg  staff    401308 Jan  7 14:51 trace-events-all
> -rw-r--r--   1 ilg  staff    524288 Jan  7 14:50 u-boot-sam460-20100605.b=
in
> -rw-r--r--   1 ilg  staff    421720 Jan  7 14:50 u-boot.e500
> -rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-ati.bin
> -rw-r--r--   1 ilg  staff     28672 Jan  7 14:50 vgabios-bochs-display.bi=
n
> -rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-cirrus.bin
> -rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-qxl.bin
> -rw-r--r--   1 ilg  staff     28672 Jan  7 14:50 vgabios-ramfb.bin
> -rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-stdvga.bin
> -rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-virtio.bin
> -rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-vmware.bin
> -rw-r--r--   1 ilg  staff     38912 Jan  7 14:50 vgabios.bin

Not sure about these, you probably don't need them though (again, just a gu=
ess)

Alistair

>
>
>

