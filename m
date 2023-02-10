Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3D691E6C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 12:37:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQRi4-0006zX-6b; Fri, 10 Feb 2023 06:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQRi2-0006zF-Rv
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:36:54 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQRhz-0005NY-PB
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:36:54 -0500
Received: by mail-pf1-x434.google.com with SMTP id r17so3268502pff.9
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 03:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ip7UkIHts0+zQA/dQ3VZu7KHBdu0EYIXCjbxhc6k/5A=;
 b=bAyjyQCkvb5jdMFWxMLDDggqQKiFYyaQ6uq3yNPuz9bf5nzJv6y86KsmK2sfwS0NRc
 TvuZXFjWdul2CWGurmKRden7GhdbLrJRYhgKLI255VZ9csSHsnSNceahnvEPT1pDZf7f
 BJH2BmUau8GlwhQuuIm7OVOWn+iD95JAkDazmpM26S76nvkbSwAeHoVrMi9Z9lYzjJOi
 68SeAFuAaD2Ij+V4i7MAjj/iOUefPAby+BPKVEi6xaXlytAAwwdEjbIbd7uGC6wHH7GX
 lFUm7l3pTuGhWESibYyFCX2cabezs0p+XUTE62R/W/1VMt1D+jGyfhsZVpQjKJqIev5e
 iJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ip7UkIHts0+zQA/dQ3VZu7KHBdu0EYIXCjbxhc6k/5A=;
 b=70l6EAfRhHQ7tK1hDH3IQZ1BIEQq9Kz8YDHd+9fo17wDSAx8WK3pLLF2ahSX3SJy07
 fzrJITg6FT3ykfoMDyNodUxSV7Og56jSbYs/LRrslK2uJSQT2TFnuUHXJfeOsWegXtZW
 5ylzMxGyZA4oFYHEzYeCX9C9T9N7FQNctgD82EvKBhaEsfqicrl4Y5rLELCvYfJ0RSQ+
 Ds8WK24+nE+PWCBvvMkdqkGkS8RGXkATgLwMkVZxg6dwIa3mAdwTynrmaW8v+R30bbFJ
 8NKsQpAn3OW5inFbmxhN3AoV175cv8Kw/UwPCmpLtlPnDPzDCOOt4nwmVMHeoNoCPnq+
 pM3g==
X-Gm-Message-State: AO0yUKVaQVuuBKE2SfkMGW+iTY8dO0yTyn0c/75KZobx2jc8dIgefFG3
 UVPTugLrF0K/4zXfmkVrblImQ56lXyKcbe8hai558w==
X-Google-Smtp-Source: AK7set9wbxVeCpxsI6VijOCUlcWxheShzBZtjfqxxJLu8uDZ/yLOLI335JtG7ImFhpjcFlF0pbhKl5c+R8dp7FKfa98=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr3256174pfb.48.1676029009493; Fri, 10
 Feb 2023 03:36:49 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-13-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 11:36:38 +0000
Message-ID: <CAFEAcA_wApEJEweyoGc_oSmyt6xcTKKRPW1X8xYkFO3agjS8jA@mail.gmail.com>
Subject: Re: [PATCH 12/22] target/arm: NSTable is RES0 for the RME EL3 regime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
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

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Test in_space instead of in_secure so that we don't switch
> out of Root space.  Handle the output space change immediately,
> rather than try and combine the NSTable and NS bits later.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index c1b0b8e610..ddafb1f329 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1240,7 +1240,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>  {
>      ARMCPU *cpu = env_archcpu(env);
>      ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
> -    bool is_secure = ptw->in_secure;
>      int32_t level;
>      ARMVAParameters param;
>      uint64_t ttbr;
> @@ -1256,7 +1255,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      uint64_t descaddrmask;
>      bool aarch64 = arm_el_is_aa64(env, el);
>      uint64_t descriptor, new_descriptor;
> -    bool nstable;
>
>      /* TODO: This code does not support shareability levels. */
>      if (aarch64) {
> @@ -1417,29 +1415,29 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          descaddrmask = MAKE_64BIT_MASK(0, 40);
>      }
>      descaddrmask &= ~indexmask_grainsize;
> -
> -    /*
> -     * Secure accesses start with the page table in secure memory and
> -     * can be downgraded to non-secure at any step. Non-secure accesses
> -     * remain non-secure. We implement this by just ORing in the NSTable/NS
> -     * bits at each step.
> -     */
> -    tableattrs = is_secure ? 0 : (1 << 4);
> +    tableattrs = 0;
>
>   next_level:
>      descaddr |= (address >> (stride * (4 - level))) & indexmask;
>      descaddr &= ~7ULL;
> -    nstable = extract32(tableattrs, 4, 1);
> -    if (nstable && ptw->in_secure) {
> -        /*
> -         * Stage2_S -> Stage2 or Phys_S -> Phys_NS
> -         * Assert that the non-secure idx are even, and relative order.
> -         */
> +
> +    /*
> +     * Process the NSTable bit from the previous level.  This changes
> +     * the table address space and the output space from Secure to
> +     * NonSecure.  With RME, the EL3 translation regime does not change
> +     * from Root to NonSecure.
> +     */

To check my understanding, this means that the bit that the spec
describes as FEAT_RME changing the behaviour of NSTable in the EL3
stage 1 translation regime is implemented by us by having the
in_space for EL3 be different for FEAT_RME and not-FEAT_RME ?

> +    if (extract32(tableattrs, 4, 1) && ptw->in_space == ARMSS_Secure) {
> +        /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
>          QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_S + 1 != ARMMMUIdx_Phys_NS);
>          QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
>          ptw->in_ptw_idx += 1;
>          ptw->in_secure = false;
> +        ptw->in_space = ARMSS_NonSecure;
> +        result->f.attrs.secure = false;
> +        result->f.attrs.space = ARMSS_NonSecure;
>      }
> +
>      if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
>          goto do_fault;
>      }
> @@ -1542,7 +1540,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>       */
>      attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
>      if (!regime_is_stage2(mmu_idx)) {
> -        attrs |= nstable << 5; /* NS */

This removes the code where we copy the NSTable bit across to attrs,
but there's still code below here that assumes it can get the combined
NS bit from bit 5 of attrs, isn't there? (It passes it to get_S1prot().)

thanks
-- PMM

