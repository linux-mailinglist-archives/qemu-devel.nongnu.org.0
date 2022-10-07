Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037BE5F7702
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 12:41:42 +0200 (CEST)
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogknU-0000XK-Ld
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 06:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkiF-0005q2-Mc
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:36:21 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogki9-0001JS-6J
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:36:15 -0400
Received: by mail-pl1-x635.google.com with SMTP id b2so4168002plc.7
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UxwxHWAfGgIfy1t+sapsDy0iUfE7JEus2Rvh5aRKYqk=;
 b=Y7D6eliU0LDuu5iNreyYEDGY/lphmkdRyEzuyhxJmmNljnxOuztK+qTsjjlGbeB4Uz
 3U7Lre1ugKtFzzRR+mxl9fvW4o7F4UmSRktA8fncD0WRpbGuAuy81/45LXfmxt0E7ak6
 V9lB96n5cvPRs+XoMpPz8jda+QWEvasCAGsEA46KRy0lJuXTcRHKOX1cQTEUzksiqiKZ
 OgN2drOqk3vjDFR3pFt0Fszu3VnhG1nMbX8IBgcJx6NPUekvFQ/Lu+Omt9NpGMfgmiDM
 EH3wCYl6Kx0SagwhRl0eUuPEDHatv+c42PEEIECcCzKc1NZG3oGay5cYUEvNutWCfrbD
 pYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UxwxHWAfGgIfy1t+sapsDy0iUfE7JEus2Rvh5aRKYqk=;
 b=J/2r+ci55YKzSpPjJ5sjp6RiIUENy/1banGVG6MRR56M1Omj+7l0rt+NyKwYmTFF9g
 1/Q1yBqPoFZqqVTqvDHGylS1Nfq0eHRzC4m9n9F368EPdRw5aPgywCyOgcEGkXKYyqvx
 6bQjufhkSQX6OLuCfWWrZl+B7SAGqsL+gzM1FL8TiENWEIvb3jAk+EjSYhkEMjAJ33yE
 xYvNUfeIEixpZHbMTshkMedE/CdtsPsN7bes5fxHY7Izn/ssLL+jFVXnWV/2ZSBlAOus
 cEsGhde6UbZoDoOYbbpOLO8oOV3lXAXK3++h37g5izgv68x8VkLLVhASyNbN8ng7OJT/
 s90A==
X-Gm-Message-State: ACrzQf3hAL28GyzEEQU2RV93J+R5PbUMBatWDglh/pOxQlT2KsFIGRck
 xg8cRjogtNIPH2y3PF0MckY7dviqIS4W2Ks/MORq+g==
X-Google-Smtp-Source: AMsMyM4mP+/WziEXqrAd8TKjZc9e+WZvZPD1uvOfrbLlrbj0ww8amem/rbzQq9F15n7767WK5msVUzzjwbDYlQNhV+0=
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr1447437pjb.215.1665138967096; Fri, 07
 Oct 2022 03:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-40-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 11:35:55 +0100
Message-ID: <CAFEAcA_p0GC33mnWrDfSMim3=v=KLoYP9Q=xNT6nMXCfwwT6FQ@mail.gmail.com>
Subject: Re: [PATCH v3 39/42] target/arm: Don't shift attrs in
 get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Sat, 1 Oct 2022 at 17:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Leave the upper and lower attributes in the place they originate
> from in the descriptor.  Shifting them around is confusing, since
> one cannot read the bit numbers out of the manual.  Also, new
> attributes have been added which would alter the shifts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 01a27b30fb..c68fd73617 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1071,7 +1071,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>      hwaddr descaddr, indexmask, indexmask_grainsize;
>      uint32_t tableattrs;
>      target_ulong page_size;
> -    uint32_t attrs;
> +    uint64_t attrs;
>      int32_t stride;
>      int addrsize, inputsize, outputsize;
>      uint64_t tcr = regime_tcr(env, mmu_idx);
> @@ -1341,49 +1341,48 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>      descaddr &= ~(page_size - 1);
>      descaddr |= (address & (page_size - 1));
>      /* Extract attributes from the descriptor */
> -    attrs = extract64(descriptor, 2, 10)
> -        | (extract64(descriptor, 52, 12) << 10);
> +    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));

So bit positions for the lower-part bits need to have 2 added,
and bit positions for upper-part bits need to have 42 added.

>      if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
>          ns = mmu_idx == ARMMMUIdx_Stage2;
> -        xn = extract32(attrs, 11, 2);
> +        xn = extract64(attrs, 54, 2);

...so this one looks wrong, should be 53 ?

>          result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
>      } else {
> -        ns = extract32(attrs, 3, 1);
> -        xn = extract32(attrs, 12, 1);
> -        pxn = extract32(attrs, 11, 1);
> +        ns = extract32(attrs, 5, 1);
> +        xn = extract64(attrs, 54, 1);
> +        pxn = extract64(attrs, 53, 1);

Compare here where bit 11 in the old code is 53 in the new.

>          result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
>      }
>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

