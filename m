Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999DA673223
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:07:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIP0w-0002Hs-Lx; Thu, 19 Jan 2023 02:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pIP0c-0001x3-QG; Thu, 19 Jan 2023 02:06:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pIP0a-0000uC-Tq; Thu, 19 Jan 2023 02:06:50 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 941095C00B3;
 Thu, 19 Jan 2023 02:06:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 19 Jan 2023 02:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1674112007; x=1674198407; bh=Oc
 oDLf5RDdyXP/ajFZeKz6pwxOwzzaAjKC8MCDMKbmM=; b=EoKMmNF49pksSpeDZo
 yC5mLjS3v3F/fSKLYgbsonC428pgp/LZvH/O6FRoe1PnU7lr07aKAECAcqqjdOLN
 5V4YR0J2lz55uPZCeu90vFWFkI4egIG4//qnUA5V5kHbkLKPrHbpqahbQc4pdzUj
 uOe2rl2MkL3sPUbvMANA+DAKXP0ceODWOnqi3rasCFpWBajwWjf5TgAxmah/E5ce
 PIlI4RCVlWvWeXNfV54bkvPuKYVq66flAudxZwgmriX+DiocFg5H8+mKcAzQZal5
 pVmoQDmWhPT8SzOW5/7RB1audfAFXnhPWqnIRYDGc4IxN4+FMFUqj+Z6Ca6Otifd
 Ta5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674112007; x=1674198407; bh=OcoDLf5RDdyXP/ajFZeKz6pwxOwz
 zaAjKC8MCDMKbmM=; b=A/GiNUgVJ6xVp03h/yfpZV8qXi1Xqbx3oQjldHAvk4Ww
 KdhlRoGlgoMDqEKLA3QF9yexB7MxLVHRG9paCiHAfN3JlAKHCCnjBoFYBoTKUb/G
 tQWTERTatDDU4vjDzP2ff1lP5C24kkWUI1odyoQalc1Rc130rJlplAA7rOgasuAS
 jtXXE6TanaW5OgcHQHJ+7W3MmRbjLHEh045ZBdnGAhctTzh9MCPc7ZuDuDKXHh1l
 F/Zgmrr1XwGtTtFKVbPjt12132kGABre6lFEehyQHFvwGhfpEx16H0hbuQZXl8yr
 f+eSjLYLJQr7QvQjlnR3eR72Mn/G9P2H3PvqDf8Rag==
X-ME-Sender: <xms:BuzIY4uZYCvBJdUZiCZhCPZJz7HAyTAxBdhu9Xv5jN_ByhY2vD5uMw>
 <xme:BuzIY1deLqDy6T1G7LirAQg9H26mL2Wy_rStvrNAYvLjospFiXz7UiBcdEdt2iHm5
 v_MbTDFAiTgadWCO88>
X-ME-Received: <xmr:BuzIYzytFD4psFiOpGcJVJfEQ-th8ByxW1k1O047sHaWprLKucGzReSyJ5hzKdBl18Ge7pg1I5N5QR6NPD-BvpO7JTfuiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:BuzIY7MWpQIQXmDs64OqJ2OsAsqZpYz1in7RLoMQJ9fanK4uLH9p4g>
 <xmx:BuzIY49A99WlYUjYCDrenEPwspfZ1BUv78iXQu0nnVyRPadkS3EOUA>
 <xmx:BuzIYzWTAUXYcwhwkx0Zx0J2rJVYfj1Kc9zMGJuKw4sBB3pTtoDwvg>
 <xmx:B-zIY1MsWFq517nTzFdwEdSjOB9grSRsFvOpS6RzG5QDvO41gx-h0A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 02:06:45 -0500 (EST)
Date: Thu, 19 Jan 2023 08:06:43 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8jsA0eJPtiB6Bc/@cormorant.local>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8hyFcsYbvLOQ+XJ@kbusch-mbp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DvSWeJSDSDxLn1H0"
Content-Disposition: inline
In-Reply-To: <Y8hyFcsYbvLOQ+XJ@kbusch-mbp>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--DvSWeJSDSDxLn1H0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 15:26, Keith Busch wrote:
> Klaus,
>=20
> This isn't going to help your issue, but there are at least two legacy
> irq bugs in the nvme qemu implementation.
>=20
> 1. The admin queue breaks if start with legacy and later initialize
> msix.
>=20

Hmm. Interesting that we have not encountered this before - is this
because the kernel will enable MSI-X early and use it for the admin
queue immediately?

> 2. The legacy vector is shared among all queues, but it's being
> deasserted when the first queue's doorbell makes it empty. It should
> remain enabled if any cq is non-empty.

I was certain that we fixed this already in commit 83d7ed5c570
("hw/nvme: fix pin-based interrupt behavior (again)")...

--DvSWeJSDSDxLn1H0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPI7AIACgkQTeGvMW1P
Dem3dQgAgtGVD7khXGAEi6BDE6dbp4x8OegdPyeQhaYcIXF0eU52eVH84pLiA90r
YgxBGlD8Pyq8/EJz/cCii98sTjr5dQQZaIET2JrkGhAV4zCTe+HGICYiABgK0mxV
A3kKZ5ZBzZUHjlB9Lz04ir6AkRrAUZGOBMF0xuc2uBHE40LRfJfUg1Hv4hbWLTRM
pELOpavQhgbQr1ToITMJCdWSmIEQSK8hN6hVIlFTe/KCacFOv2tqYYeGg3Viqt4j
1+sFq+DA4UGiI6FjF+r8TIeEozq3+5bYP0KPlLvfA7974sJWQUW6wMF9rXulIIlD
EtAYtCkM8yYrRLovwD46LJCYEhAqCQ==
=kBIv
-----END PGP SIGNATURE-----

--DvSWeJSDSDxLn1H0--

