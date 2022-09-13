Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8775B7A89
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:06:47 +0200 (CEST)
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBF8-0001Oz-9y
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oYAeF-0005U1-PA; Tue, 13 Sep 2022 14:28:39 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:37517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oYAeE-0000BG-3d; Tue, 13 Sep 2022 14:28:39 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D61BA3200902;
 Tue, 13 Sep 2022 14:28:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 13 Sep 2022 14:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1663093714; x=1663180114; bh=Ij1NKmqwhx
 rnnwOJ4huIH9TJpdlC3yPMMvBL5UmA2vY=; b=g1Pp/NmOEaZZBFPBs7FE9CtGsT
 nPfhxj8Ris1ygu0JWtq67rSZ935T49pUmWSQP/kPeZfJsCwfPIXNasIBKGkS2MuQ
 dMlJOu5jvm3SIQQBYONCcL/XZIKtWYVMKSpyTdlWr4LaGRxQFiAOqXZ2LV2c5f0N
 btau4efULWGD0WQRah6Tcff8eGYFCZObks3mHkgn/S3X3zi7AJwL7N5+Z4lIVEFy
 +YS3AMyHxfFddd19EW+1paeA3xexYa1YMZFtDWMKAyt6P7rq/3EM9MT0rpwlrL4+
 cMU0FQ+gWiV0sLMWSwkEHdSQjhXEhZowv2bswLwCEh3C6NnHclLdkMszXhnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663093714; x=1663180114; bh=Ij1NKmqwhxrnnwOJ4huIH9TJpdlC
 3yPMMvBL5UmA2vY=; b=R/aV6p2CbFumJID1ue7knH6JPuF1HzVHbksUQeiVB8Zp
 A1XBVWwPnkbRT3r0TV4VrR1ocpbAxTx57bjYj1D8YepGbzJkTeJ3t20mhzZbSjDU
 DDyHWdGWFzpxLYFcZcNum9qv4swgzDOCRhM+mWFqW3sR4bORcvlF7OzJS2an0XRi
 6x6wmaS0v0K0QuJbKlcrH0V/2tGbH8d3Ky3z+z1Rh2fj06FGTvivNyhJ5DJ9Zba1
 1C4OelvuR0JhTKlf6AIWYdg7XMg181DE3GobViMhdxmTFUAV1ElImbZqIJirHpdk
 JpT3rHUujtxl3UlfpLm/Yqo6m/IiI8IVwmkI6QzF5Q==
X-ME-Sender: <xms:0csgY9a7wSMjQMVT7Sg1nXKHSrDesoxBwUC4QtbDrvnRJulXh6eZvg>
 <xme:0csgY0ZafU34mmzdh0rllI9ebgXags1N-SniUnrkqFmo54KNWJKCMGtjT9Hv3KXnr
 XTJJgItDakUGs_h_Zw>
X-ME-Received: <xmr:0csgY_-rYoEEHoMzLqjxkcda5gCJp0ewtjdVEjpTsYCt_G3lGYr-LHJTIkLCFi64xIfmN2r8hz2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeduteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeek
 feeukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:0csgY7rBgbNUfOA452Om5ExWB911LY6ehn2bPxOjljfh2Fh-89WSyQ>
 <xmx:0csgY4pcCCJXsvoAn3Twn-5BTeegmLmgAgHOQ3DdNDuwPYBQD2sWGQ>
 <xmx:0csgYxT_0XxKYlDYW9ccTMPURcNiMA6cXGvCzBxK4JKbmtq2Ou_SGw>
 <xmx:0ssgYwICqsGj76oKUbMP3je7gNGOdpoYNtlMLCV9E7R0Om-dnGhqcQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Sep 2022 14:28:32 -0400 (EDT)
Date: Tue, 13 Sep 2022 11:28:31 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Titus Rwantare <titusr@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz,
 iwona.winiarska@intel.com, tmaimon77@gmail.com,
 quic_jaehyoo@quicinc.com, Hao Wu <wuhaotsh@google.com>,
 Patrick Venture <venture@google.com>
Subject: Re: [RFC PATCH 1/3] hw/peci: add initial support for PECI
Message-ID: <YyDLz9neyhuA9XoP@pdel-fedora-MJ0HJWH9>
References: <20220906220552.1243998-1-titusr@google.com>
 <20220906220552.1243998-2-titusr@google.com>
 <Yxua+pZUn5lSSekN@pdel-fedora-MJ0HJWH9>
 <CAMvPwGprWzOn+YgpOrTTJT67C4JLBewbknbmPn-E5pzFUmTKNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMvPwGprWzOn+YgpOrTTJT67C4JLBewbknbmPn-E5pzFUmTKNw@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On Tue, Sep 13, 2022 at 11:21:16AM -0700, Titus Rwantare wrote:
> On Fri, 9 Sept 2022 at 12:58, Peter Delevoryas <peter@pjd.dev> wrote:
> 
> > > +/*
> > > + * PECI Client device
> > > + * Copyright 2021 Google LLC
> > > + *
> > > + * SPDX-License-Identifier: GPL-2.0-or-later
> >
> > Not sure, but I think the SPDX license identifier is supposed to be in
> > the first line? Maybe not though. I would have expected:
> >
> 
> That's a Linux thing as far as I can tell. QEMU has it in the top comment.

Oh ok, nevermind then.

> 
> >
> > I'm curious if we really need the CPU family here, or if we could just
> > base everything off the PECI version.
> >
> > The PECI specification doesn't mention the CPU family, does it? Or maybe
> > it does.
> >
> 
> I needed the family info anyway for RdPkgConfig() CPU ID, and thought it
> would be more readable to specify that in the board file than the PECI version.
> We tend to add new machines to QEMU by copying the config of an existing
> machine, I think this way makes it more obvious that this is a field
> that is changing.

Yeah, I think you're right. And looking at the PECI spec, they refer to
families directly when describing new features, so this seems
appropriate.

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> 
> 
> Titus

