Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE89337ED3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 21:16:18 +0100 (CET)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKRjF-0007JS-1D
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 15:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKRhF-0006gI-4r
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 15:14:13 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:54913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKRhC-0003Yr-Qk
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 15:14:12 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MdNoW-1ltmVd2LPk-00ZOJH; Thu, 11 Mar 2021 21:13:53 +0100
Subject: Re: [PATCH v7 0/5] m68k: add Virtual M68k Machine
To: qemu-devel@nongnu.org
References: <20210309195941.763896-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d098f778-f4c6-e9ab-ba7f-7fb0b88e26e4@vivier.eu>
Date: Thu, 11 Mar 2021 21:13:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309195941.763896-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Bp983hJB5CILvFnhm4agoHX3vcR0sBJUnkEDiEiTvydqzbwilCz
 vV8PQbq1zMoruXEyMS8bBd9PS/h1ng7KqIBC692mOeXfqvxxIRVhzkAOFFz0aFkPcCXSA2q
 WPwsPeVBiiUGbnDuKcFTtP2uPCD0adRPLekW9Vnrp5SKVmXTT+sYLIrnfSHpQM8TguWlHSm
 4N7OgHtRPXX8weDgGr7Ig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CavMIJtmGak=:QT0ZpTMCKlwBQM45A1/EBQ
 t0K83XnqtUg+nNFUpWJlhJZbb4S47XbXHdQc1q9sIxCsIX//My+ppx4Ov6ZzPYWFesQTpvAIq
 zbyBw0az4lDGnrldNZk9r/ozRNv+MFZpvKX+4Pr5+bUX5C3Cb9OoM/5pnffARnShwS0BlRHyJ
 GSuPT7AjywaYs8FSFqIlCDplMDJk1i4Fo8bQg5Qn460ucyfHhxPMNwr6qfOzxpyEwVf3ffc93
 J9NjJ/PkRr/eqref2lLgj8hoeoxHno+NhLaDYieAtkJ8zajB9I0HrjiinbHkkbe+1/tKcJysr
 1hLReVlC5hv0Al70N22HE0swd2FqzhqbIQUMjxlo4JGGKs4CKemzFeAO2+gcZaPfb20ifmq7E
 1DwYpTh4AxC8l7atfPa3fAEi7nKW+YK85N0V2tiAUzY5zYnKQhN4kWQvty2bU
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/03/2021 à 20:59, Laurent Vivier a écrit :
> The Quadra 800 machine is very limited to run linux, it manages
> only 1 GiB of memory and only some specific interfaces.
> 
> The Virtual M68k Machine is based on Goldfish interfaces defined by Google
> for Android simulator. It uses Goldfish-rtc (timer and RTC),
> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
> 
> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFIS=
> H-VIRTUAL-HARDWARE.TXT
> 
> The machine is created with 128 virtio-mmio busses, and they can
> be used to add serial console, GPU, disk, NIC, HID, ...
> 
> This series re-use the goldfish-rtc implemented for RISCV, and
> adds the two others based on the goldfish specs, the kernel driver
> and android simulator ones.
> 
> The machine can manage up to 3.2 GiB of memory, not because of an hardware
> limitation but because the kernel crashes after this value.
> 
> Simply configure qemu with:
> 
>     .../configure --target-list=3Dm68k-softmmu
> 
> To run the machine you need a modified kernel you can find here:
> 
>     https://github.com/vivier/linux/tree/m68k-virt
> 
> You need to compile the kernel with:
> 
>     make virt_defconfig
>     make vmlinux
> 
> The disk must be installed using the q800 machine because the debian installer
> doesn't want to be used with a kernel that is not the one on the ISO.
> 
> And then you can run the machine with something like:
> 
> qemu-system-m68k -M virt \
>   -m 3399672K \
>   -chardev stdio,signal=3Doff,mux=3Don,id=3Dchar0 \
>   -mon chardev=3Dchar0,mode=3Dreadline \
>   -kernel vmlinux \
>   -append "console=3Dhvc0 root=3D/dev/vda2" \
>   -blockdev node-name=3Dsystem,driver=3Dfile,filename=3Ddebian-10.0.qcow2 \
>   -blockdev node-name=3Ddrive0,driver=3Dqcow2,file=3Dsystem \
>   -device virtio-blk-device,drive=3Ddrive0 \
>   -serial chardev:char0 \
>   -device virtio-net-device,netdev=3Dhostnet0 \
>   -netdev bridge,id=3Dhostnet0,br=3Dvirbr0 \
>   -device virtio-rng-device \
>   -device virtio-serial-device \
>   -device virtio-gpu-device \
>   -device virtconsole,chardev=3Dchar0 \
>   -device virtio-keyboard-device \
>   -device virtio-mouse-device
> 
> if you want to use Goldfish-tty for the console rather than virtconsole, you
> can add "console=3DttyGF".
> 
> To start the debian-installer, you can try by adding:
> 
>   -device virtio-scsi-device \
>   -blockdev node-name=3Ddebian10,driver=3Dfile,filename=3Ddebian-10.0.0-m68k-=
> NETINST-1.iso \
>   -blockdev node-name=3Dcdrom0,driver=3Draw,file=3Ddebian10 \
>   -device scsi-cd,drive=3Dcdrom0 \
>   -initrd installer-m68k/20200315/images/cdrom/initrd.gz
> 
> ISO:    https://cdimage.debian.org/cdimage/ports/snapshots/2020-10-12/debian-=
> 10.0.0-m68k-NETINST-1.iso
> initrd: https://cdimage.debian.org/cdimage/ports/debian-installer/2020-10-12/=
> m68k/debian-installer-images_20200315_m68k.tar.gz
> 
> v7:
>   remove VIRTIO from virt Kconfig (keep only VIRTIO_MMIO)
> 
> v6:
>   m68k-virt-ctrl:
>       Renamed to virt-ctrl to be generic
>       Add a simple specs document
> 
> v5:
>   goldfish-tty:
>       Use deposit64()
>       Add .impl.min_access_size
>       Fix CMD_WRITE_BUFFER/CMD_READ_BUFFER
> 
> v4:
>   goldfish-tty:
>       Use fifo8 for the data_in buffer
>       Remove the data_out buffer from the struct and put it directly in
>       the function. We don't need to use the fifo8 type because we
>       can't bufferize the data as we can't stop the tx queue when the buffer
>       is full. We rely on qemu_chr_fe_write_all() that blocks the thread for
>       that.
>   goldfish-pic:
>       Add DEFINE_PROP_UINT8() for the index
>       Add .impl.min_access_size
> 
> v3:
>   Add some #define for the interrupt controller (and fix the number of IRQs)
>   Add some comments
>   Update MAINTAINERS
>   Remove "goldfish_rtc: re-arm the alarm after migration" that will be
>   merged via the RISC-V branch.
> 
> v2:
>   Add an interrupt controller to replace the Q800 GLUE
>   Add a system controller to shutdown the machine
>   Add a fix for goldfish_rtc (already sent alone)
>   Add statistics in goldfish-pic
>   Add versionned machine type
>   Use two goldfish-rtc rather than only one (for timer and RTC)
> 
> Laurent Vivier (5):
>   char: add goldfish-tty
>   intc: add goldfish-pic
>   m68k: add an interrupt controller
>   m68k: add a system controller
>   m68k: add Virtual M68k Machine
> 
>  docs/specs/virt-ctlr.txt                      |  26 ++
>  default-configs/devices/m68k-softmmu.mak      |   1 +
>  include/hw/char/goldfish_tty.h                |  35 ++
>  include/hw/intc/goldfish_pic.h                |  33 ++
>  include/hw/intc/m68k_irqc.h                   |  41 +++
>  include/hw/misc/virt_ctrl.h                   |  22 ++
>  .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
>  hw/char/goldfish_tty.c                        | 283 ++++++++++++++++
>  hw/intc/goldfish_pic.c                        | 219 ++++++++++++
>  hw/intc/m68k_irqc.c                           | 119 +++++++
>  hw/m68k/virt.c                                | 313 ++++++++++++++++++
>  hw/misc/virt_ctrl.c                           | 151 +++++++++
>  MAINTAINERS                                   |  13 +
>  hw/char/Kconfig                               |   3 +
>  hw/char/meson.build                           |   2 +
>  hw/char/trace-events                          |  10 +
>  hw/intc/Kconfig                               |   6 +
>  hw/intc/meson.build                           |   2 +
>  hw/intc/trace-events                          |   8 +
>  hw/m68k/Kconfig                               |   9 +
>  hw/m68k/meson.build                           |   1 +
>  hw/misc/Kconfig                               |   3 +
>  hw/misc/meson.build                           |   3 +
>  hw/misc/trace-events                          |   7 +
>  24 files changed, 1328 insertions(+)
>  create mode 100644 docs/specs/virt-ctlr.txt
>  create mode 100644 include/hw/char/goldfish_tty.h
>  create mode 100644 include/hw/intc/goldfish_pic.h
>  create mode 100644 include/hw/intc/m68k_irqc.h
>  create mode 100644 include/hw/misc/virt_ctrl.h
>  create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
>  create mode 100644 hw/char/goldfish_tty.c
>  create mode 100644 hw/intc/goldfish_pic.c
>  create mode 100644 hw/intc/m68k_irqc.c
>  create mode 100644 hw/m68k/virt.c
>  create mode 100644 hw/misc/virt_ctrl.c
> 
> --=20
> 2.29.2
> 

I've applied this series to my m68k-for-6.0 branch.

Thanks,
Laurent

