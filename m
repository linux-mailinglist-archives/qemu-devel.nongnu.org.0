Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21083583BC5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 12:08:12 +0200 (CEST)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0R8-000165-Ip
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 06:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH0Br-0004oE-TT
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:52:23 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH0Bp-0004Me-Kb
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:52:23 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id 123so2434151ybv.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CclOETi+Vhv48j6oliPuKoZdSQm5aSmbz7ClPj8Nf6Q=;
 b=cP/oE+UtU6ThfpsGMTT3iXPJRWKJQkYfhT3pH8B9SGqwHe9fZu642gXsRYvPAOurXH
 DdzHu2msUaZTZxtLs7BinD1npVTExIyQRavT4M1N6DMdR1UmFv5DgazRPyU2G0EHVSRy
 pwTMuQxAHCXAmxFgP+hIEnV2HWA1mRspuFQoYs61ZwLlbkEGpgh+2JibbNsagtRiQKWi
 dZaeNwRnbR55Iqk3sFzXFrUhMz2gawm12w+qmNXnnXBxbGxbMMYpxrVqfHX7bCo1LNo1
 VPYN5yUfeZZT3IlJpxrLMEg0bk8WPpzsKE/+4Rafl+yIxHLXSnEOlYnZv59Vss15LHSH
 UWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CclOETi+Vhv48j6oliPuKoZdSQm5aSmbz7ClPj8Nf6Q=;
 b=wGUOk9YzE7ZdMyHRwbTc7w+jAxvbRcBSWa931woWj19mePtWQkw48gVPBTgB/t0vyP
 nDFjKfeCYoTU8a3nqRRor+IBYP8wv8LylxKs+3y+8zgjW8KQVQ95zcp/YbwsDl84977G
 HuB04pJnUX3tsMJxHpTMiXymKy0U5okhtV4hj9kPe2nZk7WVGK2Z5QICyTL7nj/stxjc
 WY1vRXthltt9PZ06QbvWSH3/LtpP5flCyjq8k3Jc7trMcRv7Fv46aO9Tsrz4ZBbibdvD
 VQMgDUI4KjjbeDwzwywUMkHR2EUGAl/OgCDiiHhusKCbLO37luBBRGo1ou7RbPTOnZoQ
 +92w==
X-Gm-Message-State: AJIora8nY97okGiRzcNCqvHu4mvuhzFm4tdTwcR39hzICTiQbQImsmYD
 AVwAxeeKZBO3ZE1IbU1BKwAiNiyEB63yDySL8NcRGw==
X-Google-Smtp-Source: AGRyM1tXSCPAokZuHC4uAYhHtx4dip4JA7ZEV5g+NULYfPj5lhm0vy8I2KpX9Q6M7wvSB1cwsUVV9FyffRr6VM4m9TA=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr20070880ybq.140.1659001940607; Thu, 28
 Jul 2022 02:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220630085219.1305519-1-armbru@redhat.com>
 <20220701043032.GA28338@raphael-debian-dev>
 <87wncx2xw4.fsf@pond.sub.org>
 <CAFEAcA993Z7ty7FvxEX7JjLZCFWrcPRuy2eMJKwoVTZJ1Z7_vQ@mail.gmail.com>
 <20220727172759.GA30765@raphael-debian-dev>
In-Reply-To: <20220727172759.GA30765@raphael-debian-dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 10:51:40 +0100
Message-ID: <CAFEAcA_g-7uM3WN6ijL4RFcb5qRatX11vyeVvSwNHRNXbuAjgg@mail.gmail.com>
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Wed, 27 Jul 2022 at 18:28, Raphael Norwitz
<raphael.norwitz@nutanix.com> wrote:
>
> On Tue, Jul 26, 2022 at 03:57:42PM +0100, Peter Maydell wrote:
> > On Fri, 1 Jul 2022 at 06:41, Markus Armbruster <armbru@redhat.com> wrote:
> > > Could we use a contrib/README with an explanation what "contrib" means,
> > > and how to build and use the stuff there?
> >
> > I would rather we got rid of contrib/ entirely. Our git repo
> > should contain things we care about enough to really support
> > and believe in, in which case they should be in top level
> > directories matching what they are (eg tools/). If we don't
> > believe in these things enough to really support them, then
> > we should drop them, and let those who do care maintain them
> > as out-of-tree tools if they like.
> >
>
> I can't speak for a lot of stuff in contrib/ but I find the vhost-user
> backends like vhost-user-blk and vhost-user-scsi helpful for testing and
> development. I would like to keep maintaining those two at least.

Right, I don't mean we should just delete contrib/, but for the
things currently in it that we do care about, we should define
what their relationship to QEMU is and put them in a part of
the source tree that says what they actually are. contrib/
just means "nobody thought about it".

-- PMM

