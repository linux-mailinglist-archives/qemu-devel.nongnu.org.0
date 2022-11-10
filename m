Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA45F624D6A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 23:04:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otFdH-0006cv-Dr; Thu, 10 Nov 2022 17:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otFdF-0006ci-Cj; Thu, 10 Nov 2022 17:02:45 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otFd4-0004Vj-5D; Thu, 10 Nov 2022 17:02:45 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 816FC5C00FB;
 Thu, 10 Nov 2022 17:02:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 17:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668117752; x=1668204152; bh=so
 I9meYorrmY9KmLIoVm00y6412ezaOIE/TPZpbYxCs=; b=psOJo6Fq76srgWv65s
 6jqL3FTRsgJfeZiXMVkN34I2Nl2D9PIGcow1yTsRDK/+J/ku1Lt1Bx282tLcH+3d
 a8nqTJVqmLr8v6pW/OL+++xjCpGoUwu639FQnPpvjohqUuaYpA1b+kBd6KclM9xz
 LXZyZsiI40NYqogbo//owc/yS/mHu7OkcFIzjPHriuyYDeMHconDQzWp4CSgWxl4
 J+eqsKFUmMQQ+8bvyh05e6ux60flLM7fHyQLvMQWBypGVHkswNpnidPXWpPUun3j
 0XNaG9nYnG9r7HU777hNBVSpPHDzgW8I5NhHlBeEF7vKsciXWss/lfbfiUdWY/4g
 t6GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668117752; x=1668204152; bh=soI9meYorrmY9KmLIoVm00y6412e
 zaOIE/TPZpbYxCs=; b=llU2Rfp0TnSjaPYyS9BCqBkt3NNZWXa+73nuyH3rBoh1
 AzYNWo5EC4210TF91s+2iMxpa7qSuIV1Vrol6Ta4C7nS8N+llGZ1vci5xPRDEhIY
 X7ISgv7BiknG3axaijhlfRbDKNmqLG3BT/C/cfkWqe/U8s/uL3liz/snzgWQ4uMA
 VfkTRqo0FgxVFRz7KDxeJDYXLy45OR+Pk5PqpB6ZeGGEX17gxY9OXVYE9r0iU6aE
 qd3Q/35HXZO75UM/7lN/EujiCnvpDDEfEywlV7VgdoJMn9um6oTjhCcWkt48JFSP
 PuEg+7bNcS736qgPw7BB4yeUBhQWg1eGZnIimjIcfQ==
X-ME-Sender: <xms:93RtY_0l9416jYyopdnHcySuEMAoRjjwh9C6aXq4yuU3GXm2nX_OWQ>
 <xme:93RtY-GWjjEGZHh_3-oqG3DEuPPiGmcJeD10hxg7EIWTrY7sIuaV2NkxLC7RATPp4
 0hfX6vC_rtm-vV4Ozw>
X-ME-Received: <xmr:93RtY_67EGKtge5Dz8p4ttXKKlgIyJB7Wfyy9pQJHtK8mNmatMWAVe3OrKDdOukcIYuV7wEWBBQoMqhTLVdvg6ltJ_8QIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggdduheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhephfejgffggeevkedvueektdelleetueffheeigeduteffudekvdekteekledt
 gfeinecuffhomhgrihhnpehquggvvhdrihgunecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:93RtY02rEaFr8fnJ9b9XUTFYzPTzOWYR_8PM1oMMfxYsOzKtvoqFcw>
 <xmx:93RtYyHirGE6MKcElKTfyw5qbdbAaA6cOE_vWVvM1TfoK672FRSXVQ>
 <xmx:93RtY1-KGH_xoSuATSpvF2c7N5C4VidLjREpo_0_J3r15NnsqwBwAA>
 <xmx:-HRtY-jKhOV1MR0CcZoDclnkxMqYqEuxGi2TvjLlJ5ia_WtU5RlBng>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 17:02:30 -0500 (EST)
Date: Thu, 10 Nov 2022 23:02:28 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v2 1/2] hw/nvme: fix incorrect use of errp/local_err
Message-ID: <Y2109Agnt13saEL9@cormorant.local>
References: <20221110062335.18401-1-its@irrelevant.dk>
 <20221110062335.18401-2-its@irrelevant.dk>
 <61b53454-25eb-862e-dc10-d8528b26332e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FH1Zdhq8ARKXcpWa"
Content-Disposition: inline
In-Reply-To: <61b53454-25eb-862e-dc10-d8528b26332e@linaro.org>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--FH1Zdhq8ARKXcpWa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 10 10:59, Philippe Mathieu-Daud=C3=A9 wrote:
> On 10/11/22 07:23, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Make nvme_check_constraints() return a bool and fix an invalid error
> > propagation where the actual error is thrown away in favor of an unused
> > local Error value.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
> >   1 file changed, 23 insertions(+), 25 deletions(-)
>=20
> > @@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, Erro=
r **errp)
> >                 &pci_dev->qdev, n->parent_obj.qdev.id);
> >       if (nvme_init_subsys(n, errp)) {
>=20
> Similarly nvme_init_subsys() could return a boolean.
>=20

Yes, Markus pointed that out as well. A lot of functions would benefit
=66rom similar changes, but I'd rather defer that until after 7.2 ;)

--FH1Zdhq8ARKXcpWa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNtdPQACgkQTeGvMW1P
DemUEQgAtTZSzvVICmK56sF7MrEHHFqT2mot7yDuKMsGJdrCLk3LZp3mAri3N9Mg
Tspjacs9K86bq1pV7TT5U18e7RdyyEO3bwEVxtLrRJ0gIWFaae+1e2ncOWkVsBbU
LfDuNoGCEa7xtRDGRwHUoY8TbPwW89AMnXHK3HlLWZWrNBL4AZB3d1gWKzocSvl1
ogN19mCTYIr94Msi0uXZwR+NtDB/abLMDjEq5Iwe0EytHW2CcvvV8dgX3Z7HMTM7
hpqqnV+G/EsHyojN7jxrYtWsjtadjTxxjn4bztEwn/da2OEm+VtyZETpfF6V6LOi
4EJiubpe2gnXPJqAp1QMY6ft0vLqcw==
=CIN0
-----END PGP SIGNATURE-----

--FH1Zdhq8ARKXcpWa--

