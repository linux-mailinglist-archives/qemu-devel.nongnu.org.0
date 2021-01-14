Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3FD2F60F2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 13:16:38 +0100 (CET)
Received: from localhost ([::1]:38348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l01YL-0002GJ-37
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 07:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l01XE-0001dA-Uh
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:15:28 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l01XD-0002xW-82
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:15:28 -0500
Received: by mail-pg1-x52c.google.com with SMTP id n7so3679761pgg.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 04:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7X+lubDSKfk7TLMh1SOru/tY8oaNpbVGrWzp2eEf4w0=;
 b=n+RnS3VWXTUwILu6vIoxx+b963jvhsaWN+C9HGRxLjqcEiJklyur8IEF2diYg9UJ5s
 akmKAIYS+8vI/SB/naQBAbwbTptwdn5QqOXmO57jp49ugv4kfp+JXPUDE/stLUOueHrn
 AoR1mOrFYi77U6kYweD3bJu5pd1mNMMZpXBS4Si5+ioLv/PCjcDKa7g0rCMhwU7fohuw
 0WtfloxmVsb9uJ35MOQc+ta8qOW7KcA2tajUkl2ZVacRNN+qLmJoczFadOp5xg9wu+6T
 W8xu24O3nWpXBOzzFcFXb1f3qOlslwcPTIw/ymdn7AUsN2MRNKYtwVrVz2T5iPjLuymG
 UAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7X+lubDSKfk7TLMh1SOru/tY8oaNpbVGrWzp2eEf4w0=;
 b=LaIjsnYMEH86q+wYcDI/qzMogEg7frewU8eyU/sB0NyaqtzFl5JL645s/zmbBld51z
 ip+TM0lbS1ZUJUIeEje6aiybK8rn93z4ti6jMbKQJ1t5zT3CI0KXQ53OJr6l0pG20rGB
 1MLtpzIloNSaZZl+yPoKvpinFyhY9YQNcEPmyXEF6sZnSThhmQRk4hRRQ6ppqTS02zjf
 wBB0RmEWk40QQofXDicgB3/86djqPqFHV8ErX41hhEfG44ISdtTtwcMad67l2usd9gbP
 gdc4zqb0JKIquHr/NowDrPh0kIxBvCO0UukVjZ9JwtpSNvyBsVx4RxCqc3EepuAYDXvV
 e/2Q==
X-Gm-Message-State: AOAM532qRZKgXO9qir07cCMli/Rhb1vV7UbWKu97SFQHxyErFoYaGZyP
 xoSA0jCBRogq1xMIBTlV7yjur7JYwOOgL3wLfQaWig==
X-Google-Smtp-Source: ABdhPJxhbjgdDYDat2dx8ISpN6/uy0/Pn/bfdak1JEkySqw3RJeohHZcq0VtOzmbub4F9HEne5g1H5hZEE9jz9KKSJ8=
X-Received: by 2002:a63:2d7:: with SMTP id 206mr7220626pgc.375.1610626525405; 
 Thu, 14 Jan 2021 04:15:25 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
 <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
 <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
 <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
 <CAFEAcA96=ZjZyhMcpTSDvrHKXZY-uOUoQSi-jTbOLpFZdnkMuQ@mail.gmail.com>
 <CAD8XO3Yxp6rcNgNRJ3+d8zEsYyS0myYs=rSNKtw849fEmdT+RQ@mail.gmail.com>
 <CAD8XO3YCJjTZBZaP1MOwUzcMQ9t+tbjOAwMT4STqYmp=Lmvdmw@mail.gmail.com>
 <CAFEAcA-A8Q1+0Pu4Csok+QFtw3qX2JZjt1buHeuWuFpqJhjTAg@mail.gmail.com>
In-Reply-To: <CAFEAcA-A8Q1+0Pu4Csok+QFtw3qX2JZjt1buHeuWuFpqJhjTAg@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Thu, 14 Jan 2021 15:15:14 +0300
Message-ID: <CAD8XO3ad5ggffLVg4YD_Oy2-PP_0egZw-P0qq1H4fN_xB4jfPw@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 at 14:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 14 Jan 2021 at 11:24, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > On Thu, 14 Jan 2021 at 14:22, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > Does that mean that in that case you need all regions to be 64k
> > > aligned? I mean secure and non-secure.
> > > Has anybody tested 64k pages under qemu?
> > >     [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 }
> > >     [VIRT_UART] =               { 0x09000000, 0x00001000 },
> > >     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
> > >     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
> > >     [VIRT_SECURE_GPIO] =        { 0x09031000, 0x00001000 },
> > >     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> > >    [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
> > >
> > > Maxim.
> >
> > I.e. I see comment:
> >  * Note that devices should generally be placed at multiples of 0x10000,
> >  * to accommodate guests using 64K pages.
> >  */
> >
> > but it's not clear why UART, RTC and GPIO is not aligned to 64k.
>
> Er, 0x09000000, 0x09010000 and 0x09030000 are all 64K aligned addresses.
>
> thanks
> -- PMM

thanks, will send an updated version.

