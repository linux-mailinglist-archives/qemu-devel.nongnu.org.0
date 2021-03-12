Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A9E33993E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 22:47:35 +0100 (CET)
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKpd8-0001f1-4U
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 16:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKpXp-0003sf-Nt
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 16:42:05 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:46339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKpXn-0008Dk-KD
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 16:42:05 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MBDvU-1lRxcO0zwk-00Cl0z; Fri, 12 Mar 2021 22:41:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/5] m68k: add Virtual M68k Machine
Date: Fri, 12 Mar 2021 22:41:40 +0100
Message-Id: <20210312214145.2936082-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jbj2nLE/YPW9SXdJxNNBAlBEeGvnoDrwzJdqOd6urgyNeOIoEpp
 p+ttScaNqu06g+oX03WLyUzVuj4a7468ak/0V4zdfnoyocY42vhJaOEiMiM+/hr5RHpGxsE
 wJvcxt6twOAJvK6VfeBdbbQu0tO45G9g0TMmAUfzLQbTc+bke6T6wRel3PcPibuWSPBeZfo
 Pq0JS9iozU95njxej5VjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iIHozHg5mEE=:B6my+3D3nzCXi6DZM/t1W5
 VQC8oeX4wtkgCGEBeFW8Qh0X+8C+avrfXPOjtrhdwjBJcWeBBNhp8UzBhItHXrVm/rujTOyle
 dZM9u0tycx27mGFjkBYJOrYmumRKwr87l2w+Puk8pLxlJEgmXesrEAEpQdUtjHIEAof8CKqMK
 K98bc4fbDM6ChwmUjw6xfKeu3ul1A0kYFAZic0d0ArNr8otYDXzS+wubZKUkgKGWfz+w2nwff
 nwC2T1WxNMDngjMBkYLNCmpgY/z4MCRpJZ9ZkGY80uSC1y01WJ+akuH3HTNB7MglaQiAAzP0R
 IawALZ1pMWZaknlEQfn5+vaIbETrWXWulAO2WlSJPL2eTTd7yz105PIK8zfxOs3GiCxXqHZ7H
 lDEj9do+YkUVJAmk29TLns1+BQ7KxCOdlb9tOiXeD/iuXM6EPESEtjig44Jo77iz41gCvHBSG
 6P7biZgPpA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Quadra 800 machine is very limited to run linux, it manages=0D
only 1 GiB of memory and only some specific interfaces.=0D
=0D
The Virtual M68k Machine is based on Goldfish interfaces defined by Google=
=0D
for Android simulator. It uses Goldfish-rtc (timer and RTC),=0D
Goldfish-pic (PIC) and Goldfish-tty (for early tty).=0D
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
v8:=0D
  goldfish-tty:=0D
    set version to 1 because, as pointed out by Peter, the version 0=0D
    provides virtual address and not physical address to QEMU.=0D
    It was working with m68k-virt kernel because virtual memory=0D
    of the kernel is mapped at the same address as the physical memory.=0D
    The m68k-virt kernel at this point is not ready to use the=0D
    goldfish tty driver with the physical address but we can=0D
    use the virtio-serial interface. We keep the goldfish-tty device=0D
    for the early printks that work fine because they use the PUT_CHAR=0D
    register.=0D
=0D
v7:=0D
  remove VIRTIO from virt Kconfig (keep only VIRTIO_MMIO)=0D
=0D
v6:=0D
  m68k-virt-ctrl:=0D
      Renamed to virt-ctrl to be generic=0D
      Add a simple specs document=0D
=0D
v5:=0D
  goldfish-tty:=0D
      Use deposit64()=0D
      Add .impl.min_access_size=0D
      Fix CMD_WRITE_BUFFER/CMD_READ_BUFFER=0D
=0D
v4:=0D
  goldfish-tty:=0D
      Use fifo8 for the data_in buffer=0D
      Remove the data_out buffer from the struct and put it directly in=0D
      the function. We don't need to use the fifo8 type because we=0D
      can't bufferize the data as we can't stop the tx queue when the buffe=
r=0D
      is full. We rely on qemu_chr_fe_write_all() that blocks the thread fo=
r=0D
      that.=0D
  goldfish-pic:=0D
      Add DEFINE_PROP_UINT8() for the index=0D
      Add .impl.min_access_size=0D
=0D
v3:=0D
  Add some #define for the interrupt controller (and fix the number of IRQs=
)=0D
  Add some comments=0D
  Update MAINTAINERS=0D
  Remove "goldfish_rtc: re-arm the alarm after migration" that will be=0D
  merged via the RISC-V branch.=0D
=0D
v2:=0D
  Add an interrupt controller to replace the Q800 GLUE=0D
  Add a system controller to shutdown the machine=0D
  Add a fix for goldfish_rtc (already sent alone)=0D
  Add statistics in goldfish-pic=0D
  Add versionned machine type=0D
  Use two goldfish-rtc rather than only one (for timer and RTC)=0D
=0D
Laurent Vivier (5):=0D
  char: add goldfish-tty=0D
  intc: add goldfish-pic=0D
  m68k: add an interrupt controller=0D
  m68k: add a system controller=0D
  m68k: add Virtual M68k Machine=0D
=0D
 docs/specs/virt-ctlr.txt                      |  26 ++=0D
 default-configs/devices/m68k-softmmu.mak      |   1 +=0D
 include/hw/char/goldfish_tty.h                |  35 ++=0D
 include/hw/intc/goldfish_pic.h                |  33 ++=0D
 include/hw/intc/m68k_irqc.h                   |  41 +++=0D
 include/hw/misc/virt_ctrl.h                   |  22 ++=0D
 .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +=0D
 hw/char/goldfish_tty.c                        | 285 ++++++++++++++++=0D
 hw/intc/goldfish_pic.c                        | 219 ++++++++++++=0D
 hw/intc/m68k_irqc.c                           | 119 +++++++=0D
 hw/m68k/virt.c                                | 313 ++++++++++++++++++=0D
 hw/misc/virt_ctrl.c                           | 151 +++++++++=0D
 MAINTAINERS                                   |  13 +=0D
 hw/char/Kconfig                               |   3 +=0D
 hw/char/meson.build                           |   2 +=0D
 hw/char/trace-events                          |  10 +=0D
 hw/intc/Kconfig                               |   6 +=0D
 hw/intc/meson.build                           |   2 +=0D
 hw/intc/trace-events                          |   8 +=0D
 hw/m68k/Kconfig                               |   9 +=0D
 hw/m68k/meson.build                           |   1 +=0D
 hw/misc/Kconfig                               |   3 +=0D
 hw/misc/meson.build                           |   3 +=0D
 hw/misc/trace-events                          |   7 +=0D
 24 files changed, 1330 insertions(+)=0D
 create mode 100644 docs/specs/virt-ctlr.txt=0D
 create mode 100644 include/hw/char/goldfish_tty.h=0D
 create mode 100644 include/hw/intc/goldfish_pic.h=0D
 create mode 100644 include/hw/intc/m68k_irqc.h=0D
 create mode 100644 include/hw/misc/virt_ctrl.h=0D
 create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h=0D
 create mode 100644 hw/char/goldfish_tty.c=0D
 create mode 100644 hw/intc/goldfish_pic.c=0D
 create mode 100644 hw/intc/m68k_irqc.c=0D
 create mode 100644 hw/m68k/virt.c=0D
 create mode 100644 hw/misc/virt_ctrl.c=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

