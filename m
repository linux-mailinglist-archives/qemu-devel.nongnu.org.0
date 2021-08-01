Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707D13DC92F
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Aug 2021 02:56:14 +0200 (CEST)
Received: from localhost ([::1]:44522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9zlx-0002L9-NM
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 20:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m9zl1-0001b3-1w
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 20:55:11 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:43714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m9zkz-0000Uf-AI
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 20:55:10 -0400
Received: by mail-io1-xd32.google.com with SMTP id 185so16134906iou.10
 for <qemu-devel@nongnu.org>; Sat, 31 Jul 2021 17:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9TYsHb3GDxtbQEeywPz9Hp+x+My0+04NWkny8jbmDeg=;
 b=aVI3m15aZtFH0hKjtmKBWdWOZURPcgOKqiStIXxv/Wza6f2QsoXmM/QsxT6h8tcRSl
 QVFzIKcUMsFx/H3EN0c6YOwe1UN1OBlyjeV2JRxfXEhuRO1vXjFlgzvtn8HfwIWTyKCZ
 mSCKVv7tWog1gfNIhT44ZA0IPaHfteOhbDLgE4lKvGToF0eS1Y+fxZhwBjWwl75y1Blx
 kfHfhfseQ1X0fyi4zCYwTwd8Dp2/xciN6Q+9p7kXWOxiREPBKGcLIquVuww9OUXJ2j0t
 BL4CuztQfFXdNAmuSO4/Igg7Z47i5T83tG650oT4ucuFeY39iWMT/SimXq2Cw6ztMD7W
 sTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9TYsHb3GDxtbQEeywPz9Hp+x+My0+04NWkny8jbmDeg=;
 b=Y58f5Sjm1AtTSUlql2YtQs0o9udZ+UA80qGlYqc1ouMk0VP/dZ1Cst8v2X526Z5B4h
 aqwxPGQ/T7IeR9IM8+I9+DlBPrcuu0m0eszlnudNBuXeB78Fo17LqGYRRzzvt6eL6jsB
 vV3ouqkQb1QYENfhQcLCvSjtseMbZrvGJdvgT4B/8ySAZbOKOlyqEsSHZUlzMdxAjqrf
 gD573z6lWS8stJlbdAlmLzIcyzkNxAVCvNZeGBGl79hUtWKGci97+gK9nlEuE1OvLlne
 YXe363YJy9+jglPtyIcU66d6phVt23Q10n3NO7gy/IwVVu4qHcEYHTA/fkcUh9F2Ffrl
 Xeyw==
X-Gm-Message-State: AOAM532lRkLTCr12pB4km6IhFosLAu87fpmUFyHD6sYXNVjW0hTX3HkQ
 v1WUmYl/OK0RVSymJWC1jsu1QwbMe1T+BHWdq54=
X-Google-Smtp-Source: ABdhPJz4fZCtLolSbUCJgxnRdm/0GfShs69dV3W6GhF9BpbBziaM6gFDRRDlXtZ4OQ4zYUB9AtrC6cFznM+cXn+bSJU=
X-Received: by 2002:a6b:ef19:: with SMTP id k25mr833454ioh.42.1627779307899;
 Sat, 31 Jul 2021 17:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-8-peter.maydell@linaro.org>
In-Reply-To: <20210730105947.28215-8-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 1 Aug 2021 10:54:41 +1000
Message-ID: <CAKmqyKOjNkgT8QTSj=tM1KuB5PPL-1KtZrj3VjagWh+4kx2_-w@mail.gmail.com>
Subject: Re: [PATCH for-6.2 7/8] arch_init.h: Don't include arch_init.h
 unnecessarily
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 9:04 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> arch_init.h only defines the QEMU_ARCH_* enumeration and the
> arch_type global. Don't include it in files that don't use those.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  blockdev.c                | 1 -
>  hw/i386/pc.c              | 1 -
>  hw/i386/pc_piix.c         | 1 -
>  hw/i386/pc_q35.c          | 1 -
>  hw/mips/jazz.c            | 1 -
>  hw/mips/malta.c           | 1 -
>  hw/ppc/prep.c             | 1 -
>  hw/riscv/sifive_e.c       | 1 -
>  hw/riscv/sifive_u.c       | 1 -
>  hw/riscv/spike.c          | 1 -
>  hw/riscv/virt.c           | 1 -
>  monitor/qmp-cmds.c        | 1 -
>  target/ppc/cpu_init.c     | 1 -
>  target/s390x/cpu-sysemu.c | 1 -
>  14 files changed, 14 deletions(-)
>
> diff --git a/blockdev.c b/blockdev.c
> index 3d8ac368a19..e79c5f3b5e8 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -56,7 +56,6 @@
>  #include "sysemu/iothread.h"
>  #include "block/block_int.h"
>  #include "block/trace.h"
> -#include "sysemu/arch_init.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/replay.h"
>  #include "qemu/cutils.h"
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c2b9d62a358..102b2239468 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -65,7 +65,6 @@
>  #include "hw/xen/start_info.h"
>  #include "ui/qemu-spice.h"
>  #include "exec/memory.h"
> -#include "sysemu/arch_init.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 30b8bd6ea92..1bc30167acc 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -43,7 +43,6 @@
>  #include "sysemu/kvm.h"
>  #include "hw/kvm/clock.h"
>  #include "hw/sysbus.h"
> -#include "sysemu/arch_init.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/xen/xen-x86.h"
>  #include "exec/memory.h"
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 04b4a4788d7..eeb0b185b11 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -31,7 +31,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "hw/loader.h"
> -#include "sysemu/arch_init.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/rtc/mc146818rtc.h"
>  #include "sysemu/kvm.h"
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index d6183e18821..f5a26e174d5 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -35,7 +35,6 @@
>  #include "hw/isa/isa.h"
>  #include "hw/block/fdc.h"
>  #include "sysemu/sysemu.h"
> -#include "sysemu/arch_init.h"
>  #include "hw/boards.h"
>  #include "net/net.h"
>  #include "hw/scsi/esp.h"
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 7dcf175d726..b770b8d3671 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -38,7 +38,6 @@
>  #include "hw/mips/mips.h"
>  #include "hw/mips/cpudevs.h"
>  #include "hw/pci/pci.h"
> -#include "sysemu/arch_init.h"
>  #include "qemu/log.h"
>  #include "hw/mips/bios.h"
>  #include "hw/ide.h"
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index acfc2a91d8e..25a2e86b421 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -40,7 +40,6 @@
>  #include "hw/rtc/mc146818rtc.h"
>  #include "hw/isa/pc87312.h"
>  #include "hw/qdev-properties.h"
> -#include "sysemu/arch_init.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/reset.h"
>  #include "trace.h"
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index ddc658c8d68..5b7b245e1f3 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -45,7 +45,6 @@
>  #include "hw/intc/sifive_plic.h"
>  #include "hw/misc/sifive_e_prci.h"
>  #include "chardev/char.h"
> -#include "sysemu/arch_init.h"
>  #include "sysemu/sysemu.h"
>
>  static const MemMapEntry sifive_e_memmap[] = {
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 87bbd10b211..6cc1a62b0f7 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -55,7 +55,6 @@
>  #include "hw/intc/sifive_plic.h"
>  #include "chardev/char.h"
>  #include "net/eth.h"
> -#include "sysemu/arch_init.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index fead77f0c48..aae36f2cb4d 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -37,7 +37,6 @@
>  #include "hw/char/riscv_htif.h"
>  #include "hw/intc/sifive_clint.h"
>  #include "chardev/char.h"
> -#include "sysemu/arch_init.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a3cd2599a5..0e55411045a 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -36,7 +36,6 @@
>  #include "hw/intc/sifive_plic.h"
>  #include "hw/misc/sifive_test.h"
>  #include "chardev/char.h"
> -#include "sysemu/arch_init.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/pci/pci.h"
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 9ddb9352e65..5c0d5e116b9 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -27,7 +27,6 @@
>  #include "sysemu/kvm.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/runstate-action.h"
> -#include "sysemu/arch_init.h"
>  #include "sysemu/blockdev.h"
>  #include "sysemu/block-backend.h"
>  #include "qapi/error.h"
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 505a0ed6ac0..319a272d4c9 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -22,7 +22,6 @@
>  #include "disas/dis-asm.h"
>  #include "exec/gdbstub.h"
>  #include "kvm_ppc.h"
> -#include "sysemu/arch_init.h"
>  #include "sysemu/cpus.h"
>  #include "sysemu/hw_accel.h"
>  #include "sysemu/tcg.h"
> diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
> index df2c6bf6941..5471e01ee82 100644
> --- a/target/s390x/cpu-sysemu.c
> +++ b/target/s390x/cpu-sysemu.c
> @@ -34,7 +34,6 @@
>
>  #include "hw/s390x/pv.h"
>  #include "hw/boards.h"
> -#include "sysemu/arch_init.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/tcg.h"
>  #include "hw/core/sysemu-cpu-ops.h"
> --
> 2.20.1
>
>

