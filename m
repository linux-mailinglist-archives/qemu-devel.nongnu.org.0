Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A870E31D6CB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 10:08:16 +0100 (CET)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCIoh-00034C-43
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 04:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lCIjU-0002Ap-8u; Wed, 17 Feb 2021 04:02:52 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:56637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lCIjS-0001HL-3K; Wed, 17 Feb 2021 04:02:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 07185F40;
 Wed, 17 Feb 2021 04:02:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Feb 2021 04:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=2VDclYhEuuvnLyPYgOjvNf8hQ2d
 3Rs464TzQQLoX4/0=; b=F85io4KcSPpqmKlzbP4NjAbI7ZgqNKxJ8+wh7WPiO07
 I0PSbz5DfsQRxIRqogn0fW9joe9nC4PvAaI5VWw7xlfROe5mFJeTdMBGJh2TJfd2
 Dzk4R+hvkXB3wRHmoNxW2BAhT9zH1hUOVTRk9JVy2Tpve3Jd1RVvn387XBclXVwH
 +vjGhHOb8Jz029JFUjjlWqkWml0uEB3vwve+duLB4AyacCTIG+VNrO8HRsm2MZnK
 Yd5n+0hs4Ij8aHSaPFrpsWDtPF6OqCbXlYloye4JTmpqFQZScJ6mQ8foyckYjaA4
 hgTUmIS61E5mo68l+qHrpztUAAEQFBHU1Egi/qhOPNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2VDclY
 hEuuvnLyPYgOjvNf8hQ2d3Rs464TzQQLoX4/0=; b=rcaBOCwKa45yhLu4KN2CmO
 cJ7DqZH5h4FzuHaiWBfDz5MD4ex548n3MB60ILooNxFyY0bpMJPOrbROFeg0m8ir
 SQwcaWDGJNJnjel+IgRpoq25hP96NbyMQN999XxZKBuZxHg/5iNVLJiPMXW50FIt
 +42oDxj1Je38EYI3As7TLhlapRz9uDjvF43GME9dc/G/Zv/bg3UtvGhr9ZCM5aeH
 m1EwxLK9fRNY7SfPBDQKz+ouiU1zz5TzvpjEoPGEixCFFbf6Wm6q5wEW+6tq32c5
 4HUPqspuS6OV+LM54NLNJZLcSdixsv2abf1IIhcdV3P6Y2nngeCJdfNwZ55RDsJg
 ==
X-ME-Sender: <xms:tdssYD1yNu_wockFRGUHs8pbX6UkFePEEyABIp7FAixn9S8GVRuBAA>
 <xme:tdssYCGOA0O9xkSBpzxPLvKljZkWVOd73nHARvHVVajYlVRRNb5K6mnTLn03kaTPE
 d49Un5I9HOdY0Y2WMY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedugdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:tdssYD6CAVb7-vqIatapc7ljurr7H4hEht_7HS2SZlSlxWlgOxCQ5Q>
 <xmx:tdssYI2UsxMpNHJWStj70X2nZGPClc9JcXPGnaNJ5e7iOjidH3gDWQ>
 <xmx:tdssYGGyLC88PjwoR4x9nc40NVHgdGWpKuXSp-22BOLblcZVLmauKg>
 <xmx:ttssYJ3iYMRu_JKtepLjKYncKNIH89710UPdh3PiyRZf4x5t-ypltw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1EC1E24005B;
 Wed, 17 Feb 2021 04:02:43 -0500 (EST)
Date: Wed, 17 Feb 2021 10:02:40 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RFC v3 09/12] hw/block/nvme: add verify command
Message-ID: <YCzbsB5ddpkopt69@apples.localdomain>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210214230240.301275-10-its@irrelevant.dk>
 <20210216231213.GE2708768@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Rv0CtS/wVBUqPRRj"
Content-Disposition: inline
In-Reply-To: <20210216231213.GE2708768@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Rv0CtS/wVBUqPRRj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 16 15:12, Keith Busch wrote:
> On Mon, Feb 15, 2021 at 12:02:37AM +0100, Klaus Jensen wrote:
> > From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> >=20
> > See NVM Express 1.4, section 6.14 ("Verify Command").
> >=20
> > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > [k.jensen: rebased, refactored for e2e]
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> Verify is a generic block command supported in other protocols beyond
> nvme. If we're going to support the command in nvme, I prefer the
> implementation had generic backing out of the qemu block API rather than
> emulate the entirety out of the nvme device.

You mean that the block API could provide a basic "check that we can
read this stuff without error"-call? Sounds reasonable enough, but since
the end-to-end data protection checks are performed in the device, we
need to pass the data buffers up anyway. If we had basic I/O (non-pi)
verify in the block API it would defeat the purpose if it provided those
buffers.

We've actually been asked directly on the availablity of Verify support
in QEMU, so I think this implementation as-is provides something useful
to users.

--Rv0CtS/wVBUqPRRj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAs268ACgkQTeGvMW1P
DelA8gf/ettjjJ8nwKm1I4jnMIpUC6I10LoigOZ0Io7teR7T4BH61jDsLidzaMQG
jCpOfDRGMyps2r7p6syFXm6GWtmQYUElJJxDKR6OmL47C5nsgDoARG4Yhq9SB02Z
ocX4UTB1oz8etOssfE7Egy+hj2NOIP+rTlKHa2GGPGZ8rYGd9DdUO0/mp8nk4I+G
8fUqOmR3KIOhHP6tTjmuq+y3EVkz6doS8XzT2o1U5yvXCE5wW7/Cmy2z8/WRZAmC
UFURaroG0IoNODspFm92dGnIRfcDIFHMbgLz7W4RWPgxgFYzMDRDUmYK3zK0EJxA
EEm4dh1Aw5cq7elP4tyOBlhNSNOv/g==
=BO4D
-----END PGP SIGNATURE-----

--Rv0CtS/wVBUqPRRj--

