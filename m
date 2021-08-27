Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D543F942E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:06:17 +0200 (CEST)
Received: from localhost ([::1]:53396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJV0K-0006jp-5T
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUtm-0004Ny-Uh; Fri, 27 Aug 2021 01:59:30 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUtl-000645-Gw; Fri, 27 Aug 2021 01:59:30 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F1D5332009A9;
 Fri, 27 Aug 2021 01:59:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 27 Aug 2021 01:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=tefJ4acTvueJ0u8oTQQHCzB8ysa
 kv4d2aG4q0iCibgk=; b=jzPTUzObAqitBb2cdhASmPXx/wOf5MVeGk/Z4Sb7CIs
 cJZIba1usUy4gBBf+5tyPo+R3xX5H5YXntySZPUy3qJD4nUCLZ3m6avY5MSG44DE
 Vjke7dv46UDhRiPOiYKyJ8fXQdPivPOh+LrsCwc2+isvJtCLFun4EtsJF0aiOKBp
 B54gU0fkQIL7jLtKe5/B243UBksFjTeAHCuQYxdAXKc6G2xwHuYm380HVSylaTqZ
 i3EI75uOHqjU8KTYL/CoN053etzaMtgudfYAB4MbYq9ujEJriWgEtYMNrKYlhxmW
 MR33rDKrv4fnKgefRSwqas16UYOXnPkzUVVEl3TZyzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tefJ4a
 cTvueJ0u8oTQQHCzB8ysakv4d2aG4q0iCibgk=; b=H+6e1L0aksqRpq6OGj8VSu
 ScDT27JLXwCuVqDIWpclRAFVVKU8RVlWhmhIv6dL63JAgRJqABNkWmPbSUoLruNu
 98cbjmLFpgTQIgfE+8LH/MnPL8WahEtrNBTAAbD7HEoy4PSx7txajTgftwi8YF5J
 oORdqBtalQ67lvCpytOfaLUNTVSjqFvwc3CI1q0d8eKlsFWD5lKYRcN4Y/jO9cm3
 TZl09S1nq8dcLGvpeWIH58k3FAFD5djD66jnReNBCEfALdK9fDTOY/CXH5Bp9GE2
 S2pntm4EQbZ0kkUDQT0s7ZSVRx+Uj7CJq813Z0JGBbwJTpJtHnPy0IOyCEwxrtPw
 ==
X-ME-Sender: <xms:PX8oYeI5MhQHecTOmCnDlSRLShw_QR6jRPwZ-xGo_yjsXuM1OdCB_A>
 <xme:PX8oYWLNsVnJlIDy6CTBZXaRjQU13fe1rnR4x-DHhta24L6uqZczevfLnzESbV0FT
 AKodX8lCtgsJH4fxHk>
X-ME-Received: <xmr:PX8oYevW8jjC3mULaq4juhzvHgGmJCx4K9rLjMBBt0rtu1n3_T_r18qTNRA2Tw1YU4JdpdLcBfKBIYi9l2Q_yQ8zKMX7T-xxxTDoajPg-sqBIKXh4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:PX8oYTYQBJwhjNLI_nQD2gdqPd5ZwbEtZQiIpGoD33PTWXXkbj8ZzA>
 <xmx:PX8oYVYvVxbKOZ7mZC-nAFmZv0P0tPKqbzw0HSNKQO5IJNZ6UkUzSQ>
 <xmx:PX8oYfAH1Y_Inc3mR9pWRoNwXV_C_PwwdVZot93lsTP445KpumUYpA>
 <xmx:Pn8oYTNQgRU851x5nPu_KpuHhzBEUXRmVprF3mY4PwHmad8-5pWUEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 01:59:23 -0400 (EDT)
Date: Fri, 27 Aug 2021 07:59:21 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 10/11] util/vfio-helpers: Let qemu_vfio_do_mapping()
 propagate Error
Message-ID: <YSh/OVP/45tz8JTA@apples.localdomain>
References: <20210826195014.2180369-1-philmd@redhat.com>
 <20210826195014.2180369-11-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GhFN0YcjxgEH6k3Q"
Content-Disposition: inline
In-Reply-To: <20210826195014.2180369-11-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GhFN0YcjxgEH6k3Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 21:50, Philippe Mathieu-Daud=C3=A9 wrote:
> Pass qemu_vfio_do_mapping() an Error* argument so it can propagate
> any error to callers. Replace error_report() which only report
> to the monitor by the more generic error_setg_errno().
>=20
> Reviewed-by: Fam Zheng <fam@euphon.net>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--GhFN0YcjxgEH6k3Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEofzgACgkQTeGvMW1P
DekvKggAtipT4IPRp4EmSyiZrcpfLUvqQUkWoZt8mvoLJ2Nm159oN+nfmJQ+gLY8
VKh8sd78PFPfYZVx0K8x2nrD88k2qzrXLzmIJMjRmWsRZb5qzYZdi0HqKar9VqbE
IwXtBbjNzY31o+tn6sfSQom5OvkRI8m/MqEI6itgrKTxCH92WdYqrrVt2NXB00lV
HdjQLKQRc+n7cpsIKkQLNyYyOcEY4gLUsf/dQz98ev/EGOcCmJzobLX9SKYnd99z
wehO3nmjXmwg7reuylUfjG3XcduCs492I279DZGTzPyLCdZnEpm+3IaY2vW1SzrW
SyLVLq8dQOdP2THNIRQ7A5Vhbzr4lA==
=skkR
-----END PGP SIGNATURE-----

--GhFN0YcjxgEH6k3Q--

