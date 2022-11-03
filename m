Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5E9617C39
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 13:11:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZ41-0007dP-OA; Thu, 03 Nov 2022 08:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oqZ3u-0007aR-5D; Thu, 03 Nov 2022 08:11:14 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oqZ3n-0003xq-8S; Thu, 03 Nov 2022 08:11:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 96BBD5C00DD;
 Thu,  3 Nov 2022 08:10:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Nov 2022 08:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1667477456; x=1667563856; bh=h6
 /V1TrkYKhnepM6tpNUDitOZR1yg0yXyl76dCR7Pno=; b=NABz3Q8FtqUGbktXYr
 MzMrtQNywoxmiPNDjOjYe4eJNKoC+L4xYCFNU96aXQ6gl+jP4tIkyFZYphyLf1gB
 9487sfUb9By6g4qdJf45lS7afZqG+po1v4XIH/FBAbaDcs/7s/sRFNBZzqEsK114
 EFQrAeXA/BIm/LFKmC3Do89Nx6L2EUzyi8sktgkyd2NywMvcZQZeCtKt+g0goHuR
 y5HCC7LuzeJxsQpCihb3/UppwWX4g9rA4aFOW7VpAUxntcR6qG3XWHKnPcVGxJE2
 +E6fgzrcNlESTbnugnD6SgfV3gwJGHIkQn7S9QFj8AZoctsewbmn5AEMBqomR1om
 i3lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667477456; x=1667563856; bh=h6/V1TrkYKhnepM6tpNUDitOZR1y
 g0yXyl76dCR7Pno=; b=cr9Mfdp1vPvs5I5mCgzTWelt8fh/YTN89/x9rlSl6b0v
 Cp5+SPsiKe8tU7Fu6jN8LaxAgg87wnkfmlwuNs3QBxDimV67lwb7awv1TE+6GJvz
 +BWED/ib2nTwv6c0+4voNFrtppyWA1Y2d/61oN4KEwEBxNUc3sS8UgXY0H52+OUk
 hHFtBaffHMlSU3DOcsq6utQhjA5CL0wfX5mWoONnnWaXS4lE4NU0kgXNlsc+jGLb
 Cpke0oyitTtfuN9YrZK1oJ5IRS/FnXSuGQzDb7GPfUHSZN6t/a+VTuBzOoJb/Goc
 C0+vfLKVH4iMaEVpI/dF9jgilhSnfPkacmoI5KR+Qw==
X-ME-Sender: <xms:z69jYzcKpFzMCn8D_L4cq-wLyMeUE9reXd537INq41WjWIgmjdiR0A>
 <xme:z69jY5PfrzeGEZ_E5c2XUJ_Ox6a6YGywsozw262H8U-SJ-Z8l-tyVnGulnZ49aYUj
 Jczm3vHpH03VaBP3GI>
X-ME-Received: <xmr:z69jY8ibpEWLdFj-Us5AG9TIYTY15KP90cBc8tni27hvawECD7Smc8A90V8fLWch26E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudelgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:z69jY09wT9zTMmaAwvvCyadLZjZnWYaYkXqFa8kMU5d0ux-N36t_Fw>
 <xmx:z69jY_uP0XOWJL80K5dsCSjJTq3a8zMRO_xiSzDcw2bAmXTYjL3-sw>
 <xmx:z69jYzFs4H2fvEvdYLrI8A_0BCQf5yjIE73wQ8_z-HU4SY9rvEvsow>
 <xmx:0K9jY5LA1r5X6VJJOnHESauZWArhE12R5BI8o7thv8CY2hrgFZ3rNA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Nov 2022 08:10:54 -0400 (EDT)
Date: Thu, 3 Nov 2022 13:10:53 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v3 4/4] hw/nvme: add polling support
Message-ID: <Y2OvzcfeawKWvvJ0@cormorant.local>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
 <20220827091258.3589230-5-fanjinhao21s@ict.ac.cn>
 <Y1EswYz077swwhuc@cormorant.local>
 <D1741E76-294E-41F6-B87B-70C2A4CF778C@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WQSrJ1BSDQFDZHWY"
Content-Disposition: inline
In-Reply-To: <D1741E76-294E-41F6-B87B-70C2A4CF778C@ict.ac.cn>
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


--WQSrJ1BSDQFDZHWY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  3 10:18, Jinhao Fan wrote:
> at 7:10 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> > This doesn't do what you expect it to. By not updaring the eventidx it
> > will fall behind the actual head, causing the host to think that the
> > device is not processing events (but it is!), resulting in doorbell
> > ringing.
>=20
> I=E2=80=99m not sure I understand this correctly.=20
>=20
> In 7.13.1 in NVMe Spec 1.4c it says "If updating an entry in the Shadow
> Doorbell buffer **changes** the value from being less than or equal to the
> value of the corresponding EventIdx buffer entry to being greater than th=
at
> value, then the host shall also update the controller's corresponding
> doorbell register to match the value of that entry in the Shadow Doorbell
> buffer.=E2=80=9D
>=20
> So my understanding is that once the eventidx falls behind the actual hea=
d,
> the host will only ring the doorbell once but *not* for future submission=
s.
>=20
> Is this not what real hosts are doing?

I agree that the spec is a little unclear on this point. In any case, in
Linux, when the driver has decided that the sq tail must be updated,
it will use this check:

  (new_idx - event_idx - 1) < (new_idx - old)

So it doesn't account for if or not eventidx was already behind.

--WQSrJ1BSDQFDZHWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNjr8wACgkQTeGvMW1P
Delmagf+Nmuc29NFFdAVfRRf4ntOkvGWraqpvC8/WlbrEKkoVTref1Iz38MIw3LN
X6V23kGB4+FAcZZTiUeZWT+3vO+tGgwXSo4v320ALe/JqiA6vcCWE98319ezgfo4
lPWyV4DiB808cWvUMezGBN7yiijn/z9pkD034Qw311ATRXPo8cbe3P6SKCgvQjp1
pvX7TGS9IWN6qMWcMac9T0KZSdNMcIwbXl76NmqWajq1T24c/zazfN/cJnuQSy6z
3yfNYolxRb4avGXebpUDHjzd707WJm/LFEptU1bMQ1IatbAv06lOCiGZiM7K3Ago
2Iq4QHudTyflAHK2rBnZjFwpxsPMkg==
=IdtH
-----END PGP SIGNATURE-----

--WQSrJ1BSDQFDZHWY--

