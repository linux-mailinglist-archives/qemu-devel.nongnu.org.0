Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646AF5F7642
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:29:46 +0200 (CEST)
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogjfs-0001vz-NG
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjW0-0005Kr-Al
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:19:33 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjVn-00077i-GU
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:19:31 -0400
Received: by mail-pl1-x62f.google.com with SMTP id b2so4020717plc.7
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZArFZNwt8giVPR1Jvf6NB+35PTYnfpXFC0XpvHrkmpk=;
 b=HYT7buln+tGUZZ/POZOSInwK0kRTfht5xhKQIS80ySCy9vk7RRRtXzp6dXE5geQ9C7
 Lh7RfgZ+LwNxcNeQ0urZEpJYNKaIZFZRR2XGyUfEgPpd4pFlXkV1ex+MhW30JkguQQCj
 mH/x0d77r2TTe12kGcdQ0K8vpumkqklPMkjbRLzy88Z+dKtSmc1m9UOlrbdDb0RIZAcW
 ayMVRO/cQ1V8MXT82Ojax1sD37/HhgUKrA+p1nEzyjJwqG2OjuvYQULykrDiXFrXOsBL
 ifX7GycKSU7EYVueRZabng3ZNYMeRXasT/56S+L6PDeCK5s6wPWA4jIwivfI73Yfmz5N
 sqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZArFZNwt8giVPR1Jvf6NB+35PTYnfpXFC0XpvHrkmpk=;
 b=7SwM+dyM8XdFLsyfYIyzP6W6RSGK284tLEcgXsI8Sh2dhYCG56BELIJBeF65qsAh8h
 szhwFEw2eWvAVdXeIcq+PDhEETIotk+fvqfrNZ9TBuI3LGHSBxSyrS/2GNWaWwGpNBe+
 DCK2U/8K60zG96ZqWJiDfR4XHy9WN8eNjFKR+gwH4U35fiKUmHWkA1eQhUa+SCo7YuAi
 qEWKnLKVZckL2S3uWrrBTBxN3j3B5/ZRpqIRj/YW3k7iBTZ57uqWpEOeN7kcv+i5uQ1d
 5yrby1X88XJCJ479ZTeo4xW7x7bpCn0P59+TW6jftqut52462tC6+df8xAs0c7KWzNis
 DTiA==
X-Gm-Message-State: ACrzQf3tKv7RkZ1NlJVNjYT35BBJdONrzAdlY7jnHF3XVz/xhUhL8S0D
 fquOHsph9VXAbvdwsJrInISinVh26VssqHzhIk8kCw==
X-Google-Smtp-Source: AMsMyM5pG/CHz/OMVWe7TWHX7V0vv9+1uTpp/QaiE7xND/+cozxYQrtGSqdQJ69Yll3t+75Rpvz45w2muMbb+8Nj6vY=
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr1119832pjb.215.1665134356748; Fri, 07
 Oct 2022 02:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-31-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:19:05 +0100
Message-ID: <CAFEAcA9QrOyx8V+=5F-UhtVo=LaE_uHRkAmaSx0kqB_MGbO=YQ@mail.gmail.com>
Subject: Re: [PATCH v3 30/42] target/arm: Add ptw_idx argument to
 S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Sat, 1 Oct 2022 at 17:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hoist the computation of the mmu_idx for the ptw up to
> get_phys_addr_with_secure_debug and get_phys_addr_twostage.
> This removes the duplicate check for stage2 disabled
> from the middle of the walk, performing it only once.
>
> Pass ptw_idx through get_phys_addr_{v5,v6,lpae} and arm_{ldl,ldq}_ptw.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



>  /* Translate a S1 pagetable walk through S2 if needed.  */
> -static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
> +static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
> +                             ARMMMUIdx s2_mmu_idx, hwaddr addr,
>                               bool *is_secure_ptr, void **hphys, hwaddr *gphys,
>                               bool debug, ARMMMUFaultInfo *fi)
>  {
>      bool is_secure = *is_secure_ptr;
> -    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
> -    bool s2_phys = false;

I don't think this works, because the s2_mmu_idx is not necessarily
the same through the whole of a page table walk. See the comment in
get_phys_addr_lpae():
    /*
     * Secure accesses start with the page table in secure memory and
     * can be downgraded to non-secure at any step. Non-secure accesses
     * remain non-secure. We implement this by just ORing in the NSTable/NS
     * bits at each step.
     */

Currently get_phys_addr_lpae() updates the nstable bit in tableattrs and
passes that to arm_ldq_ptw() for each level of the page tables, which in
turn causes S1_ptw_translate() to select ARMMMUIdx_Stage2_S or ARMMMUIdx_Stage2.

Alternatively, maybe our existing behaviour is a bug -- but then we need
to separate out the bug fix from the refactoring patch.

> @@ -2604,18 +2643,17 @@ static bool get_phys_addr_with_secure_debug(CPUARMState *env,
>      /* Definitely a real MMU, not an MPU */
>
>      if (regime_translation_disabled(env, mmu_idx, is_secure)) {
> -        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
> -                                      is_secure, result, fi);
> +        goto do_disabled;
>      }

I'd prefer to avoid this goto back up into the middle of an unrelated
switch statement.

thanks
-- PMM

