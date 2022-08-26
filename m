Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF75A2361
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 10:43:29 +0200 (CEST)
Received: from localhost ([::1]:60386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRUw3-0004xG-F9
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 04:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oRUu7-0003VU-Vy
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:41:28 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oRUu5-00038H-5f
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:41:27 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2D05432000CC;
 Fri, 26 Aug 2022 04:41:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 26 Aug 2022 04:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661503281; x=1661589681; bh=KE
 6P8QDBB97dIDnpQt8a8dyo+vW41EInC7C4NUDv5Xs=; b=dlOWcKDDAaYWpRKxbG
 BDWZ5NHHLjuY864tnr/3sssPXLd7dbJTCHJkj3abVIWbdkYh6o51OZW4Zoj0p3Qc
 uXUuLudWPAOkkfhEt4FdHOmaYmmP0ZoJQnUFLj0FyXV3AgHOrUB5ytGS7CjuXh6g
 7sInKGVLZnIlMw9zVlr7ebKpoIMo1mY8sKN5Kal5zdh0lWYeelSH36sUybePUs0t
 lrxLGyzzCLDsEt/gAJITJ1ClNvvozScmY3W2vGGPKxGWQaX+KSNU53nU6pfU8ILe
 cAqZ3plrBPNMHxcDZIw+Z4z5Xlw2iIeRiAyMUgd3rZTmvztP262wFtKJNvh/jECJ
 vmLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661503281; x=1661589681; bh=KE6P8QDBB97dIDnpQt8a8dyo+vW4
 1EInC7C4NUDv5Xs=; b=Kt7nGQH9kAffvXjeCVET0b/3xqiBtLlb5CKke+gs6k90
 oXKBqQJc+qQw20Yw6OLsUaMv3ptDdakWM49SmIMHo2GsvlwqeAQuUNnLClBCNru3
 VtR6OV6qlnElpONtS+5B87uBeROeQ0+rxMERyeU0hs/Olr8yYE2wdTDmCOdpteeM
 DagDiKYTTW7otZr/YQ2LwALymXEfaYN+stLPBfXVndr/rhcQ/oiGE8IFbf1ljxkw
 dpPRzPwleFMrCTEv4t1F8XPCInEmGt3/1oxlR5gv7Z43GcGHphbsik4EHfWyIWz4
 OBg4juCfIFZPyPhJaD8r9ghoiVoBj1JsDIGW4LZjbA==
X-ME-Sender: <xms:MYcIY3E5qVwoypqdWbun7MWTKvsF4qmmEzv1NJZvXbEowm8zEzRv4A>
 <xme:MYcIY0UXy7fNjt_r0sQp3NXl3ihn2cGjo11DMHTFScbwQqC3TUs1Ko5oHz3CjJ8Z2
 MlhEk_XQKt62houkIc>
X-ME-Received: <xmr:MYcIY5I-XfmyPtEyTIc9UzTNtVsW0Z5PWflMss3yFHetche4UW_9MOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:MYcIY1E8ZoJ-mqIO4QY-M8n2Tp1zXLQdbIAr4m8y_51sNVRnY-N1MA>
 <xmx:MYcIY9U4qHTCW_B1FAWWPYbha7Q_HsiGeDISsjg_kav_cTqU9fN77Q>
 <xmx:MYcIYwMt8mnRVIuTo2jXXzQvq-wc78S_iPxe78qR1yLYYMe-enZmhg>
 <xmx:MYcIY6irj8M0RorUCBEeAk47xKge4w_6ZI1FuwPYjr33aWLKsH3aiQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 04:41:20 -0400 (EDT)
Date: Fri, 26 Aug 2022 10:41:18 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH] hw/nvme: Add iothread support
Message-ID: <YwiHLmblNk6+HL/F@apples>
References: <YwhyG3JktHitinMW@apples>
 <912375DB-4A24-4032-9607-006521FBA1E3@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OaFhBQ72lt+ZmpJi"
Content-Disposition: inline
In-Reply-To: <912375DB-4A24-4032-9607-006521FBA1E3@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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


--OaFhBQ72lt+ZmpJi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 16:15, Jinhao Fan wrote:
> Sure. I=E2=80=99ve already reworked this iothread patch upon the new irqfd
> patch. I think I can post a v2 patch today. Do you mean I include
> irqfd v3 in the new iothread patch series?
>=20

Yes, please include irqfd-v3 in the series.

--OaFhBQ72lt+ZmpJi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMIhy0ACgkQTeGvMW1P
DelQJwgAkJ93LG58YpuFJwXFpC4aNXmqdPhe1tQZKOJDuJyop3rnEYaveftXisLu
8OjyV/JdbfXj2yLFgf3vkGtYa95VNG09fjsyB6Pn44SfJq+dzICdS4v7/r8XCdOT
siRfDoiRTgKOsyrVjD52Vn7TnBRT4OWmBSkdchVl74oSlUd3N9lXKhLVsfpBYask
2bAhoY9sOWhMmLMaxHMd7dxBksmZ/JGe1KZBOwg+zwRLCVdvCAhFB4FG0/Y2IRKl
2ASzccLBe+6wqy7LGh3T+vtoQD1vUTioDT3hqcTBfZKdWFw+nDRPmwedmpVJRcqT
H6IwwBc4pk6NTpsaLfiin5UfS/a0ZA==
=JXfR
-----END PGP SIGNATURE-----

--OaFhBQ72lt+ZmpJi--

