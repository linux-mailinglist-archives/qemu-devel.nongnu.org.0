Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D4E6E59B3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 08:52:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pofC1-00065g-3L; Tue, 18 Apr 2023 02:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pofBy-00064r-D6; Tue, 18 Apr 2023 02:51:54 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pofBw-0005pj-R1; Tue, 18 Apr 2023 02:51:54 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0EB1C5C01C4;
 Tue, 18 Apr 2023 02:51:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 18 Apr 2023 02:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1681800711; x=
 1681887111; bh=gSQ/FjJ0MeZChCSw+3oF594fKT/JQPa8T7zF7EJQrkE=; b=j
 TjIZ4JWsI3+s3bhc0CAehrq5f0iOVH+wPYLeEy9eKd43J8Vb1ALXKpgHKeaJVOMa
 EF+f6ZT3KU6tg/J791syO6OdqlWyaqk1VUVvYaZ3HC9qqfOZS2x9OOp2mfMWDnMe
 pYuxAgwZxRDzBzzRRMLA/ec1Lq19Z5F1W6hkaENuQjkYSyXrwNRN6v0BeD61nyL6
 b1zFX/TwYwxSnhCOz/7pocAkYMiK65b+QhIC3L3Uzcm8yz924/c0k2MDPRWlPooN
 wsw62XZdNTzBqwZW+77Mqr5x80PB66CVew3Oc4bUhDlP3TZgZnkHoSP1uF6NVQXJ
 1f54zLZCvcHpq5BCTDJOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681800711; x=1681887111; bh=gSQ/FjJ0MeZCh
 CSw+3oF594fKT/JQPa8T7zF7EJQrkE=; b=HAe6O+MC77+Z95ka5UgGyAcohxbBs
 N061jTU75Ug1eMrZkYuTVcyAHvF9+1zZ2E69Y78pjpeZU4Y0SWbU5o/2kWHc8ntS
 dZ7o7t8G9D/801t4PBOHjp5lpnfdX9k9JpUyi7NQfimlQ9P/DVB7PATyD5rw9uaO
 gnhXh63GMUgMhgA0vEHyN0dELDgHeDwJ/1J0XB1Uo4p7b0d1MHEQVmbcsMViUg9K
 NkZZs3UD1kPZXZDaK3GEyiGMnohErS/RRVKl61hkoA8z56xLYA35F8QCzbd+QmOv
 jbMRl1GVEmArlHV5sFmk66hbt678gIT8GVZirbgeARDz+rrc0ce8Q8bbw==
X-ME-Sender: <xms:Bj4-ZBS7cIuibvFkQ12n0JwjQTI2Yj9AcJBQw-52Pe9e_TDtQrtkqQ>
 <xme:Bj4-ZKy7eb3b5jmbuVZfAdtdKqfxZlQmX5svT_DxWvQRtlRZwJbpia77qNfOnwusX
 OkOQV5XamstEHUusrk>
X-ME-Received: <xmr:Bj4-ZG3IYS3QGs_dI77760hQO3oifNifcvn-jrcVjrKyuXjx058GShzClyXphxN1xRz43n0E9rJB9bN97PXL3PZ5y4UQz1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeljedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Bj4-ZJCwE7zZ_TsxRCxo3vT2D8mEy3gIt9Ry54RVDP1RrfPRyaAY9w>
 <xmx:Bj4-ZKhRB6Zkzy7F1RR9JFEMJhmMfZj_ztkuD8EcaYXQi054932VRQ>
 <xmx:Bj4-ZNpQQbzAleD3v5MhSS_eUVxVRprxbTfBbJqtD3EQHZI1Q-JFOQ>
 <xmx:Bz4-ZLs3zdBnMjvqf4yZXudWriiB69CXPWlKCzFdlwoKTqjWJYj0TQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Apr 2023 02:51:49 -0400 (EDT)
Date: Tue, 18 Apr 2023 08:51:48 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RESEND 0/2] hw/nvme: COPY fixes
Message-ID: <ZD4+BFK8BeQ7I19y@cormorant.local>
References: <20230418002622.29819-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bLXppULvL9N1bNCJ"
Content-Disposition: inline
In-Reply-To: <20230418002622.29819-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--bLXppULvL9N1bNCJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 18 09:26, Minwoo Im wrote:
> Fix status code overwritten issue in the COPY command and a trivial
> patch to check the Maximum Copy Length (MCL) for COPY command.
>=20
> Minwoo Im (2):
>   hw/nvme: consider COPY command in nvme_aio_err
>   hw/nvme: check maximum copy length (MCL) for COPY
>=20
>  hw/nvme/ctrl.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> --=20
> 2.34.1
>=20

Thanks,

Applied to nvme-next!

--bLXppULvL9N1bNCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmQ+PgQACgkQTeGvMW1P
Dek6kQf/V0QF6cM31csirzCQYyAeiNw9RcWt3Ub/qEUDRNsDvJrQAbCawDnsZQPI
5yWUQQqXvCrmpMvmI6Pp00wCnAE4/1zWNX3v666IVzkuJk2wJTnhDBXlAnK00Dx7
fM6nECEl1GQwZADcYHzxP//epWP8KRH4FyjnArdiVZzh6phGiC4YKqeIyXFX29kr
JGTAgoeUWvT8JlAeWLIcf/pEheNrzcAFfn36rNdAsk20Qneq3Iz+6mfJ3BWmbFHU
IfEMcNeM6xKUAZWhDo0OJ5Y/EP7ZmTJwbrFBgxSBQXRWFWPLM24/d+pox4Vj62Rx
9t8cg7qv2OPSNC+4LqgQ4MI8L+ZzCQ==
=YOct
-----END PGP SIGNATURE-----

--bLXppULvL9N1bNCJ--

