Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3295958E3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 12:49:05 +0200 (CEST)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNu88-0000l5-AP
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 06:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oNu64-0007H5-KB; Tue, 16 Aug 2022 06:46:56 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:41477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oNu62-0002fP-SD; Tue, 16 Aug 2022 06:46:56 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 62A653200929;
 Tue, 16 Aug 2022 06:46:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 16 Aug 2022 06:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1660646807; x=1660733207; bh=Nl
 Zd5lB0Jl69YT/6gp9AkuRlkcOz901nXi8+C4CpaqQ=; b=1RJZFyqR8Dmu72fyqo
 OIPSsR+1iMuHanO31taXJ/Q8NXEDH9zKO+Zmr4c9SZAz0ltMkjGggnoaXMRY7RKl
 f2SQJWrQWB63lTS10wGR2SmjsdexDv3Q6s+OdedJoLn6UB0S0PVJKixprOAeziyz
 +imjkJX1uYpGYXQt9BRnR30T1AwU8iB2ApcrpeUi8b2NvUE0RnnVrTtoDyLHAVou
 DmoPRlEFgkhq8vR9pW0nTDu3Nh+gFa84HEfvBD54HoSU5BWeE0mRXJGcekPmEhSV
 it+k7HRebZyvIlBaLS2P8BbAYAg8l3AC1VKTnej1DRTQ7BDXECmPqX2DAmVzx9SG
 xkOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660646807; x=1660733207; bh=NlZd5lB0Jl69YT/6gp9AkuRlkcOz
 901nXi8+C4CpaqQ=; b=WsiiqGGvxIKyVy6jQOH7cpKcC/oFgSbDSM2LqxHTANn3
 TF/O0nlLwLY2S1Ywp/xo/dSjn4j7XRtPeVlcRUCuMkSymNXl+1lyUwRjyWCuOUH0
 plzHm6mAG5RXrymA3cXFKcbps46VydNg/Ejev9OwmtcmT1xayjUg5a+bPuw9MH9r
 x6Fcel5l88y0fuxk3Q1D/V9e5cTcypVfOeoX8ybnifsQHuqa7q2XosMt8+rxp0kh
 5thPqiw2rv+vXikADArQHhklqsFhNVepMXudEN7Vr+SghNeYpZueTLBTlDbwumRT
 sQKYgBcNIICUHNgr3vZSP5Dg1QUAPWrj3LbpzmZCJw==
X-ME-Sender: <xms:lnX7Yg7HtlZphrZvB3ur7DW-k5gAzWd-aeD7Xazo9yHnAd9fgGliBA>
 <xme:lnX7Yh5xhw-mUJNW3OBmfiLD8CmA7XIwhmsiFLD9CQQE8-1MywLePYwqjKrq0sL4i
 Cv0cBqZifOYlXsKI7s>
X-ME-Received: <xmr:lnX7Yvd1VI9POlxV3FTUwRSkd_day-jEswELq1dEe3uhOzmMFqUEKIaoENEnKZ9pddZic9bWvMh5Q-JUOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:lnX7YlKQiR_fLoD1H9gChI-76M_sOYURK0LNY8YFX-Am3jKEViAVsQ>
 <xmx:lnX7YkLjF2nHrZFnwmwPtQHq3cOsLt-WnBqud_WHInTuZ4RhtY4UIw>
 <xmx:lnX7YmyrF3MwkE2nJNUgMOyB3bEHe0owkeJXFxngxsaT4QoUHoUzJw>
 <xmx:l3X7YpGzDb1ObDCYzAMsasaeNlRw-4h4_NhMg0QPJdRJI-HsPaNeqQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 06:46:45 -0400 (EDT)
Date: Tue, 16 Aug 2022 12:46:43 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH 4/4] hw/nvme: add MSI-x mask handlers for irqfd
Message-ID: <Yvt1k5X6Gu0xW3Lg@apples>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
 <20220811153739.3079672-5-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lC8sYTtQGfFaWs+6"
Content-Disposition: inline
In-Reply-To: <20220811153739.3079672-5-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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


--lC8sYTtQGfFaWs+6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 11 23:37, Jinhao Fan wrote:
> When irqfd is enabled, we bypass QEMU's irq emulation and let KVM to
> directly assert the irq. However, KVM is not aware of the device's MSI-x
> masking status. Add MSI-x mask bookkeeping in NVMe emulation and
> detach the corresponding irqfd when the certain vector is masked.
>=20

Did qtest work out for you for testing? If so, it would be nice to add a
simple test case as well.

--lC8sYTtQGfFaWs+6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmL7dY8ACgkQTeGvMW1P
DelNoggAnSV4Zk1y0zmwqAZyuScnjJfWXDoqSDzw5UHp3O8qRqG6Nw/mSsevMbxj
oIt7sxxaj8awb+MrsSo3hSc9ToyPSH/6jsyUJNlssAGhorPy/4io21z+0gf4BJhI
K/z938dEbVewX5kplNm2r0epjOcLRxpGwioqrDmEpEBUlstDRA7NfO1IGQCrj+Fu
eQMUbGHm24xLTfWhqw8OWG3r8hQ0ivY7hv2K5MqjkmnYvQxEPT4LFaJBc7pdSXFp
dwLj/RkRC+96irrv/Gbr6i/AElMQmzEeSPFSUQgZKEiDKRdpKQKraJrRe4iZdZ5O
lCCBXytRC27rcxKWJ/ecT71YzQNooQ==
=wGeR
-----END PGP SIGNATURE-----

--lC8sYTtQGfFaWs+6--

