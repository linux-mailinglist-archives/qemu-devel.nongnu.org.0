Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD936FEAE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:35:20 +0200 (CEST)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcW6p-00011q-2O
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVzc-00043R-RH; Fri, 30 Apr 2021 12:27:54 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVzX-0005Ez-Jq; Fri, 30 Apr 2021 12:27:50 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MmUYD-1lCUd52B29-00iWrt; Fri, 30 Apr 2021 18:27:42 +0200
Subject: Re: [PATCH] hw: Do not include hw/sysbus.h if it is not necessary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210327082804.2259480-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b5be58cf-7229-df29-d14d-6e8dc604b8f5@vivier.eu>
Date: Fri, 30 Apr 2021 18:27:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210327082804.2259480-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8DjDElMEsAg8uS+Gsz30+yCBJ5DghgY3r3RQZWAxAevaEy6hhNI
 Y4bi7woo9R+a3u0YTycpTWwC8ps6yr2yJDP7mSlltD9Qfq/yd/Tk81S79mCfjg6isAPtOms
 wRgPjHN67piYPRozo0I0l6WF/NkY6Ru97n0dJc/MFKjHDoO93q4zLfmq1t2XmUZacpxCkDO
 VVRZZ8BijfzbXWNume3+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:spNRIhRTzXw=:6i98ulHz0A/VK2/VjKER7M
 EixNu2peYfbGdbqv0eVCcWxEyXLV/+2pEihK/hu1HSuIOcwHA2Mh43um9m5NjHxzvfDOHjMl4
 0XDBrCTbKIcgxgc3rBjIgvKZ79Z1TR2wGcgT78mUnziMSdIDY7zwkIvjJZVUcea5T6UOdkcMg
 O8hcwfgKIo2z+C/spOzW2M8djuUcGS8b6jMBxyye9ZmapRcvGgydYHirzSSvaA8jGxE3czAJh
 FNOkV8FlFQxviQZjZ6UMe9E0Wvcrf4+EgNkvYp5k6cF0s8kY2QZr6M95r8adtgQE4+NzLvmsZ
 FyKzoi41k+G/IfuncskhWpwExgd2mJFzHEdwHANQocdT/ALX1ymkCDjpgRGAQSU3zY7YoTNIh
 VX889/B3Uq4YFe5pQ92eyOFII/GtSoQh3OJMxj8KiRwbRd5zLwSf0rOstjnZ2z6q8PdEQMUUM
 GgrWQc/gVkviPJRv94Pi0hR9zWn/flEkgg+1FpGP1P0yAAz2TWSonxnSZsJHTbKXmkPKmxTfs
 qImRYFJcv02zDnU1MUscYI=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/03/2021 à 09:28, Thomas Huth a écrit :
> Many files include hw/sysbus.h without needing it. Remove the superfluous
> include statements.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/cubieboard.c         | 1 -
>  hw/arm/orangepi.c           | 1 -
>  hw/char/riscv_htif.c        | 1 -
>  hw/char/sifive_uart.c       | 1 -
>  hw/char/virtio-serial-bus.c | 1 -
>  hw/core/generic-loader.c    | 1 -
>  hw/core/guest-loader.c      | 1 -
>  hw/ide/ahci_internal.h      | 1 -
>  hw/input/lasips2.c          | 1 -
>  hw/intc/arm_gic_kvm.c       | 1 -
>  hw/intc/arm_gicv3.c         | 1 -
>  hw/intc/arm_gicv3_kvm.c     | 1 -
>  hw/intc/s390_flic_kvm.c     | 1 -
>  hw/isa/lpc_ich9.c           | 1 -
>  hw/isa/piix4.c              | 1 -
>  hw/moxie/moxiesim.c         | 1 -
>  hw/nios2/generic_nommu.c    | 1 -
>  hw/nubus/nubus-bus.c        | 1 -
>  hw/nvram/spapr_nvram.c      | 1 -
>  hw/rx/rx-gdbsim.c           | 1 -
>  hw/s390x/s390-ccw.c         | 1 -
>  hw/s390x/virtio-ccw.c       | 1 -
>  hw/timer/mips_gictimer.c    | 1 -
>  hw/usb/xen-usb.c            | 1 -
>  hw/vfio/ap.c                | 1 -
>  hw/vfio/ccw.c               | 1 -
>  hw/xen/xen-bus-helper.c     | 1 -
>  27 files changed, 27 deletions(-)
> 
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index 9d0d728180..3ec30ca5af 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -20,7 +20,6 @@
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "sysemu/sysemu.h"
> -#include "hw/sysbus.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/arm/allwinner-a10.h"
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index 40cdb5c6d2..b8d38c9e8d 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -22,7 +22,6 @@
>  #include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> -#include "hw/sysbus.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/arm/allwinner-h3.h"
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index ba1af1cfc4..ddae738d56 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -23,7 +23,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/log.h"
> -#include "hw/sysbus.h"
>  #include "hw/char/riscv_htif.h"
>  #include "hw/char/serial.h"
>  #include "chardev/char.h"
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index ee7adb8e30..fe12666789 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -19,7 +19,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/log.h"
> -#include "hw/sysbus.h"
>  #include "chardev/char.h"
>  #include "chardev/char-fe.h"
>  #include "hw/irq.h"
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index b20038991a..dd6bc27b3b 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -28,7 +28,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/queue.h"
>  #include "hw/qdev-properties.h"
> -#include "hw/sysbus.h"
>  #include "trace.h"
>  #include "hw/virtio/virtio-serial.h"
>  #include "hw/virtio/virtio-access.h"
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index 2b2a7b5e9a..d14f932eea 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -32,7 +32,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/core/cpu.h"
> -#include "hw/sysbus.h"
>  #include "sysemu/dma.h"
>  #include "sysemu/reset.h"
>  #include "hw/boards.h"
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> index bde44e27b4..d3f9d1a06e 100644
> --- a/hw/core/guest-loader.c
> +++ b/hw/core/guest-loader.c
> @@ -26,7 +26,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/core/cpu.h"
> -#include "hw/sysbus.h"
>  #include "sysemu/dma.h"
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
> index 7f32e87731..109de9e2d1 100644
> --- a/hw/ide/ahci_internal.h
> +++ b/hw/ide/ahci_internal.h
> @@ -26,7 +26,6 @@
>  
>  #include "hw/ide/ahci.h"
>  #include "hw/ide/internal.h"
> -#include "hw/sysbus.h"
>  #include "hw/pci/pci.h"
>  
>  #define AHCI_MEM_BAR_SIZE         0x1000
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 60afb94c78..275737842e 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -26,7 +26,6 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/input/ps2.h"
>  #include "hw/input/lasips2.h"
> -#include "hw/sysbus.h"
>  #include "exec/hwaddr.h"
>  #include "sysemu/sysemu.h"
>  #include "trace.h"
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
> index 9494185cf4..49f79a8674 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -23,7 +23,6 @@
>  #include "qapi/error.h"
>  #include "qemu/module.h"
>  #include "cpu.h"
> -#include "hw/sysbus.h"
>  #include "migration/blocker.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_arm.h"
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 66eaa97198..d63f8af604 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -18,7 +18,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> -#include "hw/sysbus.h"
>  #include "hw/intc/arm_gicv3.h"
>  #include "gicv3_internal.h"
>  
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 65a4c880a3..5c09f00dec 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -22,7 +22,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/intc/arm_gicv3_common.h"
> -#include "hw/sysbus.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "sysemu/kvm.h"
> diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
> index b3fb9f8395..d1c8fb8016 100644
> --- a/hw/intc/s390_flic_kvm.c
> +++ b/hw/intc/s390_flic_kvm.c
> @@ -17,7 +17,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qapi/error.h"
> -#include "hw/sysbus.h"
>  #include "sysemu/kvm.h"
>  #include "hw/s390x/s390_flic.h"
>  #include "hw/s390x/adapter.h"
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 3963b73520..160bea447a 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -34,7 +34,6 @@
>  #include "qapi/visitor.h"
>  #include "qemu/range.h"
>  #include "hw/isa/isa.h"
> -#include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "hw/irq.h"
>  #include "hw/isa/apm.h"
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index a50d97834c..d2d9196039 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -29,7 +29,6 @@
>  #include "hw/southbridge/piix.h"
>  #include "hw/pci/pci.h"
>  #include "hw/isa/isa.h"
> -#include "hw/sysbus.h"
>  #include "hw/intc/i8259.h"
>  #include "hw/dma/i8257.h"
>  #include "hw/timer/i8254.h"
> diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
> index f7b57fcae1..196b730589 100644
> --- a/hw/moxie/moxiesim.c
> +++ b/hw/moxie/moxiesim.c
> @@ -29,7 +29,6 @@
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> -#include "hw/sysbus.h"
>  #include "net/net.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/nios2/generic_nommu.c b/hw/nios2/generic_nommu.c
> index 19899e2c1e..b70a42dc2f 100644
> --- a/hw/nios2/generic_nommu.c
> +++ b/hw/nios2/generic_nommu.c
> @@ -31,7 +31,6 @@
>  #include "qemu-common.h"
>  #include "cpu.h"
>  
> -#include "hw/sysbus.h"
>  #include "hw/char/serial.h"
>  #include "hw/boards.h"
>  #include "exec/memory.h"
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index 942a6d5342..5c13452308 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -10,7 +10,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/nubus/nubus.h"
> -#include "hw/sysbus.h"
>  #include "qapi/error.h"
>  
>  
> diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
> index 01f7752014..3bb4654c58 100644
> --- a/hw/nvram/spapr_nvram.c
> +++ b/hw/nvram/spapr_nvram.c
> @@ -33,7 +33,6 @@
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/runstate.h"
> -#include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "hw/nvram/chrp_nvram.h"
>  #include "hw/ppc/spapr.h"
> diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
> index 8c611b0a59..9b82feff52 100644
> --- a/hw/rx/rx-gdbsim.c
> +++ b/hw/rx/rx-gdbsim.c
> @@ -22,7 +22,6 @@
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> -#include "hw/sysbus.h"
>  #include "hw/loader.h"
>  #include "hw/rx/rx62n.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
> index b497571863..242491a1ae 100644
> --- a/hw/s390x/s390-ccw.c
> +++ b/hw/s390x/s390-ccw.c
> @@ -15,7 +15,6 @@
>  #include <libgen.h>
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> -#include "hw/sysbus.h"
>  #include "hw/s390x/css.h"
>  #include "hw/s390x/css-bridge.h"
>  #include "hw/s390x/s390-ccw.h"
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 06c0605681..1351aa3db7 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -17,7 +17,6 @@
>  #include "hw/virtio/virtio.h"
>  #include "migration/qemu-file-types.h"
>  #include "hw/virtio/virtio-net.h"
> -#include "hw/sysbus.h"
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
> diff --git a/hw/timer/mips_gictimer.c b/hw/timer/mips_gictimer.c
> index bc44cd934e..2b0696d4ac 100644
> --- a/hw/timer/mips_gictimer.c
> +++ b/hw/timer/mips_gictimer.c
> @@ -7,7 +7,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "hw/timer/mips_gictimer.h"
>  
> diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
> index 4d266d7bb4..0f7369e7ed 100644
> --- a/hw/usb/xen-usb.c
> +++ b/hw/usb/xen-usb.c
> @@ -26,7 +26,6 @@
>  #include "qemu/config-file.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/option.h"
> -#include "hw/sysbus.h"
>  #include "hw/usb.h"
>  #include "hw/xen/xen-legacy-backend.h"
>  #include "monitor/qdev.h"
> diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
> index 9571c2f91f..f9dbec37da 100644
> --- a/hw/vfio/ap.c
> +++ b/hw/vfio/ap.c
> @@ -14,7 +14,6 @@
>  #include <linux/vfio.h>
>  #include <sys/ioctl.h>
>  #include "qapi/error.h"
> -#include "hw/sysbus.h"
>  #include "hw/vfio/vfio.h"
>  #include "hw/vfio/vfio-common.h"
>  #include "hw/s390x/ap-device.h"
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index b2df708e4b..e752c845e9 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -20,7 +20,6 @@
>  #include <sys/ioctl.h>
>  
>  #include "qapi/error.h"
> -#include "hw/sysbus.h"
>  #include "hw/vfio/vfio.h"
>  #include "hw/vfio/vfio-common.h"
>  #include "hw/s390x/s390-ccw.h"
> diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
> index b459bb9396..5a1e12b374 100644
> --- a/hw/xen/xen-bus-helper.c
> +++ b/hw/xen/xen-bus-helper.c
> @@ -6,7 +6,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/sysbus.h"
>  #include "hw/xen/xen.h"
>  #include "hw/xen/xen-bus.h"
>  #include "hw/xen/xen-bus-helper.h"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


