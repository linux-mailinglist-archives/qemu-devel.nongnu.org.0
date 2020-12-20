Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2828C2DF534
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 12:28:57 +0100 (CET)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqwtT-0006nB-Jk
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 06:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr3-00059g-T7
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:25 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:60083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr1-0005Qp-NJ
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:25 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MeC1p-1kFxfw1n3H-00bG9e; Sun, 20 Dec 2020 12:26:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] m68k: add Virtual M68k Machine
Date: Sun, 20 Dec 2020 12:26:08 +0100
Message-Id: <20201220112615.933036-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bm37T7JuNn1w+elyAzv5BZPEPVVk08K4Nwou7rQ5srLWZ2VPjSS
 Wr/rHu/nZue8397cRv3zOWCfLYYXn3+RuN+B1I9Dd7hEIhkz7Cq59ZJwDYosEzsi8eB6p85
 6fYg6FjMMHZsBTSepvuWD5Qu7nrglukDr6lr4tKRWCI32IlKRxx9C/YyGAvd2996nLuo6OT
 DCVAsFY+E9CyghO7Xed9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Znlqjse763c=:40pfTyAn0wrZtM2DzJKuX/
 ixNRiTIYvk0f2IgaFgz6XnjGa7qUDHRZ2fhPKRSL3Ku1NUYjmwwm3kyEuWuauC8KHEBxabOad
 Le3r4kofa6OxaxzoLnVBWlKg/EDq8kxXi+cWtQPrs3+Zx62c/X9PPuXF2XPWetRJSrf8PC4ze
 4yAFnFSsE3pZeNpETmyvUGRQYMuqVuWyzIycxxYkmzzT9Zc8wdLXWkONW43jhXr8fY6gGk11v
 uiMP8vhrlxSNc+WvpgpWsU893FcUdcDXtyMZ1HLP3BZQdW1rhlTnIDUm9OYNJQX8w27dwIDWI
 OO9Nm/jlWxGQZ/748tLTWtWk28ReIoqLifxfowvXNKvsrWFd3fOddpnkKQAPJaQdCHE/Kee9L
 2OhAP505bsYxO69aDRs1lexA+QligROt9AQUa4FAVWUT8xftiHA7wEiypV/eQ
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Quadra 800 machine is very limited to run linux, it manages=0D
only 1 GiB of memory and only some specific interfaces.=0D
=0D
The Virtual M68k Machine is based on Goldfish interfaces defined by Google=
=0D
for Android simulator. It uses Goldfish-rtc (timer and RTC),=0D
Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).=0D
=0D
https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDF=
IS=3D=0D
H-VIRTUAL-HARDWARE.TXT=0D
=0D
The machine is created with 128 virtio-mmio busses, and they can=0D
be used to add serial console, GPU, disk, NIC, HID, ...=0D
=0D
This series re-use the goldfish-rtc implemented for RISCV, and=0D
adds the two others based on the goldfish specs, the kernel driver=0D
and android simulator ones.=0D
=0D
The machine can manage up to 3.2 GiB of memory, not because of an hardware=
=0D
limitation but because the kernel crashes after this value.=0D
=0D
Simply configure qemu with:=0D
=0D
    .../configure --target-list=3D3Dm68k-softmmu=0D
=0D
To run the machine you need a modified kernel you can find here:=0D
=0D
    https://github.com/vivier/linux/tree/m68k-virt=0D
=0D
You need to compile the kernel with:=0D
=0D
    make virt_defconfig=0D
    make vmlinux=0D
=0D
The disk must be installed using the q800 machine because the debian instal=
ler=0D
doesn't want to be used with a kernel that is not the one on the ISO.=0D
=0D
And then you can run the machine with something like:=0D
=0D
qemu-system-m68k -M virt \=0D
  -m 3399672K \=0D
  -chardev stdio,signal=3D3Doff,mux=3D3Don,id=3D3Dchar0 \=0D
  -mon chardev=3D3Dchar0,mode=3D3Dreadline \=0D
  -kernel vmlinux \=0D
  -append "console=3D3Dhvc0 root=3D3D/dev/vda2" \=0D
  -blockdev node-name=3D3Dsystem,driver=3D3Dfile,filename=3D3Ddebian-10.0.q=
cow2 \=0D
  -blockdev node-name=3D3Ddrive0,driver=3D3Dqcow2,file=3D3Dsystem \=0D
  -device virtio-blk-device,drive=3D3Ddrive0 \=0D
  -serial chardev:char0 \=0D
  -device virtio-net-device,netdev=3D3Dhostnet0 \=0D
  -netdev bridge,id=3D3Dhostnet0,br=3D3Dvirbr0 \=0D
  -device virtio-rng-device \=0D
  -device virtio-serial-device \=0D
  -device virtio-gpu-device \=0D
  -device virtconsole,chardev=3D3Dchar0 \=0D
  -device virtio-keyboard-device \=0D
  -device virtio-mouse-device=0D
=0D
if you want to use Goldfish-tty for the console rather than virtconsole, yo=
u=0D
can add "console=3D3DttyGF".=0D
=0D
To start the debian-installer, you can try by adding:=0D
=0D
  -device virtio-scsi-device \=0D
  -blockdev node-name=3D3Ddebian10,driver=3D3Dfile,filename=3D3Ddebian-10.0=
.0-m68k-=3D=0D
NETINST-1.iso \=0D
  -blockdev node-name=3D3Dcdrom0,driver=3D3Draw,file=3D3Ddebian10 \=0D
  -device scsi-cd,drive=3D3Dcdrom0 \=0D
  -initrd installer-m68k/20200315/images/cdrom/initrd.gz=0D
=0D
ISO:    https://cdimage.debian.org/cdimage/ports/snapshots/2020-10-12/debia=
n-=3D=0D
10.0.0-m68k-NETINST-1.iso=0D
initrd: https://cdimage.debian.org/cdimage/ports/debian-installer/2020-10-1=
2/=3D=0D
m68k/debian-installer-images_20200315_m68k.tar.gz=0D
=0D
v2:=0D
  Add an interrupt controller to replace the Q800 GLUE=0D
  Add a system controller to shutdown the machine=0D
  Add a fix for goldfish_rtc (already sent alone)=0D
  Add statistics in goldfish-pic=0D
  Add versionned machine type=0D
  Use two goldfish-rtc rather than only one (for timer and RTC)=0D
=0D
Laurent Vivier (7):=0D
  m68k: import bootinfo headers from linux=0D
  char: add goldfish-tty=0D
  intc: add goldfish-pic=0D
  m68k: add an interrupt controller=0D
  m68k: add a system controller=0D
  goldfish_rtc: re-arm the alarm after migration=0D
  m68k: add Virtual M68k Machine=0D
=0D
 default-configs/devices/m68k-softmmu.mak      |   1 +=0D
 hw/m68k/bootinfo.h                            |  55 ---=0D
 include/hw/char/goldfish_tty.h                |  36 ++=0D
 include/hw/intc/goldfish_pic.h                |  33 ++=0D
 include/hw/intc/m68k_irqc.h                   |  28 ++=0D
 include/hw/misc/m68k_virt_ctrl.h              |  22 ++=0D
 .../standard-headers/asm-m68k/bootinfo-mac.h  | 120 +++++++=0D
 .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +=0D
 include/standard-headers/asm-m68k/bootinfo.h  | 166 ++++++++++=0D
 hw/char/goldfish_tty.c                        | 266 +++++++++++++++=0D
 hw/intc/goldfish_pic.c                        | 214 ++++++++++++=0D
 hw/intc/m68k_irqc.c                           | 120 +++++++=0D
 hw/m68k/q800.c                                |  20 +-=0D
 hw/m68k/virt.c                                | 312 ++++++++++++++++++=0D
 hw/misc/m68k_virt_ctrl.c                      | 152 +++++++++=0D
 hw/rtc/goldfish_rtc.c                         |   2 +=0D
 MAINTAINERS                                   |  11 +=0D
 hw/char/Kconfig                               |   3 +=0D
 hw/char/meson.build                           |   2 +=0D
 hw/char/trace-events                          |   9 +=0D
 hw/intc/Kconfig                               |   6 +=0D
 hw/intc/meson.build                           |   2 +=0D
 hw/intc/trace-events                          |   8 +=0D
 hw/m68k/Kconfig                               |  10 +=0D
 hw/m68k/meson.build                           |   1 +=0D
 hw/misc/Kconfig                               |   3 +=0D
 hw/misc/meson.build                           |   3 +=0D
 hw/misc/trace-events                          |   7 +=0D
 28 files changed, 1562 insertions(+), 68 deletions(-)=0D
 create mode 100644 include/hw/char/goldfish_tty.h=0D
 create mode 100644 include/hw/intc/goldfish_pic.h=0D
 create mode 100644 include/hw/intc/m68k_irqc.h=0D
 create mode 100644 include/hw/misc/m68k_virt_ctrl.h=0D
 create mode 100644 include/standard-headers/asm-m68k/bootinfo-mac.h=0D
 create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h=0D
 create mode 100644 include/standard-headers/asm-m68k/bootinfo.h=0D
 create mode 100644 hw/char/goldfish_tty.c=0D
 create mode 100644 hw/intc/goldfish_pic.c=0D
 create mode 100644 hw/intc/m68k_irqc.c=0D
 create mode 100644 hw/m68k/virt.c=0D
 create mode 100644 hw/misc/m68k_virt_ctrl.c=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

