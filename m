Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B668351FB71
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:38:25 +0200 (CEST)
Received: from localhost ([::1]:44370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1ia-0003v6-6Q
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1no1K7-0002wI-Ry; Mon, 09 May 2022 07:13:08 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:40143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1no1K3-0001OI-Sk; Mon, 09 May 2022 07:13:07 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4AA815C0113;
 Mon,  9 May 2022 07:13:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 09 May 2022 07:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1652094780; x=1652181180; bh=SF
 Tt0hJM3+3HxeDsyiDSH6Z9mRo+vO49s7tnCOHbT3s=; b=BqChR13aGR3lkSHyRn
 WUoWXd8iqZEVi412/3qbGmI27RqEdHwwF3Yw6+OjIdhOmkG8nBVYxXqSKKmRtqlZ
 Q1ErdF5CtrF8UgXNj5mzzOW/TLIGTiYhUocUfoiWZieH/JgTlvEq+63wuInoynTU
 bUcO1OW7eX6ozL9G/oMufz+v1QBuxQn41dhqny62Z9b60hSDt8xBeQIGYi+0KqyF
 s4kEVmH/gikh9V1SL8FSKglkHm4KmeCJ5jhkAzaFI0uowhtlwBLnk7oEw5bvpnTQ
 esVutJqkG1+gOawQlqKfMpCVDfhZf6IWxzEdWmqa/4pN7MMCZGfoD2tESuDeM8ba
 07ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652094780; x=
 1652181180; bh=SFTt0hJM3+3HxeDsyiDSH6Z9mRo+vO49s7tnCOHbT3s=; b=m
 2m4LB3VQkF/jaVoErCoFTLiDHD7jkmiMgyyAndQgWYY2x3wRytHgxmF8Q9aaNSsB
 BiEcCKSIVU037m2TVloFqQkBH7y7V0wbzgD6i+LOugXAsYFROSuZA3lXewhk6ADJ
 bqwR0mKxSedwL0jM7jGnKITvq/K3PEC5T8Q5SprhsYKlySGI0joLFgovyguu6oFL
 YhvcfvHma9/McnZzqj46cX14RCjclVWVyCkJeYLtnMOZKY6Jo5bkbuL/QRpJyMWl
 jLW7K0Og7tdT9ejehC5GtRbir4X3xXsmgUUlMoH6hffsZWo51Hnaelku94lrirvN
 ZIjctierBcyzBcXM7JWNg==
X-ME-Sender: <xms:O_d4YkYnRosWtHgVkJExaVxKSsdgsyrA89OAoYl7AeBRbOppeZ3aOA>
 <xme:O_d4Yva4pYTzoZNdTRq2MaPMudUhOyxxsYRwANR3fVodIhBkgd_aGvetpaI41n5pc
 Sw3frSDYGffAsfhXPA>
X-ME-Received: <xmr:O_d4Yu8c5Sw6dMoysUWRLrcfzJQcjL4f4NIMAGm0cH-wG-TNeBM7OMKpT-GbiN7Ck9Cmsx57CrTbAC_d0C4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeffuddvhfehjedugfeijeeuieelgeevuddvlefhkefhgfettefftddvkeevieel
 feenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:O_d4Yup3wyhnx4nEmOe9cqHEOOSbciCeSpiHntVZoaGj2jNc41HT7A>
 <xmx:O_d4YvoO8qywpKw3ZpK9SlV5hXst8cTmxFMp_snWUaQDiAxaS8Rrtg>
 <xmx:O_d4YsSY4zd12ZZLehqaOTpwrF26l54a60Mzi4F4NHI5L22WH1amkQ>
 <xmx:PPd4YgCFnwN9N-uB7NjtARTZ8ZMlnKY9R9JmA2mvaa2z5BGIkTUexw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 May 2022 07:12:58 -0400 (EDT)
Date: Mon, 9 May 2022 13:12:56 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: kbusch@kernel.org, k.jensen@samsung.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, hch@lst.de
Subject: Re: [PATCH 0/2] hw/nvme: support smart AEN
Message-ID: <Ynj3OArUqeiCMyVc@apples>
References: <20220507072644.263105-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nCJN3q6bK6wAZzZj"
Content-Disposition: inline
In-Reply-To: <20220507072644.263105-1-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nCJN3q6bK6wAZzZj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May  7 15:26, zhenwei pi wrote:
> Hi,
> In this series, firstly introduce smart related bits of aen cfg, then
> support this in oaes.
>=20
> Linux guest does not support this currently, I also send a series to
> enable smart AEN:
> https://lore.kernel.org/lkml/20220507065026.260306-1-pizhenwei@bytedance.=
com/T/#t
>=20
> Test the two series together, works fine.
>=20
> Zhenwei Pi (2):
>   hw/nvme: introduce smart bits of aen cfg
>   hw/nvme: support smart AEN
>=20
>  hw/nvme/ctrl.c       | 9 ++++++++-
>  include/block/nvme.h | 8 +++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
>=20

I'm not quite sure what you are trying to achieve here. Bits 0 through 7
are reserved in OAES, they are not optional.

We already simply accept whatever the host configured with the
Asynchronous Event Configuration feature. And you added the support for
triggering custom AENs for those through the monitor.

--nCJN3q6bK6wAZzZj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJ49zYACgkQTeGvMW1P
DemBbQf+L0TyOcpOGl/HElzlhWl0XjvDpt/XRx4LiC9LtnRiOXAr0FOpqordSzj3
4zP3hvEBdOR4qcRCdFFHSMHrxjKoROzL53vGCCL7TbWHgIdrG2LOmwrDo+U2hMUw
IXqPkQCeSsFLn+H8CFe32ue/LuQUUq04Ezl/oIwGQAjttEHpeBh+TXLtA5m7BbPI
kliDaNYiqAoX8QUmJeXrGJTI11tJsEXoGgZwkZGbNNrr7t3SGJgCYqsO9fgQNFdv
9YnKBSIPiZl9iW+ngoZ+zdvrTtQCr6EJd72BiW92RP9SI/UeB6yBXeW0yqzHCrLP
1gbty4+IZeV/a9E4uNMPhMnwEBN/+A==
=P9Xm
-----END PGP SIGNATURE-----

--nCJN3q6bK6wAZzZj--

