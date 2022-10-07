Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E00C5F7B83
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:33:20 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqHn-0007hy-2I
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogq5z-0007J3-Av
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:21:07 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogq5f-0007dy-GR
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:21:06 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 2so5075494pgl.7
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GWBQuup7Xt2go2dIhZaR+wARjclSaiNYCYbFs9aPIBc=;
 b=kadM7VHjOnaiqjQyPUzbeTs2E9s4gkVUVD6OTchCUSq6lmfgwzAyZFdkoJ+g9//g4a
 o9qvJrG5dMFzmzsmDOQ+a8EATxp4JatjWotMFkl6YMQmA8F7pHr/N1ElfZZ23rl3lzM5
 57KAW3iGa1GyiU4P4rmzAWkwba44SAzKnqRVQIoqPe0v6HLtIP2zVTboJNqwSDlXjN0K
 PysEzy64Lq1mJ2Uh65N41opoYxNdGcJp1Rtaf54zTJYwn9BN5ksWppD5l/PrtWQ5RWs6
 /jlFciZcSocbD1etEXcYFPMsX443+jjv/QTdXknlIY4ps1pigoUYmZ4V32b0yDsYJkFV
 I57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GWBQuup7Xt2go2dIhZaR+wARjclSaiNYCYbFs9aPIBc=;
 b=GEbGhiat2XdTuZC1+69hAf7K7LPmMfGedRRamzqDNUUgpiqH+7wVVT582ekHUbqKFO
 ZzPrWoUYgFtAYiloirY23xsRrRbicJMVRN31KmolsHxTnywjq9t6pobk08W31bvtQcVG
 JNkH3rE2UWZGPGvHX3nsA3DnoHnt+MXR2JwoB3qSkbtvFTVCaF2JoUH/uikuH6+tZyd9
 PUH5cvTsnMN8wbR22WO/O+PDMCZ2fz6x6nTcciAPWufdkcHXainSGg+mMgiVLdOa83CQ
 KXI6bmaBtbGIJRAmt2B842p1BREgfyndzypUjeUP64Ci1grQR2S70d7aKpFSerfcSeI5
 b9XQ==
X-Gm-Message-State: ACrzQf3QtCkgv+AnAmuZjipzcCcb2IY5Yb4Q67v+0tDUcKm3E5NAj/B9
 fOYeWHwDlcJIZN/x+IPQ5LI76fqouk7Pt8FrzMTzsQ==
X-Google-Smtp-Source: AMsMyM6LQYVmZzY29AF0O+gsirJvhAI642koEiq6NOLHnnjA/4zzEvB1lsADjiRXZq6rfTC9kdcRoOe17yUqIQ6/NIY=
X-Received: by 2002:a63:89c3:0:b0:452:f2ad:52b9 with SMTP id
 v186-20020a6389c3000000b00452f2ad52b9mr5161927pgd.105.1665159645622; Fri, 07
 Oct 2022 09:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221007152159.1414065-1-richard.henderson@linaro.org>
In-Reply-To: <20221007152159.1414065-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 17:20:33 +0100
Message-ID: <CAFEAcA93Urww5F+_gJonUUaLeS-7W8BhYqRgcJT1hcVY3LaUdA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Make the final stage1+2 write to secure be
 unconditional
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, 7 Oct 2022 at 16:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While the stage2 call to get_phys_addr_lpae should never set
> attrs.secure when given a non-secure input, it's just as easy
> to make the final update to attrs.secure be unconditional and
> false in the case of non-secure input.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Hi Peter,
>
> This is the promised patch 1.5 for v3 FEAT_HAFDBS.  It generates minor
> conflicts down the line, which I have already fixed up locally.  I think
> the first one you would encounter is beyond the proposed 20 that you
> indicated that you intend to take into target-arm.next right now.
>
>
> r~
>
> ---
>  target/arm/ptw.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index b8c494ad9f..7d763a5847 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2365,17 +2365,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>              result->cacheattrs = combine_cacheattrs(env, cacheattrs1,
>                                                      result->cacheattrs);
>
> -            /* Check if IPA translates to secure or non-secure PA space. */
> -            if (is_secure) {
> -                if (ipa_secure) {
> -                    result->attrs.secure =
> -                        !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
> -                } else {
> -                    result->attrs.secure =
> -                        !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
> -                        || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
> -                }
> -            }

If:
 is_secure == true
 ipa_secure == false
 (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW) is non-zero
 (env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW) is zero
then the old code sets attrs.secure to true...

> +            /*
> +             * Check if IPA translates to secure or non-secure PA space.
> +             * Note that VSTCR overrides VTCR and {N}SW overrides {N}SA.
> +             */
> +            result->attrs.secure =
> +                (is_secure
> +                 && !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW))
> +                 && (ipa_secure
> +                     || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));

...but the new code will set it to false, I think ?

thanks
-- PMM

