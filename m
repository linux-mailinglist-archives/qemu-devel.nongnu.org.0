Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B22463C322
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 15:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p01v2-0002CU-2M; Tue, 29 Nov 2022 09:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p01uy-0002Bz-F1
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:49:05 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p01uv-0002el-9T
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:49:04 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso17602406pjt.0
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 06:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f4LVW1HhglgqGkPs+655xsfLtbysyYg7JZJML5/UigE=;
 b=h5/TrH2KN1+wFD2kUtpN50NYTv1oSnXSU8cvuw4c1JMwAIa4lc8p/zMP8qdWH2HFz0
 1Tri2l9ZX0vBGgPPr1HgIw3lJidaSl4uLOeMQ2LPrk8DW8FYl3xN/lox2YWmYgyHXUkQ
 nr2DwkprvwlUZwetibcxUeg6HreCj8Nw1+61krWXqV+J8cbIMfda0iZ3MlZfHB/fUxn/
 4mt8K3e4A8cNdNPEA6L7VnqusG0P+OjXardxvWWiXtdcxZh5YKCw57BfFRKu9oEuxVNG
 IaLmiSS1MBWqLcs3FLvreLS8PeU796ypTRx3TY5a4FpSy9YH6wlgmdDkmRkYjMtFC2bj
 yyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f4LVW1HhglgqGkPs+655xsfLtbysyYg7JZJML5/UigE=;
 b=VETyBtH1MoToSCEFfkdZGYKUuHrT8auQ3kUjs5v7QQ5r3SlPVF3AnJlceIN0z146GU
 XsOSSJSSxOzV/goQCfU3rJ6CFFv9IZkeylmcWuQmcnSbJC7YVlCuT7/SPgwPG94dEHW/
 FIe+JmO8ZHDnYJU5CjBSy5OB0eTmiaX/spQriTlA1MFFfil2b0vlAG3EUh+Wy90CVlNH
 C3/B95xR8nYxUQrNlfsZNseEDGOIckxz85HMbrCBcaeThmBeoZyJBoSf1k7p4iiFAj/k
 flY0B3DwDvIbOG6QUFCkmSEr+3+rb0LeWYAgiXG9F8qpQItN41DP2UjRmsrlGsAcCJkt
 99xw==
X-Gm-Message-State: ANoB5pkNjLR1YhWUqiTNeCjM9KD8HZHucmD19SBEfl6vobbb0SaJQoAJ
 3qYmzthyPow9Pe79HosfVRT1APPwMox8Judz7q3Ovw==
X-Google-Smtp-Source: AA0mqf4jrBn9GQHdG244jOq0x0OHVLgwcNIbxDMpWfAvRT7WdIlCG3kwwM4/tuGP9gglJ81z9WdeuALlfjdRP8S2sv0=
X-Received: by 2002:a17:902:f292:b0:189:91b8:bf92 with SMTP id
 k18-20020a170902f29200b0018991b8bf92mr7539641plc.19.1669733338480; Tue, 29
 Nov 2022 06:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20221129104809.84860-1-schspa@gmail.com>
In-Reply-To: <20221129104809.84860-1-schspa@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2022 14:48:47 +0000
Message-ID: <CAFEAcA-nznyaoxw-Ok1mY7sxFRXE0=JKtLH4unrYDK3Bv4w_9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/arm/boot: set initrd with #[address/size]-cells
 type in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 29 Nov 2022 at 10:48, Schspa Shi <schspa@gmail.com> wrote:
>
> We use 32bit value for linux,initrd-[start/end], when we have
> loader_start > 4GB, there will be a wrong initrd_start passed
> to the kernel, and the kernel will report the following warning.
>
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] initrd not fully accessible via the linear mapping -- please check your bootloader ...
> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/init.c:355 arm64_memblock_init+0x158/0x244
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.1.0-rc3-13250-g30a0b95b1335-dirty #28
> [    0.000000] Hardware name: Horizon Sigi Virtual development board (DT)
> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.000000] pc : arm64_memblock_init+0x158/0x244
> [    0.000000] lr : arm64_memblock_init+0x158/0x244
> [    0.000000] sp : ffff800009273df0
> [    0.000000] x29: ffff800009273df0 x28: 0000001000cc0010 x27: 0000800000000000
> [    0.000000] x26: 000000000050a3e2 x25: ffff800008b46000 x24: ffff800008b46000
> [    0.000000] x23: ffff800008a53000 x22: ffff800009420000 x21: ffff800008a53000
> [    0.000000] x20: 0000000004000000 x19: 0000000004000000 x18: 00000000ffff1020
> [    0.000000] x17: 6568632065736165 x16: 6c70202d2d20676e x15: 697070616d207261
> [    0.000000] x14: 656e696c20656874 x13: 0a2e2e2e20726564 x12: 0000000000000000
> [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
> [    0.000000] x8 : 0000000000000000 x7 : 796c6c756620746f x6 : 6e20647274696e69
> [    0.000000] x5 : ffff8000093c7c47 x4 : ffff800008a2102f x3 : ffff800009273a88
> [    0.000000] x2 : 80000000fffff038 x1 : 00000000000000c0 x0 : 0000000000000056
> [    0.000000] Call trace:
> [    0.000000]  arm64_memblock_init+0x158/0x244
> [    0.000000]  setup_arch+0x164/0x1cc
> [    0.000000]  start_kernel+0x94/0x4ac
> [    0.000000]  __primary_switched+0xb4/0xbc
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000001000000000-0x0000001007ffffff]
>
> To fix it, we can change it to #[address/size]-cells type.
>
> Signed-off-by: Schspa Shi <schspa@gmail.com>
>
> --
>
> Changelog:
> v1 -> v2:
>         - Use #[address/size]-cells for data type.
> ---
>  hw/arm/boot.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 57efb61ee419..98cd1fdad2c6 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -638,15 +638,17 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      }
>
>      if (binfo->initrd_size) {
> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
> -                                   binfo->initrd_start);
> +        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
> +                                     acells, binfo->initrd_start);

Indentation here doesn't look quite right.

>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
>              goto fail;
>          }
>
> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
> -                                   binfo->initrd_start + binfo->initrd_size);
> +        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-end",
> +                                          scells,
> +                                          binfo->initrd_start +
> +                                          binfo->initrd_size);

This should use 'acells', not 'scells', because it's an address,
not a size.

thanks
-- PMM

