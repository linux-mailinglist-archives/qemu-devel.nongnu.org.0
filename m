Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05F2324E78
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:48:40 +0100 (CET)
Received: from localhost ([::1]:43336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFECF-0001P6-I0
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lFE7i-0000Jx-Tr; Thu, 25 Feb 2021 05:43:59 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lFE7g-0000Fi-LY; Thu, 25 Feb 2021 05:43:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 045755C0165;
 Thu, 25 Feb 2021 05:43:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 25 Feb 2021 05:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=02X2Hjx+TYljkGzJBGIiiSSaA4O
 s4c5+Hi2huXNOs+M=; b=m6VYCS/wvLHEZ4Puw+V3ngwZELAul83TiGPa+2IICou
 gCa5cN+sU2NVHtXu7kwvt83B+IG9bCTq/+Hg/dpfCKm5Kz06cW2opVw/TkHwYkWB
 S8l+kkI18o1KfSofNH1FtcbTfKDlwMKr/0OSn2q4S3jmGIn0E39Ve2AeZGBL//1O
 9KMWcJ0LyqDjhcLWzhhlGO+RGauF9TPKAOHKxURmYp/MXVkYh2AthiTnxJRr4ZHs
 SeL6aCscpKySXJaDj+rfQgIWWkWOAtxm9b0xEo77XAIWJ6Nb/0PWeRrBWs3a6hR/
 lHe0svWuSqWGpEwUMjUzP23yS7we9MKJrEqTAlVuiFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=02X2Hj
 x+TYljkGzJBGIiiSSaA4Os4c5+Hi2huXNOs+M=; b=pO4eR0p8Wuyfsy84N0nDMk
 OjsDviYlDsVjzjiLSdqrPp/MDTgccTISfcUc5XdGRTQto8cTnrmKbGes5SM+CYGi
 0WiI7cVMJP95yar4k0YlM7hLCTceSdRt0+Tju5dRenK0qLfJmfRn4IV7S/Ikdcnr
 SZluYGXCZmktt0oeo7GlNmmI6BK8hk1dcAeetRhHz8uBhHupubTn4FLWpRkPNtDh
 VrJ2gWXNzgX+8v9e/oGM0vDo9LYaS/9PE47CoGRxG/j/w0+op+USLCnEInWTUz48
 2oEu635Tx2m6rKiSVe6aUA7W618whh1L75ORF7w/rfTA4b9A+8tnRUGfinanT4+g
 ==
X-ME-Sender: <xms:aX83YDHr1k3p5WNT4xfTEq4gg_kTQKwZafEDt1VWvGKnb9PQnWh41w>
 <xme:aX83YAVG8tJew_C8JIYwwP_Hu965MHeG-qr4N09c_cAPAC6necYf-ZWME09fnmL1D
 SxsRgMy4oGr9pfuwe8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:aX83YFKmDFaKOw7ILzRPRImk9_FsU4fURjrISaMeHcRxMGaqqaxNBQ>
 <xmx:aX83YBHpS7VABCwoMBLFESwhcPOaL9V07MiklmFzfG_l4wL-9KBCzw>
 <xmx:aX83YJVGpzqPiXfC9BsjiRXZrff8jDeHhDNv28ufcAmWfeB6GMSuxA>
 <xmx:an83YPzkgOkxX8JnmnB91pamRzEGycgW67j6tfxPe2ZPcF3-LWr-dg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 102DB1080063;
 Thu, 25 Feb 2021 05:43:51 -0500 (EST)
Date: Thu, 25 Feb 2021 11:43:49 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 0/3] hw/block/nvme: mdts/zasl cleanup
Message-ID: <YDd/ZdK8Vg75vBY4@apples.localdomain>
References: <20210222202921.92774-1-its@irrelevant.dk>
 <20210222210033.GC16253@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SIsMkehWSdjZWJK5"
Content-Disposition: inline
In-Reply-To: <20210222210033.GC16253@redsun51.ssa.fujisawa.hgst.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SIsMkehWSdjZWJK5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 23 06:00, Keith Busch wrote:
> These look good.
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>

Thanks, applied to nvme-next.

--SIsMkehWSdjZWJK5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA3f2MACgkQTeGvMW1P
DekS0gf/UJSB+qNXAcqlZHhPNr2ikg+U92wDR1U2B8X9+iFXQS5bcuZXqQyYJ8gJ
wV6I+ejTGLwtZxeNTsGnncR9fA/sgc9dHVxBfNy92mQbl++FavmvRze67jegenmX
xgZskCcI3e7A96osGQKHww6+QHXT+Xa6cEuiqQDsq0mO74ow9RQlXndNbf9R6BXh
JPO9oF0AkxaNkcBKirQ8UTjNC4Bcxzqoyir307HVzGbImG3++Od0r92r3tt9R9G0
zPCT30q+RS6eHP4kd5GelU8purWohqxqPLJki5Ut6NWxniw7n0t3df4ZyxUus0BP
0uUhc+Gn08NaTPGOZeD0WBtWKQsfww==
=1qEw
-----END PGP SIGNATURE-----

--SIsMkehWSdjZWJK5--

