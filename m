Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B859318A1D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:13:07 +0100 (CET)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAqH-0003FM-Gq
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lAAke-0002AE-FS; Thu, 11 Feb 2021 07:07:16 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lAAkb-0003Ky-MG; Thu, 11 Feb 2021 07:07:16 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 04A045C00E2;
 Thu, 11 Feb 2021 07:07:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 11 Feb 2021 07:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=8n3LGISFjXTT8PT+SU7OzDK9QsG
 k+i11OtPulgCOXAE=; b=MR/OpzK/t1hzhJpA5KSTMcio3VMG9sFMr9ClVxF9kkQ
 1eO8zUMpIyiVTbIv7AKWT1I4hX3l1Ehv7DTLhB5l0J35jc3i1hi4AxeEXUrIa4qb
 JbohK7lfstv/d3AhqUK8oFcS3bZoz4Xc9xCxmGxb2guitrJGb6T0/q1Ne1pMAXSm
 Vo2m0uh3ffxf2WnIUrOLyCpcCVrYA/pQSY/yWqayrtsvcnvsWXewHeO9/Hmh83KG
 9cain0HXFY/r3mT//z53PuTc0Jidx9GuW4QW2WmDphBv9gJ7e8zyfcoYyemQtxiH
 Vqol8mviGbKkxAQNnwaCQMJfCj4UbgIgqBhgAqpiq1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8n3LGI
 SFjXTT8PT+SU7OzDK9QsGk+i11OtPulgCOXAE=; b=fg6XPcPdg0G8UH+NovJ9Pk
 tG9oPe2qV+DmLYUpHf6F0EjbgLDNNL0hX3skrBYLvKGokuTmoSffxRPJckPah+/C
 KSfjYiGMNnJ3rlRbdX4d593rHzEKWfa85xAxFPsRBgHPU2SuGpZwjNZFyurotvYH
 MCu+1VOgR4gkzNljttZs/GwAm0rTaozl5GgNWxQq0/oID0+haEKmqcfjxFGZ+s8C
 HcS0Mb89HJHonWgKvfANaAsgUkzzAKPngaMaOIiPMmziOIAM+6ntZKPMK8LPf0pl
 CLFgv1EBWUG9X8H5FMgAFgIkqKiq8F5L4yvk1RFcbIShuGZMlTiPdKA6ReyurBkg
 ==
X-ME-Sender: <xms:7h0lYIqP5q3TVOgBo-vEhfQm2Q_1_wt1UJ1CiZ57wmjLKGPWZQY9pw>
 <xme:7h0lYITM7QpbP1sRp3voI0Pc-fsNJkFZrjxsSQe8WOcrJK5J2r5-FiYw7C71acbIL
 FbkR4hMgmwU7HDH7tE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:7h0lYNOjgADADBxy5MZsKyMuaDdvwLQZCYY8Zz3hDXRCqctc0bLmFw>
 <xmx:7h0lYDNb9_7brMuf4uypXMRwBqwr6rxfhXg1zkKMQfgy8Z27yUzs8w>
 <xmx:7h0lYFsqEAH_QohMG9PzfHeAeok_LiZg16YH3hfpsABZ2PqBea6D9g>
 <xmx:7x0lYG3D4jgGFFsUterP_-u5iqajvUZQZ8akqb-Ny5-BeWocRjUaFg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B930A108005C;
 Thu, 11 Feb 2021 07:07:09 -0500 (EST)
Date: Thu, 11 Feb 2021 13:07:08 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH] hw/block/nvme: drain namespaces on sq deletion
Message-ID: <YCUd7IT28icjAV07@apples.localdomain>
References: <20210127131505.394550-1-its@irrelevant.dk>
 <20210211024902.GA24885@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zGgUOvGUhHOo8MHq"
Content-Disposition: inline
In-Reply-To: <20210211024902.GA24885@localhost.localdomain>
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


--zGgUOvGUhHOo8MHq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 11:49, Minwoo Im wrote:
> On 21-01-27 14:15:05, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > For most commands, when issuing an AIO, the BlockAIOCB is stored in the
> > NvmeRequest aiocb pointer when the AIO is issued. The purpose of storing
> > this is to allow the AIO to be cancelled when deleting submission
> > queues (it is currently not used for Abort).
> >=20
> > Since the addition of the Dataset Management command and Zoned
> > Namespaces, NvmeRequests may involve more than one AIO and the AIOs are
> > issued without saving a reference to the BlockAIOCB. This is a problem
> > since nvme_del_sq will attempt to cancel outstanding AIOs, potentially
> > with an invalid BlockAIOCB.
> >=20
> > Fix this by instead of explicitly cancelling the requests, just allow
> > the AIOs to complete by draining the namespace blockdevs.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 316858fd8adf..91f6fb6da1e2 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -403,6 +403,7 @@ static void nvme_req_clear(NvmeRequest *req)
> >  {
> >      req->ns =3D NULL;
> >      req->opaque =3D NULL;
> > +    req->aiocb =3D NULL;
> >      memset(&req->cqe, 0x0, sizeof(req->cqe));
> >      req->status =3D NVME_SUCCESS;
> >  }
> > @@ -2396,6 +2397,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequ=
est *req)
> >      NvmeSQueue *sq;
> >      NvmeCQueue *cq;
> >      uint16_t qid =3D le16_to_cpu(c->qid);
> > +    int i;
> > =20
> >      if (unlikely(!qid || nvme_check_sqid(n, qid))) {
> >          trace_pci_nvme_err_invalid_del_sq(qid);
> > @@ -2404,12 +2406,18 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRe=
quest *req)
> > =20
> >      trace_pci_nvme_del_sq(qid);
> > =20
> > -    sq =3D n->sq[qid];
> > -    while (!QTAILQ_EMPTY(&sq->out_req_list)) {
> > -        r =3D QTAILQ_FIRST(&sq->out_req_list);
> > -        assert(r->aiocb);
> > -        blk_aio_cancel(r->aiocb);
> > +    for (i =3D 1; i <=3D n->num_namespaces; i++) {
> > +        NvmeNamespace *ns =3D nvme_ns(n, i);
> > +        if (!ns) {
> > +            continue;
> > +        }
> > +
> > +        nvme_ns_drain(ns);
>=20
> If we just drain the entire namespaces here, commands which has nothing
> to do with the target sq to be deleted will be drained.  And this might
> be a burden for a single SQ deletion.
>=20

That is true. But how often would you dynamically delete and create I/O
submission queues in the fast path?

> By the way, agree with the multiple AIOs references problem for newly add=
ed
> commands.  But, shouldn't we manage the inflight AIO request references f=
or
> the newlly added commands with some other way and kill them all
> explicitly as it was?  Maybe some of list for AIOCBs?

I was hesitant to add more stuff to NvmeRequest (like a QTAILQ to track
this). Getting a steady-state with draining was an easy fix.

--zGgUOvGUhHOo8MHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAlHeoACgkQTeGvMW1P
Demoagf/RVAGSa18OHENK8tDpBl35nmzXq1xUVzllDvLBsttfcNMEwQkwj5Ko4ee
mr5CduQrbiRDrXNvHnAvhbAUJtV0xLF7Lu1m2qeE22wNRspIi5uxbeId16P0kgOu
N4TB4RJhmfSfCkzFF4GiATDGK572Z91SQnBbeL6gS/w5TjqjNcSkDLlVs0ORHP8D
OqYsqBV/Bujq/FRCPP8o7XRx0aIIeIQR/CZatN9kVqs7AJhUoeUyBW4ICzPj60rQ
An2odSaTrDeybkkDg1iFrB2e3ZL4BVJT6a+wkDH9F5GlDiAf2Lt8SgbGyw2+O1l6
EWbUnJqdEJhQlXbRKmilhs4r43an0A==
=tS7O
-----END PGP SIGNATURE-----

--zGgUOvGUhHOo8MHq--

