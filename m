Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D8F302C2A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 21:05:41 +0100 (CET)
Received: from localhost ([::1]:59922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l487H-0001Hc-Tw
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 15:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l480r-0008Jw-HO; Mon, 25 Jan 2021 14:59:01 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:51405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l480p-0006Lv-PU; Mon, 25 Jan 2021 14:59:01 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 6A64AED0;
 Mon, 25 Jan 2021 14:58:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 25 Jan 2021 14:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=eHwv1/Hf3nivRTlNt9fvfXAFnAu
 Uh323arerTW+AfL8=; b=wNUBBAcsSEf70JyJ9a1tPk9KA0MfC0NlNZ3Cy0P8fTF
 nGcqFXWsW0fbFjkjcFHi7fG+VKZaiivWfMJmAbOZkt7EX0GtAxyxnvEimX0DpX3C
 kCV16hr3Yh1qIOPaCTWhjdHvgNQwIbIwPmxtivWAOlAqhcIiZFsFoPzbxh0jELtt
 Qh3St28rMNwuR082t3Wq0B/enq1CST+dF8CR2twFnxQALKTHgc3zhzHffNwMqXOp
 /yQ4TBk82fEzUQSRImme83Rp64TR0nM4THmtEj4ilPs4Y/Z0dbHC/gjqTPXYT0QE
 S0A49SC1cKU8SfWKQpttPcrDMW7k3wFkeOJwIBfG5Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eHwv1/
 Hf3nivRTlNt9fvfXAFnAuUh323arerTW+AfL8=; b=kJZf1hdu/1OpuIOAglAu9O
 oWK3DKvquUTC5jGkw7etuHqbgGOVOya+5esyPPSeJRtSbtuiyq2cIu5rg7I607Lx
 HdI1yM2zxdTRtIT4qC2m2j+21cPcUBlpTpVQWgYIba5UdgG87Ly7gZCOzLMYorjI
 gOuwDvSTCw6UgUdyLGBgSOy9Fzv4FklFsn3plAmfNaftaeMZ5D12JUCI6UUhOGXj
 pMWKMVT2GW3nRVZMbm8/H6Dxtr5MjkRGbl0xWuI52eSCJd6G325tRjwO8BmOF7p/
 8WtEKlVWH4RwdEeECxF2jRe0bGYVO6XdaO8QVevr6zfBCfrvU13kjAvrXJ8UtLfg
 ==
X-ME-Sender: <xms:ACMPYLUKEaVK5hU07RfuxXamZnJjLXiWla5Ucf0icrFoO0fUjTwBXA>
 <xme:ACMPYH0i4Q0OUftg8bNWWeC_yIdIu3FQBsrSLPZsBMJoN7qnDr_XWqwich2R5YtVh
 N__USbZrtM3MXV_izA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeehgeehgfffgeekveefteetudekheejffdtvedvudfgffelleefvdfftdekgffg
 udenucffohhmrghinhepvddtudelqddtkedrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ACMPYCbqviCs9umofZh4MNfCtcnWkKErP7oNgH8zQfFU5zqYZCLarg>
 <xmx:ACMPYKrfrlUPO2U8Zg7gl2ofUU42Pxr_UN9HbcLUJTUhxFFmBkRy1A>
 <xmx:ACMPYOqWsw3LCjmueCkqJ_PmwePw7NlDZU86PL2JQbnvX0okRhJxug>
 <xmx:ASMPYAkHEKvqaErQr8CCfTPtb7k21tuJLhhkwOilh2LlD6v0-vUlMg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B2189240064;
 Mon, 25 Jan 2021 14:58:55 -0500 (EST)
Date: Mon, 25 Jan 2021 20:58:53 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V6 1/6] hw/block/nvme: introduce nvme-subsys device
Message-ID: <YA8i/ZoxWV0VjCJU@apples.localdomain>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
 <20210124025450.11071-2-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AJ5179kGwEKr9EYf"
Content-Disposition: inline
In-Reply-To: <20210124025450.11071-2-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AJ5179kGwEKr9EYf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 24 11:54, Minwoo Im wrote:
> To support multi-path in QEMU NVMe device model, We need to have NVMe
> subsystem hierarchy to map controllers and namespaces to a NVMe
> subsystem.
>=20
> This patch introduced a simple nvme-subsys device model.  The subsystem
> will be prepared with subsystem NQN with <subsys_id> provided in
> nvme-subsys device:
>=20
>   ex) -device nvme-subsys,id=3Dsubsys0: nqn.2019-08.org.qemu:subsys0
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/meson.build   |  2 +-
>  hw/block/nvme-subsys.c | 60 ++++++++++++++++++++++++++++++++++++++++++
>  hw/block/nvme-subsys.h | 25 ++++++++++++++++++
>  hw/block/nvme.c        |  3 +++
>  4 files changed, 89 insertions(+), 1 deletion(-)
>  create mode 100644 hw/block/nvme-subsys.c
>  create mode 100644 hw/block/nvme-subsys.h
>=20
> diff --git a/hw/block/meson.build b/hw/block/meson.build
> index 602ca6c8541d..83ea2d37978d 100644
> --- a/hw/block/meson.build
> +++ b/hw/block/meson.build
> @@ -13,7 +13,7 @@ softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: file=
s('m25p80.c'))
>  softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
>  softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
>  softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('tc58128.c'))
> -softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-n=
s.c'))
> +softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-n=
s.c', 'nvme-subsys.c'))
> =20
>  specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'=
))
>  specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-use=
r-blk.c'))
> diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
> new file mode 100644
> index 000000000000..aa82911b951c
> --- /dev/null
> +++ b/hw/block/nvme-subsys.c
> @@ -0,0 +1,60 @@
> +/*
> + * QEMU NVM Express Subsystem: nvme-subsys
> + *
> + * Copyright (c) 2021 Minwoo Im <minwoo.im.dev@gmail.com>
> + *
> + * This code is licensed under the GNU GPL v2.  Refer COPYING.
> + */
> +
> +#include "qemu/units.h"
> +#include "qemu/osdep.h"
> +#include "qemu/uuid.h"
> +#include "qemu/iov.h"
> +#include "qemu/cutils.h"
> +#include "qapi/error.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-core.h"
> +#include "hw/block/block.h"
> +#include "block/aio.h"
> +#include "block/accounting.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/pci/pci.h"
> +#include "nvme.h"
> +#include "nvme-subsys.h"
> +

This can be slimmed down to

#include "qemu/osdep.h"
#include "qapi/error.h"
#include "hw/block/block.h"
#include "sysemu/sysemu.h"
#include "hw/pci/pci.h"
#include "nvme.h"
#include "nvme-subsys.h"

--AJ5179kGwEKr9EYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAPIvsACgkQTeGvMW1P
DelspAf/deAvfYTp0wn2w8lD41XGrBcil/2itCCB4fhdCuxibq4yZYKd7gmf77Qf
qi1HmvofAabmZwQBJBrK/X1ycKtgFjwzFTC6xEPSSy6Pmzk0ye1Ifj1UpjKS4yhV
BLLHB1KaQCcYYODGsDN621GKQG4HW/iHei80MWjyjfxq21r/n38SzvcKLUomdL76
LkXpQ+n2UlRspyzuhUhjLMarQDhMjmY7bg5MEpUTnIsiHnj6Id8Wqslooc9eP1pd
vzjJtaA0uCxqz6nzDbUmHtsRiN1YacR7cZy/B50beRvvsbVTMNiZr8uk9i9p8TBg
kAf76nuc7UzXwdKcndA91DDW/uHevw==
=elMl
-----END PGP SIGNATURE-----

--AJ5179kGwEKr9EYf--

