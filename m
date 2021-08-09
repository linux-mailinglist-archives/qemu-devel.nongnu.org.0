Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB353E4445
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:56:05 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2wu-0002W1-KH
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mD2sM-0005c6-0E; Mon, 09 Aug 2021 06:51:22 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mD2sK-0004dS-3y; Mon, 09 Aug 2021 06:51:21 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EF1465C0101;
 Mon,  9 Aug 2021 06:51:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 09 Aug 2021 06:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=96D6NZgSVUi+5OoY+JFriqSFMCM
 tHFN+QaEu5UHFeBc=; b=Mo9X2CGrpRFwi3qKSBAZNvzA042mOhIeDvLVb2z76+G
 Z2NFYfG+Td7wnPmHNtl/ao2o7ww5Ao3z5Im0fPnq7m42YqUDoCf/UQQMW5pC8CUu
 82mHkTBCt5HkNf+s3JRjkBE6Bg6DOeJ36PvAECqMGmVgetNFDr4Kc0+dPwrNKYjR
 7I51DmcPgBGBOlrpP52yaNme3J7ZUlyJGtsgl7L1FGgxtZei6pmQ3WAdDc9jEWzi
 lLh7jbQFyorLSzz6+eYpUpGEGCCNp052UqfXyAIOvQTQAx32MRKume1VZ51YJEyj
 aYLYtil492mAQ+rBL6ixpysKr1yUPbvmxWemUHbdvqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=96D6NZ
 gSVUi+5OoY+JFriqSFMCMtHFN+QaEu5UHFeBc=; b=brZ0NHHbSErXFZfSLnCyBb
 1N+laQq2KgrXGi9QyU3+7UjjBqLfHnXRpg/ar8jE2GGJuJNrC0VlbPjDM/q4gF/v
 dsD/hPXIBS2L39NF+GarH+hA0xxn2Y0zLXJcHO1glt7CLoPMlje6TFqN5rQuKQlA
 0aLTc9DpAqYtGTZzE6sK5quxbWkMda1Y2gZc3DMez7uiFBHo6u0nm/DREiXIzl/p
 gA9CdtL11qhk0Zt+Lo73QCdeXu+RvIW+rXCyiSpa+/VxSQ5+E3a6qSaO6UF30raY
 iFn7cGFdTpzoopq9reNGPfQ6gvE5YZOCDwmtcr1BCuh4HIa18E1xz4yRv9TWwKEw
 ==
X-ME-Sender: <xms:pggRYRTM3JCmXMZW8tVCINLT1NF1U3c4pAHbcn032SfW4KN6DGl_9Q>
 <xme:pggRYaz4ws-HmU1auefeOhMMbSXR9AsR5MyyiWHKdvUpqKKm970l-N1-CCu90MScD
 lCS4wCu_sMQKOmgnGc>
X-ME-Received: <xmr:pggRYW3BXv865pjs0kxClz08cZc8tDGRVoLQGr71cNcEVFw-lOe7Mv9GOs4dH1ovs-cM4bM9-TSrjJOzwgH-yy_fD6_yp4dVuMPPKreey5DmjLuLMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeejgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:pggRYZC1f_jNpRi1HcNfAQ3IS4O9qoyMS4WKiOMn0thawF3nSrHWlg>
 <xmx:pggRYahygwi49sl_v3ESOK-u03fIh_OPXSleMiXpwKTUbTSL5jmNyA>
 <xmx:pggRYdpdwZxhBpcs7YuPkF-_Xp0fLoivBh2zsmaE47zIQ3p9a_2WJg>
 <xmx:pggRYcYxDoXUESw4prnTd5y2R-kGuFLgZ69DEGGK-77L2MWlz9lo3w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Aug 2021 06:51:17 -0400 (EDT)
Date: Mon, 9 Aug 2021 12:51:15 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.1?] hw/nvme: fix missing variable initializers
Message-ID: <YREIo4mrctlWYrDL@apples.localdomain>
References: <20210809104324.49434-1-its@irrelevant.dk>
 <a28fd42a-1766-c1cc-6a6c-9b5f8321e30f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EGKZkRbIk1cPErNJ"
Content-Disposition: inline
In-Reply-To: <a28fd42a-1766-c1cc-6a6c-9b5f8321e30f@redhat.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EGKZkRbIk1cPErNJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug  9 12:47, Philippe Mathieu-Daud=C3=A9 wrote:
> On 8/9/21 12:43 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Coverity found that 'uuid', 'csi' and 'eui64' are uninitialized. While
> > we set most of the fields, we do not explicitly set the rsvd2 field in
> > the NvmeIdNsDescr header.
> >=20
> > Fix this by explicitly zero-initializing the variables.
> >=20
> > Reported-by: Coverity (CID 1458835, 1459295 and 1459580)
> > Fixes: 6870cfb8140d ("hw/nvme: namespace parameter for EUI-64")
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/nvme/ctrl.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20

Swift as always Philippe, thanks!

Yes, I'll PR this for -rc3 immediately.

--EGKZkRbIk1cPErNJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmERCKIACgkQTeGvMW1P
DelbSgf9GQyX0l1rrTBzzeaGUov/pQeHgUC0iB5ckX+o/hhaAd701eYFbljflxJ1
Vwdo9IQtvzS+SPsH40lZ8MfOZk35XIVrU4jLWHntqJjUAKxaXybtHsEont2Jzt2V
HVAGhcnSIXtgC1sNpGMODKS9yIohcWD5spK+t0Sl85Ey5tDybyfr6BeJZiwbqyWZ
cj9O0Rz/sBwrNzNVHgckWmB6e9oqAVMySDZTwGLIANdtz+RXKtalYm212bbUB2wi
Xi4ja108GH6j0N4n5cTqHtFzylEGXLalX2Te5rZczJ7stWtmlDeOEYQ8mRiJf7nz
Ow4QvTM4XG/XWD2jx6g8XrOIFM9wjA==
=f/FA
-----END PGP SIGNATURE-----

--EGKZkRbIk1cPErNJ--

