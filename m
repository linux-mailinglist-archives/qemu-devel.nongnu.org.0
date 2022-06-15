Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F68654C08D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 06:12:16 +0200 (CEST)
Received: from localhost ([::1]:33576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1KO6-0002q3-Rn
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 00:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1KI4-0000bR-SE
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 00:06:03 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:46684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1KI2-0004gE-2A
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 00:05:59 -0400
Received: by mail-qt1-x835.google.com with SMTP id j8so7533463qtn.13
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 21:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JhO9nZ2uvBsXQfaLVJAIA9/ppXW18cBIDMdz6qFgHX4=;
 b=nsjlDWl5CZTvqtSqHsclf6suQSmJFP6GrUoiSgzjMMjQRNkgtCWRapeDJiG0Aywgyh
 xFFzs46oIwxk9aH+rV+h8Zq0GGObIBfUX+JdSxXBlwVBBHBXEx1vWdV3hRI7qfQquqlt
 DmwSPLeW691WtMlzuULSKJG6RfRxSfClK0kZeFTFygjifxFyHAGFoK1HxMk0IpObNX2t
 JKylgj1mxdNLpVIeL6J1G3rIJMZM27b+r/QPpCaaF5YvnTYlDaW48EFksKra7ld1DUBF
 Nx1G5OcWUCKqJWiVSi7VHP8it1CTQG1lf9G8bH1IYCZpUwttfh2Virb6+XsZzZ9+/2RA
 zOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JhO9nZ2uvBsXQfaLVJAIA9/ppXW18cBIDMdz6qFgHX4=;
 b=WUIG3pD5XZlxzaYDMmimTseu3hZuEFBIb3JqOSNStWznNYZzOsAfAViXSUYR7rQtEq
 eqyJRqEYIK43iwfZ1Y8lVrWjoCebd0tdR2JPUjrqXtSVyt+QyTdoBUExcd7MVTSSQzjI
 0UmxlDuetVTfpkMdzOLAAiBpkojm2LApOAy7g/Qo8oSSqxdzXhKiUeUfbh2zrHoffZ+n
 hworh2luqelW6x7TITXEMome9C+FfyQfzvpCyoRTlnBeWqenvAm5QTjKNMIEy3lKH/mt
 zz6UByDIHDr+okDWIscX+oMzFgMk00o05WygjemKV3Z84Xby/nxDdNwGMsmXlM97gm1O
 +OKg==
X-Gm-Message-State: AOAM5301Ygz5MD2njG3+9VN/FPWe5OspdZr+La/AjlDedS/xHoBklu9E
 rAazjlF/vjRE+lRsmeQR9aNtkX8qdfnWSBpe1+w=
X-Google-Smtp-Source: ABdhPJz8M8QwBJhyJ+q1biOBFY0MVYmku0beogBCj4FUP6qjvUt/o0LOyJ0hja8zwQhR/LAcQr9vch70SxydH5PTan4=
X-Received: by 2002:ac8:7d55:0:b0:305:732:680b with SMTP id
 h21-20020ac87d55000000b003050732680bmr7254609qtb.391.1655265956608; Tue, 14
 Jun 2022 21:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220613115810.178210-1-Jason@zx2c4.com>
In-Reply-To: <20220613115810.178210-1-Jason@zx2c4.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Jun 2022 12:05:45 +0800
Message-ID: <CAEUhbmX8hOuhHrT1xx3HrgUt5jZvO_jUN+64RPWfZADKCbGvKg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jun 13, 2022 at 8:08 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> initialize early. Set this using the usual guest random number
> generation function. This is confirmed to successfully initialize the
> RNG on Linux 5.19-rc2.
>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/riscv/virt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index bc424dd2f5..368a723bf6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -21,6 +21,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
> +#include "qemu/guest-random.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> @@ -998,6 +999,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>      MachineState *mc = MACHINE(s);
>      uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
>      uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
> +    uint8_t rng_seed[32];
>
>      if (mc->dtb) {
>          mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
> @@ -1046,6 +1048,10 @@ update_bootargs:
>      if (cmdline && *cmdline) {
>          qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
>      }
> +
> +    /* Pass seed to RNG. */

nits: please remove the ending period

> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
>  }
>
>  static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

