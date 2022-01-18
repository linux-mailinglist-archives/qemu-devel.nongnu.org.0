Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03BD491D45
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 04:33:03 +0100 (CET)
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9fF0-0006oU-Ge
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 22:33:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9fD2-0005JC-Vc
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 22:31:01 -0500
Received: from [2a00:1450:4864:20::32a] (port=43669
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9fCl-0005Ij-1w
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 22:30:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so1638807wmq.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 19:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WXixNQENw0ofQFg0k2+qJaD+/ihEPIpKWp5U9V+8KQE=;
 b=bic0RvFUr+Tsu0q5oljTq+A53V6mW+Y0A7GAaiwiU+zfgysJVPCysJzBMZ9xSOe9lb
 V4ruW6klKqiee0edH4i9JfSF2OMzcbUemzVAMhBj1101n+YVf4/pPanug07hinzJkDwQ
 CgDH9NK1c5yPLAkWw7kUDfjpykdTreeNs7IrkMS4AcAlg6zPv2lba+FeqUMh5yquyltz
 +TEwN0dSJzYysqzlNfJzEN9SLC7uq6zkwHwbixUgMojPLvMFLTMwlN1asNINSAthnVmD
 38voU/dTtEE/0PaUSfj3QelloRhp+wbdmHaVqyT4vvliooFJFPEYtBJ2ZX8JqUB5x7p/
 qGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXixNQENw0ofQFg0k2+qJaD+/ihEPIpKWp5U9V+8KQE=;
 b=bEMxOJz4ZbzK85SYwjxnjG70LUnGfvvnqJ0lDGE6rhniWtJ6KH8qzUhqVBgFoGKQjD
 1OyWbD2tmgtbEYi7xd8xmGBkiCTndt3KXljrZAJAQU2xaU8WjyHgrm/753sFZM2YlT/5
 tMsMZBRtl8/zEvp6xsfXgzE4Alj2zjSaHKHufbjmUdqpaS4eMv8+PgXfKt8jYqMajyjt
 eLVdGCUSetiLfPww3h4cVP1oAYjxGKnaBSnTHsgsMbkj5eTN4pBJAm4366c/B1/EiFvN
 qy5rQ8L/DN+sMT1n2BHTEtHG44ym6kpzQjCKlHUMq3rcHFfWvesSdOkuZpzQiy6lIoNC
 8tAg==
X-Gm-Message-State: AOAM532YA1snXAdCy3JFbK6mYb9/kyrzlc5/AB1m8dhpel897uLb+7wa
 /WoAWDgazEAd4/+OaxcdG+3hxAeUCOhLYF5M1xKHNA==
X-Google-Smtp-Source: ABdhPJxKz89a8NGUAXscOC9XN/WPi3hDIVeFmKWPL4perXDzrEfCRgG41L5skrtBaNJG69JNGraE+eGlwcwzhnN1SgA=
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr24217880wmj.59.1642476641108; 
 Mon, 17 Jan 2022 19:30:41 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20220118011711.7243-2-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jan 2022 09:00:29 +0530
Message-ID: <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
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
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> From: Guo Ren <ren_guo@c-sky.com>
>
> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> need to ignore them. They cannot be a part of ppn.
>
> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
>
> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h   | 7 +++++++
>  target/riscv/cpu_helper.c | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 5a6d49aa64..282cd8eecd 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -490,6 +490,13 @@ typedef enum {
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
>
> +/* Page table PPN mask */
> +#if defined(TARGET_RISCV32)
> +#define PTE_PPN_MASK        0xffffffffUL
> +#elif defined(TARGET_RISCV64)
> +#define PTE_PPN_MASK        0x3fffffffffffffULL
> +#endif
> +

Going forward we should avoid using target specific "#if"
so that we can use the same qemu-system-riscv64 for both
RV32 and RV64.

>  /* Leaf page shift amount */
>  #define PGSHIFT             12
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 434a83e66a..26608ddf1c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,7 +619,7 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;

Rather than using "#if", please use "xlen" comparison to extract
PPN correctly from PTE.

Regards,
Anup

>
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
> --
> 2.17.1
>

