Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C251D208
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:13:51 +0200 (CEST)
Received: from localhost ([::1]:42094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nms9u-0005be-3h
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nmrst-0001Yu-NS; Fri, 06 May 2022 02:56:16 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nmrsr-0004MS-FY; Fri, 06 May 2022 02:56:15 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5571632002FB;
 Fri,  6 May 2022 02:56:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 06 May 2022 02:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651820169; x=1651906569; bh=t0
 DI5I6H0mncJkfPhLdloXfJz4yFhfRuaPt78y6aNPY=; b=QFA76nkKebW5vqDQ4o
 5Mvzb6Ad//33qUzI1mU91+hGlQvVFnAQpiCq9hZMuSFr1uaJSJYbdhx2W8PtzWHl
 NfOohWQxBLEFqhDdvl4ijAXZ1FofuulOco3r1yw6T/tmlyd48X5//hZkM0ZakKOU
 WWjFynzvclJgI0H+IXdGpJl+hqZNMnvsi1ugJOr9J2MfZHC7JUbYNe7N5daBlXFG
 NA8o9D2jEJ7HpIFwdRsvX6VtkmV13Inn1080rzKOocSaag2biXxAeGFDqIg5F5Ec
 P8d8lx+RIi4d6xvyDsyB1//d07ts62C5pIvIioP/Ex3lxOcWbJ5VnWe+LunaSYGK
 gjKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651820169; x=
 1651906569; bh=t0DI5I6H0mncJkfPhLdloXfJz4yFhfRuaPt78y6aNPY=; b=q
 iDrH9qGhn3ZFM3p8Sd3JqClbfRWAxbgX+VurVEMsdefCv4NtVVeNOLkKuhrfzX/o
 HR7KPGNBz95tdh4BPjxHrArOjnLflqhib9A1Q9Z7FANa9ea6LT/Myjpi7eia1l95
 TqnAHR5q4ss2cLNN3IJ9kyJ/5BnftH0YwFBFOVO2DzshZdwYhpQGzUnUDhhWYvCy
 3cft/Y0jBLWrbBqRr9c5MMwhvEKz/2jjUrFsqdjQ/kTEyqo+rBY95lMXrv0OsGQh
 jC6gwN+ScmACQYgsa0OQjqnhkJ8DyTia1Y9t8UCQmwLINvjj/3+zLHPk0kEnmBU5
 UGYaUzhd8igz4WTMDtZVQ==
X-ME-Sender: <xms:icZ0Yvpegmp6PXy43SDegsluQeizrmPRQC1solJYl8_DVcYgfeSPTg>
 <xme:icZ0YpooRR1Xbiq_qSaTde8OKd4tqIrkTqa3oQyPFpcEKZxvO3cEZQNRDKH4VVB-r
 KE0-tsj_RwVu_jLNpk>
X-ME-Received: <xmr:icZ0YsP9RIqLK-PbfiyM-N7B0fF3EHbYd5Oy4ot6C24ciMskOg7p_s_KwJLW6_SKL0Rj9Coupl4YvOzbfkc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvgdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhephefggeeflefhveekvdetgeduveduleekieekueejjefgtdefueffgfeukefh
 geelnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:icZ0Yi6qBCrYejJPmU8DgHgcN48FP14fegt7Cgour8A6kDkj1LkHDw>
 <xmx:icZ0Yu6NjRchbRonMcUdVFPLxyCMJ4HwzZE2N_F5aLyGczSaFRmMDA>
 <xmx:icZ0YqjeF_ERlaTpcLNQpj8wUix-WKPLYjC3cS6hc1mx5fQ7YOsZWQ>
 <xmx:icZ0YgRk0Ri8S7fh9UadI8J09zKw0eEAbflJJeLruyM7tRtoCin5kQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 May 2022 02:56:07 -0400 (EDT)
Date: Fri, 6 May 2022 08:56:06 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Peter Delevoryas <pdel@fb.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Message-ID: <YnTGhgkTyZGicQTW@apples>
References: <20220503225925.1798324-1-pdel@fb.com>
 <20220503225925.1798324-2-pdel@fb.com>
 <2ab490a2-875d-ae82-38d0-425415f9818c@kaod.org>
 <856683F7-3F36-449E-B203-89EC3D876DD9@fb.com>
 <97674ac7-17c5-06cf-6bd0-0e7acc37abcc@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CTMYqFe/x7HmZqx+"
Content-Disposition: inline
In-Reply-To: <97674ac7-17c5-06cf-6bd0-0e7acc37abcc@kaod.org>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
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


--CTMYqFe/x7HmZqx+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May  6 08:30, C=C3=A9dric Le Goater wrote:
> On 5/4/22 18:34, Peter Delevoryas wrote:
> Nice ! And do you need anything special from the I2C Aspeed models ?
> Apart from :
>=20
>  https://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D292928
>=20
> > I=E2=80=99m hoping to help however possible with merging Klaus=E2=80=99=
s changes,
>=20
> They don't need much work. Klaus doesn't have the datasheet, so we
> should help him with the changes requiring some internal knowledge.
>=20

I got a little stuck trying to do some QOM interface stuff, but I'm
picking it up for a v2 now.


Cheers,
Klaus

--CTMYqFe/x7HmZqx+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJ0xoEACgkQTeGvMW1P
Den7vAf/b5G3RywLrs8TndB8zti6qNyZFksGE3xKqWUnCK7fjyhAg08hYil7xM2g
ie3O5eLvG03bDlrUnPbi67x1u0W8C/q3mvzGydVuiKx2Jm7Et7AjimGJ/5iQoMI6
nrETNviZAVnqLu1IBPB5cIcMU5u0XQTQwXZNkNBg9Y0/NJ9jyMKOR74Ij4BIfnj7
XYhnGXnFzohCZlbW2DQ8TCkadpupzyu1j9a0AVsUwsLbsDh4SLb6E5rWoi0hTndN
SyHOVds/vM1TnfRS8CETrU/Q0WaASYCjCE6GsJB8xHks6tJq0D/tSyRhejwePfJq
SxSpf5f0YeEDwIRKhLOXHz2lrJ+k7w==
=gJ2M
-----END PGP SIGNATURE-----

--CTMYqFe/x7HmZqx+--

