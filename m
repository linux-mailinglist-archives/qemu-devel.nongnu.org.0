Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C2A5BEC73
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 19:59:25 +0200 (CEST)
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahWm-0005Kc-Cd
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 13:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oae8D-0001iJ-PX
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:21:56 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oae8A-0004um-5P
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:21:47 -0400
Received: by mail-ej1-x62a.google.com with SMTP id 13so6588668ejn.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=uJ6GqANodchxzgq1Ioq9TVrY8Pc8w2djL0pTGHGjK/8=;
 b=TA1XUanV/9efdf0lg88BX+LntpOrZESbygzF/8tGHlntlrCgaQQgpkvE4XLuNrGxja
 jf2MfCJAa9Xra8SfP54TASsWSDM/ulhve8EW0Mdeeq1TfxP4XEeUCYT/B28PzFHJ3g7R
 2/KvFmPQZky/bGdW6NEpEMrxjhliNBcKpp2140KKybfTUEbVta7R3Bez2lAoEhECS+vY
 2gJnN3murbpWvdz4Ky1b6SdGAEZO72KTde3f28ZiETCee/Peeixu35u7hU479TeMDhRc
 H1VwoxhIfKownAHB1RqrbUrw1parrxFTNFnwlooQ8eIoW5jwbSoleS0qB77pUZWdtrdC
 KjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=uJ6GqANodchxzgq1Ioq9TVrY8Pc8w2djL0pTGHGjK/8=;
 b=6jAqPFn522EUxPTzLD7ZXljSdtwMDB7/Shmn/Wh2JsgD7YyWLKtXOsTmZCvyciVuG/
 o5cy7kcNthhI0JH+s0bJ5mN7O+GBOBU/9T9q4d9EI8Bxb/mhfQdb5viorrzwJJUPT4Z/
 Q/RGLCm6p5WFqPOTJ2D4MjOlVS3l1ikTUqFMGlImD6MJdwWTS98TrJUPJP8qbkVmFxzl
 pvbma+jNmXEHaTzhFONcrqx7gv7kKFtOhQzYB9587HxRw4eY5iZkMYpP8b1LAK9CF6Be
 Ee26SLtZaaVMYXaBfoXgqGykR2exJd192m0oD5xLeBjjT3i/k6M+MIdu88VQfo1LZAj+
 kjMQ==
X-Gm-Message-State: ACrzQf1/gEya2/4YBx6YzcZRtsCkAAuQSoQkFXB6SnsXnXvSnVfu5mK9
 hd3WBfnNuUR2KEI3Fsc86ugx/k9yf1Zg4Q8+D7XwEg==
X-Google-Smtp-Source: AMsMyM4bP/3mPhSExia7GtO/8X9K7Zfq0kV3Ac6mkhRFQwe6cd35hJ/eyVqpNe8iM4xWtgTj6afLri0Hg79uhg6Bbg8=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr16621592ejc.619.1663683704409; Tue, 20
 Sep 2022 07:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-3-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:21:32 +0100
Message-ID: <CAFEAcA-o7ZQ+W+mdroH8KhoDW-Gr-3khp30ehgXCktrbXEw0xA@mail.gmail.com>
Subject: Re: [PATCH v2 02/66] target/arm: Fix ipa_secure in get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 16:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The starting security state comes with the translation regime,
> not the current state of arm_is_secure_below_el3().
>
> More use of the local variable, ipa_secure, which does not need
> to be written back to result->attrs.secure -- we compute that
> value later, after the S2 walk is complete.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 8db2abac01..478ff74550 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2308,6 +2308,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>                     GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
>  {
>      ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
> +    bool is_secure = regime_is_secure(env, mmu_idx);
>
>      if (mmu_idx != s1_mmu_idx) {
>          /*
> @@ -2332,19 +2333,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>              }
>
>              ipa = result->phys;
> -            ipa_secure = result->attrs.secure;
> -            if (arm_is_secure_below_el3(env)) {
> -                if (ipa_secure) {
> -                    result->attrs.secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
> -                } else {
> -                    result->attrs.secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
> -                }
> +            if (is_secure) {
> +                /* Select TCR based on the NS bit from the S1 walk. */
> +                ipa_secure = !(result->attrs.secure
> +                               ? env->cp15.vstcr_el2 & VSTCR_SW
> +                               : env->cp15.vtcr_el2 & VTCR_NSW);
>              } else {
> -                assert(!ipa_secure);
> +                ipa_secure = false;
>              }

This is mixing two things up:

(1) is the IPA from a first stage translation Secure or Non-secure ?
   -- this is what ipa_secure is in the current code
(2) should the s2 translation table walk be Secure or Non-secure ?
   -- this is determined by either VSTCR_EL2.SW or .NSW, depending on
      what ipa_secure is

This change ends up setting ipa_secure to the answer to q2. If we
want to use it for "is the s2 tt walk secure?" we should give it a
different name, eg s2walk_secure.

We also seem to have lost the assertion that if this is a non-secure
translation regime then we shouldn't have ended up claiming that the
first-stage IPA was Secure.

I agree we don't really want to silently borrow result->attrs.secure
for the place we keep the answer to q2.

>
> -            s2_mmu_idx = (result->attrs.secure
> -                          ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
> +            s2_mmu_idx = (ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
>              is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
>
>              /*
> @@ -2388,7 +2386,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>                                                      result->cacheattrs);
>
>              /* Check if IPA translates to secure or non-secure PA space. */
> -            if (arm_is_secure_below_el3(env)) {
> +            if (is_secure) {
>                  if (ipa_secure) {
>                      result->attrs.secure =
>                          !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));

In particular, looking at the pseudocode for AArch64.SS2OutputPASpace()
I think this code is correctly looking at ipa_secure and the change
above to what that variable is holding means it will now be wrong.
(That is, ipa_secure == true in the old code corresponds to pseudocode's
ipaspace == PAS_Secure.)

thanks
-- PMM

