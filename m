Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A441357EBC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:09:35 +0200 (CEST)
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQfO-000195-IL
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUQbk-0006dq-OV
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:05:48 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUQbg-00022a-Mo
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:05:48 -0400
Received: by mail-ed1-x533.google.com with SMTP id g17so717697edm.6
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 02:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WfCf8TyDez/mNSWlms8Kf+dQOgPnp4pHHE6zG7Dah1Y=;
 b=OVZV9yl7wGtz77x8zqq8icrpT46OUfwp7jyhN6bq8xN80Mdfbb42AFKv9Hp9Ozc8Mk
 p8Aep8NU939Exe2KagTpv+p4QJBxF0R+lhOWLCdVX2EnqwTpnCZTPKh6KUq1BD861HNu
 fWbbDBD8e/iEY0R1FINcC7dtmkfDTIFDTiQndOer00nTs6oRH72w9n18FuMtCmYUHf5/
 HovsBvKJ0pTE2AFRer/gbR5UNw+QuEjPtMxzTe8USzYBUVlZ2levNO8sUCWcPqRW3hCi
 CZ7clr6XP6L2mw5njC0oHAISJztc/Xw/V85v24qjMtnEq+pik/PMwforu59s2qrlk9Er
 uoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WfCf8TyDez/mNSWlms8Kf+dQOgPnp4pHHE6zG7Dah1Y=;
 b=UJq8RCaK8mkH1hFoNOMUTysz3Dl7tmZfQBOFYocGN3Sr9tzNG5AnDRp7NP+DAjbkqy
 lP1qOWLWHxB6kzcouiD4iw2ItDzBGZ427YlyrD2XKunJKLUcRC33uDUiphuPksaZhajI
 TIE4WPMT9N6VMRxYV6kNt4wDcIgFlCbcmawcO3m0F30fPrki9PSmY3PyjNXc1r60PwrB
 fC3xHAgxqdfw/3Kbaxgy5ilE9MWPUobrhxpG8rJL/N0fSK/D7xIJj4FWFT+zrmIabVFu
 KgPdG4xYwNxk8bO553t4Oy9LdrY2C5cimc9ulKBUPtpFdE9D21ePhWqbibSnl1qpQSWr
 04eA==
X-Gm-Message-State: AOAM532UWvK4ChV8SOADUaQURPAvAtDKaZF2BUT8+cV9LSDZ/7X1oAH4
 NS8x6hPmdFdqInN0OAiIENaggfqEzUgMgUBDPZrvkA==
X-Google-Smtp-Source: ABdhPJzro2k2+rrD+CxNPZqZaxmG8afCLmnvznwI73gAJvPGcZHSAUpZNPSQJlMOnBJdfB8hX6HNNr5wqVI87rX30w4=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr9813124edv.44.1617872742991; 
 Thu, 08 Apr 2021 02:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-18-clg@kaod.org>
 <CAFEAcA9LEO2BzghgCvp5hfFvRx1YyL5XZxY70FHPGwHeHxZZhA@mail.gmail.com>
 <016cb78c-ece3-15b6-20ed-29436595f621@kaod.org>
In-Reply-To: <016cb78c-ece3-15b6-20ed-29436595f621@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 09:05:02 +0000
Message-ID: <CAFEAcA_-YEg+dz-xW_yBdEQVi7uWe6_bU2mB6yQ5CK1JH58HYw@mail.gmail.com>
Subject: Re: [PATCH 17/24] aspeed: Remove swift-bmc machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Adriana Kobylak <anoo@us.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Apr 2021 at 08:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 4/7/21 8:29 PM, Peter Maydell wrote:
> > On Wed, 7 Apr 2021 at 18:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> >>
> >> The SWIFT machine never came out of the lab and we already have enough
> >> AST2500 based OpenPower machines. Remove it.
> >>
> >> Cc: Adriana Kobylak <anoo@us.ibm.com>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >
> > We've had QEMU releases with this machine in them, right?
> > If so, then we need to go through the usual deprecate-and-delete
> > cycle, we can't just drop it immediately.
>
> You are right. Instead, I will add :
>
>     mc->deprecation_reason =3D "redundant system. Please use a similar "
>         "OpenPOWER BMC, Witherspoon or Romulus.";

Don't forget to document the deprecation in docs/system/deprecated.rst.

> And we will drop the swift machine in QEMU 6.3

We only have x.0, x.1, x.2 releases, so it would be 7.0.

thanks
-- PMM

