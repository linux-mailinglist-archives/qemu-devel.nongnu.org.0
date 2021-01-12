Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB512F2D38
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:52:10 +0100 (CET)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHHV-0001Xv-GM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGPJ-0002Aq-Px
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:56:09 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGPG-0003tp-Vy
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:56:09 -0500
Received: by mail-ej1-x629.google.com with SMTP id d17so2593878ejy.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=19cL4wojbQuqSJ16gyCwngGtDBfXVS72TXpqKpEjZRU=;
 b=ATDN9zGmQvQlTZm/zMUTAsNYsYuBX7oeaMLyeiPPoVPoW2TgLIL2jdwc4yMt1PHbHF
 3tkcrdG2uJ6Uhsam31xwmHzfW6PZHfOF6m3EnJEBEBugQPfLRty8oLQTDsyYLepJx5Kp
 BwtgCBRdv+UvNk3fIEV16Js7U1xjHEmnvFo1C8Un5OTs3v/3ORXmvAcUc2o0MFXxlA/6
 czIr3a07cgyXs2AZGZxW7bHs0uaVfaFl9ca/xUWH7ZFgcltLmb5TN2UumV5qGefVloJr
 AtOQtkYAg+pSOi1benl+xjNQdczKBHgBFPqp5ZS9bZmvaD/4exjRg5/9CVq/SHrK+tGX
 CCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=19cL4wojbQuqSJ16gyCwngGtDBfXVS72TXpqKpEjZRU=;
 b=f6Zdmd29nO0Lpxs794/N6sXOVKYbkWGOuB1DaSfkDME16fzzXeqyK7AGkFTfzOMkrZ
 JifXSlsRrN7DM00YRXvHfUbSrRz+c6c1SXj9fNlh2nLO7GnxTBmTh/SczqePgrhPBWYh
 Hq3LGJD2bxjnhj+B+2Xd0r6CHCmswpyZSRgL+SbQSeV8uphj/IIJwjOV5CPt9wuYty/t
 brmXaE6Wgwj5L/WMgqjmh8eIG/FPvrck1tAcHxnxjMCZK8JyqYEJRT7JIMyfCLw3Jp4B
 95Kcl3fMVulrXZnQHZGRZtwzuVniBRFp2JaLJdju+XHofIEsVvmm90lz9c4lm3OtuHIN
 3NFg==
X-Gm-Message-State: AOAM530cH3Bka2HBjacaLIudldXkP0ns5B/jqZRlsu96kO0F8FbjwEnU
 cSoMZ7+/uY5TneyMTv1pegfiSjzDB8TKc0gIr/Z2kw==
X-Google-Smtp-Source: ABdhPJwuneTGFDLmGP33I92J052VvOfiPyDnJKVRpexRqXqqlsCoMLG8aT27I7XA9gg3rjGUKsN701aFhBMlRpGVaaA=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr2674759ejr.482.1610445365645; 
 Tue, 12 Jan 2021 01:56:05 -0800 (PST)
MIME-Version: 1.0
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-7-remi.denis.courmont@huawei.com>
 <6e1eec7e-35de-4276-68ec-7e12cb73a699@linaro.org>
In-Reply-To: <6e1eec7e-35de-4276-68ec-7e12cb73a699@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 09:55:54 +0000
Message-ID: <CAFEAcA_gvYayKHb9zg8F3v3HfyXUptreJZq4ozOV3a-5+kPqyA@mail.gmail.com>
Subject: Re: [PATCH 07/18] target/arm: add 64-bit S-EL2 to EL exception table
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >
> > With the ARMv8.4-SEL2 extension, EL2 is a legal exception level in
> > secure mode, though it can only be AArch64.
> >
> > This patch adds the target EL for exceptions from 64-bit S-EL2.
> >
> > It also fixes the target EL to EL2 when HCR.{A,F,I}MO are set in secure
> > mode. Those values were never used in practice as the effective value o=
f
> > HCR was always 0 in secure mode.
> >
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com=
>
> > ---
> >  target/arm/helper.c    | 10 +++++-----
> >  target/arm/op_helper.c |  4 ++--
> >  2 files changed, 7 insertions(+), 7 deletions(-)
>
> At some point I think it would be worthwhile to convert that target_el_ta=
ble
> back to code.  It is really hard to follow with 6 indicies.  Not your fau=
lt.

I think that there's value in having it be expressed as data
rather than code because then it can be compared with the equivalent
tables in the Arm ARM. I agree that a 6-index array is getting
a bit unreadable, but maybe there's a more readable data format
we could find ?

-- PMM

