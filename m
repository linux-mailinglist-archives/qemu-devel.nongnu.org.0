Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0793C6B0F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 09:16:25 +0200 (CEST)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3CeW-0003VU-64
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 03:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m3CXj-0005OI-Nh
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 03:09:23 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m3CXh-0000IQ-SK
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 03:09:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A92E8320096D;
 Tue, 13 Jul 2021 03:09:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 13 Jul 2021 03:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=l8jOBS
 LAg811erg8MPdG21fgbfN6eCv6NUUGzysC0eo=; b=UB60vgyQnY+yaKuKfYHklY
 7we+XZFZK0lmLkDqDaC3rzVsaN2dc1aTNNZQj6BoBZcnSBeFNnl4xT/etsJKWYEy
 zsOh2hN+0ZeIhSsuhCQzh7lnzDrC6UoTH+ZFg4Dredp5qRVQNejE6qXYWvHChTrQ
 8nmpDbbF1bV6pkDqT8Koib1rMZLzKmHJ1mp0kWQHK/o/bDQEqSFaeH9LcCPL9t8+
 pbIpE6yyjpgBOaGv3ieNdzMqyCIz2guk3KUnu5lLSxF/mkd2cjX4iwOicQ6IquL1
 +iM3HLCEnjj+elurASBkER5T1wmWMmh1E7uFMTH1RzSoDlz7L944amvNDc0uCL3g
 ==
X-ME-Sender: <xms:HTztYIY9mwCPJ4dA-lXhe0dXQYhqNWcOuDQYkXOYxIWv4vmC2ojgmQ>
 <xme:HTztYDay3e5edGvHlmq7aZ24JIcbhMYcwcV4fTy6CVzvDzCBKD2OnPd2ojhAgUqxI
 jxmtcS4-1L7R2UtH3A>
X-ME-Received: <xmr:HTztYC-9qffVYU7RbojUSz3TWTt6W60EK0UKXQKJVw_t9cyKB9L7lgv_f9LTY2NoVzxkWyYecZ2L5rUJsVLuElLr_Mi984Uxd6s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeggdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeefffejiefgheevheefvefhteeggfeijeeiveeihfffffdugfefkeelfffhgfeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
 hhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:HTztYCozdWFoaSRo7B1w-nI6XVpSSnvIIM8uR_UVjYTFlNM2nf4sFw>
 <xmx:HTztYDpJ2p16S3GnK1w_Jllzzrpo6W_WP5CLmrJqK047LolMkheTIw>
 <xmx:HTztYATmGaLrXHVva106ep9IaP0kjgA8Mhs8Kts8Xy5kJ1-TyxmjSg>
 <xmx:HjztYK2Dy0S2xQyqMrWP78nlcULbKg2r1mHBCFS-FmOlUP6DYrteDQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 03:09:16 -0400 (EDT)
Date: Tue, 13 Jul 2021 17:08:52 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v3 0/8] dp8393x: fixes and improvements
In-Reply-To: <b6d444e1-eb3e-b21e-d0d6-5e8a5581b623@linux-m68k.org>
Message-ID: <ea9453bc-d31c-4a8e-608a-e6da9bcbe2e9@linux-m68k.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <d4266ef3-693a-c00-117-96987fd16117@linux-m68k.org>
 <8a8ff514-8931-b6ba-f82b-163f79bdb7a6@amsat.org>
 <b6d444e1-eb3e-b21e-d0d6-5e8a5581b623@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1996588142-1626160132=:10"
Received-SPF: none client-ip=64.147.123.25; envelope-from=fthain@linux-m68k.org;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1996588142-1626160132=:10
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 12 Jul 2021, Finn Thain wrote:

> On Sun, 11 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:
>=20
> >=20
> > > If I'm right that the big_endian flag should go away, commit=20
> > > b1600ff195 ("hw/mips/jazz: specify correct endian for dp8393x=20
> > > device") has already taken mainline in the wrong direction and=20
> > > amounts to churn.
> >=20
> > We might figure out with a BE guest image, the remove the endian flag.
>=20
> Yes, it's hard to make progress without a BE guest. However, for testing=
=20
> dp8393x we probably don't need a disk image. I think we only need=20
> working firmware, since the RISC/os firmware appears to implement BOOTP=
=20
> and TFTP and appears to contain a SONIC driver.

I think we probably can install RISC/os once the firmware can be made to=20
work.

The file "RISCos_5.01.iso", found in the Bitsavers archive, contains=20
several kernel binaries, one of which is "unix.r4030eb_std".

From=20the "r4030" in its name, and from the symbol names and string=20
constants it contains, this binary appears to have all the drivers for the=
=20
MIPS Magnum 4000.
---1463811774-1996588142-1626160132=:10--

