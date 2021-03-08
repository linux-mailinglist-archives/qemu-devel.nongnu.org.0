Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F25533160B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:29:04 +0100 (CET)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKcp-0001Zh-7Z
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJKGL-0001v7-2A; Mon, 08 Mar 2021 13:05:49 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJKGI-00047k-ME; Mon, 08 Mar 2021 13:05:48 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1DAED5C00C5;
 Mon,  8 Mar 2021 13:05:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 08 Mar 2021 13:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=T49iYwh/Bu2BmP3gSvMU7Gqlh9S
 DrChLUWOCWfOLkt4=; b=GIcHvxk+b7Sl34YTEs0oql8N47A3AIIt9f7qZdV3F68
 4t+JQsf2dPVEekrNWI+5ZWdk3KDTPh5v4L2lQJan8eOJ3X/sGDGqTfYZ2XaWr3pc
 3HDa8MINB0pjXTAEG+7LNbjWBXUF1MroccUyiUP/vmthEeUCLWssPLghRad7BpIQ
 QG3dad86aZL75KEAyZpbGTxX3/7ChBdc2GwDLNliV1fO7JWtf7CZ1XMorsn11Me8
 r5/sSIXE+b8U9rFdaOU5NNub124ALKhSvQPk9C2gNYvE5d9dPOLKGAtcNlQ5iIYH
 QqofbEyGzGOkBoMQ7DmvtY2g0bqMtO9U6+KLnJhSwgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=T49iYw
 h/Bu2BmP3gSvMU7Gqlh9SDrChLUWOCWfOLkt4=; b=l/Zv5dtDajaQP6SlhLrOKI
 IGVhd7bhkRgm0wsj2HkAFsso+4QUzkkTwvadm1fszAlhqOZ9B5JXW/o+08qkNhlX
 kL8+aBfq3ZSkSzxXhz+HloMutRJhyMvfMLCfdMZzbPdqa1hdh58Af37mbbbRwT4t
 6dLhGjymSgHuafgqxcqKV9Wp3kfGJq0kow5C/M5kfOactcIk/m2dQeXNOTLIWVUU
 8xAWdKME6L4hyFzZdUnfH4BdCyxUtuvNMFIcWoPnc5avHQxVhxwvQkx5TecqHD93
 KBDHfg6xOoPUfydE9u41ZJCGQY93URbF6MQX2xmKjs2F6wyCoXr6zCagoet2/gKg
 ==
X-ME-Sender: <xms:d2dGYGc9EJ8hh01lz0d0-vyDxO5NxkJ6w9xJ0IGt-mfW_Q0A79t-Dw>
 <xme:d2dGYHqm2u-0DvL7OSRZCF5jPwKjR0fWkA37zrgELS9fdRYfY7OQ1W39Cnfa39FiJ
 77M5-TsBxTAsJE59g8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:d2dGYE6GoAoJa45gmDep3JF7Ze8GUwCloo-06n6dMnA2I-JnwiGEhA>
 <xmx:d2dGYNrGtRvwfEgrRFUAj297spFWx7dJtBIpOq23E-y0q0RZjhPdug>
 <xmx:d2dGYGgCZ-QPrLhQdYCwKGS-lJ3lixSBquWM8AtXimiSkbXQ7EywLA>
 <xmx:eWdGYPhx4NRGQcxF3Vj5AmPqkfTq5ofF5-65J4M43vT03E8fiowAoQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CD73C240066;
 Mon,  8 Mar 2021 13:05:42 -0500 (EST)
Date: Mon, 8 Mar 2021 19:05:40 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC 1/4] hw/block/nvme: convert dsm to aiocb
Message-ID: <YEZndKMdZcMvDKck@apples.localdomain>
References: <20210302111040.289244-1-its@irrelevant.dk>
 <20210302111040.289244-2-its@irrelevant.dk>
 <YEZSr7Y/Y4+NJY5V@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p2owNTjV0dSgRjVv"
Content-Disposition: inline
In-Reply-To: <YEZSr7Y/Y4+NJY5V@stefanha-x1.localdomain>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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


--p2owNTjV0dSgRjVv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  8 16:37, Stefan Hajnoczi wrote:
> On Tue, Mar 02, 2021 at 12:10:37PM +0100, Klaus Jensen wrote:
> > +static void nvme_dsm_cancel(BlockAIOCB *aiocb)
> > +{
> > +    NvmeDSMAIOCB *iocb =3D container_of(aiocb, NvmeDSMAIOCB, common);
> > +
> > +    /* break loop */
> > +    iocb->curr.len =3D 0;
> > +    iocb->curr.idx =3D iocb->nr;
> > +
> > +    iocb->ret =3D -ECANCELED;
> > +
> > +    if (iocb->aiocb) {
> > +        blk_aio_cancel_async(iocb->aiocb);
> > +        iocb->aiocb =3D NULL;
> > +    }
> > +}
>=20
> Is the case where iocb->aiocb =3D=3D NULL just in case nvme_dsm_cancel() =
is
> called after the last discard has completed but before the BH runs? I
> want to make sure there are no other cases because nothing would call
> iocb->common.cb().
>=20

Yes - that case *can* happen, right?

I modeled this after the appoach in the ide trim code (hw/ide/core.c).

> >  static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
> >  {
> >      NvmeNamespace *ns =3D req->ns;
> >      NvmeDsmCmd *dsm =3D (NvmeDsmCmd *) &req->cmd;
> > -
> >      uint32_t attr =3D le32_to_cpu(dsm->attributes);
> >      uint32_t nr =3D (le32_to_cpu(dsm->nr) & 0xff) + 1;
> > -
> >      uint16_t status =3D NVME_SUCCESS;
> > =20
> >      trace_pci_nvme_dsm(nvme_cid(req), nvme_nsid(ns), nr, attr);
> > =20
> >      if (attr & NVME_DSMGMT_AD) {
> > -        int64_t offset;
> > -        size_t len;
> > -        NvmeDsmRange range[nr];
> > -        uintptr_t *discards =3D (uintptr_t *)&req->opaque;
> > +        NvmeDSMAIOCB *iocb =3D blk_aio_get(&nvme_dsm_aiocb_info, ns->b=
lkconf.blk,
> > +                                         nvme_misc_cb, req);
> > =20
> > -        status =3D nvme_dma(n, (uint8_t *)range, sizeof(range),
> > +        iocb->req =3D req;
> > +        iocb->bh =3D qemu_bh_new(nvme_dsm_bh, iocb);
> > +        iocb->ret =3D 0;
> > +        iocb->range =3D g_new(NvmeDsmRange, nr);
> > +        iocb->nr =3D nr;
> > +        iocb->curr.len =3D 0;
> > +        iocb->curr.idx =3D 0;
> > +
> > +        status =3D nvme_dma(n, (uint8_t *)iocb->range, sizeof(NvmeDsmR=
ange) * nr,
> >                            DMA_DIRECTION_TO_DEVICE, req);
> >          if (status) {
> >              return status;
> >          }
> > =20
> > -        /*
> > -         * AIO callbacks may be called immediately, so initialize disc=
ards to 1
> > -         * to make sure the the callback does not complete the request=
 before
> > -         * all discards have been issued.
> > -         */
> > -        *discards =3D 1;
> > +        nvme_dsm_aio_cb(iocb, 0);
> > +        req->aiocb =3D &iocb->common;
>=20
> Want to move this line up one just in case something in
> nvme_dsm_aio_cb() accesses req->aiocb?

Sounds reasonable! Thanks!

--p2owNTjV0dSgRjVv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBGZ3MACgkQTeGvMW1P
DelZKAgAhUmcfOE/O5PqOydBP/2AQI4bV3YjRY++DnTpeYaHgWXDk73Y5Kk6H8oe
qcOU9+Q60gML/+MG3VhDpwSVUXHuFCBVLkym2lYAxuIfybVPyCzHyL8ANint6yYD
bhtNkM+4WI41AiJhtdQ7V0g+cElVq863GKr2Fo2hX9GKdbT+Q1yZM1PVjhswFdbl
Lyv3S6uRpq7qMK4stJE52vdHFx696HeGteHccXqEctyvFSuqvJp1ayXtD09Ze/F1
M8lzJRdGj3/BZ9W3wZ9ida25oKJaSuj2ODqaVs4jiCTZ/aWuKzdJelHaXOx3rLnR
MowGYsIVpIdItEejtV2PEc9SDJdc+A==
=mVq4
-----END PGP SIGNATURE-----

--p2owNTjV0dSgRjVv--

