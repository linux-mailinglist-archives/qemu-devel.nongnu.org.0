Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32835081BF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 09:10:04 +0200 (CEST)
Received: from localhost ([::1]:33770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh4TT-0000ym-P9
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 03:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh4IO-00074e-6Q; Wed, 20 Apr 2022 02:58:36 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:34515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh4IL-0007QG-FC; Wed, 20 Apr 2022 02:58:35 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EAE1C3201D2D;
 Wed, 20 Apr 2022 02:58:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 20 Apr 2022 02:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650437910; x=1650524310; bh=vT
 K3KO3BEfRhcTaXTT1M2ksVT9IKkcYmH13Y/g449/M=; b=M2sAcNJYBJwrDsgNBd
 iiEYleGGYfsnQi+ldVKM/SK6O1/c9qfJK7m4HSkMcqIm/whtSELUiBbViPgfR1hd
 wHr8k37jGnZt6BKu6QGjloOaRi0kMAZLm3buIhj0FOwOGTRgQH3mitdl9ukY5jKg
 HwHlIjKVZGu0leuUYDNBRcwKjQz5+Z6LxHM74D6MwaUnbytBBBBKOK+VFtXsDDHu
 CtTo6JwAKBfC6vJcTGy7ogqD+3drZ6om7Brn5o8iYv1WioeB/oqPP3krTfvhplf0
 bBKXsdd+UnYpS1SxyV+BgTcSs2EnCp6N09O03ydO+btcYVKHgYdT3P6/c0wQILqV
 ailQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650437910; x=
 1650524310; bh=vTK3KO3BEfRhcTaXTT1M2ksVT9IKkcYmH13Y/g449/M=; b=y
 C/uXPtDgNgBXmcTow4GVDyPcZ9hfX55pBoFYG+LpCIr51leKD2o/DONENyhQ2rZo
 wHAq6IeNpmKW6ph2oQYwoBbIC3EKTbysN3/226h7J/BVoHOIq/txhF5Y/X03B/iX
 B7Yqe8Mr0RreQU0SgwozccW8hqq0q03DmDKXraQXIyggwhkYdbadD/hRDEDZx8eo
 MPpknZ86XHQ5Xm398XRWW0a//ypHHh4ri4lUkXGzstbWYBmyUMRfYeNAgRxJDO6Y
 AfyIl/mL4oVL7gbmbHxQUY/dsll4F6XJdyOd9DgaAXHH5aSiUdqBYiL8b3W0q+t1
 98GlPa+KEYllHf4mSWuYA==
X-ME-Sender: <xms:Fa9fYm1nStFP83MZRPNVEb1twLg7zedarD9Di0wgNyout1TTUBr00Q>
 <xme:Fa9fYpETDBxXExVH2uPuuou8cg0aBTWe2OT1VelQyEUE6N-zfBhrCLF9Sy975IjyY
 Q7hTSxVjY2ocrHC8RI>
X-ME-Received: <xmr:Fa9fYu7yxIlAJkKmZvb9ftuyLad6mYgyTo1JCLGr-a418W8KElxLkGlJRYYTs3YtBv6udSgLNm1Lpb7s3_U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Fa9fYn2vaDegRgDB-VPGnM59Lbsl8I6PclKDWatNxkWdMS6Xfwcz_A>
 <xmx:Fa9fYpHKvA5qJ3N_3BS3v2yiq7-pwujz2sOyb-Oqkh7GqfFHPlT33A>
 <xmx:Fa9fYg8i8-C5F0HRgsJlQTi_WXH-x7QurgznztpsWo790_YmAH1rKg>
 <xmx:Fq9fYiOYjl7EczYzZuBGolxNjr2G7kFSIBk_8DwGJSPTw3kT19l1Aw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 02:58:28 -0400 (EDT)
Date: Wed, 20 Apr 2022 08:58:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/5] hw/nvme: do not auto-generate uuid
Message-ID: <Yl+vEsfdCp+pr4Vw@apples>
References: <20220419121039.1259477-1-its@irrelevant.dk>
 <20220419121039.1259477-5-its@irrelevant.dk>
 <20220420053336.GA2063@lst.de> <Yl+fZI5kGW2wQ1DO@apples>
 <20220420065334.GA3651@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UETPk1Gh+HTE3D9l"
Content-Disposition: inline
In-Reply-To: <20220420065334.GA3651@lst.de>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Luis Chamberlain <mcgrof@kernel.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UETPk1Gh+HTE3D9l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 08:53, Christoph Hellwig wrote:
> On Wed, Apr 20, 2022 at 07:51:32AM +0200, Klaus Jensen wrote:
> > > So unlike the EUI, UUIDs are designed to be autogenerated even if the
> > > current algorithm is completely broken.  We'd just need to persist th=
em.
> > > Note that NVMe at least in theory requires providing at least on of
> > > the unique identifiers, and the UUID is the only one designed to be
> > > autogenerated in a distributed fashion.
> >=20
> > I understand, but it boils down to the fact that we do not have a
> > general method of storing "metadata" like this persistently.
> >=20
> > But maybe it is time that we come up with something to do this.
>=20
> If we can't make the persistent uniqueue identifiers persistent and
> unique, we should not provide them.  While NVMe does require a
> namespace to report at least one of the three identifies, the failure
> mode for now having one is much more graceful than providing one that
> is not unique or not persistent.

Alright. I think we can do that. We can revert the eui64 defaulting as
well.

Thanks for your reviews/comments Christoph.

--UETPk1Gh+HTE3D9l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJfrxAACgkQTeGvMW1P
Dek33AgAvuwwxE2Fv5m6w6o8uEAwQdJxQjT5dalJ/+dIQfe8pGNaa6OMRUROyIMy
j7ATHeQCuFO76k1nX0D50kPWRyz3MgDfLl+UNm/E0HUV7Z44k+7n7PKJsQWxgEe8
RPVeDQZQjAXMFSERYHDA50S2Pbct1W6S4U2iUv0XuQaQ6PD0PxXSnfKaPL+aSp+y
c15LQ+1rluAdHOdPKHLUkqMowbrkIpHTdWmsgiggKQsbfsbsJ8OL3GMxYnWpu8oh
BpD8kjH7QpjAHEgkcW1YvNGJA2frOnN24tNmpcCUHn+SPNZEJzHqf+o6EPh7lXuI
7/3Abb9IrbmJYInpT98yTURe2h5yDQ==
=tGIv
-----END PGP SIGNATURE-----

--UETPk1Gh+HTE3D9l--

