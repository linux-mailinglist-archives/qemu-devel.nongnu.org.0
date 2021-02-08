Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1A314386
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:12:39 +0100 (CET)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Fhu-0001AV-EG
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Btj-0007aw-Uw; Mon, 08 Feb 2021 14:08:36 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Btf-0007ZS-3S; Mon, 08 Feb 2021 14:08:35 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id B6EDC5C03AE;
 Mon,  8 Feb 2021 14:08:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 08 Feb 2021 14:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=UgrXZH48pxJqwY14JsHbGwOufy5
 3zncJ0CNVqmUXFIU=; b=0EDcVgP0wc5mciLTZwmeYdx2onCOJgZ7H8ajfn5tnXe
 2G/D6kt2sqsyBXIdmMP0EMHEypzS5gCU01rGXNVUwuuTJNbUHxO15+pa+JkmnhLv
 JQwHEDTE1bRso0Apmx7IpsnIiDlJVG50ChPcQ4lAFY7q8d5fRynw5acU/q8ANXM9
 /YkOIozffz3qK/5Tq8CTjsrjRGycu8gjBM0o1HFTN3Btu/gXXmwrEkp8Kc4dEfHA
 pDmHFjZgqXUp3x7zXIWro5IwHV86CMxK2n9X5N6J3X5tLobQ8s+/tbT5+5iqfpwS
 nKsgfVzOH3O1McDJ3HYQb8Kqby1e5UWwIiU3SbWGScQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UgrXZH
 48pxJqwY14JsHbGwOufy53zncJ0CNVqmUXFIU=; b=EoToQsPfi8aZRXqixcFQ/h
 M/EP0DVlpH7om/Qh6Mq0SU+ExLzkhWIf4Y3SEsBGiof0fBLxpgvY5VzIPRCh1oh+
 a6//By38P1VvO57sQFUtA29AVdiN8ylwJRkjOqEq/ovLATSHFPrAFSsLjdsbu6ND
 VeL3qtOuNaS+8uP8C1md+pn0/fDps0OFZbaYwZcjUMtk5oyZk6WIkMC5MWMy+Icv
 /e1gYbIMs+Qhzw/oR20Ztagi7w+yRTz3IvdQQ2amH5JU5anRsTorQCrLsDe2QTsf
 hi2wmUioFNQkWDPfzZIxFesPN1F2ph1tr4PXWayo0uuM3Ct4g57IqjvAk0bxzQvg
 ==
X-ME-Sender: <xms:JYwhYJalPpRna0smgqC87-0OdpTAJYzUN6s2M1ZVw_T3EH1g2ow5fA>
 <xme:JYwhYEswUb9ocZTNqqINI7gTOOTXAac9xTXMu-i6Td7Rk_ZxH_btOi8NbRX5ALT6i
 zNrT3MiFU6JgPWg9Yo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:JYwhYLGkrdGCi6F_dwtjLHb2e7Rjlqq3ydAxK0Sphv3jSumdlYCY0w>
 <xmx:JYwhYPwc5EtTxQwp9NL3hnbb1Q0mF51DtxKTswzQOKypH-oYKBex9Q>
 <xmx:JYwhYKjH-LYlDOc0AgYQwA2_7so-wp5hfQLauLb_JNUmVwfQPJxITg>
 <xmx:JowhYKqgBqFTA5dMU6J-vxpWRgYjFSWLHHN0EgrFWwvYWDNZgwO47Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 442D6240062;
 Mon,  8 Feb 2021 14:08:20 -0500 (EST)
Date: Mon, 8 Feb 2021 20:08:17 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] hw/block/nvme: add broadcast nsid support flush command
Message-ID: <YCGMIcjRlw3auFNc@apples.localdomain>
References: <20210125204231.254925-1-its@irrelevant.dk>
 <20210208185907.GA17042@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="678O02pzrUJ1kfyw"
Content-Disposition: inline
In-Reply-To: <20210208185907.GA17042@redsun51.ssa.fujisawa.hgst.com>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--678O02pzrUJ1kfyw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  9 03:59, Keith Busch wrote:
> On Mon, Jan 25, 2021 at 09:42:31PM +0100, Klaus Jensen wrote:
> > @@ -1644,10 +1679,56 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeR=
equest *req)
> > =20
> >  static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
> >  {
> > -    block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, =
0,
> > -                     BLOCK_ACCT_FLUSH);
> > -    req->aiocb =3D blk_aio_flush(req->ns->blkconf.blk, nvme_rw_cb, req=
);
> > -    return NVME_NO_COMPLETE;
> > +    uint32_t nsid =3D le32_to_cpu(req->cmd.nsid);
> > +    uintptr_t *num_flushes =3D (uintptr_t *)&req->opaque;
> > +    uint16_t status;
> > +    struct nvme_aio_flush_ctx *ctx;
> > +    NvmeNamespace *ns;
> > +
> > +    trace_pci_nvme_flush(nvme_cid(req), nsid);
> > +
> > +    if (nsid !=3D NVME_NSID_BROADCAST) {
> > +        req->ns =3D nvme_ns(n, nsid);
> > +        if (unlikely(!req->ns)) {
> > +            return NVME_INVALID_FIELD | NVME_DNR;
> > +        }
> > +
> > +        block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->ac=
ct, 0,
> > +                         BLOCK_ACCT_FLUSH);
> > +        req->aiocb =3D blk_aio_flush(req->ns->blkconf.blk, nvme_rw_cb,=
 req);
> > +        return NVME_NO_COMPLETE;
> > +    }
> > +
> > +    /* 1-initialize; see comment in nvme_dsm */
> > +    *num_flushes =3D 1;
> > +
> > +    for (int i =3D 1; i <=3D n->num_namespaces; i++) {
> > +        ns =3D nvme_ns(n, i);
> > +        if (!ns) {
> > +            continue;
> > +        }
> > +
> > +        ctx =3D g_new(struct nvme_aio_flush_ctx, 1);
> > +        ctx->req =3D req;
> > +        ctx->ns =3D ns;
> > +
> > +        (*num_flushes)++;
> > +
> > +        block_acct_start(blk_get_stats(ns->blkconf.blk), &ctx->acct, 0,
> > +                         BLOCK_ACCT_FLUSH);
> > +        req->aiocb =3D blk_aio_flush(ns->blkconf.blk, nvme_aio_flush_c=
b, ctx);
> > +    }
>=20
> Overwriting req->aiocb with the most recent flush request doesn't seem
> right.
>=20

It doesn't really matter if this[1] patch is merged, but it is wrong and
to align with the other multi-aio commands, this should just ignore the
returned aiocb.

> This whole implementation would be much simpler with the synchronous
> blk_flush() routine instead of the AIO equivalent. This is not really a
> performant feature, so I don't think it's critical to get these
> operations happening in parallel. What do you think?

It would definitely be simpler, but I believe that if there is a lot to
flush, then we won't just block the nvme device. We are holding the Big
QEMU Lock and will block most other devices as well.


  [1]: hw/block/nvme: drain namespaces on sq deletion

--678O02pzrUJ1kfyw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAhjCAACgkQTeGvMW1P
DelBGAf+KXw63QY5p5U0gIAuo9ZI4VkQoZo2TECRMwOFEkfVMmmZVMWAm+azny93
b08aaAyJmjWgKnJBUrlB39E/uGuER1xmrX2hIvF12e8uFYlhHSEVLL8CfqZVF9Qs
WTDbLT9Tuvy6jRLJeuYUbFjSS6xGZ7cxiWc86Bo5uz9xPsNwu25YzXaaNLKheekJ
xXJGsMSRyr5A62jqlkfho8z2xWNwU4vH+ssLYVjL7vmZzTNQIphI1XSMa9Ztjyhk
05yq279flKhA1KqgpDLl8q9tHP5o5Yq6UGK7XPsMqyVAdXsbePRXsoZn8BbOjLhN
8l2gh720HxJ47FMWbkS5PYhAMIVHfQ==
=RdWg
-----END PGP SIGNATURE-----

--678O02pzrUJ1kfyw--

