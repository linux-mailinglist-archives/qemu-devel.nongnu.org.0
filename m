Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092DE387936
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:52:48 +0200 (CEST)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizDL-0003Hn-1P
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz8O-0001xN-4u
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:47:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz8L-0007Ms-IZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:47:39 -0400
Received: by mail-ed1-x52e.google.com with SMTP id s6so10923945edu.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WzQQio6Z4cv2fZfJqaRuin61fcb4DAUKxWnvz/TufR8=;
 b=NqIkZp2+FZ0lPsfrarmz8OJfOp8y21eROQnp3sA4Y5J23oeDhq6y/BWspCDoiuuzrE
 ELJZpHMBPJwoZXlvWsja9aJ7WvOHr5+4ObNKRaGTkhx6b4JMZhB3H45brEPlaC+j4PRQ
 uV2JDyKlpbvmQP3DwNvQWj29DhTcijuQmxpv8pvHlzuf7sNNJYSyEwFVjTsV0MFyJSEf
 gDMUznuvqsYWy7gCIc7AHdo8eAAeaN+m7qlOug/uH8Rlk+SsH7c0XHhpvUvwC4ap3qbV
 BW2me6OUkffujDUd2O4MLSIU7t8ugSMZoSv28solzp0WjjGPGQtX0j5FxvTYQAv+CJd4
 xtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WzQQio6Z4cv2fZfJqaRuin61fcb4DAUKxWnvz/TufR8=;
 b=XI2JdMmJX71CGYtZJKqU7lVzcashvkV6JI8nqDqlsI+zIFHblcHLer5MHQkRdaj7YO
 yiCra/q8WfBEwnV/VDWr2ccJbTFm5FpGLGh+nyaNDyVGp/LWnA0p9nejptQF8TlIijcM
 T/X8H5klHY07lXklqxzhrHzKNsvnxgAESSJlk/WIDixHTwpS1mHsm9SFtN8oLoHR+tbx
 b/pxq4jdVA0Bs49Xa+5jgoIulB96Xie6TAGLl5db1COOOjA8Zu1mtFrOcH+d/8wMuHAO
 ZRbzN9CReItGq7q+RT69mx/pMXrz+YmrAZ6Ergk3Kn/RwZOldzQB2+VpUbpXGWWlEsv6
 ietA==
X-Gm-Message-State: AOAM531vRUOrrxMn6CrIIcKftdw2ym9IEtksW+R/9i90FJYDWuzoMRam
 McwM6ArQLQ8H5Icc1By6+KjqVB7ugGOb3JOJlJZ4+Q==
X-Google-Smtp-Source: ABdhPJy48uzVj/u4impllVU3N96Ur2l7CjBd9qf3gu+dWrfzhArcTa3PFWqE/Ejxx6G/vEWTc0OwsMd0VuqIWJUeC6M=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr6934865edv.204.1621342056042; 
 Tue, 18 May 2021 05:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-12-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:47:19 +0100
Message-ID: <CAFEAcA_YZe6xMfMFek-KEh8j3zO-AiquM3epyFET3R6XPDAjkQ@mail.gmail.com>
Subject: Re: [PATCH v1 11/11] target/arm: Enable BFloat16 extensions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Apr 2021 at 01:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c   | 3 +++
>  target/arm/cpu_tcg.c | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 379f90fab8..db4f48edcf 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -660,6 +660,7 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
> +        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
>          t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
> @@ -707,6 +708,7 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
>          t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
>          t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
>          t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
>          t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
>          t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
> @@ -730,6 +732,7 @@ static void aarch64_max_initfn(Object *obj)
>          u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
>          u = FIELD_DP32(u, ID_ISAR6, SB, 1);
>          u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
> +        u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
>          u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
>          cpu->isar.id_isar6 = u;
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 046e476f65..b2463cf109 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
>          t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
>          t = FIELD_DP32(t, ID_ISAR6, SB, 1);
>          t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
> +        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
>          cpu->isar.id_isar6 = t;
>
>          t = cpu->isar.mvfr1;

Same query as with SVE: do we need to clear these in the "!has_vfp"
and "!has_neon" handling code in arm_cpu_realizefn() ?

thanks
-- PMM

