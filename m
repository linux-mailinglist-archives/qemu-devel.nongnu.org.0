Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC850909B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:42:26 +0200 (CEST)
Received: from localhost ([::1]:51632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGDZ-0006hf-1o
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nhFoM-00007i-9j; Wed, 20 Apr 2022 15:16:22 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nhFoK-000335-9e; Wed, 20 Apr 2022 15:16:21 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B0CE5C008B;
 Wed, 20 Apr 2022 15:16:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 20 Apr 2022 15:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650482179; x=1650568579; bh=yl
 hSg/4ifObIYojMv9Q1Zq7r7gZomsI0bKQjbHY+D/k=; b=aLxKGxr04Q7Xow7eYH
 SorYuFU9yhp99EWVr60crq4aLCKTkqEXlJK3FqOjLePNfbMy/E7XRvcl3eXdPaSq
 RSYUrmuxeW/1Z/CcUwNjPFahc1bxv6BGpByyPEhZ9ZX7foRNtfNwfePhoIhYDSFd
 7UEV+Mzg4SoZeYapx+GFdx/fqcMn9hO36v5c9BP9q5tCWkEue7wq5q+cLlw67FB1
 CiwNBEnIlKbN1xHmBVnHNAe+EdIV+mIGzCluAedFmfC8N8sKetfTjXVr4NFwB44A
 rpNqp4Y9y4AN2sPcjcKe07pUe+7OUTuQDJ2hQAni3L/kr8AVC5J/JQmpyafIsXjC
 naFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650482179; x=
 1650568579; bh=ylhSg/4ifObIYojMv9Q1Zq7r7gZomsI0bKQjbHY+D/k=; b=F
 ZTUWODle+iIfjYr1H9UCdjR4d5pc/j0u/TYYYuZHC4knHIcVTaBuNWun9Cknh2mm
 NC7auG4FJMGarSQEN5id/ZQF/pYBBRhZ6BfJjxZyxYr0jT2kW43v+ZS5OcE5Raqn
 UIBKM1GB3TiQv0CVc7OA0iKiZlYVNY6Nhdxt+AHtz71iWY2hstYP1MArJ5uNyFHL
 SUHHBEP3Xi2CVXlNR04v7/VV8EHKetBse9D+jpzcldPAOS2TufeBBzQBM23bjOV0
 5wUc4v0KyxrWaOMb5BsP2GTD5OwYcVhv2IgBg8+S0YmaTpBHyDBzO7op3REc1oJn
 66EPTwgFn8iB/W/Q+AwKA==
X-ME-Sender: <xms:AlxgYnb5JTI5EX0PlJC-LuH5A5O_tzjJeGH_69bkBZW2yoGUkYEIpw>
 <xme:AlxgYmZXCQ3ooKpnbbCiSmKa3kv1EV71sYGaSA0-rywQ7vHL48BexkZexQwHGO1R9
 dmQvGCe5119vYNEq5s>
X-ME-Received: <xmr:AlxgYp8y6O58eEiXo-OzxPx0paHBF8fZYFwTqfFJu6fKDh03-Nk91oLXnqwB825g5An5Kzr11LjNFunj3WQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:AlxgYtrTzydN8-uRIcq0ebv5yTpscstAUUAC-tX3njuuQQ3XL1wdoA>
 <xmx:AlxgYirUDkGTBCje1NpCtTyAVNJ5PTe8JFx8yMHcV8mp12EkAehnEg>
 <xmx:AlxgYjSujIlQTxjqv3qqGqimkTXKVedEpi0CyC5-ufNeouf_X1RJBw>
 <xmx:A1xgYvAdMHzOH-GKGvh4SIu7LB7yeMsCNV8sAe45AvITf9omvBso9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 15:16:17 -0400 (EDT)
Date: Wed, 20 Apr 2022 21:16:15 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH 2/2] hw/nvme: fix copy cmd for pi enabled namespaces
Message-ID: <YmBb//zeHrAT3Oj9@apples>
References: <20220420090336.10124-1-d.tihov@yadro.com>
 <20220420090336.10124-3-d.tihov@yadro.com>
 <Yl/ari5v/o8vuveT@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9bQJIG2xf43Hj+Qq"
Content-Disposition: inline
In-Reply-To: <Yl/ari5v/o8vuveT@apples>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: kbusch@kernel.org, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9bQJIG2xf43Hj+Qq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 12:04, Klaus Jensen wrote:
> On Apr 20 12:03, Dmitry Tikhov wrote:
> > Current implementation have two problems:
> > First in the read part of copy command. Because there is no metadata
> > mangling before nvme_dif_check invocation, reftag error is thrown for
> > blocks of namespace that have not been previously written to.
>=20
> Yes, this is definitely a bug and the fix is good, thanks!
>=20
> > Second in the write part. Reftag in the protection information section
> > of the source metadata should not be copied as is to the destination.
>=20
> Hmm, says who?
>=20
> > Source range start lba and destination range start lba could differ so
> > recalculation of reftag is always needed.
> >=20
>=20
> If PRACT is 0, we really should not touch the protection information. My
> interpretation of the Copy command is that it is simply just screwed if
> used with PRACT 0 and Type 1. PRACT bit is specifically to allow the
> controller to generate appropriate PI in this case.
>=20
> On the other hand, I can totally see your interpretation as valid as
> well. Let me ask some spec people about this, and I will get back to
> you.

Discussed this with the TP authors and, no, reftag should not be
re-computed for PRACT 0, regardless of the PI type.

--9bQJIG2xf43Hj+Qq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJgW/4ACgkQTeGvMW1P
DelLHgf+NASlDYIcJfYICgJLGjh6rkIY5J2gk6/NnBKkKaEEQJeiYPQgt0v8a6Op
NcwyfQcjiGaOjDCi6JZAGDJdqfgBoNrAsEP9CJD/K+cTzmdWZZCU7R+z8wI5wz/d
VmyddiWw+KjZPTJPshpZVxXucBCLnNLihix4/RcI6VNKnrd+oSsiJUsAc9TvjQcV
CV4E78Tic10Y8yOEs4NIn+n4vb94pmEW6hINg0aJNHTHC0rLGtwfVtguXn9x4u9/
7W6XDf032zWSNtAqzSMWEyze7q7MOR9lFlTtl1M/4JkgwflCQVhXS79xhm50fAWR
O0T+jVL/XDTXlgx2nouJpIN91aQJ9Q==
=Ala0
-----END PGP SIGNATURE-----

--9bQJIG2xf43Hj+Qq--

