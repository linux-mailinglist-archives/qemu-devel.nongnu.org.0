Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A7755FEB1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 13:33:22 +0200 (CEST)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Vwf-0006Ut-9l
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 07:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Qae1=XE=zx2c4.com=Jason@kernel.org>)
 id 1o6VqZ-0002kt-2Z
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:27:03 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:33488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Qae1=XE=zx2c4.com=Jason@kernel.org>)
 id 1o6VqU-0002o2-I0
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:27:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89422B821B8;
 Wed, 29 Jun 2022 11:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C767EC341CB;
 Wed, 29 Jun 2022 11:26:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="TXU4jf9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656502011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QXUMjoR7ShY2hcbeYdIKNbVTwlzgCfoTPIEze33Mr4=;
 b=TXU4jf9wd4cwV7TX3ti5FScIvKtpb5SWW5bEnFZYMZlK1mwaVUcVQWy/4QNKGRJdgOGCGu
 /Zxc2C5KUk5xy+/4frRni2+VqrkljdgyVVi0IoUJ6Ts3uU1tf0cnlHnE5fOhKtjL2DjmFN
 0f/7v+9JXc7iXcHcS37te0yYoK9kOXs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4406c37b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 29 Jun 2022 11:26:51 +0000 (UTC)
Date: Wed, 29 Jun 2022 13:26:49 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
Message-ID: <Yrw2+X6Pi8qlTo2d@zx2c4.com>
References: <20220627160734.749861-1-Jason@zx2c4.com>
 <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
 <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
 <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
 <CAFEAcA9jzUk72NZ=BAubjiFwqVaUWqCgjJ-BLLx=J8Aq+ieWSg@mail.gmail.com>
 <878rpfixfh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878rpfixfh.fsf@linaro.org>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=Qae1=XE=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jun 29, 2022 at 11:18:23AM +0100, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Tue, 28 Jun 2022 at 19:45, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >>
> >> On 6/27/22, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >> > On 6/27/22, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> >> On Mon, 27 Jun 2022 at 17:07, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >> >>>
> >> >>> In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
> >> >>> kaslr-seed property was added, but the equally as important rng-seed
> >> >>> property was forgotten about, which has identical semantics for a
> >> >>> similar purpose. This commit implements it in exactly the same way as
> >> >>> kaslr-seed.
> >> >>
> >> >> Not an objection, since if this is what the dtb spec says we need
> >> >> to provide then I guess we need to provide it, but:
> >> >> Why do we need to give the kernel two separate random seeds?
> >> >> Isn't one sufficient for the kernel to seed its RNG and generate
> >> >> whatever randomness it needs for whatever purposes it wants it?
> >> >>
> >> >
> >> > Seems a bit silly to me too. `rng-seed` alone ought to be sufficient.
> >> > After the kernel calls add_bootloader_randomness() on it,
> >> > get_random_long() can be used for kaslr'ing and everything else too.
> >> > So I'm not sure what's up, but here we are. Maybe down the line I'll
> >> > look into the details and formulate a plan to remove `kaslr-seed` if
> >> > my supposition is correct.
> 
> Sorry now I've had my coffee and read properly I see you are already
> aware of kaslr-seed. However my point about suppression would still
> stand because for the secure boot flow you need checksum-able DTBs.

Please read the patch. Maybe take a sip of coffee first. There's a knob
for this too.

The code is exactly the same for kaslr-seed and rng-seed. Everytime
there's some kaslr-seed thing, there is now the same rng-seed thing.

Jason

