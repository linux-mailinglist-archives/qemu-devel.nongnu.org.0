Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EB23F9430
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:06:54 +0200 (CEST)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJV0u-0007BN-QJ
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUpl-0001LT-P0; Fri, 27 Aug 2021 01:55:21 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:60851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUpj-0002aw-H8; Fri, 27 Aug 2021 01:55:21 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 71E6F32009F5;
 Fri, 27 Aug 2021 01:55:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 27 Aug 2021 01:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=S/UAfvtE+k44En+jiw6pQwND2kS
 Dhdde1jmI8r22HmE=; b=JU1xV4hGelfpulOx702XD+aGGAM3m4mXdQII23gtwYK
 xpcEw5BRAe6cynbPLbYwgRbXCAFWLFvDH96qAZV/tqpZwqomSE0a+bGLvoSnR0vf
 Gfb8Iqkq1J1whdFp+4oahnP13MOrE7cQK63Is1lLEH7CH1cEYW+pMhmMd9EGSYR1
 OoBHf64JDaEsYY7pFn2g1cxN9hSaxUUPfAh/03LOTcBwwoS2yLpl6GOPpL4f3yny
 Bj3H2bTjfYyZ5oFVU3eswz9SENxkWwmMWrofpbaTNpX8l7X3dO7xS1yl00P87XTe
 Eqkz3og8BNnuiRtN/79eWSOQeOblVG9QTsk85VU7mWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=S/UAfv
 tE+k44En+jiw6pQwND2kSDhdde1jmI8r22HmE=; b=JMUEESiE3TC5bflC6FAxGW
 9SJJy7ilqsIm4KJs2xnkI3t+mNFdRxzR2bZdG9SOoVgFXcLuC1yeXLkUUZngDxpB
 5leSgsq5YQCACVpjwbBSVm3FdXdJ+zjBQT+5PIx9N/A6bzY0XaVyHH5WHy8ONVEG
 lDuWIkVBHeKWRL/RyB/9eaXjXoTRQjhsmi4fkPpnM/LBd1+xwZD1E9ngCMg3O0ri
 ORNs6qFoVBbH/Gw5x/HFQpczApn7o4ZreYwbVYWCKR7rJDCxx8iN99jph7GtO7/K
 f64c+6spb8FoDt3jVkuq0+0nuNgXTqfjuNk/IMDkt365T0D0KvEZ/YHqsxoz/aWw
 ==
X-ME-Sender: <xms:Q34oYZcC6jsW9rKkVfZMAQgs7wSd9Hbw6CKmgTSXZJsWbZ21fYWVAw>
 <xme:Q34oYXPgIF55ShR0RkOr0HEPwqYcQwa3RoPUysJF1xm8d4sLysaOxpbyPlYr_1NIB
 Tr7eawe2xGHglTBB4I>
X-ME-Received: <xmr:Q34oYSg7Czk_XP-gdWHmbIgPnyZbk4WihFZ4U4OPK-wwZJ1J5SYSymW-YgnRdqR3kKXmxo5bdSI-aF-cWJ8rLxZ9ZWowQ5BM-REvo8yDtCgX69rMYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Q34oYS-Msd67s31BFAxY3ivNw8bKuXbB-V7u5C3nv56qkeslW71rEQ>
 <xmx:Q34oYVuuIo_34JvSQAlDW6Gyy6KA5lxiwqPR54E4aSUZFOL2Zi0Ijw>
 <xmx:Q34oYRGbNEHPmlHvHzOCblaBHopd5BX2soaBdbPSXp6bYbbczem8PA>
 <xmx:RX4oYbA9H5h8fPxXRl4Yl4JNUE0iud6CPa0m9_2S1a2awpJ6tDr1mQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 01:55:14 -0400 (EDT)
Date: Fri, 27 Aug 2021 07:55:12 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 07/11] util/vfio-helpers: Extract
 qemu_vfio_water_mark_reached()
Message-ID: <YSh+QH25YQknMJUe@apples.localdomain>
References: <20210826195014.2180369-1-philmd@redhat.com>
 <20210826195014.2180369-8-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LGOpx5gI6c3RyhmB"
Content-Disposition: inline
In-Reply-To: <20210826195014.2180369-8-philmd@redhat.com>
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


--LGOpx5gI6c3RyhmB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 21:50, Philippe Mathieu-Daud=C3=A9 wrote:
> Extract qemu_vfio_water_mark_reached() for readability,
> and have it provide an error hint it its Error* handle.
>=20
> Suggested-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--LGOpx5gI6c3RyhmB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEofj8ACgkQTeGvMW1P
DenwrAf7BbG9/DRmbaHl/OSYwIQLw9Q01v1xWCjAWumDzo7aQfcdPBoWLXjQ88ar
5xRDuH4PsSOqrdEh6a8RCIU0fHuHhNymQnWL0Y4gzBjXJ4y7yW7y/+dO7IZLnq10
pY9EQ9dOVgs/j0S+pXQBZu+pcnrUOO0XnNYkh8YCUww5Pd6nmc62owVDtcW10Fdz
5/zFcTZvgQM1ViFkchMQoi2aSE7MiQuaE32+t35XB1qR8FmjF7W5+hAq76fNSwcq
A/L8/HJvsoTKu4nPpUFTW51MM6RZS5QNtZ2AmEy/MEg/lxQ8SmJePvNuWUXYULMH
63mvcZXP/PvV6JPGvNH7hWWw8R8wcA==
=WNkL
-----END PGP SIGNATURE-----

--LGOpx5gI6c3RyhmB--

