Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77DF48FAA6
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 05:31:56 +0100 (CET)
Received: from localhost ([::1]:60860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8xCt-0001c1-Dd
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 23:31:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n8xBP-0000Ec-MK
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 23:30:25 -0500
Received: from [2a00:1450:4864:20::331] (port=38561
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n8xBC-0001xc-8e
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 23:30:14 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso15949293wmc.3
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 20:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=67GYJjFvb45InGhRzz5uLi2aa7ADP/6KYTwdYb8jxVI=;
 b=N3pm5kwX7TZw18Z7xphhGd8JxR1N0Kmw7Dl/PNnGJQkjjY+89J47yU580o1DqgfQ1+
 XQV3GwJpTM3MB/bCbGTk90ZkEYK9u/ucL10zkU5LZVyIgTEC6Indse+7skiGl/9zetnR
 pQB1c/jjZeIGWIeJwhYGAYH1QhN4SISXpcZyylGlyQkfwDnjtJ9M9HS9UdEr28csnc5K
 6tesNerH3kcY7a8QckW4BaR2VAfWXRIP9x+zesF38tckWFFEisHvvPtu2gEAHju1BYO7
 Wcjvl5llVwX0CAX+2Uo5d5eAh3+wRM/K6ZsFJvUo2zQLcTOOWaV/C7WXSqTLLmzEE7O4
 AeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67GYJjFvb45InGhRzz5uLi2aa7ADP/6KYTwdYb8jxVI=;
 b=zg3D+YvUBABC1AEyM6u/vdicFyvxGfUKHGikqBH+DQefqP+GRSKxWIDTGP4QOfq4FX
 25BCNMOA62hUj++AXCgZdKA+Yw6IBNv93+K+jK8fhfpLGiiIvPfzoVRF/JgSUCFUYqHU
 DTqgjTk+PisLFy9nIJwz5PzVbTn5KdDWyWHYbw/wFU7CCbj+/4LyyUT1KI446D06E6tc
 li4zUIBWhYOGs+SKCgT2aHBgM1+RUTf+8otA229Ii5iHwNrM3LGANCubLO7DpfQfR7+a
 USsFlnW2K+s8UELKb6fCtWoxiTO0A4XX32se6+6H5piP54Y8cKoa+auZ4UMDq4WYYQ33
 5F2w==
X-Gm-Message-State: AOAM533Ow3hRlaUMYz1AAkYtpsETk6feSWvoOpVqy482TcocyvmNTpOr
 zptSgLEY8hOeOPqJsKPC1jotg1rc36pbDj2eaowEKA==
X-Google-Smtp-Source: ABdhPJyQX9bCNk/Tjs3uoJMBH7z1Ozmw7zSLJ+0akJqikyzFkSmaldRWD6twzzQr0cjAICvmmdIAGNWvv9vndx+fMZM=
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr15651637wmj.59.1642307407833; 
 Sat, 15 Jan 2022 20:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20220116025925.29973-1-liweiwei@iscas.ac.cn>
 <20220116025925.29973-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20220116025925.29973-3-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 16 Jan 2022 09:59:56 +0530
Message-ID: <CAAhSdy2sZRZ3r8Or_nQFXGzZOQbVaKsM_QLTCBdfgNNCoGC9Xw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] target/riscv: add support for svnapot extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::331;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x331.google.com
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

On Sun, Jan 16, 2022 at 8:31 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - add PTE_N bit
> - add PTE_N bit check for inner PTE
> - update address translation to support 64KiB continuous region (napot_bits = 4)
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  target/riscv/cpu.c        |  2 ++
>  target/riscv/cpu.h        |  1 +
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 22 +++++++++++++++++-----
>  4 files changed, 21 insertions(+), 5 deletions(-)
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
> index 5a6d49aa64..bc23e3b523 100644
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
> index d84cde424d..832a2dd79c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,14 +619,17 @@ restart:
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
>              /* Inner PTE, continue walking */
> -            if (pte & (PTE_D | PTE_A | PTE_U)) {
> +            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N)) {
>                  return TRANSLATE_FAIL;
>              }
>              base = ppn << PGSHIFT;
> @@ -702,8 +705,17 @@ restart:
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

