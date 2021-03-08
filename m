Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFB1330A84
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 10:51:04 +0100 (CET)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJCXX-0000px-Mw
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 04:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJCTG-00009m-SS; Mon, 08 Mar 2021 04:46:38 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:42269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJCTD-0002XY-H1; Mon, 08 Mar 2021 04:46:38 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 628CF3485;
 Mon,  8 Mar 2021 04:46:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 04:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=qzxGbPmDviDT8rnKQoyTElC7AQK
 JZ8KKq2mQuLEObx8=; b=z4T/ZonqFPWG3lxVT5Piolg+gPJhuKYb2C1wT1ELu6m
 tF+STFQpUagYU5hs/8QItqwlLtr3sNL6mdyGmS2eb807okCHzoMCsovzSjo63hGK
 tVAppmdYkVr7GMi+3tr8sQmTU4vYwXwy7H8kPKqzWwITzXnKKaKqEnslOeH5gqE1
 KDxiKOYJ2J0Y9cykOyp+7zWJgRawbJcEAlgShIhNzqFxU/allzyMRIrWNx+Oi6pt
 hiXRkQ0TAamveOtCsYoilS5IX6iLQ3ofPLWwqiTvniEOn8f1zFDoA41kU0V2zZt1
 gb4OuFYyZJeMKG7ZbU+0m3BpUwmx4BbOc6XtR/sC/sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qzxGbP
 mDviDT8rnKQoyTElC7AQKJZ8KKq2mQuLEObx8=; b=WBR5thF0VFHpnliGSYgztY
 Gh226ZJ0Wrz14NpAMmTsg0B3RyYQs9n69jhtiR+edn3ZJWmzXfatAq2HqWGnYrNx
 0IPkVbPP+l7ZVGgTv8IgP9VBvXVt1N5aDbCR/ZVr+4gBoj7ztySAe9ejTNIfPDDb
 WzpsWZNDmt31+18jyhcD/liAqJpvTgwDBNefOR+MKPnqkuzOq6Hm4oYq5SP70Tr4
 9XgMhbw5pqYKkXhOpvRnXt4PJXqD7f9cpzNRItEeBRwT/IDd6I+9Kubd3BYKT5WE
 JslJYM9SpKtoi69QNFihGGOCwnNxruu91DnvnX625HfznEIf7UCjpKR7twuKk6qA
 ==
X-ME-Sender: <xms:dvJFYMkPaLE5PJy_HUWbO0qAGzP7C8akvvU4xHqRWvGkKVkbBIl-OA>
 <xme:dvJFYL1qvypv7N7ohkdafGQ5EnylPPRtC23h4K9XVPOi3MCol9CSuYqPdonh0gKfX
 nBpXirSN37zRIVm_Jo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:dvJFYKqYAnH_k6iih23cfe1BhFiA3l6knb9r2omRjaKBwFRHxSiwOw>
 <xmx:dvJFYIko3-CcIv6xUqfahsZIzjtB8avDVArHj5hUhTUT-j4XrFCjCg>
 <xmx:dvJFYK0c_6VSxYyEbZ-FibM_V4zt3_GKuaMzfTwPNUOQASACQVVcEg>
 <xmx:d_JFYG-DNStQoZXxJfiJq5FROtJbW-qrFLqzEIjiIWqvie60wQKNNg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0DC8C1080066;
 Mon,  8 Mar 2021 04:46:28 -0500 (EST)
Date: Mon, 8 Mar 2021 10:46:26 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] hw/nvme: move nvme emulation out of hw/block
Message-ID: <YEXycjnozuTutjFK@apples.localdomain>
References: <20210301113509.79706-1-its@irrelevant.dk>
 <bc248cb6-f8e4-8d6e-82df-9fe914779995@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ORZxfNy5meCjTKJR"
Content-Disposition: inline
In-Reply-To: <bc248cb6-f8e4-8d6e-82df-9fe914779995@redhat.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ORZxfNy5meCjTKJR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  8 10:44, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Klaus,
>=20
> On 3/1/21 12:35 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > With the introduction of the nvme-subsystem device we are really
> > cluttering up the hw/block directory.
> >=20
> > As suggested by Philippe previously, move the nvme emulation to
> > hw/nvme.
>=20
> Maybe type "NVMe" when talking about the technology and keep
> lowercase "nvme" only in paths?
>=20
> >=20
> > Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> > v2:
> >   * rebased on nvme-next
> >   * got rid of the second patch (Minwoo)
> >=20
> >  meson.build                               |   1 +
> >  hw/block/nvme-ns.h                        | 193 ---------------------
> >  hw/block/nvme-subsys.h                    |  32 ----
> >  hw/{block =3D> nvme}/nvme.h                 | 198 ++++++++++++++++++++=
+-
>=20
> I'd split this patch in 3:
>=20
> 1: Add missing license in hw/block/nvme.h header
>=20
> >  hw/nvme/trace.h                           |   1 +
> >  hw/{block/nvme.c =3D> nvme/ctrl.c}          |   1 -
> >  hw/{block/nvme-ns.c =3D> nvme/ns.c}         |   1 -
> >  hw/{block/nvme-subsys.c =3D> nvme/subsys.c} |   2 +-
> >  MAINTAINERS                               |   2 +-
> >  hw/Kconfig                                |   1 +
> >  hw/block/Kconfig                          |   5 -
> >  hw/block/meson.build                      |   1 -
> >  hw/block/trace-events                     | 182 --------------------
> >  hw/meson.build                            |   1 +
> >  hw/nvme/Kconfig                           |   4 +
> >  hw/nvme/meson.build                       |   1 +
> >  hw/nvme/trace-events                      | 180 ++++++++++++++++++++
> >  17 files changed, 387 insertions(+), 419 deletions(-)
> >  delete mode 100644 hw/block/nvme-ns.h
> >  delete mode 100644 hw/block/nvme-subsys.h
>=20
> 2: Merge nvme-ns.h & nvme-subsys.h to hw/block/nvme.h, adding
>    Minwoo Im (c).
>=20
> >  rename hw/{block =3D> nvme}/nvme.h (55%)
> >  create mode 100644 hw/nvme/trace.h
> >  rename hw/{block/nvme.c =3D> nvme/ctrl.c} (99%)
> >  rename hw/{block/nvme-ns.c =3D> nvme/ns.c} (99%)
> >  rename hw/{block/nvme-subsys.c =3D> nvme/subsys.c} (98%)
> >  create mode 100644 hw/nvme/Kconfig
> >  create mode 100644 hw/nvme/meson.build
> >  create mode 100644 hw/nvme/trace-events
>=20
> 3: The rest (basically this patch).
>=20
> Regards,
>=20
> Phil.
>=20
>=20

Thanks! Good suggestions, I'll respin it!

--ORZxfNy5meCjTKJR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBF8m4ACgkQTeGvMW1P
Dek2fAf6A8g2tEOU/q1wqeV47P658gHJT+DWFoVYJU9NcJyXDS/7wG2+5UtaAlfH
X0GAZFMSMUjjnIihBuGy0jYi69lZpMmz5zTo7otT/7ntxpmQL7WrPALfIM2Z9CQy
ihUykXSraOcpmAmL82G1N1/4YzFV6aO8PlTnY0Kgl7HOM41kHwyOb0oZKzBKVbsm
n8hbGjzuhTi734REzLhJM5JC83MP4wlwDBuAQ2HmmOadsQsgdFePMbcScydGytHP
l4vsPp1eoUwzKA5nk4YuszPSo96wxF/AqMlxEgvO4eQ1ejikhQ4nucEp3juc75wK
T2dgN0HaMZPMO4LZazyCZrmlyTsKqg==
=XkHP
-----END PGP SIGNATURE-----

--ORZxfNy5meCjTKJR--

