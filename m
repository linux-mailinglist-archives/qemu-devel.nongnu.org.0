Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16335BEEDD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:00:53 +0200 (CEST)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakMJ-0006EP-Af
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafgq-0004uY-1W
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:01:52 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafgl-0005HP-Nm
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:01:38 -0400
Received: by mail-ej1-x629.google.com with SMTP id y17so7302588ejo.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4HCElNzxi9fXay2wgMg1C/+5kWB6SjuogoB7SUnuQ9Y=;
 b=XVETZK3PflKUqA6p1y2AZUxA/9sXfRnRyLhFT0y51kA44b3ZFTB/gg5d3Cappmhrzu
 zSFhOmBjKP1whPvzfS3ID0LLhOQxI2q7DzXNUeQOXI/gcL46f21evXbhoaU8F19awkek
 nDoefYlIEf47H9B39p7DmBqQb7TinvIxmj62oi0frR0KadFmNAel3TaPMgc3z/oJSQ28
 Q2Ri+pPkAMYvD8MbQDT7hLYwiELhftxPP6VPDA1w5VFsOaPmQ5pqk9/31HbY84S4y4gg
 iMmST8ZNuhay33PP5dzC3KWG42z1t3/zSKxsPiKfOBw/q9oaMTsdSuAcVkb6y9ygACQR
 V2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4HCElNzxi9fXay2wgMg1C/+5kWB6SjuogoB7SUnuQ9Y=;
 b=r/60wcnEiYkXOBLRezJp/8/ltxgn9PYWWda8875dfGGr27dFpMEpJrQt3CwX1uZIpS
 0hIF5CwCwN308kvPtpjluR3L/2F8GWw951iDBMaVLA1Agium7ac0wUtyopgCnIBIxiV/
 cQtxZAuAfLpdAELdGm/nBTteLZzruXeJJZDzr65RTEGdcNifAsXSTmaonRUpoZ+6kYw/
 oMqpFcnrzA5yQfFAcAsCXzjOYgYX+az479Zgeqe7v9XLODcCp/APGW9nmRno0eo4J3X+
 FhvQUrnoJMnQfmc+eHXuCh53DaewxG7XhDHDiURSs2jxQR8aWy3nhzfCmHuSRo4YnDer
 10rg==
X-Gm-Message-State: ACrzQf07v4E/+9qAvLXolMGr+NgNEps8Y3UNBuHW8ugqGucQf9sWoKzN
 rtDJQrWVl5obESEOs5eicIoZRfp1AokAg4kGgdidRg==
X-Google-Smtp-Source: AMsMyM7Y58Ttu9Z9rTOJWozih/rp8VPfbthvfDEE9JGRP6KLKNGOLOw07/OA/eJ0sKPYMO5mSOTD2cW59LMtwkEsszI=
X-Received: by 2002:a17:907:7209:b0:778:e86e:568 with SMTP id
 dr9-20020a170907720900b00778e86e0568mr18056317ejc.659.1663689693619; Tue, 20
 Sep 2022 09:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-32-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 17:01:21 +0100
Message-ID: <CAFEAcA9MuZWy1Y7yMLdh-xVb=HhGxi6bzabeiE-KT7r2DLwnhA@mail.gmail.com>
Subject: Re: [PATCH v2 31/66] target/arm: Fix S2 disabled check in
 S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 22 Aug 2022 at 17:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass the correct stage2 mmu_idx to regime_translation_disabled,
> which we computed afterward.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index dbe5852af6..680139b478 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -211,11 +211,10 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>                                 ARMMMUFaultInfo *fi)
>  {
>      bool is_secure = *is_secure_ptr;
> +    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
>
>      if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
> -        !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
> -        ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S
> -                                         : ARMMMUIdx_Stage2;
> +        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
>          GetPhysAddrResult s2 = {};
>          int ret;


This doesn't actually change the behaviour, though, right?
regime_translation_disabled() at this point in the patchset doesn't
do anything that makes a distinction between Stage2_S and Stage2 AFAICT.
So this is just making the code clearer; we fixed the actual bug in patch 19.

With a tweaked commit message,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Alternatively, pull this patch earlier so it's before patch 19 and
is the one fixing the bug; then patch 19 is only adding the
is_secure argument to regime_translation_disabled() and doesn't
fix the bug in passing. That would be neater but maybe the
patchset reshuffle is too painful so I don't insist on it.

thanks
-- PMM

