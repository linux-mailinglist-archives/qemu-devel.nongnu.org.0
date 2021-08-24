Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0CE3F6054
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:26:20 +0200 (CEST)
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXNb-0004Ma-9p
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIXMe-0003Yv-45
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:25:20 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIXMc-0005tC-Mm
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:25:19 -0400
Received: by mail-ej1-x62a.google.com with SMTP id n27so12805232eja.5
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FES3aYK4d8ZW9c+FrBZLjt0EhJlOil05dW0QsimcFb8=;
 b=tmJ/20LQ7KpLP7Tw+/r+QGLrG89lXSTh/xgARlGww/R8RH7Rhcsq94XOhdP34AWFAN
 XiwsI9TM0vWC+FhM05HR7v6e/Lc04UxtQb2JAZT9C/IqYvQugqSTeNicpZfAH3YJ/LsP
 YJPxy7jpGa87evBV5MbA1zZMEmBHO3JhyHoI9BYBi9V2pOhaYha0zARLB2BR4+FQh/WU
 mKprYs9FTpzNRuB4/C3syT3nKKzAlmEgeCG76OwCTsprAQN84t1Zr9T9096d+Ukxlo2+
 xMBd4A/H2cylTH+QiRtwza2fXHBrJW/IGlg6xk0HTBtDhZEvHDds0x5myhQ4paVCx7A/
 4W4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FES3aYK4d8ZW9c+FrBZLjt0EhJlOil05dW0QsimcFb8=;
 b=thkL7gbmwVZBhyH1IM36aOpn1e/DDM1Wg9f3q3B0l0zhvhvGDD3rql+5l15rFzRrSY
 45kpH3TukC7SOji0wyLe3sLSMBRs99S7wVs5ZrLOCRqWshY0HT3fERGtlvprNHiBO5Vu
 JMYAo+b1zyiIv9LALu92H+hTt6u3fmtxHM67q0dRyp5qeK8np8pJtlUS4wCaovB4gYwq
 0pTfCDYd+7VVolVij27TqKPx7C9xM9kxl8+gn45UErcQYrS8NSWz520ED/i1aWICQPD6
 CS68+r37B3tr3El7y2j/lAerQpRKW89jsgWdgI3vzjB9vR8xIRX/tXDONT7shKPcpprT
 pk/w==
X-Gm-Message-State: AOAM531BwdCRydJjOLzBMDVzDcb0gYVcpGjBetGtbENhdqpI/WE7zsxm
 DwFIlTrs+f1hxSVkv+XCZ63gaZ5agntALziSTK3/bw==
X-Google-Smtp-Source: ABdhPJw2Y8mSLwv6GDn+gZBrXbhC7CPp2SXAAvkMBZV1qV5/SuBFb20UbsXXTqUmy4AFdm+k+NjTVNb0Eh0x7zTtpdE=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr41027642ejy.407.1629815116980; 
 Tue, 24 Aug 2021 07:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
 <87ilzvntu1.fsf@dusky.pond.sub.org>
 <CAFEAcA-2ShxjS6YAb_xBk=v5YJ5nLaaKtOLVEn7Vjfe6rkpp2A@mail.gmail.com>
 <87tujfdp4c.fsf@dusky.pond.sub.org>
 <CAFEAcA9_HGCVYX8smuAWhUDJ8NbfQ76XgJjOLd2EoyiS2gKC0A@mail.gmail.com>
 <20210824135742.auvxsilpjtlruwyc@habkost.net>
In-Reply-To: <20210824135742.auvxsilpjtlruwyc@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 15:24:29 +0100
Message-ID: <CAFEAcA__JxVBDtChgY9FMC5zPM9ytv_BtQP_8SxVCqs+f9HOtw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 14:58, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Tue, Aug 24, 2021 at 01:16:40PM +0100, Peter Maydell wrote:
> > On Tue, 24 Aug 2021 at 13:05, Markus Armbruster <armbru@redhat.com> wrote:
> > > When you know that all callers handle errors like &error_fatal does, use
> > > of &error_fatal doesn't produce wrong behavior.  It's still kind of
> > > wrong, because relying on such a non-local argument without a genuine
> > > need is.
> >
> > Not using error_fatal results in quite a bit of extra boilerplate
> > for all those extra explicit "check for failure, print the error
> > message and exit" points.
>
> I don't get it.  There's no need for extra boilerplate if the
> caller is using &error_fatal.

Yes, that is what I mean: if you do not use error_fatal,
then there is extra boilerplate. Markus is suggesting that
we should avoid using error_fatal, and my response is "the
cost of that would be that we add boilerplate".

> > Right now we have nearly a thousand instances of error_fatal
> > in the codebase, incidentally.
>
> It looks like 73 of them are in functions that take an Error**
> argument.

Those could probably be fairly easily adjusted to pass the error
back instead. Still leaves nearly 900 to go :-)

-- PMM

