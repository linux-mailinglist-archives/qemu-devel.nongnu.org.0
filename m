Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECB44827B2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Jan 2022 14:22:01 +0100 (CET)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3eKe-000641-R8
	for lists+qemu-devel@lfdr.de; Sat, 01 Jan 2022 08:22:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n3eIa-0005FT-Kz
 for qemu-devel@nongnu.org; Sat, 01 Jan 2022 08:19:56 -0500
Received: from [2a00:1450:4864:20::330] (port=43793
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n3eIZ-0001rA-5p
 for qemu-devel@nongnu.org; Sat, 01 Jan 2022 08:19:52 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k66-20020a1ca145000000b00345fa984108so10204856wme.2
 for <qemu-devel@nongnu.org>; Sat, 01 Jan 2022 05:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mG6rn/qJpS01V1Nlw8A9sLS9nFO6AkO9W7RAPWBePn8=;
 b=bQp8IRttOn8imdDhOx62mjqb9zw21m3MWSF/4U7pCL//Jme3tUmhuL/iKxryrWQINB
 /p/mZsmK6rYOmRCnYab4DFBLdf7lV3HT9J5ij6Yw7m+YbN4pWEpGNmzqAFGfsP3EtqRG
 KvGZZhjYBu4yhb690Wtos7GHMqurkpa5zqynL1HUnPnSS9YND+yTSYShescozEoA5wdi
 ovR2y84/UZ1OxUIuDXndMHduLuMK8IjAWGZWCJ4wMK3TOn8o5A2SwrIJHTY3IEN+j5L8
 lwAnH4ElIdLix331jCE3mYkkfORjzXQmLg1x7hy7cxLxqch7ylUC+kgw+z0jJpkXvC0B
 /htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mG6rn/qJpS01V1Nlw8A9sLS9nFO6AkO9W7RAPWBePn8=;
 b=bdZJr7gH5UplVMD9pGj0g2mbWe38wtN5NW/kUnvaRUI2CDrGC6oYcsX+b1CjI99+Cd
 xENSmFcK3IneZ3fVuFcGm1M67f78UhP4LSbx2A7B7kvOFt3t/vnsSP7aoMnQA324lwcE
 n2s/vOusCtRaCEXreEX2M+vtYaTgUOENOO6PTgRgWlVLYdPoLHFTvpri1MmtRoj3XU/x
 MnLoXaXxKQnIbZCRai1rEElfcM0JgPtTg26Kkh6hitl/1S1Km1Jshx/XyiLoGBn9mNam
 30Lfz2PhNaST6kFzqA8DWqetP+5bqCBLX2kR5Zcd259SvJpzi2vcOO3n/jEcgzkJEmzo
 Gzrg==
X-Gm-Message-State: AOAM532Y968EGhH0pphBoxKw7gx43DINMCIyXuU8xfmso0cq436MafTX
 rO+Zl/zbPoRozj2cCaUi5qZKDw0dGj2UewUGwNGhsQ==
X-Google-Smtp-Source: ABdhPJyDqSC/P+Nt66VHElGltY2na0+5vj62ZGMQCtP6a7VHx61YlsZC0aIeP4r+P69sa0SETELIjHaCt0iSWbSEcAo=
X-Received: by 2002:a05:600c:1da5:: with SMTP id
 p37mr33446398wms.59.1641043189719; 
 Sat, 01 Jan 2022 05:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20211231080923.24252-1-liweiwei@iscas.ac.cn>
 <20211231080923.24252-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20211231080923.24252-4-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Jan 2022 18:49:38 +0530
Message-ID: <CAAhSdy0ZVqYRZd_fkfagaee2tHiKtCKQi965gyqLkJAUCFRFfA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/riscv: add support for svpbmt extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::330;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x330.google.com
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
> It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  target/riscv/cpu.c        | 1 +
>  target/riscv/cpu.h        | 1 +
>  target/riscv/cpu_bits.h   | 3 +++
>  target/riscv/cpu_helper.c | 9 ++++++++-
>  4 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 77ef0f85fe..743bcfe297 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -649,6 +649,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      DEFINE_PROP_BOOL("x-svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("x-svnapot", RISCVCPU, cfg.ext_svnapot, false),
> +    DEFINE_PROP_BOOL("x-svpbmt", RISCVCPU, cfg.ext_svpbmt, false),

Drop the "x-" prefix, same as the other two patches. The Svpmbt extension
is also ratified.

Regards,
Anup

>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5dd9e53293..6656b8a4f3 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -317,6 +317,7 @@ struct RISCVCPU {
>          bool ext_icsr;
>          bool ext_svinval;
>          bool ext_svnapot;
> +        bool ext_svpbmt;
>          bool ext_zfh;
>          bool ext_zfhmin;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 1156c941cb..3dae358aa5 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -483,7 +483,10 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_RSVD            0x1FC0000000000000 /* Reserved for future use */
> +#define PTE_PBMT            0x6000000000000000 /* Page-based memory types */
>  #define PTE_N               0x8000000000000000 /* NAPOT translation */
> +#define PTE_ATTR            0xFFC0000000000000 /* All attributes bits */
>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e044153986..41d04675b3 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,16 +619,23 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
> +        hwaddr ppn = (pte & ~(target_ulong)PTE_ATTR) >> PTE_PPN_SHIFT;
>
>          RISCVCPU *cpu = env_archcpu(env);
>          if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
>              return TRANSLATE_FAIL;
> +        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
> +            return TRANSLATE_FAIL;
> +        } else if (pte & PTE_RSVD) {
> +            return TRANSLATE_FAIL;
>          } else if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> +            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N | PTE_PBMT)) {
> +                return TRANSLATE_FAIL;
> +            }
>              base = ppn << PGSHIFT;
>          } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
>              /* Reserved leaf PTE flags: PTE_W */
> --
> 2.17.1
>
>

