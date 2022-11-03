Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADE3617C3A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 13:12:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZ4F-0007jm-Lv; Thu, 03 Nov 2022 08:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oqZ4C-0007i1-Nu; Thu, 03 Nov 2022 08:11:28 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oqZ4B-0003zn-AO; Thu, 03 Nov 2022 08:11:28 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 856CA5C0101;
 Thu,  3 Nov 2022 08:11:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 03 Nov 2022 08:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1667477486; x=1667563886; bh=dx
 0fSg5Vcfzf5khcOv14CMx7VUrjeYWHlB5RlLkaw+I=; b=mXeGhsSZLysMeXG4DP
 cZtRBrp+Yiv2nLjJl2GSdMIvs6yRRwR+/G648IMSCMdv/6GSdLjarAHNaKC4YEJ1
 qRORMi/1lsdkLRjPWP/6mSxbKSkLzCCcPYi0H595dxrsXjJFX3u+EL/563TKaz6D
 YDC5nXVz8kBMeeR3PL4BTildDNzlYLKgSLJyZhoxKwKUm6tnkFP+aS8u5LRBmyZ7
 AtPt2hHKG+R0H2DeeuIIErIQi71KCF0iWOaZlS1KZMdR0L4iE5dFliRELhR8f4fc
 O5f1GdDNC7XUdhuzeZ6gdUmCZex9R2xRTTQwBD2PcPzIiDNdOT7N56MRl0rmShmJ
 qgdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667477486; x=1667563886; bh=dx0fSg5Vcfzf5khcOv14CMx7VUrj
 eYWHlB5RlLkaw+I=; b=JF5BBCGIZUDAb88HY22GtHJiEJVAvJuIbkj4PRki0f2g
 KkVX7Rx8BFBtLPlfDFz9Xr99aFaCwwR5U9ElVmWNfq2BwVeiT6F6dDAM9fqkhJJs
 aUCwnRlV6ExrovcbLsOJ0F5O7MZqlb5aeISRJ077gDjz5cxTHCGqmB2lbW6X1P6/
 cJy7H8BAzR6cIk7be8GkssCLZxrfGTCWH1h92ZCwiVtCIXcj4ur5TTZBpyYZOh9c
 0oSd+SpIiLTu3ygVnu6vZuj4jn4gSmQxsHyL1lFKZFKhHAFOIZGr/SRmXjs+FCRv
 vmuxGCNal1qVA/t6VhrOP+t+tiC4DSmjbzw/iq84PA==
X-ME-Sender: <xms:7q9jY8edBhHED1iN0okMHfI3qV0zOTA-hwMFHqSPf_S-zk1yj52JUw>
 <xme:7q9jY-MT_H5fhSJf7T9rnyrd4A9KM0Soqev1oFjheyhEPoN0IU8Qn6nFcOyqurngc
 DGcwO9Fv_GWMPhx5XU>
X-ME-Received: <xmr:7q9jY9jB1rEr7aXKJaPi2PTMwcbERA65772Nl-YJ01d7NC0i-Q3KD4aE4YP0FX1fzdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudelgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggfeule
 ehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:7q9jYx8FnPJ7CIkVfDGj6gVWrRpA95veo0ivYFcAoMzwDiTKg7izpw>
 <xmx:7q9jY4vM30_dhj-G7ldW94od-_dIwSE-Qi7qCeiO4AOiOdMifWx4kQ>
 <xmx:7q9jY4GVGa8uYVZ_Eacoq9B4EFgy3AcKcpcrE4sJ0lf7tMFuNCBbGQ>
 <xmx:7q9jY6IJ3QYYwG_9SOyUC0CDZXiSCF_--rJPg5Ih9ujgE65THUdR6g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Nov 2022 08:11:25 -0400 (EDT)
Date: Thu, 3 Nov 2022 13:11:23 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v3 3/4] hw/nvme: add iothread support
Message-ID: <Y2Ov614txesZMtC+@cormorant.local>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
 <20220827091258.3589230-4-fanjinhao21s@ict.ac.cn>
 <Y1Etac3z2PWv/Zq6@cormorant.local>
 <90EFC69D-C01C-4066-B981-8B6C3C90D4C6@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BE8YzlQKlMIPeUoh"
Content-Disposition: inline
In-Reply-To: <90EFC69D-C01C-4066-B981-8B6C3C90D4C6@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--BE8YzlQKlMIPeUoh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  3 09:51, Jinhao Fan wrote:
> at 7:13 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> > Otherwise, it all looks fine. I'm still seeing the weird slowdown when
> > an iothread is enabled. I have yet to figure out why that is... But it
> > scales! :)
>=20
> How much slowdown do you observe on your machine?=20
>=20

I'll rerun some experiments and get back to you :)

--BE8YzlQKlMIPeUoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNjr+sACgkQTeGvMW1P
DelsCwf/bmLdTz8Ja+wZNX1wv/7qQDIEVnh4+yhKD3/UaZ2XhSA2N/AgidlhGL7G
PtfndFsvtbLLHyzkL25vGn0Slh4lSaapgMeAo8p83QeBMN2/8mTh1/hG92dnB+b2
dzCyjJmQRcFmA0BbYY8Daz8Z12QGjud7Y5bdlh+IK7XlHZSDsxLiUdH6ICeNVlT1
CpVYi9pH6Cjwcp6kst5SPXWWp5oCuWmKnRgy1ZA1nHexq8TGeqBnGdtjU9WZRIxV
Y70bPd5HtEqPYdO57Kqu+DaxkBcF4poNXdE7rgGnGQiqE55pTw23S/P4FN3ajlY1
QMABEXYFf99TgPHVM9POQ+Y2ycoL1g==
=shhJ
-----END PGP SIGNATURE-----

--BE8YzlQKlMIPeUoh--

