Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2083302475
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:50:48 +0100 (CET)
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40OM-0004JZ-V4
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l40M4-0002Mt-1U
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:48:24 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l40M2-0000R6-7r
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:48:23 -0500
Received: by mail-ej1-x631.google.com with SMTP id g12so17570734ejf.8
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 03:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gug9XGBPh/3SURIJqxVQnavvgMf6gEGJyHA8magW3t4=;
 b=xRO0RLl406myh08XXu2RoQSK8uj4+vwn47HTFALH2LkTdA1LH1ZjiDKciUN3sIvQMe
 GIIXzBB9c1LTnoa0wh0NsdOJnpZvvpgxxVrrc8Wuym5O8U223inqJI0LyKJ7E8jIbgMv
 PzyQH2gywhlV5+YcnJxl5z40owvDdE4mg6++qcSxo70nAX8xqYoQ58O7twuNfZVmV3IL
 0R+XgGtKwIbn3znKuYZrmKzpHjovfn5Klf1V4Xtj03+8+CL47im3+m/RTvQa6VEPJszj
 RMaB/JaJfKIDEdn87mfBzRvJzlUZr+R+C/8fVTkYPrLGLnpzkemT5K3swp7aylYnS/Sr
 c3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gug9XGBPh/3SURIJqxVQnavvgMf6gEGJyHA8magW3t4=;
 b=iAWd8TAKnEJjH6Hcs0TdD6RsrkOsqfF0resAeCiS6+y4I8pL/yjm5q79kMhWWIrg9u
 shkH98R/h8QGkRf9kxd9JzjTc4HU/M8IAVqllm2HFPEsmllGmVjt/kZrhgO2vbPrtwLK
 aZTW4dpXHoxfQCotb9m7jlsg7OtMx5+y+aLsLck/gScmDyNBb4jCdokWdvn5sm2gclcm
 vWLSJVgRWli4iY7FnniuqSSt65UgoIvfBz91jeJ97npJmWJ7B9VRY2clCbIbTqGLGmPn
 Sy66InpI7dJR925X0Icj7HiaP5UxVa1hXyuWW+xKvBsMacrZ139OvEQS4afC83IXhUnA
 gcbA==
X-Gm-Message-State: AOAM532fziN9SpmVTi6SuCLyRB50D+pRXqncK7nnwnlcE2XMqJ11/YKK
 C62trJMdaym0igFPOER1jG3lMExgFSDjqb85179vbw==
X-Google-Smtp-Source: ABdhPJwx48fSmemx+AQCLN7/iG+QOi6SurCXCrwEktsF/D7Xu/Wof7b2B6tb0haJdLzezm4kIcFWUGTr/ZXFlm+UNEw=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr116599ejc.482.1611575300559; 
 Mon, 25 Jan 2021 03:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-17-peter.maydell@linaro.org>
 <eaebe605-7ec3-ca26-9003-4619680bb43b@amsat.org>
In-Reply-To: <eaebe605-7ec3-ca26-9003-4619680bb43b@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2021 11:48:09 +0000
Message-ID: <CAFEAcA_qaJeR0TgX0CJuS_mUxezGQy-KtF44c7P8gG6JADe+wQ@mail.gmail.com>
Subject: Re: [PATCH 16/25] hw/arm/stellaris: Convert SSYS to QOM device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Jan 2021 at 22:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> On 1/21/21 8:06 PM, Peter Maydell wrote:
> > Convert the SSYS code in the Stellaris boards (which encapsulates the
> > system registers) to a proper QOM device.  This will provide us with
> > somewhere to put the output Clock whose frequency depends on the
> > setting of the PLL configuration registers.
> >
> > This is a migration compatibility break for lm3s811evb, lm3s6965evb.
> >
> > We use 3-phase reset here because the Clock will need to propagate
> > its value in the hold phase.
> >
> > For the moment we reset the device during the board creation so that
> > the system_clock_scale global gets set; this will be removed in a
> > subsequent commit.

> > +
> > +struct ssys_state {
> > +    SysBusDevice parent_obj;
> > +
> >      MemoryRegion iomem;
> >      uint32_t pborctl;
> >      uint32_t ldopctl;
> > @@ -371,11 +376,18 @@ typedef struct {
> >      uint32_t dcgc[3];
> >      uint32_t clkvclr;
> >      uint32_t ldoarst;
> > +    qemu_irq irq;
> > +    /* Properties (all read-only registers) */
> >      uint32_t user0;
> >      uint32_t user1;
> > -    qemu_irq irq;
> > -    stellaris_board_info *board;
> > -} ssys_state;
> > +    uint32_t did0;
> > +    uint32_t did1;
> > +    uint32_t dc0;
> > +    uint32_t dc1;
> > +    uint32_t dc2;
> > +    uint32_t dc3;
> > +    uint32_t dc4;
>
> Shouldn't these be class properties?

Could you elaborate on what you think the code ought to look like?
I just used the usual thing of defining uint32 qdev properties so we
can set these values when we create the device, as a replacement
for the existing code which either reaches directly into the
state struct to set the user0/user1 values or sets the
stellaris_board_info pointer in the state struct.

thanks
-- PMM

