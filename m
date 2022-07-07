Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9A356A23E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:43:33 +0200 (CEST)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Qqy-0007Yv-DN
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9QjW-00008P-Gd
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:35:51 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:38694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9QjU-0007wS-TL
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:35:50 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31c8a1e9e33so116135837b3.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P1z2YkMDX/WVS38YM566xaZGlop703ofSRFxpBPecRQ=;
 b=G8csMEaU3Wnmbs3ijUECsdCzNx98+5lyga2tr368e1WtnGDJFQF1rLzccV/zfqFGqb
 Cmo44iEvqjKjibuCSrBcSgn2cCxUXwQXve92/7LkX83tNloNDXh6jsKSma8ktkQk/ySG
 BqpZGZ53vSypP7bMK1g/LjxNrZGp1nhXEgb0EDdaIMJGKu7MWzTVD+51Fe5WWVNvsb6f
 8IircLVA0VM4nzkgEpolSBmX9qvWYMl1sFXXUkqX767uu9jQCAi1FSbJOqpfbJdasFQl
 Ocuowve7PmMDsdfTeMIUkvhDIDMOb9n4ybOTmRZhkATgFyTY7EmWMWfxxwPqZ1OeYhqL
 Rbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P1z2YkMDX/WVS38YM566xaZGlop703ofSRFxpBPecRQ=;
 b=XO4FHKe5pq4wpNXLwXU6P+zA2g4XlmNEXyK0emjq3BNo4BWLrQK79p/e4rx5bQhWOz
 yIF6i6t41yRqhfr1fpBWnfVsaRpPf0m8Rn7TdiH8TP3V0qstG5rgtZjsoglFXBEDjta7
 ONSP7UwCrWNsggngT6dmRd250+CaKFSsymWAj0QgOg6VNvPVD56Zi3mwpaKS71h8AMrW
 9/9OPtJe2ZDkKxSHOqtywSUSTRcSbLupdfpUvnQdw2sfJg5Z7nFtVPw8gNdVz3hDbFDo
 t8EOjUzBUiv3m4qcOs/qG5gqzVQeobbf4wp3mGTJlHT2WsZK1zhKXo5sHU7EoVwW2tTv
 dxJw==
X-Gm-Message-State: AJIora/inw6TjL8MmABvTOgYDISecOylyrUCTyyIOx4mWzMeYDS4owXj
 fSv2LppKzcXO1hnRTAxuMuiwFdAP2XUiN3k6oYHZYg==
X-Google-Smtp-Source: AGRyM1vbDuXfMp8aVUlnYNVJZ8b6FOVOUfCf2azKG/isItIqyAsSgLD8eS1Cy7OaqpZ7Xw5RiuxZBtgm6xrRMzvVur0=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr52583182ywb.257.1657197347284; Thu, 07
 Jul 2022 05:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-5-berrange@redhat.com>
 <CAFEAcA9=cKaD=LoBheRfU610nOQVjVWmqCT=ONUpD6OhBX9WxA@mail.gmail.com>
 <YsbR3/ZJtQAS2yg/@redhat.com>
In-Reply-To: <YsbR3/ZJtQAS2yg/@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 13:35:08 +0100
Message-ID: <CAFEAcA_ftFckHNLwhM+SQ=UMDjR-6rfkGgezK27DRy0vUnTfjg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] misc: fix commonly doubled up words
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 7 Jul 2022 at 13:30, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Mon, Jul 04, 2022 at 04:52:40PM +0100, Peter Maydell wrote:
> > On Mon, 4 Jul 2022 at 16:23, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> > >
> > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > ---
> >
> > > --- a/docs/tools/qemu-pr-helper.rst
> > > +++ b/docs/tools/qemu-pr-helper.rst
> > > @@ -22,7 +22,7 @@ storage fabric. QEMU's SCSI passthrough devices ``s=
csi-block``
> > >  and ``scsi-generic`` support passing guest persistent reservation
> > >  requests to a privileged external helper program. :program:`qemu-pr-=
helper`
> > >  is that external helper; it creates a socket which QEMU can
> > > -connect to to communicate with it.
> > > +connect to communicate with it.
> >
> > This text is correct as it stands, and the change is wrong.
>
> I think the current text is a rather awkward, so I'll rephrase it
> next time.
>
> > > diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.=
c
> > > index 04e199ec33..6cc1f5d932 100644
> > > --- a/tests/qtest/microbit-test.c
> > > +++ b/tests/qtest/microbit-test.c
> > > @@ -449,9 +449,9 @@ static void test_nrf51_timer(void)
> > >      timer_set_prescaler(qts, 0);
> > >      /* Swept over in first step */
> > >      timer_set_cc(qts, 0, 2);
> > > -    /* Barely miss on first step */
> > > +    /* Barely miss in first step */
> > >      timer_set_cc(qts, 1, 162);
> > > -    /* Spot on on third step */
> > > +    /* Spot on in third step */
> > >      timer_set_cc(qts, 2, 480);
> >
> > These changes also look wrong.
>
> It makes them consistent wth the first comment "Swept over in first step"

There's a difference between "in step X" -- during the duration
of the step, and "on step X" -- at the point where the step stops.

-- PMM

