Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB3560506
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 17:58:06 +0200 (CEST)
Received: from localhost ([::1]:53202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6a4r-0000HH-Ow
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 11:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Qae1=XE=zx2c4.com=Jason@kernel.org>)
 id 1o6a36-0007WO-GZ
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 11:56:16 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Qae1=XE=zx2c4.com=Jason@kernel.org>)
 id 1o6a30-0004XK-9M
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 11:56:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FA3D6179B;
 Wed, 29 Jun 2022 15:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24C9C34114;
 Wed, 29 Jun 2022 15:56:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="OMakRdQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656518165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lc2W+RZz/mb8IHevcCZHL4WsMnY1g12M7Aj1gxMbN9Q=;
 b=OMakRdQ0D5tTjYNwv/2zu7DyT4meivuq53O5o6bbSu1j/OQGcomyE/03EUiX9yMSgyVtij
 rgf5doB8ltBBwD50434rXBhcQiH4T/I6Q497bLaF1+liF7c4zl93Zd4UpULOB5eLzxRx69
 j5h3Ofgeh5DH46lDyBWX597qyCMCbks=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e1e50e30
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 29 Jun 2022 15:56:05 +0000 (UTC)
Date: Wed, 29 Jun 2022 17:55:59 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
Message-ID: <Yrx2D/uPxM8YPCYK@zx2c4.com>
References: <20220627160734.749861-1-Jason@zx2c4.com>
 <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
 <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
 <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
 <CAFEAcA9jzUk72NZ=BAubjiFwqVaUWqCgjJ-BLLx=J8Aq+ieWSg@mail.gmail.com>
 <878rpfixfh.fsf@linaro.org> <Yrw2+X6Pi8qlTo2d@zx2c4.com>
 <87r137h49s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r137h49s.fsf@linaro.org>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=Qae1=XE=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

Hi Alex,

On Wed, Jun 29, 2022 at 04:24:20PM +0100, Alex Bennée wrote:
> > The code is exactly the same for kaslr-seed and rng-seed. Everytime
> > there's some kaslr-seed thing, there is now the same rng-seed thing.
> 
> The duplication is annoying but specs are specs - where is this written
> by the way?

The same place as all the ordinary specs:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/chosen.yaml

> Given the use case for the dtb-kaslr-seed knob I wonder if we should
> have a common property and deprecate the kaslr one? As of this patch
> existing workflows will break until command lines are updated to suppress
> the second source of randomness.
> 
> Maybe it would be better to have a single a new property
> (dtb-rng-seeds?) which suppresses both dtb entries and make
> dtb-kaslr-seed an alias and mark it as deprecated.

No, I don't think so. If anything, I'll try to get rid of kaslr-seed
upstream at some point if that makes sense. But until that happens --
that is, until I have the conversations with people who added these and
care about their semantics -- assume that there's granularity for some
good reason. No need to put the cart before the horse.

This is a simple patch doing a simple thing in exactly the way that
things are already being done. I really don't want to do much more than
that here. If you want to bikeshed it further, send a follow up patch.

Jason

