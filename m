Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA051BE9E0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 23:29:25 +0200 (CEST)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTuGh-00063K-Ij
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 17:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maxim.uvarov@linaro.org>) id 1jTuBW-00040a-Be
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 17:28:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <maxim.uvarov@linaro.org>) id 1jTuAF-0002C5-GW
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 17:24:02 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:44967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1jTuAF-0002BP-2W
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 17:22:43 -0400
Received: by mail-yb1-xb44.google.com with SMTP id o139so2022323ybc.11
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 14:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=E2cqTwkAVjxmv3V2Yhs9fijcUpvzGzF+6McpCZdUFFQ=;
 b=F6DnsK6unD0hjzbRxAvyETFxb3KjO347uVtOPaCvgC9tyhqxIQtWceTux/rgWVb/v3
 9hF5vqqibcJ7WEPbavXevXUg0VRQEoanTnKczE8Kd8Ee3pdoBHs1I0YVAYHV4BUw+Ujq
 H8yxvrTK7tCBNXlVVaJRQc/3/6LUjz7+tq00NeSZhT+jBl/A7m76Ef76/4E6c9WiCoNV
 nKM/KhUxVOGkPHYanwsHmnKO+s3oAG5KeBAbZR2wAy1JF2t6jtqCjJmL3l87cK2P/a2T
 UZqM7Tq3dIFrMR0otOQpWO1o1qWfxqYIV+2xLqcDhbxP8BgL3NJgLbzqFuv8ns6TuZPm
 6M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=E2cqTwkAVjxmv3V2Yhs9fijcUpvzGzF+6McpCZdUFFQ=;
 b=AL07rXi8rkt1jW1FnIOrIQh1q/MjqUF02eI11JTOY2b4TIg+vLu0BKL6XX5tKCNnvy
 P2iEmjHadgIBNShx6PiSNr1KvjTgB/4+l8VuCRJ6yZ/UyCxXSBh3sNTko1s5zrUJTXk2
 CCNX47M/zBWj/ihjq279aUE6aQVoDr+X0ACXDS+cYX3gqDEJig2uXR8yveFM7XaYRwln
 gS8pG9s60sWXtbfQ0aaO/88yxsx9LODRNBuo3ew3HAvhuOAMsqvcWnPCCuevP+QuUccW
 nqaquy11Zsp/Rnc/2bFhXcgk0chKBG0e1OlP8PtheeFQlu1YF2qg49XhNU0mjQDBJOm4
 H2ww==
X-Gm-Message-State: AGi0PuZIrQy1qEbMf1V2lwvM/AOeHdzAoAyvdbDAFHWqek2Brl/fZCMc
 oELAOMQM0Ph/YqCEGpNueN2aPxIkKuQ+yTYCu1RBOmVQArw=
X-Google-Smtp-Source: APiQypJOUsPkpvbkt+48/Bo/H5VcZQvrHfxSW4TZBbhvAYQZfoUnaHFPxuaCmYgK+nghDdO0Td3CBHqyPg8s+M/q9Ds=
X-Received: by 2002:a25:6404:: with SMTP id y4mr501880ybb.374.1588195361162;
 Wed, 29 Apr 2020 14:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200422130724.3581-1-maxim.uvarov@linaro.org>
In-Reply-To: <20200422130724.3581-1-maxim.uvarov@linaro.org>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Thu, 30 Apr 2020 00:22:30 +0300
Message-ID: <CAD8XO3aLFWYf=VM9seb86pvExZboh3Jfgqw08FEj+LLtOZFf7w@mail.gmail.com>
Subject: Re: [PATCHv2] add optee dts entry for secure machine
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-yb1-xb44.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::b44
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping to merge this patch.
For more detail. This patch creates a dtb entry to load the optee
driver which is needed for secure boot (atf+optee+uboot+linux). Kernel
part is already there:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tee/optee/core.c?h=v5.7-rc3#n705
.compatible = "linaro,optee-tz"

Thank you,
Maxim.

On Wed, 22 Apr 2020 at 16:07, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Add optee compatible string for dtb to force linux
> to boot optee module.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  v2: added method.
>  hw/arm/virt.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 656b008..c937a82 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1335,6 +1335,23 @@ static void create_platform_bus(VirtMachineState *vms)
>                                  sysbus_mmio_get_region(s, 0));
>  }
>
> +static void create_secure_tee(VirtMachineState *vms)
> +{
> +    char *firmware;
> +    char *optee;
> +
> +    firmware = g_strdup_printf("/firmware");
> +    qemu_fdt_add_subnode(vms->fdt, firmware);
> +
> +    optee = g_strdup_printf("/firmware/optee");
> +    qemu_fdt_add_subnode(vms->fdt, optee);
> +    qemu_fdt_setprop_string(vms->fdt, optee, "compatible", "linaro,optee-tz");
> +    qemu_fdt_setprop_string(vms->fdt, optee, "method", "smc");
> +
> +    g_free(optee);
> +    g_free(firmware);
> +}
> +
>  static void create_secure_ram(VirtMachineState *vms,
>                                MemoryRegion *secure_sysmem)
>  {
> @@ -1720,6 +1737,7 @@ static void machvirt_init(MachineState *machine)
>      if (vms->secure) {
>          create_secure_ram(vms, secure_sysmem);
>          create_uart(vms, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
> +        create_secure_tee(vms);
>      }
>
>      vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
> --
> 2.17.1
>

