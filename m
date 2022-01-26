Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1249C5EB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:13:00 +0100 (CET)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCeMN-000466-1c
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:12:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nCeF0-0000e2-9s; Wed, 26 Jan 2022 04:05:22 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nCeEy-0006Fr-Ia; Wed, 26 Jan 2022 04:05:21 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 84AB73200B25;
 Wed, 26 Jan 2022 04:05:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 26 Jan 2022 04:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=tZRcjw+lpi8vmm2v85AmnuohCjGt2e
 tF2WGLC6wOOwI=; b=g9kh3Utj2u6ZLQuz+ED3Cd5SNODOdvbNjQ73aoNET4piqU
 DQVERBr9HfL0cudcCX2twtr+krhhTZ8uyVWcp0YQdoBf1TQ4Y55kw48oBpYE9Vpe
 zx3skfDuk0zFc2hXN37ZKQ4/Mg2rpfNcOlUZn/I9rZYL5ozKqjVDXpAZDK559+LI
 Kq+V5iOiALTiOzQqpHuCq/77wgEBD66cqTLhQoY2GVoiZn59bb0s3fnafrvcVpf0
 3hIdD2Np+9e62hZWVWhvaMvSexRLrDxGlmJEDCLFbQ2JcKIoGaXDQPN8g+uZTYo7
 rB6vu6Z8tgbPOTyQ7eLK1FYa4qsgo3ZuF9pYsWgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tZRcjw+lpi8vmm2v8
 5AmnuohCjGt2etF2WGLC6wOOwI=; b=CywpSQJtinjD4MV/Dxx+3D4ka+BvDUBVd
 2Vt2IBuq4oMhsYw5lMmo6J92gkHlLFvUr1IkEodYhoFf+m9muEIPRa8grj10FOx2
 J4RHucyn6a//cbdpB8MpDvQyjEtaQs2JP1kzsp7FdCPbjRqH+jpqu9Wb7spJLJPr
 QuZpl6kQTlpcyhKt/E5BLtzR2E7KkeuZZwdfkXKMRkPfhBEEUD/iDL0hCOTPZmV5
 IxWAZXFOGx0RAIO09gCYR6N0Jre7cTw9cR31OK5uM+77lFGcQK8pN9N1wVhp3CBi
 CvfkOsqEwH7EL2YeHvfULw4O7FCwQJjHsqlOt/2t52mLDjRKDEjeQ==
X-ME-Sender: <xms:zQ7xYSC3jWb41va3hTmkUuWmPetlmgFElfwZZasiOwN4Um2o3rp6aw>
 <xme:zQ7xYcjUU9bjdH5tTvlN7FuIbFCM_N8f80X8uXV_dIEuql833a-XE6tcExPap_rE-
 3hl8r0Zm9AvrahU67U>
X-ME-Received: <xmr:zQ7xYVmhnSI8C9QGrDRH4vF8gZ6zWeX8RIT29T1kMzN1tGpDvAzVpBc0nzyU5CCTMbSuWnBda6sKglps6X4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfedtgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedugeefveegfeduhfeuledugfeufeetheeuhfeuffejgeelgffgtdeffeduvddt
 veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:zQ7xYQwVA42cH-C5XY3QPjSU5h0SZ-K8u2iGXt-11LvxkmMhshosOQ>
 <xmx:zQ7xYXSCjNrkauxAQH6YqQutaRFMlb6TelL4gLU7dWBaRWl5Lm6u8g>
 <xmx:zQ7xYbZf3qbI32vzlxbcQuwKYlywk7cYyg5n5FIl_tur_SkPhtyC4A>
 <xmx:zg7xYRfGEmWhxS_kJYByGA8TAh8N6FlHwPYQfTe1Lj_D0AqZKyDAaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jan 2022 04:05:16 -0500 (EST)
Date: Wed, 26 Jan 2022 10:05:15 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-7.0 0/2] hw/nvme/ctrl: Buffer types cleanups
Message-ID: <YfEOy0x3w1acGcX+@apples>
References: <20211111154552.2263410-1-philmd@redhat.com>
 <YY1cQEvB+YK1VA01@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="smiAT9bUD044qw5g"
Content-Disposition: inline
In-Reply-To: <YY1cQEvB+YK1VA01@apples.localdomain>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--smiAT9bUD044qw5g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 11 19:09, Klaus Jensen wrote:
> On Nov 11 16:45, Philippe Mathieu-Daud=C3=A9 wrote:
> > Some trivial notes I took while reviewing CVE-2021-3947:
> > https://lore.kernel.org/qemu-devel/20211111153125.2258176-1-philmd@redh=
at.com/
> >=20
> > Based-on: <20211111153125.2258176-1-philmd@redhat.com>
> >=20
> > *** BLURB HERE ***
> >=20
> > Philippe Mathieu-Daud=C3=A9 (2):
> >   hw/nvme/ctrl: Have nvme_addr_write() take const buffer
> >   hw/nvme/ctrl: Pass buffers as 'void *' types
> >=20
> >  hw/nvme/nvme.h |  4 ++--
> >  hw/nvme/ctrl.c | 12 ++++++------
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> >=20
>=20
> Thanks Philippe, LGTM.
>=20
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

Applied to nvme-next. Thanks!

--smiAT9bUD044qw5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmHxDskACgkQTeGvMW1P
DemV9wf9H/oCgB973adzlUskmTW9C2uI9N8AExTyy7RrXhFqdk6x8NOC9+pGTi51
INKzWAIeDVuAjUKK0SjAkO951Io5WsmE/XnVIztGve3gx55GCRrG70jBg1q6eNRc
KQQkEdH/rTMTbi4+dNKUip4mA42Dnuz44yWDr5C2y5u/T3nr0LmjwWoXlCWcF7P2
+PIm9VlrWhZYs7vl1g5Z0KGQJ+jrHxBxQ4laz/nrLlCCXScimoDSAYb1v3m7vRb/
NB/vrKOkC3rBEUyPGyPb4k7BAFOAAPbs8bdVqdI2sfOGrYxbGCrlSocOpahyE1MI
iNQNkXbZRlZRGZ6Ij//xBXkVPGso8w==
=CIfv
-----END PGP SIGNATURE-----

--smiAT9bUD044qw5g--

