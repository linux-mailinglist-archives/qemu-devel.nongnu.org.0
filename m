Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E956179C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 12:24:04 +0200 (CEST)
Received: from localhost ([::1]:41674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6rL9-00076v-IR
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 06:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=bCe9=XF=zx2c4.com=Jason@kernel.org>)
 id 1o6rJf-00067B-PJ
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 06:22:31 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:37916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=bCe9=XF=zx2c4.com=Jason@kernel.org>)
 id 1o6rJZ-0007Lz-2N
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 06:22:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E508C621FB;
 Thu, 30 Jun 2022 10:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4299FC341C8;
 Thu, 30 Jun 2022 10:22:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="N8BZA17P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656584534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82Uem0eIswv9iVUsO+NezGRoKDeo+YXYZCRuwUKqKHY=;
 b=N8BZA17PL7Aq48mveSGq5bfOpnvxCHT2L4SOEh4L0y/LUYMYZgvzPLpVqEFl4YC0t+stL1
 2uwz3N+tU986UkNOQhRgG/VIFTqY/+VJaNqYDs5GnSmHixwm/Pw1gLBWdXBCiL3i8BUuf9
 8HEwyQ/JmG9Tv2wkYLh/J/JzFUgGzQ0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c6251320
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 30 Jun 2022 10:22:14 +0000 (UTC)
Date: Thu, 30 Jun 2022 12:22:12 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
Message-ID: <Yr15VHaAVQ11wlw+@zx2c4.com>
References: <20220627160734.749861-1-Jason@zx2c4.com>
 <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
 <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
 <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
 <CAFEAcA9jzUk72NZ=BAubjiFwqVaUWqCgjJ-BLLx=J8Aq+ieWSg@mail.gmail.com>
 <878rpfixfh.fsf@linaro.org> <Yrw2+X6Pi8qlTo2d@zx2c4.com>
 <87r137h49s.fsf@linaro.org> <Yrx2D/uPxM8YPCYK@zx2c4.com>
 <CAFEAcA8iq+ANzSgwXvLsF3ZQGLcTFGvyXtwh+Kw5XGmCo+-Z-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8iq+ANzSgwXvLsF3ZQGLcTFGvyXtwh+Kw5XGmCo+-Z-g@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=bCe9=XF=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Jun 30, 2022 at 10:15:29AM +0100, Peter Maydell wrote:
> On Wed, 29 Jun 2022 at 16:56, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > On Wed, Jun 29, 2022 at 04:24:20PM +0100, Alex Bennée wrote:
> > > Given the use case for the dtb-kaslr-seed knob I wonder if we should
> > > have a common property and deprecate the kaslr one? As of this patch
> > > existing workflows will break until command lines are updated to suppress
> > > the second source of randomness.
> > >
> > > Maybe it would be better to have a single a new property
> > > (dtb-rng-seeds?) which suppresses both dtb entries and make
> > > dtb-kaslr-seed an alias and mark it as deprecated.
> >
> > No, I don't think so. If anything, I'll try to get rid of kaslr-seed
> > upstream at some point if that makes sense. But until that happens --
> > that is, until I have the conversations with people who added these and
> > care about their semantics -- assume that there's granularity for some
> > good reason. No need to put the cart before the horse.
> >
> > This is a simple patch doing a simple thing in exactly the way that
> > things are already being done. I really don't want to do much more than
> > that here. If you want to bikeshed it further, send a follow up patch.
> 
> It's adding a command line option, though. Those we have to get
> right the first time, because for QEMU they're kind of like ABI
> to our users. We *can* clean them up if we find we've made a mistake,
> but we have to go through a multi-release deprecation process to do it,
> so it's much less effort overall to make sure we have the command line
> syntax right to start with.
> 
> If there's a good use case for the two seeds to be separately
> controllable, that's fine. But I'd rather we find that out for
> certain before we put a second control knob and make all our
> users with workflows where they want non-random dtb blobs find
> out about it and flip it.

Okay. Do you want me to just make this controllable by dtb-kaslr-seed
for now, then, and we can rename that in a follow-up commit? I'll send a
patch for that.

Jason

