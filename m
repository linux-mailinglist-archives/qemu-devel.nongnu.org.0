Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8919A5454BC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:16:21 +0200 (CEST)
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNdk-0004bS-Jv
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1nzLx2-00071a-DK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:28:09 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:53135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1nzLwz-0004ak-Px
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:28:07 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 036B232004E7;
 Thu,  9 Jun 2022 13:28:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 09 Jun 2022 13:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654795681; x=1654882081; bh=dY
 fYEgNfCNASoPmQNMUmsya96mtpzxNfRbEHDtYE5eg=; b=MEDxm3d8I0rbP6DUoQ
 SK1B7MCsgPo9HlvkcC1iN9qbsIhr1eOEka6oB3bM1lLEpF6tHlAhiOXPdd9hRXOA
 vKO1zpkNvpOkcRJuKfnakJaLyFPjAToZpHZKNQ7AcobYfRll2J9LZQwfR0VhYFoa
 JYo2P5dbGnow9yTRgaevUVZm7zQKG3mMFqQve9EYxFJ2n5iE233lynw0d2iNcz40
 kY7xt/KInOEuxvlbSxCnYeh1V6952tNJDSgr8o92pCx1lhgMmjHvcayvBuhiYsoU
 KAjJI1/OE3RQ26cBtc5A+rVI9s8OKR0hN369EAVrcNmJVESii3KY3zAeCG7AR4dr
 0NSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654795681; x=1654882081; bh=dYfYEgNfCNASoPmQNMUmsya96mtp
 zxNfRbEHDtYE5eg=; b=HWqcDOZyg4AgwuaNDkwNRl1Wn0LNKW2y8R04yh54+pL9
 WUc9p6tY4HDLCatYGgOLF1BkRrg3SFZ7jbX8ryK8fXthVaotVdowVB1ndnQ7LjWa
 9OVXkXlIynVXY4TjNDfkZRmaFRH+eMCt/GIJRPj4wtqtgQzOSZp+W2ibKuN5rM9N
 U8hwKcYffbKAb5yluk+d1ECqsFojhqAsGhCYb+IIIfwrG8fDJY7cqJBnw1vVDr6/
 d/Dy67j3SHahf7d8/vpCWkXJGdUJLsp5ZAzKEf6QPKd8+9WK6Y8hwpLI0bN99FmT
 efWDygAX/qEo3KY/j1BFnr5d8J5eMCWX1Kf+1qO4Xw==
X-ME-Sender: <xms:oC2iYnK5uG8UOGV6cbt6KSlsJK7ldYfTMjQQLRmX314GoFZZmmvvHw>
 <xme:oC2iYrJ9UaENHodE475Dlw5x3zb704cipzVDKwDuwcBsak_r9KK9Yrwph5VSdjec0
 yKXEauLD1RIY5usuOI>
X-ME-Received: <xmr:oC2iYvvIGBqLTXvm4K_HiorV0wM0pUUf5y1BDHa13RKyAI92JyKP_5jKaIrTWODjYWe9oUuEeKcYW7QJvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtledguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:oC2iYgaBZpdcvjdOuWcmjIFZb95R3X7wtTYmTZ2T4TWFtbsu-pR92A>
 <xmx:oC2iYuYXXPCfa5tx56yqzVdH2KOkHZye2Nj1vFOCtWDbsHgeXker7w>
 <xmx:oC2iYkBtnRH10vSdW2aZj7hXzxaY0zhPUbAexubj6gUVPua0y65JCQ>
 <xmx:oS2iYuE6DnwrRvZr-XZ9uUIAUZ1zTF4waYtVJQLf2Ft1x3TFw0btSw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jun 2022 13:27:59 -0400 (EDT)
Date: Thu, 9 Jun 2022 19:27:57 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: John Levon <levon@movementarian.org>
Cc: Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YqItnbgtw7BNPBZH@apples>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
 <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
 <YqEMwsclktptJvQI@apples>
 <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="am+t4l9NEvGF56Vp"
Content-Disposition: inline
In-Reply-To: <YqIXIiQr+dpksBh6@movementarian.org>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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


--am+t4l9NEvGF56Vp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  9 16:52, John Levon wrote:
> On Thu, Jun 09, 2022 at 08:29:30AM -0600, Keith Busch wrote:
>=20
> > On Wed, Jun 08, 2022 at 10:55:30PM +0200, Klaus Jensen wrote:
> > >=20
> > > Keith, is this a bug in the kernel? If the code here would expect the
> > > doorbell buffer to be updated for the admin queue as well, would we
> > > break?
> >=20
> > The admin queue has to be created before db buffer can be set up, so we=
 can't
> > rely on it. And this is a performance feature. Admin commands have neve=
r been
> > considered performant, so we decided not to consider it though the spec=
 allows
> > it.

It's not really a question of whether or not the spec *allows* it. If
our device chooses to be compliant here, then it will read invalid
doorbell values if drivers doesnt update the admin doorbell buffer.

>=20
> It's not just unnecessary, but enabling shadow doorbells on admin queues =
will
> actively break device implementations (such as SPDK), which have had to p=
resume
> that driver implementations don't use shadow doorbells for the admin queu=
e.
>=20

I'm ok with following the concensus here, but we all agree that this is
a blatant spec violation that ended up manifesting itself down the
stack, right?

So... if QEMU wants to be compliant here, I guess we could ask the
kernel to introduce a quirk for *compliant* controllers. Now, THAT would
be a first! Not sure if I am being serious or not here ;)

--am+t4l9NEvGF56Vp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKiLZsACgkQTeGvMW1P
DelaowgApqL/nYJGx92mOYr2EF5yH9yXciWfYjFCS3BL/zGZVpz2yVqCZbfShWlC
rgihAk6jxeFBhBXqHlsW5JZXVbry4BxGgBP3sEwKvYvJH3F7XHZt2vD0n19NRtAW
Y1W7UmezQMwdsn/G/4FZ/iChZcrwQfjzs3DVnpDeLZoDsigqScgh8RbcxwytQO8Z
hbCOrtWN9qiPE1DJh8i7AjnoeZv34RLbzpBN2O1UlPb+Ka4Wo1cU741VuJMbvWNJ
4C47cXj8OA3O+aNBZHGMgAxYicage7Mw57YUy164y8Chvxo9E4O170F6hy7M416a
u/Typhh3ZmlVgSdy94gSOP5ImVBJJQ==
=KBuw
-----END PGP SIGNATURE-----

--am+t4l9NEvGF56Vp--

