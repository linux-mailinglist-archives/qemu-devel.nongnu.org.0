Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D473F4CBC93
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:31:00 +0100 (CET)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjff-0006YJ-B4
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:30:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nPjZF-0004YX-DB; Thu, 03 Mar 2022 06:24:23 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:40579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nPjZD-0004jj-34; Thu, 03 Mar 2022 06:24:20 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 485C75802B9;
 Thu,  3 Mar 2022 06:24:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 03 Mar 2022 06:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=6ikmImTdm47N4tZ0kBMXBXvsugwI4h
 g7cplLWphv/rg=; b=OyUrEZO4PCxKKYGnOQHwHQHT0vYsQ8Jw9CxydaHAlMQDKi
 FTVjhs2CDCV10qAHY8GexOTBViDEyP6q+pxbdtKe6z+ieylCWgSbS2QECSO08lZh
 p+HmvR/St0eb/m0c6Mj0hVf4G8LPzIl623xrr9faN3u1PVzgLiMIAznQd4+nGANy
 mu3YZj+hJUbXQgEyJmHvuy1rJnMFcq5oBCt2FrgLycKWdeu5ihvcpQXfcTYSzAC2
 a5Gc5WKZXFTmtokuGqfFy2NP8eJKP2s1Re8eBDvJmlPNAVIwiahE4Fp2LZ6WxM6o
 CHPsm7hkIrK/kedeJPc53ku4KNCwITLozfWrZyLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6ikmImTdm47N4tZ0k
 BMXBXvsugwI4hg7cplLWphv/rg=; b=lUWSY2wOnbCBpO5SMUVCNqwFbt96PdDna
 GHjSVrozCQK/RKW585xrPBKNYsWoBPPEnM2alRSuuSLrIt6t1xjeo6C9yldZT9jx
 p+cQMIuyjY/xhlY6i+69T6nlORkdQltGEfrQ7Au9ur4YYXYJ4Xz24W/1DZJfCZfz
 SmrqUhtzSkFiFJLrw/u2sNBHsGauHgFB61xiPRi4PVBOuchwEnIAIYo3SZppB5KI
 e0INjsnIiutwC6WIqDzuEpQ8F/uk7aArw55ReUF4fTx7yq1PyFRRRiTf5v3NGyIv
 Fd7Ih/JyAidSnhynGX0oFQk3BSiWgBh3BzF2r/cUSAZpMJpYuPChw==
X-ME-Sender: <xms:XqUgYmWB1VnX-mIkni6wQCt0LM9Af7VG4HF7Fq2fxh9NXvFT8w5Jew>
 <xme:XqUgYinyOjmIXbj7aZ0XQTuhinbZIQlTwlEfKZez4-wtJa9t-LxB6Lec1oEO_yT-Q
 QKs2HcK808d_lUYSzU>
X-ME-Received: <xmr:XqUgYqZJ1hahi0OL0OeID6GLkpKqN4K0AffX3KrzoL44Rtw3EBhasF4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtiedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedugeefveegfeduhfeuledugfeufeetheeuhfeuffejgeelgffgtdeffeduvddt
 veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XqUgYtXrU12GLYHS7VnEUEX99Haz1a8Xm94yVYSyNqX_DH3j4tuBnQ>
 <xmx:XqUgYgmMPH19rk3fOUaiPQzl_kYFKrPTrfGiab1CQ69xHzSreDKZ4A>
 <xmx:XqUgYidSyh_u6vCYnPndYRf6h1RP7UjCZ6GQeFL3uAsXmBN4Ca4Rbg>
 <xmx:YKUgYtirvzNtBHhgIF6agXFkXX-PAyNpYYQREORw85OysdxqBVchjA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Mar 2022 06:24:13 -0500 (EST)
Date: Thu, 3 Mar 2022 12:24:11 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2 0/6] hw/nvme: enhanced protection information (64-bit
 guard)
Message-ID: <YiClW/XGefTsEfPp@apples>
References: <20220301104428.160017-1-its@irrelevant.dk>
 <20220301145453.GB364422@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sTz2oNmAEClLkeBJ"
Content-Disposition: inline
In-Reply-To: <20220301145453.GB364422@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sTz2oNmAEClLkeBJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  1 06:54, Keith Busch wrote:
> On Tue, Mar 01, 2022 at 11:44:22AM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > This adds support for one possible new protection information format
> > introduced in TP4068 (and integrated in NVMe 2.0): the 64-bit CRC guard
> > and 48-bit reference tag. This version does not support storage tags.
> >=20
> > Like the CRC16 support already present, this uses a software
> > implementation of CRC64 (so it is naturally pretty slow). But its good
> > enough for verification purposes.
> >=20
> > This goes hand-in-hand with the support that Keith submitted for the
> > Linux kernel[1].
> >=20
> >   [1]: https://lore.kernel.org/linux-nvme/20220201190128.3075065-1-kbus=
ch@kernel.org/
>=20
> Thanks Klaus, this looks good to me.
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>

Thanks,

Applied to nvme-next!

--sTz2oNmAEClLkeBJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIgpVUACgkQTeGvMW1P
DelaWAf+IPkZHIeu4Z8bJL8IHXEwtoK1ac/nds6E+NAhKmtvVPzezY8UU7kBnBgp
TXDgxcuIT6mWgeCAYtkaRTCTcmweIkNczATlCxf1jWNwmmExpjGEY1V5Qucfo81j
H8uFFIm/rADr/XD+eaisysz7bSjZ9IeYyIQaVv+Hy1uUNLpw/80K8F4lQqFdbPxH
dQfpwrbBqlUlTlPxMG1D4IJT+tS44N/4Vt1iYnLHrWavGqYlMr2OjT8JW+9Ndc17
60Xp89fc51sRZXsILQjGLLwzEaSUYlZOEbWW7dfzm2if0MArb+ibH4qX+FLUDtJW
/VIjwGEFNRWUGI7ommWw/jrwxkrp3A==
=7mIA
-----END PGP SIGNATURE-----

--sTz2oNmAEClLkeBJ--

