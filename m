Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF255BF97
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:49:41 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66ui-0008HA-Jk
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o64FC-0003rq-Pp; Tue, 28 Jun 2022 01:58:38 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o64Ex-0008N1-Cj; Tue, 28 Jun 2022 01:58:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F1BF95C0191;
 Tue, 28 Jun 2022 01:58:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Jun 2022 01:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656395900; x=1656482300; bh=zp
 7B7Wz9Zr4PyXrYdd/DN3MHuKv07NzKRaBm1ro6VQU=; b=IkXeJ0jwXE6lEmDEZT
 GaobHBe53yImDw6TDkI6gOEfsuKxwRjb50WIYXbipEtk9dK7fQnbvBFLLBqbVMPc
 3a5Cc22b7nonrkiqlLTDsBLg8IrxrTaHPrIgY2SCH4gb9taJExSsXiPJzRBNSjLd
 lLkRGjzZ2ST02lG3qn3uIf39oM2xvueCrzB997BTbp0W7+NVp2kBKtGhPRpuH+bB
 4nZ57d9PCX0YXOHiiu/dvbHAo8VC3faU32XCkHC3EisPDQoFInpo0FXuiRiJE4yi
 O/gI0Dq9POvvpP0wSQWrFU08ku2cD0AjhQ9FHy2mdew+pBfHRjWSOWx5nOL8TJBb
 94jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656395900; x=1656482300; bh=zp7B7Wz9Zr4PyXrYdd/DN3MHuKv0
 7NzKRaBm1ro6VQU=; b=PflnloHY5Kuwi6RGh4OU28vbSw9NLoJeBjSYmsaiUMuF
 95PALVmfDSzSGa2mHcrkKroQfeEA2asv+5ow78KAKG1jFaJk+VN02dplpHRub3WK
 vKilGYym7l7gTJZqgAk6scCgXovh42/H6k9TxwFey25S+CE311dZ0aSXXXq9YX59
 pUS46Ru60MC94u3BpUoo3KUyL3YerKDWt0omzkI8DJDpQx46NvvCziGD9DsBU20X
 80sGS616uc8g3A1e2yhM1Ex5tFx+BRnZ2+AKJfiiH9x+mR+iLIsPd3xIOar5w9qa
 QeopaI+8NK5bIuc8fA5QpJZNG/54jBHpwsnnQdZ+JQ==
X-ME-Sender: <xms:fJi6Yk6o4FS_8VyCJ7rZQUKVdMuaZKBy7Um6WQiE1FJGv1iJqt3z_g>
 <xme:fJi6Yl7Zuw4wwkPzuQe2lBNbeFWLpynr1K2nskAlpX7ni_Nt6D3dJLaLoYuNzCDHn
 DeMCwgsuLlOLlH97WI>
X-ME-Received: <xmr:fJi6YjdZTuk6-hiy06_C1UQkUXAlJoXBZSZY2H4zLlwGWlYcN7kbMEy7TNeaV-1saUpTvKHU_9i8Yt98e0M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fJi6YpLSGvAJgQJbZGoYiwkHqVuLE38qaN17ObcI3bbKTvuNfWyFng>
 <xmx:fJi6YoKYdktrJjtP_009gY7vxy5AEo6x4grCIoJEy4BpCqTj9CePQQ>
 <xmx:fJi6YqxXQoMmrGH3RHvhdVXn7a-mBvzZZTWc6eYNiA_NYn00sSqe0Q>
 <xmx:fJi6YihfwLkKQhlvlw28iHEmUJ0E6ODJWQXqrUja50g1RztA3aKoKA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jun 2022 01:58:19 -0400 (EDT)
Date: Tue, 28 Jun 2022 07:58:18 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Christoph Hellwig <hch@infradead.org>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, kbusch@kernel.org,
 damien.lemoal@wdc.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/4] hw/nvme: claim NVMe 2.0 compliance
Message-ID: <YrqYemg/1aDufGXu@apples>
References: <20220627114731.356462-1-niklas.cassel@wdc.com>
 <20220627114731.356462-2-niklas.cassel@wdc.com>
 <YrnwFTnGdSpKipWA@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D2Zx1fsmKP/dm9dN"
Content-Disposition: inline
In-Reply-To: <YrnwFTnGdSpKipWA@infradead.org>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


--D2Zx1fsmKP/dm9dN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 27 10:59, Christoph Hellwig wrote:
> On Mon, Jun 27, 2022 at 01:47:28PM +0200, Niklas Cassel via wrote:
> > CRMS.CRWMS bit shall be set to 1 on controllers compliant with versions
> > later than NVMe 1.4.
> >=20
> > The first version later than NVMe 1.4 is NVMe 2.0
> >=20
> > Let's claim compliance with NVMe 2.0 such that a follow up patch can
> > set the CRMS.CRWMS bit.
> >=20
> > This is needed since CC.CRIME is only writable when both CRMS.CRIMS
> > and CRMS.CRWMS is set.
>=20
> You can also always support newer features without claiming
> compliance for the new version.  I'd suggest to go through the
> mandatory changes list first before upgrading the compliance.

Agreed.

> (And one day it would be neat if someone tried to run the official
> but commercial compliance tests on qemu a well..)

Ouch!

--D2Zx1fsmKP/dm9dN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmK6mHgACgkQTeGvMW1P
DelGqggAl85Rs10GHyZqJC8vzfXuiDQxZsQsUey7HltrFvzCmy10d+uiJGe430L4
QADKIEcccWqq+1/3UYWpl+pmud65MNMbvnDm0Z1bkPVmcH9NVv+ac+LVfVxG+PeY
arqqd9xpFSoebBwLtj8giE6t5q/rcadg+TgR0IqCfETRx1hJMbB0zu+n4Eerpmbu
m34hsRpIploMjYniwlRafceTF9MO58gwdhG6WQDHrBV6ObAvQThPBQWTipiIMNZG
jwRZV3j4e0vva5wMmTRNzUJVru5oWi2tBrRh7fFOxOynHagBYnTUYwyo0zKozLjR
OD9uClhLhkXzg46qjYhY8AzfqTdsJw==
=61/A
-----END PGP SIGNATURE-----

--D2Zx1fsmKP/dm9dN--

