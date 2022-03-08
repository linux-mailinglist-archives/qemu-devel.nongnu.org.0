Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84A54D151E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:49:07 +0100 (CET)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXOs-0002d9-Vf
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:49:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXMJ-00017S-Q1
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:46:27 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=37420
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXMI-00065k-4t
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:46:27 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id g1so36897016ybe.4
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Yj4KmkyQVHefrV5StxQ4NZmI5feCBifLWCC3lWTmaI=;
 b=ULWf/V41azw0efwZY2DOMrIj6bKn1QgGT4LCOEnRHA95ZjKDYFOALOpMHLQOvMHCRd
 52ZQnTpvHkBEShuznXd2lgf532bSJ/HnyQO9xjNX7x2x0yDCiQX7SEC89TNJAgFISNQw
 kCzBY4E7yQ3srPNwQNC/jlPy92xnI2E0P7lKFechQ9G4T0hZdaDHNTLWxTHrnZTLGxus
 h4b5HMjIKPRrK9xls7fT26PUd5c3+Hbq7qwZDjk2wf+kLTqXgpBZC36u5+6tEYU4hSkv
 FLad/v9WsSVdo9/lHufQX2Qqo+C+FVlYXdkvb/JYltv1DYb9LamsqfZkKiW4VBMtbkvF
 P8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Yj4KmkyQVHefrV5StxQ4NZmI5feCBifLWCC3lWTmaI=;
 b=pHTqFkPJv9pban6LNydbzVTVQw9LS9FkeQp1WxJBf7I+LmBo7J3dnUF1uVQT16U/Y3
 nOtq8OOHV/dZqniXurePYaetsPlC/XM0EKAzUJqRNXjIe9AZJmx7V5KS0ZoCqSvfs3DA
 KPShrBfSkpnh5KZKzkwAHYRwWODnvIpm/IiKtRNrSGSYwI4p2ue7eiyCNCuoUdL/vC8u
 TnsI6NJs3rD8ydFuiSkE6FA+aF1q8j8Hy67h3bj7V3D/cv68kkYFWVf4FhM76Qyo8mjK
 kX84ypXtrHY6c4omzLen9HUVFUubjxz6VeASV6drC7cEoFCPSXfKlmyy93+2x05SEm7d
 zGoQ==
X-Gm-Message-State: AOAM532Q3mApFWhQQElmTyRjaE9XhRndMBE8J+Qn3MpUYqQMfhm47y6K
 INvYSz9efTs7v2x1rNYJPuSkDKkCbWzfE9CBKBAOhw==
X-Google-Smtp-Source: ABdhPJxv84g8pKG0jMKEbmdXh4H+8Ilzz8pSm4YpxWS29ClYUcyRbS0WmYeR2ZkQVIq5BdtQ+TU9TNCF15OB08Lcpfc=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr11159765ybp.39.1646736384311; Tue, 08
 Mar 2022 02:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-16-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:46:13 +0000
Message-ID: <CAFEAcA9nJchuHFyyQjfh+fbVBYs6keLz8hmDCKj0-F5zvMSV8A@mail.gmail.com>
Subject: Re: [PATCH v4 15/33] target/nios2: Use hw/registerfields.h for
 CR_TLBMISC fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h       | 28 ++++++++++++++++++----------
>  target/nios2/helper.c    |  7 ++-----
>  target/nios2/mmu.c       | 33 +++++++++++++++------------------
>  target/nios2/translate.c |  2 +-
>  4 files changed, 36 insertions(+), 34 deletions(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 024ef3ccc0..3857848f7c 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -131,16 +131,24 @@ FIELD(CR_TLBACC, IG, 25, 7)
>  #define CR_TLBACC_G  (1u << R_CR_TLBACC_G_SHIFT)
>
>  #define CR_TLBMISC       10
> -#define   CR_TLBMISC_WAY_SHIFT 20
> -#define   CR_TLBMISC_WAY_MASK  (0xF << CR_TLBMISC_WAY_SHIFT)
> -#define   CR_TLBMISC_RD        (1 << 19)
> -#define   CR_TLBMISC_WR        (1 << 18)
> -#define   CR_TLBMISC_PID_SHIFT 4
> -#define   CR_TLBMISC_PID_MASK  (0x3FFF << CR_TLBMISC_PID_SHIFT)
> -#define   CR_TLBMISC_DBL       (1 << 3)
> -#define   CR_TLBMISC_BAD       (1 << 2)
> -#define   CR_TLBMISC_PERM      (1 << 1)
> -#define   CR_TLBMISC_D         (1 << 0)
> +
> +FIELD(CR_TLBMISC, D, 0, 1)
> +FIELD(CR_TLBMISC, PERM, 1, 1)
> +FIELD(CR_TLBMISC, BAD, 2, 1)
> +FIELD(CR_TLBMISC, DBL, 3, 1)
> +FIELD(CR_TLBMISC, PID, 4, 14)
> +FIELD(CR_TLBMISC, WR, 18, 1)
> +FIELD(CR_TLBMISC, RD, 19, 1)
> +FIELD(CR_TLBMISC, WAY, 20, 4)
> +FIELD(CR_TLBMISC, EE, 24, 1)
> +
> +#define CR_TLBMISC_RD    (1u << R_CR_TLBMISC_RD_SHIFT)
> +#define CR_TLBMISC_WR    (1u << R_CR_TLBMISC_WR_SHIFT)
> +#define CR_TLBMISC_DBL   (1u << R_CR_TLBMISC_DBL_SHIFT)
> +#define CR_TLBMISC_BAD   (1u << R_CR_TLBMISC_BAD_SHIFT)
> +#define CR_TLBMISC_PERM  (1u << R_CR_TLBMISC_PERM_SHIFT)
> +#define CR_TLBMISC_D     (1u << R_CR_TLBMISC_D_SHIFT)

Same comment as previous patches.

> +
>  #define CR_ENCINJ        11
>  #define CR_BADADDR       12
>  #define CR_CONFIG        13
> diff --git a/target/nios2/helper.c b/target/nios2/helper.c
> index 37fb53dadb..93338e86f0 100644
> --- a/target/nios2/helper.c
> +++ b/target/nios2/helper.c
> @@ -276,11 +276,8 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          return false;
>      }
>
> -    if (access_type == MMU_INST_FETCH) {
> -        env->tlbmisc &= ~CR_TLBMISC_D;
> -    } else {
> -        env->tlbmisc |= CR_TLBMISC_D;
> -    }
> +    env->tlbmisc = FIELD_DP32(env->tlbmisc, CR_TLBMISC, D,
> +                              access_type == MMU_INST_FETCH);

This inverts the sense -- now we set the D bit for MMU_INST_FETCH,
which is wrong.

>      env->pteaddr = FIELD_DP32(env->pteaddr, CR_PTEADDR, VPN,
>                                address >> TARGET_PAGE_BITS);
>      env->mmu.pteaddr_wr = env->pteaddr;

> @@ -130,24 +128,25 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
>  void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
>  {
>      Nios2CPU *cpu = env_archcpu(env);
> +    uint32_t new_pid = FIELD_EX32(v, CR_TLBMISC, PID);
> +    uint32_t old_pid = FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID);
> +    uint32_t way = FIELD_EX32(v, CR_TLBMISC, WAY);
>
> -    trace_nios2_mmu_write_tlbmisc(v >> CR_TLBMISC_WAY_SHIFT,
> +    trace_nios2_mmu_write_tlbmisc(way,
>                                    (v & CR_TLBMISC_RD) ? 'R' : '.',
>                                    (v & CR_TLBMISC_WR) ? 'W' : '.',
>                                    (v & CR_TLBMISC_DBL) ? '2' : '.',
>                                    (v & CR_TLBMISC_BAD) ? 'B' : '.',
>                                    (v & CR_TLBMISC_PERM) ? 'P' : '.',
>                                    (v & CR_TLBMISC_D) ? 'D' : '.',
> -                                  (v & CR_TLBMISC_PID_MASK) >> 4);
> +                                  new_pid);
>
> -    if ((v & CR_TLBMISC_PID_MASK) !=
> -        (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK)) {
> -        mmu_flush_pid(env, (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >>
> -                           CR_TLBMISC_PID_SHIFT);
> +    if (new_pid != old_pid) {
> +        mmu_flush_pid(env, old_pid);
>      }
> +
>      /* if tlbmisc.RD == 1 then trigger a TLB read on writes to TLBMISC */
>      if (v & CR_TLBMISC_RD) {
> -        int way = (v >> CR_TLBMISC_WAY_SHIFT);
>          int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
>          Nios2TLBEntry *entry =
>              &env->mmu.tlb[(way * cpu->tlb_num_ways) +


Any reason for hoisting the declaration of 'way' up to the top of the
function ?

-- PMM

