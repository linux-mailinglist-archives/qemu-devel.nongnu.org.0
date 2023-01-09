Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E27663480
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:58:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF15t-0002i2-Nt; Mon, 09 Jan 2023 17:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pF15m-0002hX-26
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:58:10 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pF15k-0000OQ-GI
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:58:09 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id j18so3017663vkn.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HuApRwskrnjZ7JZSpyf9nPpTzFOL0VRkoumRzw4Sbls=;
 b=eNDYg2rqMK6cazurEMBLf2+qDI+QVYGYLd/gBS8lGtCMpZcKUoy0FyBXoS/JzgS4v8
 zxgDQNpTid3XLB3B7H0pGUiQbGDgl4on6cfuojapa0yg+VTDvMV+6+rPJMLk2YFkaIHx
 egIX9ADxkfhS4Hk4o5pF5/vZpCJPE13+eC+KpHQzSJSLNt3UYyWSMwDG4oQk66Uo7dX1
 HD9yAX2Z8yx8Y8jXtD+pkptwnRCE58kxXC4nGhtC44tDRbNztJ3cisf7w4fNH6lHSiNr
 XD4n/wXyJ+ielpEO8aRbxar8i1lbYm1TxwNHW+nQ6SqW6RFMX29w87FTm7ekbS1/RsUw
 L/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HuApRwskrnjZ7JZSpyf9nPpTzFOL0VRkoumRzw4Sbls=;
 b=d21IiCJaC9VRsOmF8oGd9c5SGM+efE9XmiDokOtaK13LY+NVQO7g5RZCItANi05uCW
 sfe1dOZvlj3ox+02JKJLZ9tKnC9TF7jLSno30QleZaZnsumSZ3x4edlWdIcmaivr89tq
 /MRedJQ2Wd4Zuj52ld8lTnWF1DrSnEAko8fNXcm3PV3fRfuNSkjmITDpo+zb0H0ohKM4
 5fld07+7R14xuvfvQ68cdgKVN7JT2/RWG+a550Djm6ywFU5FjLHdRIymhCeRvIlq7Xts
 7e4TF8X/dN14ZG7Wj01mlU8G8/8SoS60OEeJztvx0kP2hDLbVmWvLabAQsr402cSCArV
 A7lg==
X-Gm-Message-State: AFqh2koQCsxh3iEEYzneqMt8L30Qr0whS+uyjrN0V6Lxjd4bT+MDahU9
 ownmeg++7t/Va9codeqXN+x5eR/D9flQyvUH/sE=
X-Google-Smtp-Source: AMrXdXtST8zpBk5HeTRi9B4X/+MkuvUr+xl0uiiey1JHpKOPD8XY5h9IhacxDKe5h0rd+QsdRJ+JOMeXy90z6qxqkFY=
X-Received: by 2002:a1f:3215:0:b0:3d5:86ff:6638 with SMTP id
 y21-20020a1f3215000000b003d586ff6638mr6101462vky.30.1673305087472; Mon, 09
 Jan 2023 14:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-8-philmd@linaro.org>
In-Reply-To: <20230109120833.3330-8-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 Jan 2023 08:57:41 +1000
Message-ID: <CAKmqyKNQN08VjouZuGJ8U1+T5djCrM53mYm4gHLRCqCCE5yzXg@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] hw/riscv: Use generic DeviceState instead of
 PFlashCFI01
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 9, 2023 at 10:24 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Nothing here requires access to PFlashCFI01 internal fields:
> use the inherited generic DeviceState.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 9 +++++----
>  include/hw/riscv/virt.h | 3 +--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index aa8db65685..a2cd174599 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -46,6 +46,7 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/tpm.h"
> +#include "hw/block/flash.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
> @@ -106,7 +107,7 @@ static MemMapEntry virt_high_pcie_memmap;
>
>  #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
>
> -static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
> +static DeviceState *virt_flash_create1(RISCVVirtState *s,
>                                         const char *name,
>                                         const char *alias_prop_name)
>  {
> @@ -130,7 +131,7 @@ static PFlashCFI01 *virt_flash_create1(RISCVVirtState=
 *s,
>      object_property_add_alias(OBJECT(s), alias_prop_name,
>                                OBJECT(dev), "drive");
>
> -    return PFLASH_CFI01(dev);
> +    return dev;
>  }
>
>  static void virt_flash_create(RISCVVirtState *s)
> @@ -139,7 +140,7 @@ static void virt_flash_create(RISCVVirtState *s)
>      s->flash[1] =3D virt_flash_create1(s, "virt.flash1", "pflash1");
>  }
>
> -static void virt_flash_map1(PFlashCFI01 *flash,
> +static void virt_flash_map1(DeviceState *flash,
>                              hwaddr base, hwaddr size,
>                              MemoryRegion *sysmem)
>  {
> @@ -1514,7 +1515,7 @@ static void virt_machine_init(MachineState *machine=
)
>
>      for (i =3D 0; i < ARRAY_SIZE(s->flash); i++) {
>          /* Map legacy -drive if=3Dpflash to machine properties */
> -        pflash_cfi01_legacy_drive(DEVICE(s->flash[i]),
> +        pflash_cfi01_legacy_drive(s->flash[i],
>                                    drive_get(IF_PFLASH, 0, i));
>      }
>      virt_flash_map(s, system_memory);
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 3407c9e8dd..2be47547ac 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -21,7 +21,6 @@
>
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/sysbus.h"
> -#include "hw/block/flash.h"
>  #include "qom/object.h"
>
>  #define VIRT_CPUS_MAX_BITS             9
> @@ -49,7 +48,7 @@ struct RISCVVirtState {
>      DeviceState *platform_bus_dev;
>      RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
>      DeviceState *irqchip[VIRT_SOCKETS_MAX];
> -    PFlashCFI01 *flash[2];
> +    DeviceState *flash[2];
>      FWCfgState *fw_cfg;
>
>      int fdt_size;
> --
> 2.38.1
>
>

