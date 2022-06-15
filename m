Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2625654C41C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:01:23 +0200 (CEST)
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Ott-0000F6-T7
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o1Ohb-0008La-OU
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:48:40 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o1OhU-0001J0-Lu
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:48:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C8F445C0241;
 Wed, 15 Jun 2022 04:48:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 15 Jun 2022 04:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655282909; x=1655369309; bh=ZL
 oNxKMBCjVr6HKIHvdfmS/mJzC/ipaIHnWeYxs/cKA=; b=UPhu1x8TcNDBH/Bn7+
 uJXcUOvEMowumtE8NbUfYVEWZawsR9C/lB6gZNvqCaoSTtNvloyJU62XrycBPBa6
 VkGUa9o9SSJ/pfU9ZoPU59izOHj4FBsKIQgIGKq/TJuHChMjr42aZbePtXHd51ZG
 W3+vNQq0KTtbACYguBdCOPsqrr5ERz8YbEKusoQM7K8nacQ0xDIWuWnJHCIZCNlR
 AfsxXb3zdk8o4rhwGRPuGFWeUCJP04+VGgCUMiZh9K1CC3+zCD4X8dGtfpqukRNu
 Dt17cQxRPIf2ctw3EO3J2QfeFG7wL98hW9P2JSumxBVJncY7EvCpWUjaJ4OwKwj4
 JVmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655282909; x=1655369309; bh=ZLoNxKMBCjVr6HKIHvdfmS/mJzC/
 ipaIHnWeYxs/cKA=; b=q4mSJRyVZjD5jtzG2qPl7wdqAoXh3jI3vR3zEGzSKWb6
 xBcIxUmZKnvPiskE9Bv+2hp3zf4Hn783h7pOTFWI1lk2EnzprSbqPpNNJOjFVdFf
 N0KaxE5M3BLE8IIZI5eh8cRZGHI4eSMkVeUeLxkRuATKvLgQTyMm5AUndbXPk3UT
 aI0/OmpnUGYa596deDnoZmJ5SAim+b8JPR9SHtpHnLGZGOD19vi9ORnYj4vhrUvL
 9mZOQJLSTw5gXduNEY6xZNVY/QhdPu7qY4OYFEzErtXkeNdruvLfL8J621O30lGI
 dj2DgDhIUzqg+sbCuTN5pD30tOfG9MASvKIsJBc5Xg==
X-ME-Sender: <xms:3JypYrr10R9SIm4QlwfCzjj0Gd9Py19HChLieq8JzgM1sJEL6cO0mw>
 <xme:3JypYlrYmEoXsWpm5wTcFgmI7NVfTG6bF5jW0IEtQ17Qb7znX5QWlGPBX5LYSnH_M
 uvbAkv5FtWNjX0g53Y>
X-ME-Received: <xmr:3JypYoNSzYu4ErRyDH-RHBRC81mKqDNBpVzZXiCn-f2QcYMQHQdWEXs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepudetteefueejueelkefhveekieevieffheelfeegheehkeduudelhfejheei
 ledvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihhnfhhrrgguvggrugdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhs
 sehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3JypYu4_Ne5lCBSrM4hrx9wlDCLJ-dhwDZqulgnUEbmrXSjDTIV8Pw>
 <xmx:3JypYq7Qx9PUOvLrGF-Ca49c8z10crslhDX3-oK6spppuKeewUgOAw>
 <xmx:3JypYmjK3nb2hnTw9ZffFMbiagx3hbFfjen0IAd464MWyz6BghX40w>
 <xmx:3ZypYgkVH3H4SNhKmsmk5tcaaKdPkjz_Mjs1djpQ6AIEE2XoDG3KUg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 04:48:28 -0400 (EDT)
Date: Wed, 15 Jun 2022 10:48:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 John Levon <levon@movementarian.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <Yqmc2vKXcMl4Xsme@apples>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
 <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
 <YqEMwsclktptJvQI@apples>
 <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org> <YqItnbgtw7BNPBZH@apples>
 <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
 <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
 <0CC03CA7-1BC5-4FDF-92BA-4256778AD113@ict.ac.cn>
 <YqisK8iYANhY/mCm@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bAjloJlL+1jaCMmH"
Content-Disposition: inline
In-Reply-To: <YqisK8iYANhY/mCm@kbusch-mbp.dhcp.thefacebook.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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


--bAjloJlL+1jaCMmH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 14 08:41, Keith Busch wrote:
> It's a pretty nasty hack, and definitely not in compliance with the spec:=
 the
> db_addr is supposed to be read-only from the device side, though I do thi=
nk
> it's safe for this environment. Unless Klaus or anyone finds something I'm
> missing, I feel this is an acceptable compromise to address this odd
> discrepency.
>=20

No, I love this hack! :D

I have tested your hack against a dbbuf enabled driver that enables
shadow doorbells on the admin queue by default. I can confirm that this
works as well as on "broken" (or, lets call them "reasonable") drivers.

> By the way, I noticed that the patch never updates the cq's ei_addr value=
=2E Is
> that on purpose?

Yeah, I also mentioned this previously[1] and I still think we need to
update the event index. Otherwise (and my testing confirms this), we end
up in a situation where the driver skips the mmio, leaving a completion
queue entry "in use" on the device until some other completion comes
along.

I have folded these changes into a patch for testing[2]. Note, your
patch was missing equivalent changes in nvme_post_cqes(), so I added
that as well as updating of the event index.


  [1]: https://lore.kernel.org/qemu-devel/YqEMwsclktptJvQI@apples/
  [2]: http://git.infradead.org/qemu-nvme.git/commitdiff/60712930e441b68449=
0a792b00ef6698cc85f116


Cheers,
Klaus

--bAjloJlL+1jaCMmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKpnNUACgkQTeGvMW1P
DekVAwf/fs5rRVsaz0d8S+2qBesWimpgip/7qe/nQOKP7rzdvC4kNtdRfoZEhpNF
goe5LAoNcQ8U6N/qkdpwpLaX8ap+udI7dW+AMzZmRKG5v48S/WtHYErcG+/GYxgF
hkLPi+EPstmK62CJ+L6SeBBDuL1dgVCb+owza/ndlox6Dzv5gBcNCN5DKsgZyR3N
xX0P7WALUbAeSzMyWQq7SUvnwBxNFl8BdvkH5fenDHXSj7fxsP/7C83/1/mfWAm/
8F2A0QlmBVruw4mBEK5Zd0WfJA7tmr9eRKMUfmnY4oJW/U2XUbcH+rONxW+EdEgn
jbBzv0j8z1Oijw0jOXLET3mgT/ZlFg==
=fzoj
-----END PGP SIGNATURE-----

--bAjloJlL+1jaCMmH--

