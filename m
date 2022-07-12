Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB145719F1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:26:25 +0200 (CEST)
Received: from localhost ([::1]:53962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBEy9-0005zw-1j
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oBEuF-0001kS-TJ; Tue, 12 Jul 2022 08:22:24 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oBEuA-0004lp-Ob; Tue, 12 Jul 2022 08:22:21 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5BF965C0067;
 Tue, 12 Jul 2022 08:22:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 12 Jul 2022 08:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657628536; x=1657714936; bh=HV
 kxoQGf904cze7sglZBeurLOBqEha/6moItBO7y3bU=; b=Q1js20GvVByD3P7yB7
 FY3vETauu+fBZZW+9H6RDp7pec+kFQIedVMhDqYoIBWbqjG8K3SQR43j5IDhvD95
 GqCkZ8cA2MXMw20n0QJlTce38BcyB0ngqzmOYCWURNm6Pbue+kDPtwy/jvbw0FYK
 r7AugeRXYkrFFFuabfEk0Qo7k/v3hjjbIEA9HY21AjLHkZvxl7mGcnvcI4J7fdQq
 Tohfbe6OxRudFpQmNqbTg/sTZi/hRsI/NDncJS0bKtI6SSNCNXVx0EHQuADtWyX0
 pcl0xyzfKGKmnOr2cv7dlSQxkSKwV1ard8P3Dmp44UMj5Eai9eU0hR2GU+yKKDqx
 hm5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657628536; x=1657714936; bh=HVkxoQGf904cze7sglZBeurLOBqE
 ha/6moItBO7y3bU=; b=linb8fTp2jzFLm0ZhGaqPIXree0e5HM2r2nluQCKCYDP
 yTBibCJCo3iHDUbNUDk9czXL69z8BamuJdnol87jbEwEhn17Pyb6+AyKV0kHJPHI
 xXUl/BoVYQxsZs4OA7Rz/54iJTRqyLpwjQ/tA4ehw9TsH/77TeOFwF4beo7/EZKt
 sO/oTWOgk18dgdmkwikhOv/SKSb8seA0t5IRXVbhAfIN7BgydJ0r2zpTbiO2q7Au
 1foV3/nsexcTzKsN74I12n1hBaUgCck9KzsQhNR59hJCuVub4udg0uHEIO+8qgUA
 yxXigz3nTT9dmmnOuHjTGZfWdDscy67G8ODwTyuyEw==
X-ME-Sender: <xms:d2fNYu_CBqZlk5G2zDVsSIwzzmWWLPV0H9sk-Zk3W_GO_ZuWdmOaXQ>
 <xme:d2fNYuvVTQJiOEbqudR15nIWw_QPy3K3iVwMwoEDCq0RQG-1F9TlrNPaydTpu2rzq
 pGGBJ8HzAZe8W_pdAk>
X-ME-Received: <xmr:d2fNYkCPWd8wLZW3vd1xOj6H0bfQ5Ns172Lob_FkcBdPIVTrRtFXVkp0Zgplmu3eHqbISe-qqksTlSmvnHk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:d2fNYmfquGP8msVTaaBAIMVzWaPz1vs5H8W4WD4NCNlR5bJY0RlJqQ>
 <xmx:d2fNYjMcjD3URCIwoo5Xhhtgpv_yJgfA1bvMlr5W0lufdJi5y_bZow>
 <xmx:d2fNYglw6M8YGeuPTAGYYnf3JDB5kiefc0MgKwKovgVFGJTIY96uug>
 <xmx:eGfNYsjHiokkvPTwCpCBhvSuFJAfF3k6RB_GROls0acYTiJZZhqHaA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 08:22:13 -0400 (EDT)
Date: Tue, 12 Jul 2022 14:22:11 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Keith Busch <kbusch@kernel.org>,
 darren.kenny@oracle.com
Subject: Re: [QEMU 1/1] nvme: Fix misleading macro when mixed with ternary
 operator
Message-ID: <Ys1nc+eAyghckfIe@apples>
References: <d3fc4a90ba74d4874c445480b48d45b67c9322ae.1657200900.git.darren.kenny@oracle.com>
 <Ys1k6ameYujtE1TX@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WJRB15Ft9CQPgZt+"
Content-Disposition: inline
In-Reply-To: <Ys1k6ameYujtE1TX@stefanha-x1.localdomain>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WJRB15Ft9CQPgZt+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 12 13:11, Stefan Hajnoczi wrote:
> On Thu, Jul 07, 2022 at 01:36:21PM +0000, Darren Kenny wrote:
> > Using the Parfait source code analyser and issue was found in
> > hw/nvme/ctrl.c where the macros NVME_CAP_SET_CMBS and NVME_CAP_SET_PMRS
> > are called with a ternary operatore in the second parameter, resulting
> > in a potentially unexpected expansion of the form:
> >=20
> >   x ? a: b & FLAG_TEST
> >=20
> > which will result in a different result to:
> >=20
> >   (x ? a: b) & FLAG_TEST.
> >=20
> > The macros should wrap each of the parameters in brackets to ensure the
> > correct result on expansion.
> >=20
> > Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
> > ---
> >  include/block/nvme.h | 44 ++++++++++++++++++++++----------------------
> >  1 file changed, 22 insertions(+), 22 deletions(-)
>=20
> Klaus: ping
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Sorry,

Thanks Darren, applied to nvme-next!

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--WJRB15Ft9CQPgZt+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLNZ28ACgkQTeGvMW1P
DemXoAf+KsGV4q4UFkSnBviPwt2mAgApOREr3RexU8cM1X3n1A4hZZRRJAWkZjwk
OH2X/FpgYVUkw47/QW13GKKv1ZWw+R1U4yjqoFt4N8+EeILzyt4m4VfBMBJlLn7I
uz0JjEd8WG1LSIkUbM8ws7bwCjqsl/jwCrKFzgmAYuum9U7v5goqMFguFf0nsn3Q
wQXXfx8q7az+xDDpp+9JEXLqdzp9B7Ve3OJ8s3EfDDeEg7P0HBwKfIFIxnnxGpIV
0ptQTt7PBJLG93KPvNPGJxbf58Gzy9UbnbBhN9ST/TwQ91GOiwrIZc7PSrI2ikrp
sjgtExClVfxDPtvwubSLzMbwnPr4aA==
=vKL4
-----END PGP SIGNATURE-----

--WJRB15Ft9CQPgZt+--

