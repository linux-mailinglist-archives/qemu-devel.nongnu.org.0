Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E9489624
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 11:17:06 +0100 (CET)
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rjc-0007qR-L8
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 05:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n6rfl-0006aP-6A
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:13:05 -0500
Received: from [2a00:1450:4864:20::534] (port=35688
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n6rfi-0003CA-Kb
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:13:04 -0500
Received: by mail-ed1-x534.google.com with SMTP id q25so42808722edb.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 02:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=KrrLUAtuqj1b5dBz/Rez55EI3Obzr7DuidHwjntUPkU=;
 b=ctvpnSnBniKvZK0eyBOZbNCm6hl+AQqtAw5z4amgmYyfXJwNXAAlQAusF117li9jJ7
 1TFY7I4cVHGIBe6Wm6d4JCxgSjae7k9nOCnDW/xwCp++5GdjjKs1AQ3uqaMkAvSCIdgU
 oa+dFGnNI5s7J9EkT0/LPA3oZauuY+2Eu1cazVrU/WxTMWShaFFr7J5Mz7cyg4wO4hej
 2rGi1gGPYXOsazqjyxtzzIBwpaJB8+oTUfw4hsvG2uYSw8eiKQKbz5cuDj3I5ZiUBw+v
 Agr5c+OcOD1bkDXNonucscimqCUDI+n9dNkSEowI0ryn1Uh7MWAJKz21AFvq6wmL0+nQ
 UGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=KrrLUAtuqj1b5dBz/Rez55EI3Obzr7DuidHwjntUPkU=;
 b=olA6rl/wV4leuPoOztNpaAla2pv8sBZ3+F7W26imA2ly8oDF31E7ql8QlKzv8gqPUb
 uRPz6cbnnuC3Ek9iADp6YgfB/2nPS7u2WFqRKuMoQYnNUoKAukLPq4bvBSaTPT9GkUZL
 AG38sMKti6Jh592l+0N0hXn+zbiI7wNBWJuLjvm4WvChVAn+/PlrlszWxvlNJEs5+bIS
 uiYMtP0/bmq9AcB4hp9t/uk7ThBtgugCNQjl0QVoVR8Y7lJMdz+7yObuB0WXvNM6Jnc/
 9WYu+lJF9GbdPLapZPjuF2VtKGh3YMaLvySUcJhLeNTX9q7m8zkImMAFS2RTPmk3V2g9
 YZiw==
X-Gm-Message-State: AOAM53397JAqa2iDvpaYpClmyNkz5inMi65miy+/CqPYxu+43U3kSmvU
 rG1l5dShiOmUfmQBDWhLcw0WUqlMfPkFulFP
X-Google-Smtp-Source: ABdhPJzwJFML+15IYSF1wwvhKh6R+hW58CQ1qGcTlfB3aGPfCrYxUqbZ10eUqrywCC2aNMXF9IyqFQ==
X-Received: by 2002:a17:907:6e20:: with SMTP id
 sd32mr3559248ejc.692.1641809579940; 
 Mon, 10 Jan 2022 02:12:59 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id z16sm1049653edm.49.2022.01.10.02.12.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jan 2022 02:12:59 -0800 (PST)
From: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: /usr/shared/qemu binaries
Message-Id: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
Date: Mon, 10 Jan 2022 12:12:58 +0200
To: QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=ilg@livius.net; helo=mail-ed1-x534.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

I successfully built two QEMU 6.2 binary packages, one with Arm and one =
with RISC-V, each with standalone variants for Linux Intel, Linux Arm, =
Windows Intel, macOS Intel and macOS Arm.

Each package includes only the relevant executables =
(qemu-system-arm/aarch64 and respectively qemu-system-riscv32/riscv64).

However I noticed that the `make install` also creates a =
`.../shared/qemu` folder with more than 200 MB of binaries.


Given that my binary packages are intended to be installed as =
dependencies during tests, I think it would be a waste of bandwidth to =
include all those binaries in all distributions.


However I don't know if any of those binaries are internally referred by =
various configuration options, and I'm concerned that simply removing =
the binaries will result in failures to start the emulation. For =
bare-metal emulation I expect none, but for Linux emulation there might =
be some (unfortunately my experience with emulating Linux is poor, and I =
cannot tell).


If there are such cases, could you suggest which binaries are mandatory =
for inclusion in the QEMU Arm package and which in the QEMU RISC-V =
package, if any?

Also, is there a configuration option to disable the inclusion of those =
binaries?


Thank you,

Liviu


------------------------------------------------------------------

p.s. For completeness, I added the list of files generated by my build =
of qemu-system-arm/aarch64 6.2.0:


ilg@wks qemu-arm % du -s -m share/qemu =20
221	share/qemu

ilg@wks qemu-arm % ls -l share/qemu
total 448560
-rw-r--r--   1 ilg  staff       850 Jan  7 14:50 QEMU,cgthree.bin
-rw-r--r--   1 ilg  staff      1402 Jan  7 14:50 QEMU,tcx.bin
-rw-r--r--   1 ilg  staff      3211 Jan  7 14:50 bamboo.dtb
-rw-r--r--   1 ilg  staff    262144 Jan  7 14:50 bios-256k.bin
-rw-r--r--   1 ilg  staff    131072 Jan  7 14:50 bios-microvm.bin
-rw-r--r--   1 ilg  staff    131072 Jan  7 14:50 bios.bin
-rw-r--r--   1 ilg  staff      9779 Jan  7 14:50 canyonlands.dtb
-rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-aarch64-code.fd
-rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-arm-code.fd
-rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-arm-vars.fd
-rw-r--r--   1 ilg  staff   3653632 Jan  7 14:52 edk2-i386-code.fd
-rw-r--r--   1 ilg  staff   3653632 Jan  7 14:52 =
edk2-i386-secure-code.fd
-rw-r--r--   1 ilg  staff    540672 Jan  7 14:52 edk2-i386-vars.fd
-rw-r--r--   1 ilg  staff     42903 Jan  7 14:50 edk2-licenses.txt
-rw-r--r--   1 ilg  staff   3653632 Jan  7 14:52 edk2-x86_64-code.fd
-rw-r--r--   1 ilg  staff   3653632 Jan  7 14:52 =
edk2-x86_64-secure-code.fd
-rw-r--r--   1 ilg  staff    159232 Jan  7 14:50 efi-e1000.rom
-rw-r--r--   1 ilg  staff    159232 Jan  7 14:50 efi-e1000e.rom
-rw-r--r--   1 ilg  staff    159232 Jan  7 14:50 efi-eepro100.rom
-rw-r--r--   1 ilg  staff    157696 Jan  7 14:50 efi-ne2k_pci.rom
-rw-r--r--   1 ilg  staff    157696 Jan  7 14:50 efi-pcnet.rom
-rw-r--r--   1 ilg  staff    160768 Jan  7 14:50 efi-rtl8139.rom
-rw-r--r--   1 ilg  staff    160768 Jan  7 14:50 efi-virtio.rom
-rw-r--r--   1 ilg  staff    156672 Jan  7 14:50 efi-vmxnet3.rom
drwxr-xr-x   8 ilg  staff       256 Jan  7 14:53 firmware
-rw-r--r--   1 ilg  staff    757144 Jan  7 14:50 hppa-firmware.img
drwxr-xr-x  36 ilg  staff      1152 Jan  7 14:53 keymaps
-rw-r--r--   1 ilg  staff      9216 Jan  7 14:50 kvmvapic.bin
-rw-r--r--   1 ilg  staff      1024 Jan  7 14:50 linuxboot.bin
-rw-r--r--   1 ilg  staff      1536 Jan  7 14:50 linuxboot_dma.bin
-rw-r--r--   1 ilg  staff      1024 Jan  7 14:50 multiboot.bin
-rw-r--r--   1 ilg  staff      1024 Jan  7 14:50 multiboot_dma.bin
-rw-r--r--   1 ilg  staff       768 Jan  7 14:50 npcm7xx_bootrom.bin
-rw-r--r--   1 ilg  staff    696912 Jan  7 14:50 openbios-ppc
-rw-r--r--   1 ilg  staff    382048 Jan  7 14:50 openbios-sparc32
-rw-r--r--   1 ilg  staff   1593408 Jan  7 14:50 openbios-sparc64
-rw-r--r--   1 ilg  staff     78680 Jan  7 14:50 =
opensbi-riscv32-generic-fw_dynamic.bin
-rw-r--r--   1 ilg  staff    727464 Jan  7 14:50 =
opensbi-riscv32-generic-fw_dynamic.elf
-rw-r--r--   1 ilg  staff     75096 Jan  7 14:50 =
opensbi-riscv64-generic-fw_dynamic.bin
-rw-r--r--   1 ilg  staff    781264 Jan  7 14:50 =
opensbi-riscv64-generic-fw_dynamic.elf
-rw-r--r--   1 ilg  staff    153728 Jan  7 14:50 palcode-clipper
-rw-r--r--   1 ilg  staff      9882 Jan  7 14:50 petalogix-ml605.dtb
-rw-r--r--   1 ilg  staff      8161 Jan  7 14:50 =
petalogix-s3adsp1800.dtb
-rw-r--r--   1 ilg  staff      1536 Jan  7 14:50 pvh.bin
-rw-r--r--   1 ilg  staff     67072 Jan  7 14:50 pxe-e1000.rom
-rw-r--r--   1 ilg  staff     61440 Jan  7 14:50 pxe-eepro100.rom
-rw-r--r--   1 ilg  staff     61440 Jan  7 14:50 pxe-ne2k_pci.rom
-rw-r--r--   1 ilg  staff     61440 Jan  7 14:50 pxe-pcnet.rom
-rw-r--r--   1 ilg  staff     61440 Jan  7 14:50 pxe-rtl8139.rom
-rw-r--r--   1 ilg  staff     60416 Jan  7 14:50 pxe-virtio.rom
-rw-r--r--   1 ilg  staff     65536 Jan  7 14:50 qboot.rom
-rw-r--r--   1 ilg  staff    154542 Jan  7 14:50 qemu-nsis.bmp
-rw-r--r--   1 ilg  staff     18752 Jan  7 14:50 qemu_vga.ndrv
-rw-r--r--   1 ilg  staff     50936 Jan  7 14:50 s390-ccw.img
-rw-r--r--   1 ilg  staff     79688 Jan  7 14:50 s390-netboot.img
-rw-r--r--   1 ilg  staff      4096 Jan  7 14:50 sgabios.bin
-rw-r--r--   1 ilg  staff   2528128 Jan  7 14:50 skiboot.lid
-rw-r--r--   1 ilg  staff    991744 Jan  7 14:50 slof.bin
-rw-r--r--   1 ilg  staff    401308 Jan  7 14:51 trace-events-all
-rw-r--r--   1 ilg  staff    524288 Jan  7 14:50 =
u-boot-sam460-20100605.bin
-rw-r--r--   1 ilg  staff    421720 Jan  7 14:50 u-boot.e500
-rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-ati.bin
-rw-r--r--   1 ilg  staff     28672 Jan  7 14:50 =
vgabios-bochs-display.bin
-rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-cirrus.bin
-rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-qxl.bin
-rw-r--r--   1 ilg  staff     28672 Jan  7 14:50 vgabios-ramfb.bin
-rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-stdvga.bin
-rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-virtio.bin
-rw-r--r--   1 ilg  staff     39424 Jan  7 14:50 vgabios-vmware.bin
-rw-r--r--   1 ilg  staff     38912 Jan  7 14:50 vgabios.bin



