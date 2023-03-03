Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE46A9968
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 15:29:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY6Oi-00063b-AY; Fri, 03 Mar 2023 09:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY6Og-00063L-Qp
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:28:34 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY6Of-00071E-6w
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:28:34 -0500
Received: by mail-pl1-x629.google.com with SMTP id p20so2784036plw.13
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 06:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677853712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z1jjAztQ9HZerXRpxamFViFj+6T8tWVAjd1eaGe0To4=;
 b=pAB88lAKOJ9J6AFgfhHc/m6Vf4pWPAMJPfm0k3ufbaeksRCIBAajhCFDJVopu9rcGH
 frTPGr+nJvdPVN0F7/FdsRlgFIT9gzG0LIicd0Jo8K2d59jQyqYJD0HQ4qntI8sJtt3Y
 BqRneA0PQjaik5tG90PS0Wm4cFU7jQWJ1E+T3cAq6i1PjvbzO39Hs3cf2rxKmoglJMU3
 wik0KADp7tKuQJt/FPYus4E9PsYyjTco00fmIUwV/R/uCHWGEvKwPw8wkHYkiQfLZkCw
 TZYR/3iV18A83Eg2UkhrDwEwoGofuRhRF9kbpiocN1WebHBNiyOkodMVWYs5+RX3PKuC
 KhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677853712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z1jjAztQ9HZerXRpxamFViFj+6T8tWVAjd1eaGe0To4=;
 b=tM8sQ40iYJRzy1SqXXlHN+jku4VI0YRuvmMF6sTmung+DAE8ekqIfopsZXMIASLPT3
 4KZk1rCJMlG5+X7OWaKNV+SlKNBeFms3QkyQXE8lqtgiRW0Jkem5rOioLbERmxyosQZk
 nD88bNd9WlgApvI/bD6rEs0TF7NW6E0mhmL5kbzgkebtUvN/A9mbUInPZ2ye4yaOvU/w
 xb8Ed9z/JIUJtcQxv6RiSRHVdgkxaTMMX+1JlWPxVL1fNgF6LN74ExucsHkAgrfshG0h
 4+EQJnNu6Q/L/S97SlHZg7i7VsDWruBopF5ILZ7u2OtKUlhNNEmtVCAN405YY2TVvwd/
 ymYA==
X-Gm-Message-State: AO0yUKWjK3VMBPbclYiFzmzfV6oHI3thSBV6yjAg3bq8T316CouNSPtm
 hdRCm4C8bSzzwETQVWsKaOkO95EINuYvciPsLabF0Q==
X-Google-Smtp-Source: AK7set9EmLRBnKiR7bdr9zn/GorNdkHYeay3cgVtDR4yg002sxR7EU7xSGZ7IGEtGO/w83HpypP0ft31eHNFBiUKx2Q=
X-Received: by 2002:a17:903:2616:b0:199:4a4f:9d2a with SMTP id
 jd22-20020a170903261600b001994a4f9d2amr784922plb.13.1677853711784; Fri, 03
 Mar 2023 06:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20230302174206.2434673-1-clg@kaod.org>
 <840ae915-390e-5cb9-3186-360856ecf407@kaod.org>
 <CAFEAcA-HvviZFZXBwJQXhxVsqv473=5BW=WJgKSd25uqmschXw@mail.gmail.com>
 <d62972e8-cfc9-e494-1b41-cf4825715532@kaod.org>
In-Reply-To: <d62972e8-cfc9-e494-1b41-cf4825715532@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 14:28:20 +0000
Message-ID: <CAFEAcA_2pLD=dsJXHCZP1ZVFUbFiLoneoz9gbvMPW8-oxGn+ZA@mail.gmail.com>
Subject: Re: [PULL 00/11] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

On Fri, 3 Mar 2023 at 14:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 3/3/23 14:34, Peter Maydell wrote:
> > On Fri, 3 Mar 2023 at 13:23, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> >>
> >> Hello Peter,
> >>
> >> On 3/2/23 18:41, C=C3=A9dric Le Goater wrote:
> >>> The following changes since commit a2b5f8b8ab7b2c947823088103a40f0ff1=
1fe06b:
> >>>
> >>>     Merge tag 'pull-tcg-20230301' of https://gitlab.com/rth7680/qemu =
into staging (2023-03-01 19:19:20 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>     https://github.com/legoater/qemu/ tags/pull-aspeed-20230302
> >>>
> >>> for you to fetch changes up to b22a2d409b1acfdf0d63d1bb3595194ceb3d94=
da:
> >>>
> >>>     aspeed/smc: Replace SysBus IRQs with GPIO lines (2023-03-02 13:57=
:50 +0100)
> >>>
> >>> ----------------------------------------------------------------
> >>> aspeed queue:
> >>>
> >>> * fix for the Aspeed I2C slave mode
> >>> * a new I2C echo device from Klaus and its associated test in avocado=
.
> >>> * initial SoC cleanups to allow the use of block devices instead of
> >>>     drives on the command line.
> >>> * new facebook machines and eeprom fixes for the Fuji
> >>> * readline fix
> >>
> >> This one was merged already. Would you prefer an updated PR instead ?
> >
> > I'm not sure what you're asking ?
>
> Sorry, I am not being clear. I included commit 76f5801a83 ("readline:
> fix hmp completion issue") in the PR, which could be an issue when you
> merge, may be not, I am not sure. I can respin if you like.

I think that's probably going to be fine, it's a small bugfix,
and the git merge machinery should Just Cope.

thanks
-- PMM

