Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB76A317211
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 22:11:48 +0100 (CET)
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wm3-0005Xg-8D
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 16:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wZ0-0005rw-Jb; Wed, 10 Feb 2021 15:58:18 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:39277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wYv-00078U-9J; Wed, 10 Feb 2021 15:58:18 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 65D2A5C01CE;
 Wed, 10 Feb 2021 15:58:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 15:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=R7xdxZXkx2EENr96KSX+mwS9J4E
 w1XIl8cuJ+yG9WTQ=; b=MW7qGtMnTFkF1aBi0nfDYRCiYo7XMGBjySBzXzt2P9P
 zcBXfJkzTRynaAJ2ufMy/k9ryv6UZN1Oixz7hsC43aSC8AD04EJ+UIy0G5pINjbN
 9g3xcWmt7aKFE6bZKk35ThVZnDtaaG/n4UM5hduIDgea85vFnbZGuWtQ7/CfiVVs
 Ob6a6onNm/P0au1KuwvB5rrzeY+zrp/fVUbM/foD3ESQJURUV4C4nam5x8IbCmhW
 6TmfI0nVcOYYrJjnFDLITvNMG1+B48Gha9Bcq3g2XicyB2P+ElhCw7gO/ks6WEw+
 B6G/MFOUnjc3aXd2kkTC42dC2dWU9XZwe1XWJqEYExA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=R7xdxZ
 Xkx2EENr96KSX+mwS9J4Ew1XIl8cuJ+yG9WTQ=; b=R7mdPZ0KEerbQUY6Il8dGJ
 BAXTeV+G940xoIH6MpCLlDciDhk5IcdUbF0zyscCvJOjCoB/OU8h2U+jqlJhoL/w
 oeD3h85hpSvYUPT0RJbltFELQwF2LnQGSAG0nbFRBIvPkwB85HdUKWnmjCPlkEHc
 qTsMtrJuN791tafoMLli1hsJfAVb+RbmZOcNTjCzm9aXLj0b2pRpJYLmXyQBC+V+
 R62y9io1jAX5PSDlWiRbZOWMzAopP99Yh2aigceX95vQMzqiBI6V49wHT3uvs054
 UxpC1a2L3o0YbIqEgC5YnYN87fQPVfzqQNOWc/AqQzCNkEgNQTHVqB2TI6YbjJ9g
 ==
X-ME-Sender: <xms:5EgkYMlsbH2_1hO2pOvfsCH-4_qiIV4XkzRVbx__icvScFclP0hQGA>
 <xme:5EgkYDdDDdxgm90YO7s56oFp4U5gmlBz0m_hmqLz4aPMoxGr5I4lC7Wm4JqNvAi6T
 skh3YFtsN2opqvPMcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:5EgkYIQDJtNC3b2NxkIQw9Nx-8kylICwNFuyvjRdVHVqu-yarybeQQ>
 <xmx:5EgkYCvVlFejAxKoj-XTuiUT5kLsk9Ky431v943Ywd-btO7N3VCRUA>
 <xmx:5EgkYBeDcETIU2h_L2V1GHyiFAe_FEb6iUG3IvEltN6qAmHTUKRt9g>
 <xmx:5EgkYAd6Dm_x0U5HMD6_d1BaFwJMyLXpiLt4rw6_V8-D2P8B3wxHkA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F2651080057;
 Wed, 10 Feb 2021 15:58:11 -0500 (EST)
Date: Wed, 10 Feb 2021 21:58:09 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/block/nvme: drain namespaces on sq deletion
Message-ID: <YCRI4Z7zlHxjJcny@apples.localdomain>
References: <20210127131505.394550-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="diobeb0iX3QUPtSt"
Content-Disposition: inline
In-Reply-To: <20210127131505.394550-1-its@irrelevant.dk>
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--diobeb0iX3QUPtSt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 27 14:15, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> For most commands, when issuing an AIO, the BlockAIOCB is stored in the
> NvmeRequest aiocb pointer when the AIO is issued. The purpose of storing
> this is to allow the AIO to be cancelled when deleting submission
> queues (it is currently not used for Abort).
>=20
> Since the addition of the Dataset Management command and Zoned
> Namespaces, NvmeRequests may involve more than one AIO and the AIOs are
> issued without saving a reference to the BlockAIOCB. This is a problem
> since nvme_del_sq will attempt to cancel outstanding AIOs, potentially
> with an invalid BlockAIOCB.
>=20
> Fix this by instead of explicitly cancelling the requests, just allow
> the AIOs to complete by draining the namespace blockdevs.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 316858fd8adf..91f6fb6da1e2 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -403,6 +403,7 @@ static void nvme_req_clear(NvmeRequest *req)
>  {
>      req->ns =3D NULL;
>      req->opaque =3D NULL;
> +    req->aiocb =3D NULL;
>      memset(&req->cqe, 0x0, sizeof(req->cqe));
>      req->status =3D NVME_SUCCESS;
>  }
> @@ -2396,6 +2397,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeReques=
t *req)
>      NvmeSQueue *sq;
>      NvmeCQueue *cq;
>      uint16_t qid =3D le16_to_cpu(c->qid);
> +    int i;
> =20
>      if (unlikely(!qid || nvme_check_sqid(n, qid))) {
>          trace_pci_nvme_err_invalid_del_sq(qid);
> @@ -2404,12 +2406,18 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequ=
est *req)
> =20
>      trace_pci_nvme_del_sq(qid);
> =20
> -    sq =3D n->sq[qid];
> -    while (!QTAILQ_EMPTY(&sq->out_req_list)) {
> -        r =3D QTAILQ_FIRST(&sq->out_req_list);
> -        assert(r->aiocb);
> -        blk_aio_cancel(r->aiocb);
> +    for (i =3D 1; i <=3D n->num_namespaces; i++) {
> +        NvmeNamespace *ns =3D nvme_ns(n, i);
> +        if (!ns) {
> +            continue;
> +        }
> +
> +        nvme_ns_drain(ns);
>      }
> +
> +    sq =3D n->sq[qid];
> +    assert(QTAILQ_EMPTY(&sq->out_req_list));
> +
>      if (!nvme_check_cqid(n, sq->cqid)) {
>          cq =3D n->cq[sq->cqid];
>          QTAILQ_REMOVE(&cq->sq_list, sq, entry);
> --=20
> 2.30.0
>=20

Ping on this.

--diobeb0iX3QUPtSt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAkSOAACgkQTeGvMW1P
Dekt/AgAmUIU3ZgXfADxaTryQKFojN8wVn/Bd6g/deSO43VVadgTb5OLtQ/SkUt4
SB4pHXwtu4LasRUYGuu9S4IXLsYhC7nod23hpvvPkWjMdMcY1Q/YOwpA8qc49oZc
rphzR95IvpZWuiSTRuRNg5zxakfy5FjIHUfBjkorykMXqyRHzLiC2ltVY/2/mvpW
lSC8BJN4KDjQWS9sI7oilM9by/gepTIIJjXiOXuyrqWrrF3n5YAc8w7VLtj85TV/
5cGTV1iJtuAScSBy2evpUeyzI9p4MwzGDwf1hRxD2Gbu/H+THvGfAQbeU+AgPOGm
6QJVnmx0iH3V0+RNPUH/iFbCNeXv5Q==
=SQWq
-----END PGP SIGNATURE-----

--diobeb0iX3QUPtSt--

