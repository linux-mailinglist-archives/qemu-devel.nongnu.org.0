Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B10960CBED
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:35:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJ8S-0003Cm-Ee; Tue, 25 Oct 2022 08:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onJ8P-00031A-Tj
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:34:21 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onJ8O-0000wi-3b
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:34:21 -0400
Received: by mail-pj1-x102f.google.com with SMTP id ez6so10773318pjb.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kox3nj3fFbRu7l9sJY44/+JHE3i0YXLiWwE1pGDluVw=;
 b=i+mF3GRlUaihhF8ROtckJ4Sjc87bO3Ul6QLbzU+hLH6sD+xy4LkpRC3cpT5JlIhoDh
 Sl2CRQd7hGGKJOLu8DGmo4Udu+lNYppNQa1Uj489Pwj36L9Nki59iQGXmWhZ/gIBADJ/
 H25bvZedS5FnB6WDJ9Ji4kraOQzTnhyYgE4fnJ/eido2rKdFdf/Jk/Ox2vPex6SMJqOj
 4kd/PmoLSMAQVLiFWs38SKI6iIpElqMmHM2JLDA/RCNk47ICteXuQjpvLMxm1NOo2QlT
 MOLH7yoD0KYWn5Y6VasuQzANE3PM2LCVNotdyC3jStBtIOYglt6dS7DnFoydiotN7BT7
 P/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kox3nj3fFbRu7l9sJY44/+JHE3i0YXLiWwE1pGDluVw=;
 b=iQ8TwTiafTzsWzuiverGZE3y7Ky/t95GXb5ZQrlkcb8GCxqrTRI6V273+QgSz9aZ77
 2s4DCTT8vLVxVSp+eLTzPBVO0fCpQ13iXiE/ym6xLzMTxT4xxpSJ4P4U1dE3o67meqh1
 IeWFGmMeUB/mZ1VlR2J+ill9lRyFiCYjrmjqNw9gYjv5LZ8p3dGIXNIwf7xoC4LBx4U2
 2gX2ycDolkRMLWNoD3kgn/IwSAu6WTRtupR+nsrzgrKZIrBO++nI7P7btPgu0A4sRAmH
 Mv9Y9rDH6N8kt779l5zll5Xjc+Wo6tEKVld4rJ3W2w/SySXVCU9smqyoR1CFLUd80Lmk
 IlxQ==
X-Gm-Message-State: ACrzQf0HshUyKz63QNcd0n3Xmc4wkshZ/IyJHSEwjdNz+I1t4yOQPfGj
 Sfaro2tma5oPugD033+z9wNULvjqfuBW6LWwGiVRIA==
X-Google-Smtp-Source: AMsMyM65VP0LIDHWkXn4VsteoyR3iIby2FR51Qo1etD5bLqQcGFTMJSvVY2/7htL52FM9euEEujtou0yabQQ6ltJn/I=
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr43552067pjb.215.1666701258516; Tue, 25
 Oct 2022 05:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-2-Jason@zx2c4.com>
 <874jvs5t5k.fsf@pond.sub.org> <Y1fR/bMo/HcDvo7A@zx2c4.com>
 <CAFEAcA-cqzoEyWiCd0RCGezqijvWfnXso1kH9zDb9fYdYpa_6w@mail.gmail.com>
 <CAHmME9owB8eay2DJrYiEaZKRoJA6RA_EmCPSV0_XgU2aHYx_wg@mail.gmail.com>
In-Reply-To: <CAHmME9owB8eay2DJrYiEaZKRoJA6RA_EmCPSV0_XgU2aHYx_wg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 13:34:06 +0100
Message-ID: <CAFEAcA_vLqKQnXuYs6nQqbqw5KYUq4ye5O1s2CRPrdEkxOAVcw@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] reset: allow registering handlers that aren't
 called by snapshot loading
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Markus Armbruster <armbru@redhat.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 at 13:33, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Tue, Oct 25, 2022 at 2:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 25 Oct 2022 at 13:09, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > Hi Markus,
> > >
> > > On Tue, Oct 25, 2022 at 08:11:51AM +0200, Markus Armbruster wrote:
> > > > > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > > > > index 49989d30e6..e44c0de914 100644
> > > > > --- a/qapi/run-state.json
> > > > > +++ b/qapi/run-state.json
> > > > > @@ -86,12 +86,15 @@
> > > > >  #                   ignores --no-reboot. This is useful for sanitizing
> > > > >  #                   hypercalls on s390 that are used during kexec/kdump/boot
> > > > >  #
> > > > > +# @snapshot-load: A snapshot is being loaded by the record & replay
> > > > > +#                 subsystem; internal value (since 7.2)
> > > > > +#
> > > >
> > > > If "internal value" was an established way to mark parts that aren't
> > > > visible externally, this would do.  Since it isn't, it's too terse.
> > > > Suggest something like "This value is used only within QEMU.  It doesn't
> > > > occur in QMP."
> > >
> > > Thanks for the precise text. I can do that for a v5, or, Peter - do you
> > > want to just fold that in upon committing these patches?
> >
> > If there's no other issues with the series I'll just fold that change in.
>
> Great, okay. Last time when we found this original snapshot reset
> issue, it surfaced because you put this somewhere that the CI ran on.

No, I was just running "make check-avocado" locally.

thanks
-- PMM

