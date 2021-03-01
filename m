Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C192E327D76
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:44:54 +0100 (CET)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgyr-0007UU-Lz
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGgtU-0006Bq-Ep; Mon, 01 Mar 2021 06:39:20 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGgtS-0006f9-Vz; Mon, 01 Mar 2021 06:39:20 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 468FC5C004F;
 Mon,  1 Mar 2021 06:39:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 01 Mar 2021 06:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jUn5BwGkrIGYoJLi4ZlK9qVVpPR
 aATaYCdcq2sa1/3w=; b=EOUid07oBhJiK1lRYz5pjTKAikaMys4dlScCP5p8tLI
 jyNhOIOevQN/JZlCmrr8n68VDt952qx7UDLm4SgrlifQqj/zI+r8y3+oe29mOAy/
 en0lUqd7qhbLwqNtfvHpxoeL3KL+1zoRpwcXjCX3Fm1mqAiwr/Fh4NRewMIhSXVn
 T2f7F8mq/UsNPJKaVi1TdVkViK5qITK3jsXJiQ15Vquoz70FjBWIjGSKma6m80sv
 mg6V9MOz9phbcrtWrkiXwdm+qoVjb9rfvCIQk7qXDc4jEOmKi4rt0h0vHuqmlFvu
 orrtXXtVkqc2dz99zEKaRcYfK4y6QT0iV5/gi913Vsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jUn5Bw
 GkrIGYoJLi4ZlK9qVVpPRaATaYCdcq2sa1/3w=; b=JmSGRTDm7Sg0BmV1NNpDLZ
 YTkluLBUR9AOzOGG/QWeFhDGWvsaDWIx2x6TYzUJajh6A4tL8dwowv8nuiZ4cA6g
 mKB3pFF8zYKn86oqSczBbBXFo2AS5uYP13Oyx+hw4FMJVzHAJG0l5DEDDwXwapYO
 BWSb+NkBf1OQFchHxUreyM7wfU4pglKELAcaEoR6X4TM95P3/G+fOwD7p2XzU5QH
 FLEjvGTbqb59Qo/mwjjt26Kj2er2aNrT/QF5RwCN00K78g7jmGj5dOef+F/D0cg7
 55pO4JlqKhWjfPWm97m7R4MtL6MTEo8YrvffY+yF5eka5xzNXvaBuq2L0VTPunjQ
 ==
X-ME-Sender: <xms:ZdI8YJlY7rxZIXLjrA8s-PQMZ2I9D-l-cMVrvED-DPU90_wluNYjUQ>
 <xme:ZdI8YJIauY2YZtQemxU55ba73SLT_oZIvBn43e_34ZfxFmzfwtElyyOK6Wh7yohOQ
 lW7ETUx_FjmdXFzhds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ZdI8YOwu3JuAkt4S0-Hww5vs7IhIdHHOI7cu4_NjQONnUoNCOWZt9g>
 <xmx:ZdI8YBv6ScprJ_LB0E2z_n88k-Lu6_pCy0_mTmb2pyJ_u2gkBwiiug>
 <xmx:ZdI8YNvHlcfDhk0FEBux2jcb0XbHuCgIjQnwm86fA3II7cF6ND8pdg>
 <xmx:ZtI8YJUPPtwwG7g5mAwZQm8xQit7SWySA83grf8jBbnAsz9UKg861g>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C86E6240054;
 Mon,  1 Mar 2021 06:39:16 -0500 (EST)
Date: Mon, 1 Mar 2021 12:39:14 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/nvme: move nvme emulation out of hw/block
Message-ID: <YDzSYrlIiwAgXRq3@apples.localdomain>
References: <20210301113509.79706-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="il0I/docZ1eBBCvE"
Content-Disposition: inline
In-Reply-To: <20210301113509.79706-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--il0I/docZ1eBBCvE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  1 12:35, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> With the introduction of the nvme-subsystem device we are really
> cluttering up the hw/block directory.
>=20
> As suggested by Philippe previously, move the nvme emulation to
> hw/nvme.
>=20
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
> v2:
>   * rebased on nvme-next
>   * got rid of the second patch (Minwoo)
>=20

Argh. I forgot to add Minwoo's Acked-by and the change to the commit
messages that was suggested.

Anyway, would be nice to get this merged before I post v4 of the eedp
series since that will add yet another file in the hw/block directory.

--il0I/docZ1eBBCvE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA80mAACgkQTeGvMW1P
DekaXQf/U8CLtPYAdfQrqbN+vj8ugXQASXhhL7s90ZI8RT19bOHhsGyUHUPeJkX9
1HCTnQbbnVj/L63BPM5ZAoEn0KCrPTkt+Ai8EYXdd6ouplpzRQ4WexHeQj2y0/JU
hcnNikuAYdzyAKBqrVk3aN3nElXIZ5bvQL7xOAqVp7vHNJTL3QnbMgr4jHYgbJmd
pE9t03FCt1xeIILwpTQtqNURD6I/yPpT45hWMN+YDPvSWcudhh71RmeJkHrNwdso
YZO9bmBB067y7XvUhQEBIl25eb5HkFC4jPMNmIxrn6/2bY8ABM9NZ1Ou51T3ebPN
KtypUTGXyrE1nS6T6VzyRLEBgqhLcQ==
=u1Fb
-----END PGP SIGNATURE-----

--il0I/docZ1eBBCvE--

