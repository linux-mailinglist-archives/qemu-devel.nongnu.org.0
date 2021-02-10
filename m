Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93887317187
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 21:42:18 +0100 (CET)
Received: from localhost ([::1]:47960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wJV-0005JX-IC
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 15:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wEd-0003xG-Ty; Wed, 10 Feb 2021 15:37:16 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:56167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wEc-0007IL-1Q; Wed, 10 Feb 2021 15:37:15 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A3045C010F;
 Wed, 10 Feb 2021 15:37:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 15:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=7xvake67O9MAI0LIV+gK3sfrIFG
 +9Tx3Cm4b7j+czIc=; b=ckM7k8vXJewl3LDPiYTTllVUflRqzG8RprR3wPSqNvS
 NkInQW4HOOa3TSm+I9c9q1IOmJZr3aAl6tFzBhJjUiAhIz0W83scHgMc6J3O6SU5
 JMsC7boG95gkzoLSrGBbTw/XJzXXkbfltkOx1Y48KhwiUoGx4PCvQO4vV2rjiYKF
 75iwJbUhNq2uPo+iqlS+Sks1SAye6UfaNIpnZjDoQinXdplBL+L9k7jDlHPU7v7W
 2bAW1wFh1BFRUVWvS4DZoxGtMN2fWEnGu6hsQZ9i0s9dkqcaSZzyJo6OzCjFcki+
 BxhayY+x6XytUCZ9FhjAuFj/xlBTbFG3yzO/x+PkqaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7xvake
 67O9MAI0LIV+gK3sfrIFG+9Tx3Cm4b7j+czIc=; b=I9vCE3J0gzWNggKD0p/OZ9
 zvWkmTjl7IBypxee/joK3MBRhNYSH+4vBf9bBZ0ebrmMP2b37fCIRgWjl1FsdKOu
 5HKwArVXiBHg802t02SyxSMUxv8cDPob9SoObZzyG3JtV2vyb5KRALrY21pVRuGy
 RMhIfZsxzPy1UJ2CV1UmTU2/6GFTOJP4/XGxQTyxe0IOC/e08KW4sC4kDelMZP6N
 RmjWzHVbIFZg3mEec64Z/oIcTR3UGY1Ilcpok/BfLmvzkJRPEHzlcmhVbM7nGo0x
 ZUQwF7sKqQgPd/PcK0lI4+ZlGyNBsBmRQlPQx034v5SOuRr+UlL8wGIy/7K30yTQ
 ==
X-ME-Sender: <xms:90MkYMVtRd_9AT34l1CfVQZSF-JMUhshD-NSbSIvCtPWA3qo-JjbHA>
 <xme:90MkYAnXwMBqD3JxndGj7iOyyJOGBdOu6TGl3rg_o6HolzWjbFQMAQvFuf_38egqe
 WvREn3xN8joCXB_vYs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddufeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:90MkYAb9-VTXnTlFuT3GYNMWuf-GXFBu5CGGLKpKoJ17OkeP4JeIKQ>
 <xmx:90MkYLWLL4IPgy6hJqpjRKEPiIemN4-ON3EWJ2gjfvrcmHgD0AWFug>
 <xmx:90MkYGne4iK5kaHWz8e6mcs1C7QxRhSX_n9M4WIPfnmUFEsjXoiZtg>
 <xmx:-EMkYNs-zK2RldE-OVXM-TESHOQNlO73JfmVoP4sgAbYRP_EH2DB_Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C80EC240062;
 Wed, 10 Feb 2021 15:37:10 -0500 (EST)
Date: Wed, 10 Feb 2021 21:37:08 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH 2/3] hw/block/nvme: support command retry delay
Message-ID: <YCRD9Ojsx0f9y0Ds@apples.localdomain>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-3-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GQkm0vbEGz6Ny3Lr"
Content-Disposition: inline
In-Reply-To: <20210210195252.19339-3-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GQkm0vbEGz6Ny3Lr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 04:52, Minwoo Im wrote:
> Set CRDT1(Command Retry Delay Time 1) in the Identify controller data
> structure to milliseconds units of 100ms by the given value of
> 'cmd-retry-delay' parameter which is newly added.  If
> cmd-retry-delay=3D1000, it will be set CRDT1 to 10.  This patch only
> considers the CRDT1 without CRDT2 and 3 for the simplicity.
>=20
> This patch also introduced set/get feature command handler for Host
> Behavior feature (16h).  In this feature, ACRE(Advanced Command Retry
> Enable) will be set by the host based on the Identify controller data
> structure, especially by CRDTs.
>=20
> If 'cmd-retry-delay' is not given, the default value will be -1 which is
> CRDT will not be configured at all and ACRE will not be supported.  In
> this case, we just set NVME_DNR to the error CQ entry just like we used
> to.  If it's given to positive value, then ACRE will be supported by the
> device.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--GQkm0vbEGz6Ny3Lr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAkQ/MACgkQTeGvMW1P
DekMTwf/ZGOVvYSO9WVKPMAygySS+tHajxd+7xRsqPbF0waWYBWn0HfORP4OFhI2
Fmm2giT3tIvYhyZv1HoSkbJBYvzogLUup7THOmf87GqpxG5HTcjaTp/jhQvVL7Nu
u0fMMurlqUzh+IbCChaK2Qk/Vk7Wwmi46oaTEcNCSb7lGZ/2ib4bngKOdH2GGyAQ
YRB3/McUwv6xTG1C6mAnjPd7TXJHa48GDSuZ3ac/Z7s9nfgDzH/SBpUjR0Elu+QF
FtdZuR2KmNGPfGpdEZ2uyouMKcpGy/ILaI0XF9H0tVctfSJ1AkkmItO3gx9gji1s
fZXvmmbQ76zeuIrBkV/FBuqvPXUfUw==
=lUzv
-----END PGP SIGNATURE-----

--GQkm0vbEGz6Ny3Lr--

