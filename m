Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8A7331666
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:42:55 +0100 (CET)
Received: from localhost ([::1]:51132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKqE-0007hB-4W
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJnO-0002CJ-II
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:35:54 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJnM-0008EI-Mq
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:35:54 -0500
Received: by mail-ej1-x630.google.com with SMTP id mm21so21949612ejb.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WcywYy0MwbLvp1uGuKwbkEhzLSElonvrYpbBsOj7Qzc=;
 b=GOoYbDgTObfs+5s0dyi1jb7LeWwx3yYBmeO1IqargXh/MdvSLVw+tzNsXg0ym/3V3e
 h2OG+F0azIgSXJeP7eh9tdWG3bLIYkceDUTQwFCx74Nv89cFO9lKCRqgMPtGvgHr2oCu
 smRbYj79+Th5XHCzVDQRnQ3UCAgOG+45mgatUxxoNRcbdmhLQW9WB8HB3Nb+Idt8JGrA
 pS7FWDHbexbb4xr7H1+d+4hIDQ4RaM2jJ9K2fE/FJejkq6ipKZa4gvuNY12zi+psxum4
 5rHqYUAGjEH1/8e4C88XjE4tDEindRSjzAouzn7rATR+xvyPBTjWB4HsjF5DGUiHgSFp
 Rfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WcywYy0MwbLvp1uGuKwbkEhzLSElonvrYpbBsOj7Qzc=;
 b=DxgYVfM2GxC/txsre9I+DFDv4S3cFq2rBVsfhFHNqie8tkLD7tuJO01Yj5DGWw6Ljb
 o5gQPklsVQfEM9lxURFwYIj+SxnTPzaj6BzHbWBCM2ALULduocal8UrQ44r5EUDKDa/w
 zubo0mwnTrdcF/w/oVrDFLOmkK6/61/OPiG0oQ0ggFB0f+2RcsLCU0M7X2VrXIsMUcxM
 EIXnYPO9UOPGJ+PbAiyfRB4ERtYu+GBn3r3XRnRrmBkfNpGOF4Z9LPycZv0aHxk/qjKf
 YOo2JOdSsJ9LHj7sQvpQy5oC+TJYL1Ym0XpTPVbGXXJZ9UFhbEitotFNoOmAm8sJlSwG
 dl1g==
X-Gm-Message-State: AOAM530wkZkjQMurVIkdW/cBHn3q+zsrnP8Dn572gHP+A2wMc0YHoryZ
 lETNH0Kp6Hq18myFd7kX2Awd/SUqE1OcK2ZhwbtdxQ==
X-Google-Smtp-Source: ABdhPJzd21xqibnmXwlr5Nat8Jo6omKLDzFCKF1jDgP1maip9nFkneRaSPoAxCU6Bb+5NbbOvtrWf2rIWwvnQDtY+14=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr16269429ejd.85.1615224951052; 
 Mon, 08 Mar 2021 09:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-44-peter.maydell@linaro.org>
 <5283165e-f8f8-fd5b-843c-2010d212785b@linaro.org>
 <CAFEAcA8kLV_gxbD+Gt+c4ShTxcPKEUHYvF26gmtDA_-iAuWdTQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8kLV_gxbD+Gt+c4ShTxcPKEUHYvF26gmtDA_-iAuWdTQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 17:35:34 +0000
Message-ID: <CAFEAcA-JKTOoUpN=KOkYNsoT6_-wvJFhmkfG0qH84cSOX9CsVg@mail.gmail.com>
Subject: Re: [PATCH 43/44] docs/system/arm/mps2.rst: Document the new
 mps3-an547 board
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 10:22, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 5 Mar 2021 at 01:28, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 2/19/21 6:46 AM, Peter Maydell wrote:
> > > @@ -1,5 +1,5 @@
> > > -Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
> > > -=========================================================================================================================================
> > > +Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an547``)'
> > I think you should drop the list here, as it has gotten *way* too long.
> >
> > > @@ -27,6 +27,8 @@ QEMU models the following FPGA images:
> > >     Dual Cortex-M33 as documented in Arm Application Note AN521
> > >   ``mps3-an524``
> > >     Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
> > > +``mps3-an547``
> > > +  Cortex-M55 on an MPS3, as documented in Arm Application Note AN547
> >
> > The list is down here, anyway.
>
> The title is what generates the text for the table of contents in the
> next page up:
>
> https://qemu-project.gitlab.io/qemu/system/target-arm.html#board-specific-documentation
>
> I like having every board model listed explicitly in that ToC. (Though we
> have broken this rule for the Aspeed boards with "*-bmc"...)

I put this patch into the pullreq as-is, because the series is otherwise
ready to go and this was a minor thing; happy to send a followup patch
tweaking the title text if we conclude that we want to do that.

thanks
-- PMM

