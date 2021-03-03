Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4BA32B5B1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 08:44:34 +0100 (CET)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHMBN-0006rj-7r
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 02:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lHM72-0005Yj-29; Wed, 03 Mar 2021 02:40:04 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:46023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lHM6z-0002Si-TM; Wed, 03 Mar 2021 02:40:03 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DAABC5C0178;
 Wed,  3 Mar 2021 02:39:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 03 Mar 2021 02:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=OE5J2gP2pCwymOdNVfZJwTUsIh9
 Xkimm/SN6cj68HOk=; b=ktcAC1KI+oFWwXXV2wGFhqV+Zxf54Sa+2YSsSTgU4Tw
 Rk1f3aK4A68js+cykrkXUuSvHpma6NQoDnF8+KziXNK21PRQnAmF+cahmV/oR7qo
 JxcnjNLB6T/HsQivq8qTwRtc1JPbUSbvi91FHgH9Ch7vg1w9HMvNJEQsbwFLuQ6U
 IgqL1b3qHHlmVbLN3hP6R7fufpf5wR4+w2DAAG0DAZ6J+MeYFXFlIATrxlSu3sXj
 BMDGdF5jlXwpeuy+IS9jkDtW1u0xzEyq0AC9amhlzHojEjAy6z2HuEJnmKRNviZ7
 j8Ky/mOr024xTVqlrxOMxvjFobvJBnmqESL9DLxkeaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OE5J2g
 P2pCwymOdNVfZJwTUsIh9Xkimm/SN6cj68HOk=; b=mVii23dmjSQpOgmMFeT776
 8/RsjSIQZ0poU56aG2hvky8XBAGwhu7TheacpFSyuIuEM//QWoZVkTqBAL6jCgfM
 w5Xmv2FbfQwnZLanSgm5fhhaC+nao533lVL5CRmN3Cj0N/wdL2fLrOQxTBCa3aDm
 4l8PzHVpXndu2S/Y3wmSTXE/13wRKS3gBGp3aCnrbKcNJzY8RWwrV8WaQK2wtuHi
 VAW1BPSeGZo9guNsJAfBCdYwuOUjBZsIxFcFGHX8/Ro8x+SdGO9PxHkWD9pQM3cm
 brh09ZXMsA/pkFef7c4W/VsFbpPoZh5jpAx3RRl830vW26Jq0Kj+bO9Uu7zb1kiQ
 ==
X-ME-Sender: <xms:Tj0_YBHFHuMHk9o5gAR7zJDfY5RpYcY4jCshzI6vvxr3glEPFrTW6w>
 <xme:Tj0_YGVKyQrx5INBWs_OQHhCu4UhuiGs31qyje8cVwm_aNuEMzGLQqH7ZrLu4JFtV
 7GFH_ShS2U4x4xvLLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtuddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Tj0_YDLDB5MTCOvs_bAXKrTgzoYrb_rpYsrma0ew2qqwtkkkCeOR0Q>
 <xmx:Tj0_YHF0qCYB2xyj929FjWvVig7QZ3OHB2iPsNc4Y8C957aN8lfwzw>
 <xmx:Tj0_YHXexmAsq26h-Lwvq6aSfglPT6bTy_-nOvqEEk-oF9fcVqXR-w>
 <xmx:Tj0_YNxrB-5iEnB5NRa7Rb37_FDWBRV-Oe2PXd-I5FwFtZxZNdYiVA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 144A4240065;
 Wed,  3 Mar 2021 02:39:56 -0500 (EST)
Date: Wed, 3 Mar 2021 08:39:55 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V2 1/1] hw/block/nvme: support command retry delay
Message-ID: <YD89S/2EFGUooBTI@apples.localdomain>
References: <20210214142805.21534-1-minwoo.im.dev@gmail.com>
 <20210214142805.21534-2-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HnXnoafOoBP1CQwh"
Content-Disposition: inline
In-Reply-To: <20210214142805.21534-2-minwoo.im.dev@gmail.com>
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HnXnoafOoBP1CQwh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 14 23:28, Minwoo Im wrote:
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
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--HnXnoafOoBP1CQwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA/PUcACgkQTeGvMW1P
DekUjgf/WMf32DmKj3sID441dqpu7jZmk5rmjbDEwGn0omXNTklnBdKv7PNqLgGc
u4SnnzBmBFUT2S3O5pcC11HxDejcTvkkGsIBO8GOitiBxG+BCMAUQ0cpYWYL09+H
/kuFfuaYOEkv+0rPjzZXCPlGrY7GzLvRlu1lZo+F/Hgbv4XKZZz/8Foq4VfYpQMT
V2zUlaAdOcMU5gXSNZ3i7MvY/w8w8i1jiVB0yaSLedQUZMMwQ+8z7S47XOR7pCPl
h6mFMJEgeX2aSLydO0X6+esp4PU8Lm71vxfhOJ/82alQJNjFQStmAJLZtQcxDj+G
H8yQFtFN+3WyuE6RebHi5dkkQcLfRw==
=3fmK
-----END PGP SIGNATURE-----

--HnXnoafOoBP1CQwh--

