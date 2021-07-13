Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A447E3C6EB5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:39:02 +0200 (CEST)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Fob-000135-Ds
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3Fk2-0008HA-H5; Tue, 13 Jul 2021 06:34:18 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:34779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3Fk0-0004Dn-EE; Tue, 13 Jul 2021 06:34:18 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D2A663200933;
 Tue, 13 Jul 2021 06:34:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 13 Jul 2021 06:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=s90usuO+THzHso5UX988akMJ+6g
 G66L/yTH/3iCjOus=; b=bR6F0lGjeqhjcwpJ5kkkA3iN02Yc0UKL+Ps0qGdgCsQ
 lSBYr9bVo72j8MBkXss5LRc+JTgo7MyU+FKC86W8sSlN28w7G0clyi76M7R9CAkS
 EkttjuS+fli+MzxnGXYBSxwFkKo9vGAFw1frJoAqFlEtSrPCCSZnuXN3Qa++Talc
 2HeRRrMuwynna3UDUqvn1mI1bqU3G0it8q7jVJnpCkZNbpsSH6mkK2iFmi+zgt1f
 Tm1npOfPZa2FCPvlfl0q877+W4Hb4uxD4J30KdVWBiq4ABerIQsF2ZQrloAHgwoM
 cZMkyAmOLe02O9HNiEuh0Pxc5g9YV4fhujwVtp+CsbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=s90usu
 O+THzHso5UX988akMJ+6gG66L/yTH/3iCjOus=; b=tZi4g/Crkc6oD1LyKNLztW
 kLbuB7U+rgW4yvuUffsGyDeeoxrIN+bZQ45qA/ReSv2OU3w+oSiF5oSN5suBkY6/
 KHErKn3Yc+cSdVz47E7VXEVApQhiI/h3A5CBp0qSNF4C8GZxzlUPklraawRPEAfV
 2mMXQmvfzgnJuCG9D8avO9dtNsJc6orVTjS0+C9KoLjQL2s5OuOI5ExdXm7bMNS7
 iFqrUOjScsCql8Lja7Ftl6jD4ZLGSvSNaR2O7Jtr+fTWmc/3cI4/j3hK+AIMIQi4
 +xchuVzS2jUItCes8P5v7K/suNe1Tbog84K7/7j8WWNCyYpI/83rMjOBAEMKvu1w
 ==
X-ME-Sender: <xms:I2ztYG1ZRfMlUr9ocd_IUHTaRpRED-bGzNYUJQxi8PPt0jO5PkA62Q>
 <xme:I2ztYJEdUSEQUs_UlX4QjYRr1NiR6uYgBbKKkMQTdqVc5QrLYqgHpQksqWqGKuYSO
 PId5LB_45grcwx4QZo>
X-ME-Received: <xmr:I2ztYO40Jgftl1a5CYZRoYnrmFM8zspBeHLe32KYBuR7zUjZRVFXOcFmobvVqUBuf8Q72zngDOwSzOi_Ch2Wjus4pGGjoFYmq3BDvEdHfQ_xQ6vQWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:I2ztYH3JHdOE1luaGB03VWEx13S0W35SFMYUXHCFLFYH7fXy6-mDHA>
 <xmx:I2ztYJHcNAj_pHbkwZ_uwh3JF6Lh_-M3GtjXp5s5QO4N17mZFSxsHw>
 <xmx:I2ztYA_MPpEn988N5J2V8_3OlZ-IToH3WekgZir8mCPwrxFOhzXlEQ>
 <xmx:JWztYCOSWAGSTlddldtnqJJ2TWR-bc2xiz1KQT_JNlnhv4DDxRdiLA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 06:34:10 -0400 (EDT)
Date: Tue, 13 Jul 2021 12:34:08 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/nvme: fix mmio read
Message-ID: <YO1sIGG9CS5lnUj7@apples.localdomain>
References: <20210713054359.831878-1-its@irrelevant.dk>
 <CAFEAcA8Qo7xfjAHNbZmDiVUkhnL2WRrEWp7U-urxOTBnao8Oyg@mail.gmail.com>
 <YO1ori+GqpbhxARg@apples.localdomain>
 <CAFEAcA-9V9RtOq+QCn-d+HMrxsKxRgpjkOPV0Ta4W5sh6WWo7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gDYpwGcWLNUrbG5a"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-9V9RtOq+QCn-d+HMrxsKxRgpjkOPV0Ta4W5sh6WWo7w@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gDYpwGcWLNUrbG5a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 13 11:31, Peter Maydell wrote:
> On Tue, 13 Jul 2021 at 11:19, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > On Jul 13 11:07, Peter Maydell wrote:
> > > Looking at the surrounding code, I notice that we guard this "read si=
ze bytes
> > > from &n->bar + addr" with
> > >     if (addr < sizeof(n->bar)) {
> > >
> > > but that doesn't account for 'size', so if the guest asks to read
> > > 4 bytes starting at offset sizeof(n->bar)-1 then we'll still read
> > > 3 bytes beyond the end of the buffer...
> >
> > The buffer is at least sizeof(n->bar) + 8 bytes (there are two doorbell
> > registers following the controller registers). It is wrong for the host
> > to read those, but as per the spec it is undefined behavior.
>=20
> I don't know about the doorbell registers, but with this code
> (or the old memcpy()) you'll access whatever the next thing after
> "NvmeBar bar" in the NvmeCtrl struct is, which looks like it's the
> first part of 'struct NvmeParams".
>=20

Sorry, you are of course right. I remembered how the bar was allocated
incorrectly.

--gDYpwGcWLNUrbG5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDtbB4ACgkQTeGvMW1P
DemB6wgAsDt8mQTkA8121RbkEubPaMz+cepngL9Git6axQ3hxfI+gmTy1lhvEk0i
/xxNH/85oPDVsFOUrIcXnRYNLaE9pqrvl8pKrK4iiDCInAr8FZtMnptkW3WCkcb9
xQxJmQt6Q/X018v5RHGZXWED0afYQQs5oeLkEmss6kyC8rGpK/P6cHiFOg7FtawD
chviE3r8DCG5QWPSv2RHedgIwGTrfqNlYnOHAtCYTqA1wPMQQrH3P2UrRRpdu7x4
LyB/niQp1HAB8xYnaIjFkifuDfOvQjI8vyz2xVX+yNo0K9OGMWPdxbxpqZWXlMEL
vUpQMG8qj/FB32UWM5V4qgrL+nvlDQ==
=hpA4
-----END PGP SIGNATURE-----

--gDYpwGcWLNUrbG5a--

