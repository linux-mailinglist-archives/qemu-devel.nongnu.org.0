Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34996DE478
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 21:07:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmJKb-0007Tb-Ay; Tue, 11 Apr 2023 15:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmJKZ-0007Sv-2C; Tue, 11 Apr 2023 15:07:03 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmJKX-0007dK-KD; Tue, 11 Apr 2023 15:07:02 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B2F575C012C;
 Tue, 11 Apr 2023 15:07:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 11 Apr 2023 15:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1681240020; x=
 1681326420; bh=8HYmg5mAffsa7ZMn3IPU/3Oeq4TMsHbU6HfuG3p07c0=; b=j
 NbcXHcujU1LX0de9gxYCwSArmAEeix5VOnZlP/nNNvscJ4umTkWfUSQd1vwGdPTJ
 yC4HNCzULNNWIrjdPnMnEMUKVrtrFI7ugxJpa6ztZCmolyTIWsVCX3D2yFjSt+x6
 SpejaqFkupz032fNa/uoBPdRPl9qA0ULznYXTn8Q2F0obKozX6SodhYHN7EtfXvt
 Ky94kPXuRp+LXg/wFVBKkvIyBTgO+6yTnegSqfWfHMSedyiyJplWCQmYFaxb4g7h
 zaW44OqaljAA/ZiFb/HRaI7ZAXlWMXYIjQYSmtohlUbUS/2RdgFjD50PNWlae4Lz
 dxX6ufWT2F/u9z2UNd8HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681240020; x=1681326420; bh=8HYmg5mAffsa7
 ZMn3IPU/3Oeq4TMsHbU6HfuG3p07c0=; b=UZdmkdX4MNtFDIiID44SRGcO8kv+Z
 R7iDkYdSZLylPWb18EQd0eIGMcLjfbSUyVSDmw+mX1PSWtL5qbuoHt+Z2U9wsbIW
 miiaZKRHE8A16Hir0yfQ9mAnKsUk+22CQhX52rUf7tNATX8TP45SI2JgyTl6tTPS
 qiGzX/ICNpZuS5OOg3Cp4wsypJLTGM/+EOq7/QphWEo+r+Tr5YtU6HpsuRu/z9IX
 jfArS2kEU63FzYAY4WRzYA5F0//BdVPnpw6rjlXPEXxZ/K1zui3dEIRjWeHceU08
 A7WAVPda3vmWI4ZmNf+RSAvKPiIMlWACjZDP6qQvAvm4zzdxHq+j1FsuA==
X-ME-Sender: <xms:0681ZC-FKEYHg1oDdBURR1gf8cAMSyWYWTolRvdIpnvUf3tp6bWvXg>
 <xme:0681ZCsLMxgeW8kFUHiLhysUhZZ-kB9qU-KfZeBeXrMa-Oq6ax_4jfJ1iw_BNf5db
 azqMS0ibVEoaq8xtOo>
X-ME-Received: <xmr:0681ZIC7yLb_xIsdyfy8XcEHuSDQcJCLAX-w9CN--zz05i1nbsi5yDzw4PYkVYMJlKuwsiinezyTpEWaopUuQf4wVkpAX7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgedgudefgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:1K81ZKdB0Ep7D_lpqQ9U87lo4-wK-g7_iT2CAFChj7jq0tWQ5er4Dw>
 <xmx:1K81ZHPC34lVjZuAsAFrBorZ5VFnUr3dCyUusDwIicmRl4ExgbNQFA>
 <xmx:1K81ZEm54zlvrsAiqQYqFFjowP55pXWOdVCMXqaKqEv3RKNf76T3cA>
 <xmx:1K81ZIHX142SsHLNvPtAaKYZ5RBMIOIRhhXvawpn7ZyZVPwMD9RZGQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 15:06:57 -0400 (EDT)
Date: Tue, 11 Apr 2023 21:06:56 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Jesper Devantier <j.devantier@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PULL 5/5] hw/nvme: flexible data placement emulation
Message-ID: <ZDWv0GfMaNQO+9iS@cormorant.local>
References: <20230306143433.10351-1-its@irrelevant.dk>
 <20230306143433.10351-6-its@irrelevant.dk>
 <CAFEAcA98nL2w5ac-1FR79u2ai79xUm4f2Ry=-kDuHNaHrrcBMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xfoW1axxUz04HoYa"
Content-Disposition: inline
In-Reply-To: <CAFEAcA98nL2w5ac-1FR79u2ai79xUm4f2Ry=-kDuHNaHrrcBMQ@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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


--xfoW1axxUz04HoYa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 11 19:16, Peter Maydell wrote:
> On Mon, 6 Mar 2023 at 14:34, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Jesper Devantier <j.devantier@samsung.com>
> >
> > Add emulation of TP4146 ("Flexible Data Placement").
> >
> > Reviewed-by: Keith Busch <kbusch@kernel.org>
> > Signed-off-by: Jesper Devantier <j.devantier@samsung.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> Hi; Coverity points out what looks like a memory leak
> in this function (CID 1507979):
>=20

Thanks Peter, Coverity is right and you are right that it is only
working memory.

Fix posted.

I usually go through the Coverity reports, but I must have missed this
:(

--xfoW1axxUz04HoYa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmQ1r88ACgkQTeGvMW1P
DenNpQf/aixDIww8iSmWWmNLztmG2vXnJh+I29ZyK77CCdyihByKOGh0THDxFG+z
JGWZ8FY7mInESaLfRiqvdkwT3v8MdKcuHawzX1ToshDWHm59wfuBsj3IPPAio1FC
i8Xud5vFVIciAXRTxmA+sfxpQ0e8pSP2znFJIQkYE35jPzCNjEILVZucR3x00QB6
WvRwIHG2eX4ZY9EMocfIvKBKk6lkP6ZbjOEXmGzTFqmXFUE9PF7Rx9BZM3+zKL4R
R14pzKfSv4q/WfOwQiqROKGL9H6WnxtgFaC2tSp8rrwEJ4Lu5hac0zrRuoT9gANt
pZVLv9DPlB24x1z4EMcq7wwgH73uuA==
=DWWP
-----END PGP SIGNATURE-----

--xfoW1axxUz04HoYa--

