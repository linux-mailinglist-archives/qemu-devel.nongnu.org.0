Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9A6A18C9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:34:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUTP-0004zu-EP; Fri, 24 Feb 2023 04:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pVUT8-0004yu-Hk; Fri, 24 Feb 2023 04:34:27 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pVUT6-0000UA-QJ; Fri, 24 Feb 2023 04:34:22 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id ECCBA5C00C1;
 Fri, 24 Feb 2023 04:34:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 24 Feb 2023 04:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677231259; x=1677317659; bh=Jw
 R2YIMDAdzbecp+4J4CHiN//UOLFOLc8YSX9rv0GpI=; b=pc+XgH6hTLRKTJ85Wx
 dj+IwEUGZw4JFtvohnXcSPC9jyZRzSwM8P9G1khdy/SqU2jp7tBkpBK/2Mf4OOZ+
 YiawC8bqKCu5oghvO+2yv6yiAnXhwKn+BqgKT4uI80DsQ4AuerYSI31yE+QE7wkp
 tomYzcS5lvfSk1wyv7nW6aIBXYtROt79Mh4A+TY9bT7y2NKQBV5hO+fTsHBZuwf2
 o2aODdZSbGU8QYQFrYc8yRTMh4ogSt877dbk3NYcrHDCLc0jOJ2qitLoe2gkL5ex
 0V2kt7WlOL4ulm11SOuxE79WscnIZ1jPPhQeZfrLQxfdc+lRYyPDjDyxdLrbPdgR
 0tAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677231259; x=1677317659; bh=JwR2YIMDAdzbecp+4J4CHiN//UOL
 FOLc8YSX9rv0GpI=; b=k+T7zFAZk5Se0x2KgyBnUYeqt3nOLbwbFCgJcdbUHbWb
 Sw/Bynf3T2zWQqTo09dRU4yEZvgXKYNKZT8mRT8gpcetPcCqTC31F7jFYGWlIzdq
 9XkN7UwcvavrOpC558eKmoQGr6lPk15iDhy1gOH8lumKzf/X7qWTbXQmftSiwSo9
 HyfiPzwomgqt4J2nkkW3qorscE+nSgKu03YzkaITW9rJm24I4K7xxJB9E1QZhIjC
 S+syvFB1OoVTAh4Ra5C5GYsO2Ihwm7Y9/ql1ZpSMOnHJTMv/1sswfCBrqpXli3h+
 XGj7oUKoMamGtYND9DdoDlEYd/fYJoz8RyimirJWNg==
X-ME-Sender: <xms:m4T4Y4B3xSzo1DGG2cF4bKkVf6EXzIxmkQur7jCgCvf_yrvD5zdqqg>
 <xme:m4T4Y6j9ZuvPj07oCOjZ-e8aI5p-DVQ6hIyolYnlOUR-kLPcKkS4s45SUeCScmArm
 pLDpSchFCTBkeZseYs>
X-ME-Received: <xmr:m4T4Y7lI_0BwhuOY418FrWrZVMBEGh5YKGHXuve7V6I_z-3T9uRiKrXYVIcSRoH_jH3J58pVUhDHhO707SgeO0L6v9R2ZGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekfedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:m4T4Y-yYd8VL4IKi6HxcHywLepdDIuORQjUci2K-lgczDlNmV-wALA>
 <xmx:m4T4Y9ToI2XoBU36qDqtEMHN3h4BwwlF-J2SXWcpm0uvCxLb-YaWnA>
 <xmx:m4T4Y5Y2z08cEvt2K9KPO_woBvYvgL1V6tcuMVQLwo2DPopJi-5yCQ>
 <xmx:m4T4YyJYZobRzLwRKZFzT5VF_W8w9OOMRBPD4GLPjOe0JwPnRuqvxg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Feb 2023 04:34:17 -0500 (EST)
Date: Fri, 24 Feb 2023 10:34:16 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Joel Granados <j.granados@samsung.com>
Cc: Jesper Devantier <jwd@defmacro.it>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v3 1/5] hw/nvme: move adjustment of
 data_units{read,written}
Message-ID: <Y/iEmHjjw4um/fjE@cormorant.local>
References: <20230220115926.54623-1-jwd@defmacro.it>
 <CGME20230220115941eucas1p18804ba500e79b6d61c468bd2fe25f7bc@eucas1p1.samsung.com>
 <20230220115926.54623-2-jwd@defmacro.it>
 <20230224082027.xy56qmirky6pxuss@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="enyx3Mjnzf2kOSbl"
Content-Disposition: inline
In-Reply-To: <20230224082027.xy56qmirky6pxuss@localhost>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--enyx3Mjnzf2kOSbl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 24 09:20, Joel Granados wrote:
> On Mon, Feb 20, 2023 at 12:59:22PM +0100, Jesper Devantier wrote:
> > From: Joel Granados <j.granados@samsung.com>
> >=20
> > In order to return the units_{read/written} required by the SMART log we
> > need to shift the number of bytes value by BDRV_SECTORS_BITS and multip=
ly
> > by 1000. This is a prep patch that moves this adjustment to where the S=
MART
> > log is calculated in order to use the stats struct for calculating OCP
> > extended smart log values.
>=20
> This was originally part of another patchset that looked at adding OCP
> to qemu. Why is it needed for this patch set? Should we change the
> wording of the commit to remove the OCP specific stuff? or should we
> just remove the patch all together?
>=20

It is useful because the Endurance Group Information log page wants to
report Data Units Read/Written in billions of bytes, not in sectors.

But yes, the commit message should be update since it is no longer
related to OCP.

--enyx3Mjnzf2kOSbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmP4hJgACgkQTeGvMW1P
Dem9oQf/WS23C3NcmdsNnYwh0hpps3FYxVtYuYv/bYMRSGnJPioTFljC2jA2nT2J
75mAOXTUThWwCyvCHmtbVXR7hlLC7g7AAPkzSaopZvXMOL+wPoiz7XaSYc7wouJy
mREBWwuDaak3Sex2wI7MqiZ27sTgiGOkiqOFV3MQlCik6r6iYisAa8PQjj4Kojsl
FDwKDuPHijpJuTUeElRIKpiv7yhjswMn0OeJvLtMI+jGUHH+3WtlkDtPF6gmBe7i
RNHtHQ4CyGdlp9SWuvFwfdJvNVId1UiSQJsxNr4T9rLeBRvrHTQS+VhYpr33cMRA
mW7w4KnYNUdoExKsNfZU+0cFFNPvfA==
=ZeDD
-----END PGP SIGNATURE-----

--enyx3Mjnzf2kOSbl--

