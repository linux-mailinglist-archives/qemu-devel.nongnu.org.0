Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750AA502F6C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 21:53:03 +0200 (CEST)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfS05-0005vn-Kt
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 15:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nfRpg-0003Pt-JG; Fri, 15 Apr 2022 15:42:17 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:42057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nfRpe-0001dU-CO; Fri, 15 Apr 2022 15:42:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9EB633200A2E;
 Fri, 15 Apr 2022 15:42:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 15 Apr 2022 15:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650051729; x=1650138129; bh=4L
 WebQwAVYJblE4IQoLTgkjaGiqCwwl3CR78L+jAqYM=; b=h/a1C1150BNcV/kdLw
 WbsP44jFk6CK+LJdHpG+6ckW+OPCE+F2/pM7NvW2QKW8LfhngHqeHBOVxUVbxUMm
 F3BVXulbETiI3C9xwNSIS7bTnUVh5kz1I0ATULd7kmbbYNo6LZ3QmEGofz6Ff1HG
 hcDxI0Y9p5arowfG2m/onjE1k1nCKOPQdzXGyf+Y40yKof+pAhiTm7XyqfZ0CwWI
 yTO4MFsL76sYZGI93QjyAm7qemIoxI+uC2jWkv5pSqp8eOyhP+b4dPWAAbgMRZK2
 cJWk/9MLLgHXQu3NpQvRn9W+WjbTX5AtrVYP6j6kSNappSeCcfxOTv8zrWbi/I96
 EMgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650051729; x=
 1650138129; bh=4LWebQwAVYJblE4IQoLTgkjaGiqCwwl3CR78L+jAqYM=; b=o
 JbyHW9vPLGsCKYXHDN3TYpCLbyoi8ejbrTe9HObZ4Bno+VQ7YmCbjkBpCDoCepMP
 jdFYuPJnE4iVFlQeCBkjNmKUHOHjvesKhkAXreisWD0Ry+K0Ppv5a2sMlZpKaOmC
 /IUlUkebUEDCAKUmXIPg2wsUyDf5jRzSckD7xm1unBoiChdWIUBQsqmIJzs8CGoH
 RboaNnQNd7xe5NwhLoslwAQIRXWvANAPjYFgnXfTYFXZLE6CM9QZ0Rq5zxDmgO38
 j8lVPeTPZwiVSGwBJXaBHoBYDmUGM/PilVbzQZqs2Wljf1CfEeAOFq+idKnXrPGu
 csuo73i3cOBsc5DiCD1cA==
X-ME-Sender: <xms:kMpZYkw_YvJZPawP6IvYg_ADKiWbNzhfYaKGuy6muhF7s8rp2u7-lw>
 <xme:kMpZYoRXuQJW7t238vFyzBG1pfx0aoDzX5E8WieIUmmEY5sXmIkjDpYR3abEompmj
 1XdqSQ1ey7NkNGGFyI>
X-ME-Received: <xmr:kMpZYmUzm8pmvCtSEQMOn87_uBbBYA5TFBDSZuc5nvsob7Iq0uKEgRiu69O1igpnEf3qCsz3poF9EA066PA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelhedgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:kMpZYigMQfA5eKyXj8MPcqHoBtuRQ8SOsAEW1Gfxn9Xh9oi5iTmw5w>
 <xmx:kMpZYmDhwd3MrDabG49VCY977rdiG1j8p-b1YusB_IM4xL_DaxDMXg>
 <xmx:kMpZYjLSbyFaRO9TgnHiwI4jNw9u7XOoeYXn-G4Uh4toPFyku3sXoQ>
 <xmx:kcpZYt5EqziVqMQX4ncw4v7Pq2gFZE1H33gbFt2bZtRj8OQfuACISQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Apr 2022 15:42:07 -0400 (EDT)
Date: Fri, 15 Apr 2022 21:42:05 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] hw/nvme: fix control flow statement
Message-ID: <YlnKjTc4FRkfsOv9@apples>
References: <20220415192721.tkbokbl65rrwkbew@localhost.localdomain>
 <YlnI8EONxaX/fnPZ@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jNzA3hlA70mb3Ywr"
Content-Disposition: inline
In-Reply-To: <YlnI8EONxaX/fnPZ@kbusch-mbp.dhcp.thefacebook.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: ddtikhov@gmail.com, linux@yadro.com, Dmitry Tikhov <d.tihov@yadro.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jNzA3hlA70mb3Ywr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 15 13:35, Keith Busch wrote:
> On Fri, Apr 15, 2022 at 10:27:21PM +0300, Dmitry Tikhov wrote:
> > Since there is no else after nvme_dsm_cb invocation, metadata associated
> > with non-zero block range is currently zeroed. Also this behaviour leads
> > to segfault since we schedule iocb->bh two times. First when entering
> > nvme_dsm_cb with iocb->idx =3D=3D iocb->nr and second on call stack unw=
inding
> > by calling blk_aio_pwrite_zeroes and subsequent nvme_dsm_cb callback
> > because of missing else statement.
> >=20
> > Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
> > ---
> >  hw/nvme/ctrl.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 03760ddeae..7ebd2aa326 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -2372,11 +2372,12 @@ static void nvme_dsm_md_cb(void *opaque, int re=
t)
> >          }
> > =20
> >          nvme_dsm_cb(iocb, 0);
> > +    } else {
> > +        iocb->aiocb =3D blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_mo=
ff(ns, slba),
> > +                                            nvme_m2b(ns, nlb), BDRV_RE=
Q_MAY_UNMAP,
> > +                                            nvme_dsm_cb, iocb);
> >      }
>=20
> Instead of the 'else', just insert an early 'return;' after nvme_dsm_cb()=
 like
> the earlier condition above here. Otherwise, looks good, and thanks for t=
he
> fix.

Dmitry,

Agree with Keith - also, please add

  Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")

Thanks again!

--jNzA3hlA70mb3Ywr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJZyosACgkQTeGvMW1P
DemT8Qf/WWDNhr8OfOt2ZFA/8xCCq+ejOY7DuqcCCaw3KbfKWjluaftAaG7julcj
XJSxXp3w5l6GhisUfMXRuoME+mOi6yhYShbVWTWsUnYs0CcQHuRlT9ok8Lakn0C8
KapWyHxdPlnStdK7Mxa9mvrytuKMxMU4uFRaTgMLsxNeXxOjQLT1fnnE886kz0sJ
dlM67qXhjGFUTpgRsD4T90dv83GjeVUZsrpfA89DmObZbFt3L2ouAKSi4MgYigW6
APXgOc8gjBjvp+aUoIWOFajzQTsMQIvI/pnJnLIcSie5C9w+YbxVWddQLcDAuHkD
SdBbC4OGAIr4+Exw29k5cSvpNaHZ1w==
=Dk1L
-----END PGP SIGNATURE-----

--jNzA3hlA70mb3Ywr--

