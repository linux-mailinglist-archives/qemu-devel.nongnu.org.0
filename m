Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B9A491D4A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 04:34:38 +0100 (CET)
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9fGX-0000R4-KX
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 22:34:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9fEN-0006vQ-F7
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 22:32:23 -0500
Received: from [2a00:1450:4864:20::334] (port=52213
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9fEM-0005WX-1h
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 22:32:23 -0500
Received: by mail-wm1-x334.google.com with SMTP id c2so19124028wml.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 19:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r1s9ORPSa9ns8X8jKGvjMoVR35efRhCu+m1zU8F7ob4=;
 b=D0OjJ88z8ctKNl/175CBLhlFyCUR2yW9wYwl2dIl6jHjw0a2lvdmrdi0xz2Wf4vbxb
 6/3usdlO8qrINTVQYQ21z7sBm5H6jdI79NDvW0xmIpHlzLj8Uy+ulEwHL83cEFg7ERKd
 X5pFSFd/ebbFms3LsqtA8sh55mrtV2V0vEIxEK61JTQp9sKsmHjrixP2bOGQ7wJ1nKvg
 nsFzlrYS+txUYuE6WGsd2jwRxgnCj+FMjJyksWFbpoARt1/lQe79CYuLuvHi8I8D/2d6
 tBdXjrm7YUxeaJuM0TLAgOrQCkuOhx42LNuxil3PpYJYVmUTNZQYMNQYFN2dviQ6t+uM
 Y7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r1s9ORPSa9ns8X8jKGvjMoVR35efRhCu+m1zU8F7ob4=;
 b=eq2VXlkpqaq3V/zvqzLZ3s5F+e/TQ71mwvor9v8aa55LUlA76DYQebBrRRShna2UE/
 gQOpwUsX1XdKdDUa1yClIu/QXdRBrZ3DuQ7wqse9O2ltE1Do7EJM5ElgSdzwjueIHPiw
 39uxHjq3GQd6FNmTd9StgEXT/npoluDBllfV7SHQIdJUwI2USDOSjL90+Zabgf7X3MUR
 saHV6ICLDIyzvSCt54AD3/C2eIPDTs2xxGaaDXxLaRadECQXDG0L2P3Q54yORcYfG78h
 IxEfEGSUH982NcuXlxr34DWwD3ii0CsPMkeL+PVnFiDJXMboGYk6txhZEJ7tEgXuAEhn
 gq8A==
X-Gm-Message-State: AOAM533t/1IvXUM0qW0iCr61toRCh3HglYpX9YiEh3qCSYZD5zkEBc9c
 EquuQT6MZu3/fNVjFRWPeXoSESKX0o4jn7ve67XqLw==
X-Google-Smtp-Source: ABdhPJwCdegztHw0oZFeTmirZvfzNh0Y48umYiNaOBuiHoyeH7LCAqroWOuYaX3bd5GREf91BHrvsQkhIphf4L02U0g=
X-Received: by 2002:adf:9d81:: with SMTP id p1mr21709135wre.313.1642476739616; 
 Mon, 17 Jan 2022 19:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20220118011711.7243-4-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jan 2022 09:02:07 +0530
Message-ID: <CAAhSdy3C7eNcrq2WJ_u7GnY-z=MJQCVQXL=iKufFETswzZ0awQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] target/riscv: add support for svnapot extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::334;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, wangjunqiang@iscas.ac.cn,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - add PTE_N bit
> - add PTE_N bit check for inner PTE
> - update address translation to support 64KiB continuous region (napot_bits = 4)
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Cc: Anup Patel <anup@brainfault.org>

I did review this patch previously.

In any case, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  target/riscv/cpu.c        |  2 ++
>  target/riscv/cpu.h        |  1 +
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 18 +++++++++++++++---
>  4 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9bc25d3055..ff6c86c85b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -668,6 +668,8 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> +    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> +
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4d63086765..d3d17cde82 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -327,6 +327,7 @@ struct RISCVCPU {
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_svnapot;
>          bool ext_zfh;
>          bool ext_zfhmin;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 282cd8eecd..5501e9698b 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -486,6 +486,7 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_N               0x8000000000000000 /* NAPOT translation */
>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1820188f41..c276760c7f 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -621,12 +621,13 @@ restart:
>
>          hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>
> +        RISCVCPU *cpu = env_archcpu(env);
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> -            if (pte & (PTE_D | PTE_A | PTE_U)) {
> +            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {
>                  return TRANSLATE_FAIL;
>              }
>              base = ppn << PGSHIFT;
> @@ -702,8 +703,19 @@ restart:
>              /* for superpage mappings, make a fake leaf PTE for the TLB's
>                 benefit. */
>              target_ulong vpn = addr >> PGSHIFT;
> -            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
> -                        (addr & ~TARGET_PAGE_MASK);
> +
> +            int napot_bits = 0;
> +            if (cpu->cfg.ext_svnapot && (pte & (target_ulong)PTE_N)) {
> +                napot_bits = ctzl(ppn) + 1;
> +                if ((i != (levels - 1)) || (napot_bits != 4)) {
> +                    return TRANSLATE_FAIL;
> +                }
> +            }
> +
> +            *physical = (((ppn & ~(((target_ulong)1 << napot_bits) - 1)) |
> +                          (vpn & (((target_ulong)1 << napot_bits) - 1)) |
> +                          (vpn & (((target_ulong)1 << ptshift) - 1))
> +                        ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
>
>              /* set permissions on the TLB entry */
>              if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> --
> 2.17.1
>

