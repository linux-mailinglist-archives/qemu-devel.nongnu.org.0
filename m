Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A59559E8E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:31:07 +0200 (CEST)
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4mD4-0004DY-G3
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4mAI-0000yu-5f
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:28:14 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:34678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4mAF-0008AJ-E8
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:28:12 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-318889e6a2cso29720257b3.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYVeqkD6mJqyQyPSeYecDofAjz7huJNMxRjD307Um3Q=;
 b=e9fpjgUsx3l4pKBANut5svbQ2v5CSzKmQnMH/o01LSz38pS+//5M11dn0BvAknJgN1
 WRPCCDTnyKCh0MDNSwu2j0LcsCvx8qRGMdRShr8GW/xGVuCslU9/2iv+z6kXgIpzXWjm
 xIAoG+jzmNps2tADZCtIesgbRG8WZjs5XJC+cP2m7YjHUsLoUbsvAXw5rhm0VQFdAD0K
 L0wsjlYPvSiXaqcNySA6PXSJC527uR27joAGpj0DAPHHzmaZEDUEiJx9Bn+qQ4G5OTAx
 llhEyMr+hSl4HOyK5oMwdGqCfvDvbe+dwHQj9n8FaJAZOdj1yk+6RmAlVYSz4lvkcdYM
 m2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYVeqkD6mJqyQyPSeYecDofAjz7huJNMxRjD307Um3Q=;
 b=3OI0ES/ie79Khu2zGovRMKnat3wgYWPWAYbTP0/uqV79QYlx/D5dJtMywT9unGfdYV
 QRGwqKuFJwadRAR+1lAHCVBC1ErgeMY894arCAmWx/gMusE6SL2uz+of6fbqG5RE4gSo
 RnWVr6RB36WNh22Vrde/kAKntNZ6ryP91T5awG7VfGODrAprlomeWfPhLaWEBxlF/e3C
 j5MFkz4toe6sDZivdPbvkysPmtc8ZujglnZB3djv9N4J7PiOxdhJGTX2aOb80uRVvwIA
 r/wFchMwbNtYRCqyu+IDgJlxaHTRDAGQx2bUVUXGSzTxTJIgRLIyH8RuYwHfm70LH2C+
 69Jw==
X-Gm-Message-State: AJIora/xowpdcf1k1cu0+ylNTiBRYKgYAZlIp9EoNKDrsAX5E0x3g8Bh
 r0t8SgNHx4aJ+Z+oiw7rl/GGZFgkmEjaNUonGZ9i/Q==
X-Google-Smtp-Source: AGRyM1vsG148DbhdRGOdsjDBKai1lNcQk79Opujw2eSp+wVKu6WQNRBRRSgq2yN2zZTWqJl5Sw3xrS4N/rNI9VR99vk=
X-Received: by 2002:a81:a047:0:b0:317:8761:14f8 with SMTP id
 x68-20020a81a047000000b00317876114f8mr18535869ywg.469.1656088090373; Fri, 24
 Jun 2022 09:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220619001541.131672-1-richard.henderson@linaro.org>
 <20220619001541.131672-3-richard.henderson@linaro.org>
In-Reply-To: <20220619001541.131672-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 17:27:33 +0100
Message-ID: <CAFEAcA-zUJV2FdFWM2UdS1BDrh_3Tw1p+vHkMoEn7g1G5kArMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Check V7VE as well as LPAE in arm_pamax
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 19 Jun 2022 at 01:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In machvirt_init we create a cpu but do not fully initialize it.
> Thus the propagation of V7VE to LPAE has not been done, and we
> compute the wrong value for some v7 cpus, e.g. cortex-a15.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1078
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 07f7a21861..da478104f0 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -47,7 +47,13 @@ unsigned int arm_pamax(ARMCPU *cpu)
>          assert(parange < ARRAY_SIZE(pamax_map));
>          return pamax_map[parange];
>      }
> -    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
> +
> +    /*
> +     * In machvirt_init, we call arm_pamax on a cpu that is not fully
> +     * initialized, so we can't rely on the propagation done in realize.
> +     */
> +    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE) ||
> +        arm_feature(&cpu->env, ARM_FEATURE_V7VE)) {
>          /* v7 with LPAE */
>          return 40;

I guess this is expedient, so on that basis
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but as I mentioned in the gitlab issue it's kind of bogus
that the virt board is doing stuff to a non-realized CPU object.

thanks
-- PMM

