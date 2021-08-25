Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA33F74CF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 14:08:39 +0200 (CEST)
Received: from localhost ([::1]:44896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIrht-0003bv-9r
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 08:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIrXC-0002AO-09; Wed, 25 Aug 2021 07:57:35 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIrX7-0002sM-AB; Wed, 25 Aug 2021 07:57:31 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 04F453200ADC;
 Wed, 25 Aug 2021 07:57:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 25 Aug 2021 07:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Z1xTbmfE/RR1d1anKDikYmkMJ0A
 zjqksCHi6mUmro7A=; b=VqDfS+r03sLGxFTc5qyrzSZ1ZVrkB5V1nOSmfy/sKw9
 p4CYqR3gr/1JXaFGwHaL77bGn79OE4NdMLUsAgr0bp+fUICaSKFmbAkTXYkn5cTi
 x9hcXJMa70yoZnUEefKQjqeWl56I0ABRlrWqQHPA9yHuIKhXPJOcBJz0TyP2kp8C
 KNovmwTUEY495OZTG+F5DtnyDr+qJYcDNxnPxmXX4K74iLFTd/UOK9+UD7WfPkce
 tZlQmuhEjp+fX9mUWYpECoU72W0A7wu/Saq2ZNsEM6DOukiDx6eL2riWq8n5aOxV
 YY9RdiMhyBwRWk2EzxBWGo6qWDwNA6waR7h47VmNslg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Z1xTbm
 fE/RR1d1anKDikYmkMJ0AzjqksCHi6mUmro7A=; b=S+EvfO2NqtE7iIWuC89ye1
 VhMcr375L0hrTUpUa2aEmRToYOO32023Zq74gkx9+63fUYMoBJVCIOQw1dQQseSD
 ArUq+OKrV4VG4if502SpPzpPlB6VJIYNyAQUyogOx9KDykSuSSceWDS5AK6OVj6C
 eEUDMTbNIEGlyTcvtQc1OCw3RiJU84fFIG/Y4oVG+nk9IrjmMqcbGKf0coek/9TE
 LdF0QIgF1A3KhAK7oZ2++4M6HMs/cSaJotBr42T+unLrv+mmvrggIEjD2GCT4JQL
 jON1G+B+e12ZgqlKnRfNfMzsrZEHq957/5OYE4s6dpnyMgxRq3gbxGAPRG4tJU9Q
 ==
X-ME-Sender: <xms:JTAmYfqFbZJhZ-vzCLHXcCyQ4-HeU1dzNmJnFKtiIPvqIs3tmWZmrg>
 <xme:JTAmYZrDblVvXDr1IEspG_MrQ48X0RVxblB7Up-yo0RzonffcnGTsmFQen7nwhhIP
 LVB2L0Cg34ykBD-lEU>
X-ME-Received: <xmr:JTAmYcP8Pbks7mg3tadbYZytRO7bPPIYqU3OBkoRqrFoAXCyQV8NnWrnZWaDMR5NMlL8Iq5d4f4lXW9IH3_zjYv1wyFaYUKiRm8oMfStO3vpeviMoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtledggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:JTAmYS49I_MdBJ-kFToruJ4jHNrAZtRuhUYnTl_LASUCTxqO15rekg>
 <xmx:JTAmYe4kpLVoHqkccLJ3kSBYoULQj_RZ-hcFocrYpFXMPKFT_sZcDQ>
 <xmx:JTAmYagpYMCZUOf_47fsDPIosjnyc4iHHcV7yM9zmonzHbXVezomng>
 <xmx:JjAmYVZo2OI3W51yTcZO7Kja1jXwJNbOgKGp1Y7dL8Sg3v3JeVOEIw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 07:57:24 -0400 (EDT)
Date: Wed, 25 Aug 2021 13:57:22 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 4/9] util/vfio-helpers: Replace qemu_mutex_lock() calls
 with QEMU_LOCK_GUARD
Message-ID: <YSYwIifdLOpKq5gI@apples.localdomain>
References: <20210824141142.1165291-1-philmd@redhat.com>
 <20210824141142.1165291-5-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lbWu0WcVS0gGVYaE"
Content-Disposition: inline
In-Reply-To: <20210824141142.1165291-5-philmd@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lbWu0WcVS0gGVYaE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 24 16:11, Philippe Mathieu-Daud=C3=A9 wrote:
> Simplify qemu_vfio_dma_[un]map() handlers by replacing a pair of
> qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
> macro.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--lbWu0WcVS0gGVYaE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEmMCAACgkQTeGvMW1P
Dem+jAf/S7KUVHBypKGkZ8gMlJk4pmw4wxWLZnRmFtxIJ8fkXSdtPTDYMUq2hGhG
JCSQpy8NgjlKX68qhYB4iyIu+4yiSp67VdDXWPYJXGs3Si60wougthoCcx9hE9Qb
HmdBFeJN1Ieq8DdqFiFMabe3GmZTQ7fj35UyE6Q6O5qDXMr1eOPi3L3yEO4QP7cS
NuhbGeUDW8/i23yn7oyKmTLSnYo1NwSuU/L0Ix61EMGnUqmKYZDtOmL09kIi+FhA
IMpu63kA/e9hfSYiQAO3Gr9tDFdfqgjlgHdJVqXgNDUxPpuEjt+ICltVlqcgCK+e
CMgSPqnzkLxUG00g2uRgMg7Mimbjkw==
=fLSY
-----END PGP SIGNATURE-----

--lbWu0WcVS0gGVYaE--

