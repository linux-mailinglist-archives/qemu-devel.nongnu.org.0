Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152BE2FAAEA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 21:06:58 +0100 (CET)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ang-0000RT-Dc
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 15:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1ahc-0007ae-OE; Mon, 18 Jan 2021 15:00:43 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1ahV-0005X4-C6; Mon, 18 Jan 2021 15:00:39 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 56DED5C01FA;
 Mon, 18 Jan 2021 15:00:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 18 Jan 2021 15:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=EI9YXp3tuitz01WaKD0UiMHMsX3
 nxTMDLPRadXOjqpQ=; b=HR1cpZ66UXX4i24U+3KiHIpo21Qco8kaoh2GaEK+VAc
 vbNa6hA69c/VFpX1h5pWGMXW0z5M+JCWBOef/NVL7DvHrC4KUbT0soEiQ1qC6ZE7
 tBBxtmyEDd8Tf7GrvVw2LxXHfmye8Lg9CyDETlX35O1TJTZtS6xMFD3YQwgCLKeU
 6DMU/ldNZISevU9g34iyzpxpTEzbZWlr2q/chNop5cYBSx2avkk6IeIMF9DliD1g
 Q5NoHhRfC/Zv2mZ4fkdLszQPMejHnweEaZZzeOxRszvK2Eudldp1UFW15bhx6qCw
 W7QDwpZANOFExL0oyWkMXI7uZ75+cDCKsjvLK/wZlsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EI9YXp
 3tuitz01WaKD0UiMHMsX3nxTMDLPRadXOjqpQ=; b=dGfCy632FLJojGowV9QSDd
 W2nVgwYovxUSKOD9LK69hBdE1LN79sy48aDiaarETJiLZcN+iHwET27PAY08ubqT
 D5Z+zDK2x+I5HHm52pZUGRNsGvbPH6MohgbrW9sIKsWJbsR6Voq+Ns1bVufY2iI8
 685pv9BPLte4CFiD3WEUWXn6WrOvfyoDhi2Z8fP50pW8PX9sXjuIOZf7k85YI56O
 nG3h+tJBBb9Z0BO7+gcuh30c+lvLv6rDRsN7krbO+KqkuTh5pNm3K5IMPSXk14Zy
 7nkJgRG38IiPvdjYiER+/C+KyfL164ItMZM+iUGAGJaTStbVTi19Q6yPSs+VYAXg
 ==
X-ME-Sender: <xms:3OgFYKRZTs1Ec6iN0pd4-PwDlFNX8lRgpwWDDoR4Wxa0FJdEpy9r7g>
 <xme:3OgFYHN651srbpsxQc5wr_qz57bpAJOy67PoXKVq8V-JA_FNI714eVBQrSebtkLhJ
 K6TsoJux_Gl-FoxYuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddufeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3OgFYFN9FOo0s49hRd-TbFLtyH3iBDijR_6UaaUY1KRGPfxo3aaGVQ>
 <xmx:3OgFYPtxoH7P586132cOYgDGIvOII6AeDPqWX99up2HRLQjXEsqqVQ>
 <xmx:3OgFYHWFfThlz4ckK1QzGQVyu-FjOxQirKFymY6yxGTrpNacZi1f_w>
 <xmx:3egFYI1LMFydYhXejPWlkli3yzXyZPkl3ZGHGB8mrEzCLziUx1BMEw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id BEB4C24005C;
 Mon, 18 Jan 2021 15:00:27 -0500 (EST)
Date: Mon, 18 Jan 2021 21:00:25 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 01/11] hw/block/nvme: remove unused argument in
 nvme_ns_init_zoned
Message-ID: <YAXo2ar45usqyteO@apples.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-2-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="buQ07qm7Ei5blQvq"
Content-Disposition: inline
In-Reply-To: <20210117145341.23310-2-minwoo.im.dev@gmail.com>
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--buQ07qm7Ei5blQvq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 17 23:53, Minwoo Im wrote:
> nvme_ns_init_zoned() has no use for given NvmeCtrl object.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--buQ07qm7Ei5blQvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAF6NYACgkQTeGvMW1P
DemkPQgAl5tQAaj0jO5Kw5ftYG5pjnL5XLE+g0adnNGBLXiorA5kD3xM/drYLRvf
z6spRGwSE6bEDKoJw2RBaOhJxuJORUBzqFVOsY5Y+Hy5rKjSlikim8ybVVspla9S
HQdy/6dxHZirZElHkFMrgUMxWRFnnSafoDIKro26BVebeQnXaGSV7z5pGNun17wf
bZgL9Iu7XJiQOA9q2H39M3XxcRMBrzhSg9clZ4FIUVIe/c4VEdysXwN2j7fv7rPv
4fRgVHxA317qZtSPvfo+shcgkOG3yTfbJ96JqVGarf+A2Yd/jVm7KchWiE4RlXpf
8D7hTcodfof/tw5ZhC1/21KaRu5qzg==
=PsRS
-----END PGP SIGNATURE-----

--buQ07qm7Ei5blQvq--

