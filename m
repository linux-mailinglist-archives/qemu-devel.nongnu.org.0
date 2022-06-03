Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A926F53D2EF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:47:07 +0200 (CEST)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxECH-00017k-TI
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxE8V-0007wk-NF; Fri, 03 Jun 2022 16:43:11 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:36167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxE8U-0001CZ-3Y; Fri, 03 Jun 2022 16:43:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 937003200406;
 Fri,  3 Jun 2022 16:43:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 03 Jun 2022 16:43:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654288986; x=1654375386; bh=l7
 MIq/7/auiPryd1vsk8dEkkyfMplyn5fdOzuJQyrBc=; b=oLbKEPMQxllMFypVtp
 Un8GQqwNdutVvgp9vSXFQvzZo8mqmRhR7dGIpV8H37fbAHJkTc1+p4lYt1gt7j2S
 3IJB1CN0QGKjJa5KCA7KLO4iSH3/C3IpOkmkVhfLyVk+6VA9YHqKJWxNgCAr00h6
 LoJnRvw0nZdy3L/bVpLc0vvw/70qvuBLmt6gs+LZrpCICGunNSVBYu+F4BLmXIra
 u67BOcCyPsbyfSzbgniCCBKpTpLO+zrhqW09X17WABK9KwNy16BkvmHBjbqKopj3
 LHxuv7Lr125D4dNojaESIpT9nXZBxhkV1Ti+DniOIM8FeeVHJ6EI1oZGsWNadj69
 ksVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654288986; x=1654375386; bh=l7MIq/7/auiPryd1vsk8dEkkyfMp
 lyn5fdOzuJQyrBc=; b=yFeL6PXKn9lRNev6aI0oEwIVZLgb3BkGZayJp6PfhsVn
 FxX4Kgp00RhxfBYRPTQHls55So5RZ1Ghy7atNa73/QmHzgoPPDTdJvpFgv2RvOGi
 INIkLOJY33xx56H2vMOiRbmEpTZud+llG/qU8GvXxxw5j4XaWX1v4p2Dj2R08S2e
 iHY2/BD1bbzOfpJ8K+oCABpyBhuJMzpI5Jus9G6f1RqCMFsiLqLTUZiajT6V4w3y
 Ghhw4S7XcTDuOAaYrhzIspgXwG3lN2CNW1kpRIWxIEnvDevrMHgY7G3RBNBKnFcE
 vQ2SFvoBI23T7RT1Dqb6qr6iVOSYKaEp9mpRb0jffQ==
X-ME-Sender: <xms:WXKaYrNcaP8ItRd30mBtaoJNWLHcSZggOMewdWQpBf2MW3r0YEUe9A>
 <xme:WXKaYl9msnm3smGBex54GnpBRcRkBHKakcyfvRT8ta0WYNRO-C2fLxZx8jGy3H1tl
 eddGgRM7R0KAnPiMrI>
X-ME-Received: <xmr:WXKaYqRI49H2WXS3ojvjj6a1lpgma2ZMEkYHkVhisRoS2j5CAYZnYx8wh21E8-3LcOjuncZrdzL2owNrMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigdduhedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:WXKaYvuxHAUqh9bV1Vmqq59Yy7tRr4PPwV578kYzCEvjk3YdylBDjQ>
 <xmx:WXKaYjcOx-7AO2wwcr3rEXqjUWMVLM_mfiHn0eKScO70LpxB0Of0qg>
 <xmx:WXKaYr0TIc9z1S7FXL4FCKjcujO-zMkpTO-fawtDVdPFDO8jEJOfoA>
 <xmx:WnKaYv5Tf2ERUwl3nXyDm69reqMLdELzLu5lIghVZ0EEKY49v5Fheg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 16:43:04 -0400 (EDT)
Date: Fri, 3 Jun 2022 22:43:03 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Wertenbroek Rick <rick.wertenbroek@heig-vd.ch>
Cc: "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2] hw/nvme: allow to pass a memory backend object for
 the CMB
Message-ID: <YppyVy9PDz1B/Cfn@apples>
References: <80A639CD-2E9C-4574-9557-FE61DDBE0C57@heig-vd.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OQe/4EKNavdEnSbU"
Content-Disposition: inline
In-Reply-To: <80A639CD-2E9C-4574-9557-FE61DDBE0C57@heig-vd.ch>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OQe/4EKNavdEnSbU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 19 07:20, Wertenbroek Rick wrote:
> Adds the optional -cmbdev=3D option that takes a QEMU memory backend
> -object to be used to for the CMB (Controller Memory Buffer).
> This option takes precedence over cmb_size_mb=3D if both used.
> (The size will be deduced from the memory backend option).
>=20
> Signed-off-by: Rick Wertenbroek <rick.wertenbroek@heig-vd.ch>
> ---
> hw/nvme/ctrl.c | 65 ++++++++++++++++++++++++++++++++++++++------------
> hw/nvme/nvme.h |  9 +++----
> 2 files changed, 55 insertions(+), 19 deletions(-)
>=20

This all looks reasonable enought and straight-forward. But I can't seem
to apply the patch for some reason. git is complaining about 'patch
format detection failed.' and trying to apply manually with patch I'm
getting a 'patch: **** malformed patch at line 55: }'.

Can you try to recreate the patch? Or if you can just put it in a git
repo somewhere, then I can cherry-pick it from there.

--OQe/4EKNavdEnSbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKaclUACgkQTeGvMW1P
DenMegf/UFiZjRLMnKmJYXHndf+OvXlHXinxUBhwLBe0KSkokh6a54tKaojaeEK6
KGPvCC/fDzhQv3Jc+A/2+h5JkkYZzYFuIdm4Fj28mw3xDYX/GWhZGHCYd7B1A1Vy
1jqQqszRwPcY+vZaCDRyRgTRDTjQpd9TM/brD97+13NBDn6gvi4dubcKn9czxTao
NMvQsnho0kOgcPA4ef70ixJ19DuseWroCxgJvOvxQDnasphLq1PUfEudpq1hYi5R
iuEgbBve7CjtGyxzhHjdyq8L0NP/EE8rUQ4N++MtsH9SLNsp+6vyba+p+06iR4y0
Fmi9AmydU6S31frET+V4Br1uL2gsuw==
=PXWs
-----END PGP SIGNATURE-----

--OQe/4EKNavdEnSbU--

