Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA650332F7A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:01:38 +0100 (CET)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiXx-00022j-Op
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJh4b-0000Di-8v; Tue, 09 Mar 2021 13:27:13 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:48275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJh4Z-00014q-1o; Tue, 09 Mar 2021 13:27:13 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 638D55C00FF;
 Tue,  9 Mar 2021 13:27:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 13:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=u00T4U9tlRto6VjyWvNsgCaEgKC
 KJw0hmTOQteFn7O4=; b=L1IC5JU+oD6wDhDYHOei5UjCyC6uEaU8Yca0dzFry7Y
 19OQbN6IQOUBWileq4HBp/zYi5PMhTzXeqvMay4WEGXbCeRH+UxpyX2wSzebmF01
 lM4ssORyV8F642wDBJlx5xGlvjdidFLHLqcG/fq3zfmuT2UBVpAyQcHf5hUIbens
 YhvS/zrbaeL/YwB7eloJakpAPLBvDWdCXn2fRWyOebG+vbS5bBW/ZKK1yI+9GZiB
 944driKtYhmLiPQY615/XYhJJUb3UsXxCbbHmfWjzqTk/yPsH+EMrgHWENdoJSiV
 rxtrw2e69og4rfArBnujXnzi9PPkJ9RYh/PJxV6yoGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=u00T4U
 9tlRto6VjyWvNsgCaEgKCKJw0hmTOQteFn7O4=; b=DbUR2j+3I+SpX/MRGvWrpC
 50uoXC+SzPnIyjuvPAvy/OZ0hQ2D1vk6UFfAX9iv19lpHacmpzZ18BCLVboDMo+a
 nB4oOKy6OCDPgi7Tr3ULfchxoghRLLFc53ZMB5DK8/GUsaKC1zCQQst1PUa39WCm
 WbWqYAlMJ2Jr0t8WgEB9CMuoHbvoH1UBevsW5TYAE8e6dFUGZVIME9mobru4j6vq
 UpyON/m+/+SPcFyLIUo9UXCbZ9NF0uFnM5yzP1hS370S5IMzKIgWddyeXAdGk7ZO
 rH4imR5r2LadBAnYiYxrQpRo8SrhkMvFOAkdw9yDKOuENdwzzHwXCGSKXtOQyryQ
 ==
X-ME-Sender: <xms:_L1HYHWVp8y91BhsovyykrmnEILl2Cu_6rI8BDMs7yaKfXX5mdTzSQ>
 <xme:_L1HYBHrHnceSyOMLekBLOjO-Vkuzn4ZzARVtDNa9XiSi0hG-DerEdRbrFAKvf4_I
 z77TsYwS6rcvIEzE1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_L1HYDcZHSZAQw6dd3TMVg0Mtfw0ABni_1uuGpT4HEyWwRm8-9TL3w>
 <xmx:_L1HYCKAu1OQFsbHqQo3dgpSltFcWEusG_yc_BjxFj-SnCUUoETrsA>
 <xmx:_L1HYIFihQ3BLkoApmr2EjGeDnKLf7urjPpnepXIyNIq4C-FYw3pmw>
 <xmx:_b1HYE_I1s06yQ9nwejz6PjjoQt5cN--UvrkCntNVVs7L9CulyWYHw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D445240054;
 Tue,  9 Mar 2021 13:27:07 -0500 (EST)
Date: Tue, 9 Mar 2021 19:27:04 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC 1/4] hw/block/nvme: convert dsm to aiocb
Message-ID: <YEe9+EFffSaZEJiq@apples.localdomain>
References: <20210302111040.289244-1-its@irrelevant.dk>
 <20210302111040.289244-2-its@irrelevant.dk>
 <YEZSr7Y/Y4+NJY5V@stefanha-x1.localdomain>
 <YEZndKMdZcMvDKck@apples.localdomain>
 <YEecWpaChyb883Ut@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hf7YFNzrVkgefhSp"
Content-Disposition: inline
In-Reply-To: <YEecWpaChyb883Ut@stefanha-x1.localdomain>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hf7YFNzrVkgefhSp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  9 16:03, Stefan Hajnoczi wrote:
> On Mon, Mar 08, 2021 at 07:05:40PM +0100, Klaus Jensen wrote:
> > On Mar  8 16:37, Stefan Hajnoczi wrote:
> > > On Tue, Mar 02, 2021 at 12:10:37PM +0100, Klaus Jensen wrote:
> > > > +static void nvme_dsm_cancel(BlockAIOCB *aiocb)
> > > > +{
> > > > +    NvmeDSMAIOCB *iocb =3D container_of(aiocb, NvmeDSMAIOCB, commo=
n);
> > > > +
> > > > +    /* break loop */
> > > > +    iocb->curr.len =3D 0;
> > > > +    iocb->curr.idx =3D iocb->nr;
> > > > +
> > > > +    iocb->ret =3D -ECANCELED;
> > > > +
> > > > +    if (iocb->aiocb) {
> > > > +        blk_aio_cancel_async(iocb->aiocb);
> > > > +        iocb->aiocb =3D NULL;
> > > > +    }
> > > > +}
> > >=20
> > > Is the case where iocb->aiocb =3D=3D NULL just in case nvme_dsm_cance=
l() is
> > > called after the last discard has completed but before the BH runs? I
> > > want to make sure there are no other cases because nothing would call
> > > iocb->common.cb().
> > >=20
> >=20
> > Yes - that case *can* happen, right?
> >=20
> > I modeled this after the appoach in the ide trim code (hw/ide/core.c).
>=20
> Yes, nvme_dsm_bh() may run after other event loop activity. Therefore we
> have to take the iocb->aiocb =3D=3D NULL case into account because some
> event loop activity could call nvme_dsm_cancel() before the BH runs.
>=20
> Another (wild?) possibility is that nvme_dsm_cancel() is called twice.
> That's okay, nvme_dsm_cancel() supports that nicely.
>=20
> But I wasn't sure if there are any other cases where iocb->aiocb can be
> NULL? It could be nice to include an assertion or comment to clarify
> this. For example:
>=20
>   if (iocb->aiocb) {
>       blk_aio_cancel_async(iocb->aiocb);
>       iocb->aiocb =3D NULL;
>   } else {
>       /*
>        * We only get here if nvme_dsm_cancel() was already called or
>        * nvme_dsm_bh() is about to run.
>        */
>       assert(iocb->curr.idx =3D=3D iocb->nr);
>   }
>=20
>   /* break loop */
>   iocb->curr.len =3D 0;
>   iocb->curr.idx =3D iocb->nr;
>=20
>   iocb->ret =3D -ECANCELED;
>=20
> (I'm not sure if my assert is correct, but hopefully this explains what
> I mean.)
>=20

Understood! I'll fix that up.

> The reason why this assertion is important is because nvme_dsm_cancel()
> does not support other iocb->aiocb =3D NULL cases. The cancelled request
> could hang if nothing completes it. The assertion will complain loudly
> if this every happens (may not now, but if someone changes the code in
> the future).
>=20

Yeah, I understand that there is a risk of dead-lock due to "weird"
scheduling if one is not careful.

Thanks Stefan, these kinds of comments are super helpful when trying to
wrap ones head around this!

I'll give it another spin and post a v2 taking your comments into
account :)

--hf7YFNzrVkgefhSp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBHvfYACgkQTeGvMW1P
DekVtAgAlIe1yFYeTFTXe5zBOrEdD2P2obesfbh39r167MEocKOQYL8OnhMwozqk
kPbjFUUOg3svtTySqFI/zkME12W/7ZBoxHmQlG8NEu+y9czyHscbkUbZ25qKC8eA
dxp1CjzUkNMlUFZ0iLBi2Ta34EQ9RiO5eIgvjdpJGdOjs6Jj4YiXoLugm5sHoMPD
G3crDqb/adkKVrIWLhf54oHtTPXmYHCyTvjcY0lAD9U6LPmKhvqUtKP6hmfQMgY2
J8N/ag4iC2y5sT8onBRZkMIwyZTDnJb2mAdvcjTDFQpMyh9eG/c68j3cWvtQ2mum
81mMCuG2JybKlzQBbcGl7jYl8pzMJw==
=4ztN
-----END PGP SIGNATURE-----

--hf7YFNzrVkgefhSp--

