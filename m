Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC43171DF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 22:04:18 +0100 (CET)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wem-0007Jq-M9
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 16:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wX1-0004UQ-2H; Wed, 10 Feb 2021 15:56:15 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wWz-0006Ig-Jk; Wed, 10 Feb 2021 15:56:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C0A105C01B9;
 Wed, 10 Feb 2021 15:56:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 15:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=GokTOU8lAhjm/lFKNL21gwX/1dF
 ecWCh+6bxhAkpL58=; b=gVI3Z7P9F9bbJbTCITM5PSZ6EmlOuEoJE00VwQ62gS0
 SP0QPcNRMYOwiN216uWyFnGAJAYO1ShV8O/BOphkFOiNRoRnnWHoJunbmox3B9pj
 7aYrDidut8FhELWF/ulr102lw8EsAFag3xOpqPm4uZ3a8G9DCjEl4VpfmalPPVAp
 BZlkmNcg1CNm6a+5nBu9Q51vOF2Ntu8h01umQ6aizi+DhmjAiqr8Zl+8YMopHTNH
 JlwyVZKiOVdXweDfIAxsSBpkOPQu1KSk3O9mlV7F+QYoW8nMFv34IVMLKmcrbOAa
 1OtNGGxoDgj3WJ6L+RTOhbCFdQKJYmwvFJtzqQBSP5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GokTOU
 8lAhjm/lFKNL21gwX/1dFecWCh+6bxhAkpL58=; b=TGNnktK+WHnuAuYFa5Gwjo
 3KSZIClNZsqLKMADcT9fVXE5YclpHyOV867wgC3r/y9vauJsY6YiG3FSXifldYa3
 C/g3j41m1L4JYfsIQVurIKAC0LxBQIXArxQ6VqQJlb/anybXZ7sMoq4WO+VSozbC
 3J2kVYUGs6xVEejyXgF7OuPbeLgXg6vHIQcHj5Nm1s42hl71IjVWOouN5MszbWfg
 MMCj3t39cXpAcjQUg21cX7hlueI1pOL0vxjaBPO6Jbu0ZmkdC+mS8keoIOYZPr7y
 z3HKNWVua0TKiStOEFR2DS/B0fftxUfz8qDMXgwSfY3eKHwvDqmf5QXkiIe8zDIw
 ==
X-ME-Sender: <xms:aEgkYOzcDUqpmg_brh998QcFX02x-qv6kOqddv8xfo3u6ZglZRqW7w>
 <xme:aEgkYKOZaLZ_EEv8aE_LK93xEikaBSGqH2jMX3dZxQGH0CKt7kve6JH3BtZoxoLX8
 xkN7xrugPG5cP9dl3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddufeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:aEgkYNPR-kEu3-3Wjty88W7EU5rg90ehk3QRqlca8I0Qc6wSOvwBvQ>
 <xmx:aEgkYMTVfZrtcvMeAeGofUtdIphTz5rvEwhosdoYhTcHudB4XnByRw>
 <xmx:aEgkYPAlUe0WpZ28qIis0brExG6cJIrAt6QhtQSXIYc9omi6qO7fNg>
 <xmx:a0gkYBFyvILhwZwHkVN33E08GfAm9zGOWkPuJVhcUyzWXwQIhsESjQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 169C21080064;
 Wed, 10 Feb 2021 15:56:06 -0500 (EST)
Date: Wed, 10 Feb 2021 21:56:05 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/block/nvme: improve invalid zasl value reporting
Message-ID: <YCRIZblbiTqwmw+P@apples.localdomain>
References: <20210208082532.308435-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mViZ5GneWlMw3a30"
Content-Disposition: inline
In-Reply-To: <20210208082532.308435-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 "info@dantalion.nl" <info@dantalion.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mViZ5GneWlMw3a30
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  8 09:25, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> The Zone Append Size Limit (ZASL) must be at least 4096 bytes, so
> improve the user experience by adding an early parameter check in
> nvme_check_constraints.
>=20
> When ZASL is still too small due to the host configuring the device for
> an even larger page size, convert the trace point in nvme_start_ctrl to
> an NVME_GUEST_ERR such that this is logged by QEMU instead of only
> traced.
>=20

Thanks for the review; applied to nvme-next!

--mViZ5GneWlMw3a30
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAkSGQACgkQTeGvMW1P
Deno6wf/Q0DyIRm4UPFy6Q8Ohtzxy9OsfRRmw8/+yz+l07eiA5nkaWHwVu4lT7oT
42ta0h60tDRx5Faq6c/tNjZuWVVxByyQYUrKVTZREtBCQe7lbPx1JecTl+XvDo61
qkj52b4kCf9e2t/DArT7Zb/gr7e59IUgvuXuugBGqybfFuSepGfSRIpjVOImxD9C
zPeDxYIyvlaBjBQEqktIJ1Ip+BfKBKFCgvpifN+8lDcC2DjyrO76PiQF7K1h4Oxc
GAtISt+h5++jAIKlvjAsnVR0glWuilWwxdHTubKs5LBYg4u0w2E8OIXVyn3sgFmI
rf9W4T9rmAqZTaGuUzZJBm4pWpPDvA==
=Mjep
-----END PGP SIGNATURE-----

--mViZ5GneWlMw3a30--

