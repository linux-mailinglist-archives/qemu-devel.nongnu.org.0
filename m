Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC1A622BC9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:43:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oskPq-00050x-Ih; Wed, 09 Nov 2022 07:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oskPe-0004wj-OM; Wed, 09 Nov 2022 07:42:40 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oskP7-00060B-Ie; Wed, 09 Nov 2022 07:42:16 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 998DF3200A24;
 Wed,  9 Nov 2022 07:41:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 09 Nov 2022 07:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1667997719; x=1668084119; bh=AY
 bLPLHAgDWYXlCl+oLBrkS3fGo4h8RCS+l76lL8ObU=; b=fsZmbyT9uwUI0LqG3i
 XKLaEE2r2rUcBYd+R8hCPN2+6HTQ6hMF4pWRX91zm1kYgeB2q4WoPEHFgy7AmcwQ
 2DbJI8gd6iVIbiwMFQQ2XeW/8DDadQUvLxOjkMWQ/43E8KpKvdf5AtyDDzig7GCT
 kGaMd7Buwnw6BIziAR/Ocnr6dNj+A5RlxgTLZDha7HvFYpwnSHk0Udw8lGhpmo8A
 gdTQCegmc1ifv4JIEJyeQdmp4ynmHjISnhOmP0RHL30e4MJftx2E3iRViIS2dThd
 RsragSbIJN0d1etSFma8UIsGZIlPfsGlBFX41HcQM2PVmYdIVMwUtBP9vl5JOIW1
 4aTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667997719; x=1668084119; bh=AYbLPLHAgDWYXlCl+oLBrkS3fGo4
 h8RCS+l76lL8ObU=; b=S5/ZvbTrZz3o8DfQijykNsSoTIDCCPAhATElsE5KfhWR
 e7vN4sOn6Smk/iBJHdf86EK9hSv7EymRblznVbv9Y9z3pH4471khr1YOm7JOeJbq
 I2qihavY4p/JLKuz8KDrBMYnznBGhSMFrm4R+36v4vJ901OC+UwxJ3rQgmaDHEQu
 VhJ06JKPQgEWWPs8QAHs2zq2mz6aHBoCll7GVlo0sUsSlmzro+v1B/cR0pOIOtn2
 kd7PxynUYgDcM+S+8Nx30zBZd1b+8cLVkMudL30sjGJYNF3SNu/TDuo4U4g19RSU
 8lMS8I/v4DCvIb1fHM0+Sagxg4hT3x9UzWjw/YZW4Q==
X-ME-Sender: <xms:F6BrY9kUWYFrRCwZoazMJY86SdJ3QuQ7aWqnAo-XfkzU8x1r9Ci8rA>
 <xme:F6BrY43yqsn1FXrn9jUDYDauLFQKCqbZmTX99eJXAzUDLphJmfoufIMD3Dd4LwVna
 s4DiTMEtSQ9pgKUkB0>
X-ME-Received: <xmr:F6BrYzpMEEuVyaS7zPH0vCI_3ezXhJh1e70C0iL-QkDhhodf8nRfUmeN3uNchYmln9E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhjefggfegveekvdeukedtleelteeuffehieegudetffdukedvkeetkeeltdfg
 ieenucffohhmrghinhepqhguvghvrdhiugenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:F6BrY9n8x3AnkTy1d98A0gYjq1VfCe0HJLmTDZdkQlFoFdpRBgVi4g>
 <xmx:F6BrY71ioTTbsHOq282o-QUbGVeWlNegsvBKLOarbOQwkEsjkmhriQ>
 <xmx:F6BrY8t0j9QDJPCuaQVDImFTsQARWihXfa19uc1Vf0s7d-qW_iPgNw>
 <xmx:F6BrY2QmwNDhh3DPbL3_V3L36eebSAeRgCO6aN0MSRc-mXn_xnSI_A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 07:41:57 -0500 (EST)
Date: Wed, 9 Nov 2022 13:41:56 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 1/2] hw/nvme: fix incorrect use of errp/local_err
Message-ID: <Y2ugFFtUF7EVHXaG@cormorant.local>
References: <20221109105357.30430-1-its@irrelevant.dk>
 <20221109105357.30430-2-its@irrelevant.dk>
 <87a650nw2i.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2efYA3PeghKFl3pB"
Content-Disposition: inline
In-Reply-To: <87a650nw2i.fsf@pond.sub.org>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--2efYA3PeghKFl3pB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  9 13:36, Markus Armbruster wrote:
> Klaus Jensen <its@irrelevant.dk> writes:
>=20
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Make nvme_check_constraints() return an int and fix incorrect use of
> > errp/local_err.
> >
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> One more question: what exactly do you mean by "incorrect use of
> errp/local_err"?  Is it incorrect in the sense of "behaves badly", or
> merely in the sense of "doesn't use the Error API the way it wants to be
> used"?
>=20

It's the last hunk of the patch:

@@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **=
errp)
               &pci_dev->qdev, n->parent_obj.qdev.id);

     if (nvme_init_subsys(n, errp)) {
-        error_propagate(errp, local_err);
         return;
     }

It propagates local_err (and it's NULL here).

And the bug is a consequence of the error-prone use of an unneeded local
error value.

--2efYA3PeghKFl3pB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNroBQACgkQTeGvMW1P
Dek6Bwf9HmavPTyC+BVT41i0fLxOtpZCHdAMiT4qPUzqHxqaBsB8UpHfDv6+IrS4
XrbedlybdgOAth5s4Sx/6IzdSYGjpzBcLB9Z+YLnULVr7yaNgjqqk6qRvGa6Iye8
lSebEUHIzkDWo/hH2wUAst9Ez1sUJlRyZ7ytBhZb46qwOdR1xd3upxt05dMfLwHA
Icu3LGm4iJrV9aBQQqL0xBkFUxkGaBbFHMHEHMQMqaAZrDhxlWqKsZojPhhzxP1I
uw0UL/xQXWwCgCRC7/Y57F3k5rX2XWvwD6w1Gx9voITF4uvCaBgS09ESHuEwZXrW
JKL7gc/XcO25SwCEXDIn0SwSP/bJrQ==
=P/8w
-----END PGP SIGNATURE-----

--2efYA3PeghKFl3pB--

