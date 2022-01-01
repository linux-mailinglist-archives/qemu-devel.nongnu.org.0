Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141914827AF
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Jan 2022 14:18:36 +0100 (CET)
Received: from localhost ([::1]:53894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3eHL-0004HA-75
	for lists+qemu-devel@lfdr.de; Sat, 01 Jan 2022 08:18:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n3eG9-0003aw-NU
 for qemu-devel@nongnu.org; Sat, 01 Jan 2022 08:17:22 -0500
Received: from [2a00:1450:4864:20::434] (port=43891
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n3eG7-0001fY-MQ
 for qemu-devel@nongnu.org; Sat, 01 Jan 2022 08:17:20 -0500
Received: by mail-wr1-x434.google.com with SMTP id o3so2378172wrh.10
 for <qemu-devel@nongnu.org>; Sat, 01 Jan 2022 05:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imOW++GZyZQGv4lJugti242NBmXZazlWAQqs1XM/fbU=;
 b=IqMe7bM733IjKlUY2/4I2w/jPSjnJXgh6LjWLHhkp/EjaBO8RratwgXdlnaPeM9W+H
 E9BkNXq6Qolpb+4QV1zMS1hKlIifPOXyU0U4n5UbRGIZJeJI3EaUmp51CCT9hxq4rRue
 jdbApnbrqyzicw3B4M4ALa2fw9v5QUIX7gSLfgl6tbwkamoap5V0/VRSYAl2+lfMxbRp
 A5aj6vPV9nueFkRprzfLCU3LYpHgPlxQBWuXDM2Qiz82tu+N3UOOs5y0Rpw4cz9sBJ4K
 PCLbvilJp3AvAHPS4v6Z28ZTpqjD8TrS1ner8khTsH1wTf+BrpXJOOxeYx1W6YeyPxXP
 /gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imOW++GZyZQGv4lJugti242NBmXZazlWAQqs1XM/fbU=;
 b=GmlKKNIMkVUsaE21m7tT77wGqZDjaYEUhlvZ5aNddT3JGwPFDXVQSn8iHzXXcXMhCU
 Un9S/mk1pMrLnKPV719wBP666ebLQM5mhqjrt4HCkwG/czdHE8TQ0zQgg5bChSfxHPH8
 A3LRfoGMhWgIEsmxsDUOFzVAyHzWZirJ02TwozRdByM8p1xu/GiANuvwc32DRDoag78k
 YAsNx7U5i914WL9Yx1qYuA0V5En5URUAnGTorHxw8IC6RlGg1jdHugp1BnHMASRtcgNY
 7UhHGolWyxS7jCgAamVUE0sR7c9pJ+yrrpERv1R/kHLIcLE/3F0fiMxjIaNYRmE/pagJ
 hLMg==
X-Gm-Message-State: AOAM530vH3NZj31tvPyYGtj7UzGiPfzCPGWG1DDjp4R0mKOXIoOwkQU/
 hFtFTed2IDh0DJbPXQ4jsLc/+5aMbwaz2/YIecYbEw==
X-Google-Smtp-Source: ABdhPJzaE/SRi/r581fSMXf+Hw0S90vbIQ4yVhUEN+BeP9J9dqKsI7duAH4sAlezT7SUI7ZXV0jZQGEUTZQOvzJvsfs=
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr32608246wrw.313.1641043037704; 
 Sat, 01 Jan 2022 05:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20211231080923.24252-1-liweiwei@iscas.ac.cn>
 <20211231080923.24252-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20211231080923.24252-2-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Jan 2022 18:47:06 +0530
Message-ID: <CAAhSdy1jr-_ntceCCmHLCfcVcLnDrj4eVMugWaAMwxcvruHs2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/riscv: add support for svnapot extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On Fri, Dec 31, 2021 at 1:40 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c        |  1 +
>  target/riscv/cpu.h        |  1 +
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 20 ++++++++++++++++----
>  4 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6ef3314bce..cbcb7f522b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -647,6 +647,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> +    DEFINE_PROP_BOOL("x-svnapot", RISCVCPU, cfg.ext_svnapot, false),

Please drop the "x-" prefix here as well. The Svnapot extension is
already ratified.

Regards,
Anup

>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index dc10f27093..1fbbde28c6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -315,6 +315,7 @@ struct RISCVCPU {
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_svnapot;
>          bool ext_zfh;
>          bool ext_zfhmin;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 1e31f4d35f..1156c941cb 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -483,6 +483,7 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_N               0x8000000000000000 /* NAPOT translation */
>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 10f3baba53..e044153986 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,9 +619,12 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> +        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
>
> -        if (!(pte & PTE_V)) {
> +        RISCVCPU *cpu = env_archcpu(env);
> +        if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
> +            return TRANSLATE_FAIL;
> +        } else if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
> @@ -699,8 +702,17 @@ restart:
>              /* for superpage mappings, make a fake leaf PTE for the TLB's
>                 benefit. */
>              target_ulong vpn = addr >> PGSHIFT;
> -            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
> -                        (addr & ~TARGET_PAGE_MASK);
> +
> +            int napot_bits = ((pte & PTE_N) ? (ctzl(ppn) + 1) : 0);
> +            if (((pte & PTE_N) && ((ppn == 0) || (i != (levels - 1)))) ||
> +                (napot_bits != 0 && napot_bits != 4)) {
> +                return TRANSLATE_FAIL;
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
>

