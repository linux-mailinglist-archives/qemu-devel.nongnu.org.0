Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F3B332E90
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:54:39 +0100 (CET)
Received: from localhost ([::1]:32810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhV8-0008Ch-4F
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJfKp-0003dU-2m
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:35:51 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJfKm-0004Z0-Jn
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:35:50 -0500
Received: by mail-ej1-x629.google.com with SMTP id lr13so29481719ejb.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U6+SnKhUCC0Mfvz4K7prRs/soynObQg8kHpJqB0KHsk=;
 b=UFkrt8W4d8DEYKGFtIjaNB17C2qM5026LHMrvjHy8dZ8pZrAyhQkx8mwUtbMPPzp97
 Yz3hwREvfJ3d9qiHoldGkoHfjtOtHsY2sTkqzTjiDb1mVOf2jK4+hst/+KuFKIJCFggo
 SLaclUyayw01JJSZcXRNxtEAzzFvwHYdvIdW5xBvSG7UXT8/jO249C64CbTRBwic5KPe
 SyPcwrPRZ71IKYCmF/PLlQK0qOOUOf6vJC71kz3oZT4R4VZkxituszYIBbqlCnqsSqcB
 Hr+fxt1ARgb79GMLkrzGNsLpNkO16XYmdWDulOPA0n7u/WNlp9F+bwznLh5ITeV7e0RK
 FCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U6+SnKhUCC0Mfvz4K7prRs/soynObQg8kHpJqB0KHsk=;
 b=XZa8xu3NZ2c0rceX2X+dTdAlcKD4DI2T2WDhHsD1I+nFWnMrl5HOLJlcmJm4V3NX4U
 vNNMMXin7RLduI74WtNqIaXSgnN5uL12u/y4ibgUg+pXWOMemm6HmDIk9NMMN2s02CVb
 WIj37fpvx/sZtIoxSZSbtjPTBdStn8efEczeHGMB6lcjCRrEkSp1XwXdomGbYK/8D2NQ
 VPY8eGPdaR8/YVDFqhWdDRpj5eI5RMCTESvui03HPAQXKW4wMYg+Fns7w+nPHpBRF+Cs
 sVlFW9zrz6YxaU6C4nsw9a7Y3AH3RaoMxQXahxSl3G3HfLYn5Rckm+PRQn45QtVwkz1Z
 YSug==
X-Gm-Message-State: AOAM532Un6tqgbnfWNfB77KAVMgpEBPNoTHZtmwsXcGzp61KLJXBL32C
 +gUmQgQKnPYyF2Nx/n1b0NT6n0w7B8CHWL5U54vaqlJ4DPg=
X-Google-Smtp-Source: ABdhPJyugzxxJwgk+EsftYRu8J7vvDsso+OSDeXF+JDV8jOr1lY0c+i++EloW8Ob5LG/V4e2f8WqE/7bxP7mP3GVWV4=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr21703106ejc.250.1615307747174; 
 Tue, 09 Mar 2021 08:35:47 -0800 (PST)
MIME-Version: 1.0
References: <20210309141727.12522-1-alex.bennee@linaro.org>
 <20210309141727.12522-4-alex.bennee@linaro.org>
In-Reply-To: <20210309141727.12522-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 16:35:29 +0000
Message-ID: <CAFEAcA_zFYAWc=03iSdsj-Sy+MN5-DWih4QKzddZJsrRjrzhOw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] semihosting/arm-compat-semi: deref parameter
 register for SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Packard <keithp@keithp.com>, Bug 1915925 <1915925@bugs.launchpad.net>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 14:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> As per the spec:
>
>   the PARAMETER REGISTER contains the address of a pointer to a
>   four-field data block.
>
> So we need to follow the pointer and place the results of SYS_HEAPINFO
> there.
>
> Bug: https://bugs.launchpad.net/bugs/1915925
> Cc: Bug 1915925 <1915925@bugs.launchpad.net>
> Cc: Keith Packard <keithp@keithp.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  semihosting/arm-compat-semi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index 733eea1e2d..2ac9226d29 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -1210,6 +1210,8 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[2] =3D rambase + limit; /* Stack base */
>              retvals[3] =3D rambase; /* Stack limit.  */
>  #endif
> +            /* The result array is pointed to by arg0 */
> +            args =3D arg0;
>
>              for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
>                  bool fail;
> --

No, 'args' is the argument array. That's not the same thing
as the data block we're writing, and we shouldn't reassign
that variable here.

What was wrong with the old arm-semi.c code, which just did
appropriate loads and stores here, and worked fine and was
not buggy ?

thanks
-- PMM

