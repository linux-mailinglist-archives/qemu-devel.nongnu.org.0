Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB7D2FCD6A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:27:20 +0100 (CET)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29ll-0008SU-56
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l29gX-0007Du-Hz; Wed, 20 Jan 2021 04:21:53 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l29gV-000339-PS; Wed, 20 Jan 2021 04:21:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 821505C00E5;
 Wed, 20 Jan 2021 04:21:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 20 Jan 2021 04:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=f5EeipKE+Pk+Yw80HIXUlQshlTM
 dR6x2JraybhKqWS8=; b=Tm8KXMaVjvG+S9OWzKyzlA2wR2kDee1NgyDMxToOOhs
 /Ksu2cNBuZuzgoFv+FDH1vsHUkMpaBPqKl3Ns6j0+gx9HHtFH0xqDVL4jcmjZG7J
 KdR9aKR7iBw9lSyt097pApPCA1Ai5TB3cZihnDldW3SrQggzIEbnYma3keOmKa8P
 0yl47FV1EGWNMnMpYLb4W73JdRCmrVxslDGDZ+bRuOZjkl4Nq2NxJHgbt4jtBEgw
 8LEUcn93yxa4my0syhVNfyWYr/o3mT+z4yNQzQCR+PkIQ+57Zp060Bce4QtSLck5
 RiRqsIJ+VzchJS+Cno64+KCSyaiMV2Ylwdm7g4Gr3Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=f5Eeip
 KE+Pk+Yw80HIXUlQshlTMdR6x2JraybhKqWS8=; b=RKv3N/QK+U619kM9vCY+5q
 w0R5os7t5T/OvQ5ED5oCl6wW07JDXedq8dkhpTrPIwuUJbhX5Ze/pigsPsnnLaXj
 USbVKAC6/yZkOtLBTgdEgIsVB2Tnm8Zb8xCH3eZx/oROCBbCxwGZVIX5L7EniR/P
 FrN3L84RfNGlailSVZAoR43s7GZ8gWYDoZiBA2cP0kRZYy+oIIip6fbrYbMajRYE
 tsTj6N9Qj9AGXOOU1JTvUERZ/Yy3tDix5uz3Fy3GL62lnaf00cxzK2WoSRgOmjrQ
 hVQyJcW9ENs2ArnAGv4vf6UlU88MLtj9pZ3jV1IvVzU6Mrym2S6EpV4LVUuJ/M+g
 ==
X-ME-Sender: <xms:LfYHYCIKzlP9Ffazv7Yobc_4k0ghWvzaGQpClO2QUgUrrD0v0ZYkcA>
 <xme:LfYHYKL4Iud3M8hxkn_WLIW43IDoEGyga-DWDXgzyKnYLnkqUtDOm2YEGUBZeMt9D
 EMhwUiL_3SozkQLykg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LfYHYCvB_X3AzG9uBoFWt1uxS-EYC7YSG5TUxVfz-yU-Mx8y0_XTPA>
 <xmx:LfYHYHZNH0PAgi70lE_MuzNNUSbinl2MDCidkj8p2HzKcBRaP7o5Cw>
 <xmx:LfYHYJbD96wJwNixdGe1uZfvALyC3YnUm5-EUsz-yI_c1QqWOE3tSA>
 <xmx:LvYHYMwkVQMBTzoMWZvNKAYBXdqNUKFDMgSI3h9JRk5SZ-XAs16n2A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A1CD1080063;
 Wed, 20 Jan 2021 04:21:48 -0500 (EST)
Date: Wed, 20 Jan 2021 10:21:46 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v4 0/3] support NVMe smart critial warning injection
Message-ID: <YAf2KimutBAUUuT7@apples.localdomain>
References: <20210115032702.466631-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iPXtC8w1IPoLewX2"
Content-Disposition: inline
In-Reply-To: <20210115032702.466631-1-pizhenwei@bytedance.com>
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iPXtC8w1IPoLewX2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 15 11:26, zhenwei pi wrote:
> v3 -> v4:
> - Drop "Fix overwritten bar.cap". (Already fixed)
>=20
> - Avoid to enqueue the duplicate event.
>=20
> - Several minor changes for coding style & function/variable name.
>=20
> v2 -> v3:
> - Introduce "Persistent Memory Region has become read-only or
>   unreliable"
>=20
> - Fix overwritten bar.cap
>=20
> - Check smart critical warning value from QOM.
>=20
> - Trigger asynchronous event during smart warning injection.
>=20
> v1 -> v2:
> - Suggested by Philippe & Klaus, set/get smart_critical_warning by QMP.
>=20
> v1:
> - Add smart_critical_warning for nvme device which can be set by QEMU
>   command line to emulate hardware error.
>=20
> Zhenwei Pi (3):
>   block/nvme: introduce bit 5 for critical warning
>   hw/block/nvme: add smart_critical_warning property
>   hw/blocl/nvme: trigger async event during injecting smart warning
>=20
>  hw/block/nvme.c      | 91 +++++++++++++++++++++++++++++++++++++++-----
>  hw/block/nvme.h      |  1 +
>  include/block/nvme.h |  3 ++
>  3 files changed, 86 insertions(+), 9 deletions(-)
>=20

Thanks! Applied to nvme-next.

--iPXtC8w1IPoLewX2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAH9ikACgkQTeGvMW1P
Dem/Xgf/QD7HSkKHrWC3qQlWFAInzEGMdalrz39LaNiqtyUwZNM0c8dN6OFNLGou
GSKK268YvXOInH78nPcwMQzcY1N0dQSDzPZVnKF4WDqWAhdPh4H0SiLVnrkfR95v
BL81D7/LakPC6UFdeyMsX7xbqWMKjEuv+zbwCAzIMpYVnieGNYDwzyqXrX2NQteI
j5r9PoaJl0wdNG/KY3nKxe5jkWIzBEd7690XrUI1FXt2ibrlYBOO7pgo0W4uNk25
oWk0Y2jnPlyVSKGOrIFSzy0hcl1Ccr03Kd0aT33ZZHn/91BH2Kw7Nvg8aqKe2jDl
6cs3Q+m3nfvEeZOyjw+JofmhCcHmIw==
=Y/a7
-----END PGP SIGNATURE-----

--iPXtC8w1IPoLewX2--

