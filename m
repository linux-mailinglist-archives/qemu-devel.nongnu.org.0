Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5C3318EE6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:40:52 +0100 (CET)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAE5L-0000mC-07
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lADxk-0004Qo-8P; Thu, 11 Feb 2021 10:33:00 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lADxh-00004x-VN; Thu, 11 Feb 2021 10:33:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C13365C00C4;
 Thu, 11 Feb 2021 10:32:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 10:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=f79YnSqfZe9aWk06rPQZT+nQW/j
 84jrMEnpJpAhzmqc=; b=btHbrzySPIjO+eJdVHn1GT+oMJunng9c3NvF/rfGzpp
 jQkaVaFYmJQHldhQ1YTMSRplgPVtLB/RBko6qPx7XQEPu0qy1N/lxwqwkb0Gj6FM
 pK3pteie2M04jA2TRInYbkVIfkSo+eSR18+t5yZDui4Vj9sAZ1HvTgYTsDR1EvN0
 N7J+QLmihWgzL7ndmJxem87idLB1bKokpj2m1C8D45kZoN8EZzIgWvetvdGK/jHA
 sDC+OJXddXLdm+Fz8mNPQRfooFtWXckqaTiCb5PmCyxIjfE+rAIIIlZtfNZrF9ni
 0x0FBNGqH5818aACsWpzBk1MKJNdgNXmWLsBrHfnweA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=f79YnS
 qfZe9aWk06rPQZT+nQW/j84jrMEnpJpAhzmqc=; b=JcrRGz/gIg8R0xYIbamU3c
 WMZU/I3htqt4lO/fkoTTZABynye0IL5Sr0gnPH7pw94uCkcBdIlgJwgULdUUXtkx
 z5KJdcmijQY/oFo+Xo7OTGZFKgz9gqFjuNbmq/zXJZdpsHPTNGoDH6bQwPhubPfF
 vg7NeaYTh9blpdqJoqp1r3L49paCh7x9/i4mqQmpWit2T9x4tZjLLP49Tp3nKx9B
 nj8G5hXa72UBbDIrRDusfXpA3kaB9u/YWiwMrPsqFKd75QBnG1UuCZF3MXVvTDdg
 CJbhmhkFHkMEbFaR+ytwXK+42w80x1BBL0nDNnhAhe52CLLbv2obmMW1/w8DJCtg
 ==
X-ME-Sender: <xms:J04lYDOVCE2c8Kh39Ei5MGYz8SeQ6_VkPg7p9exhX3nifrnNWWdJxw>
 <xme:J04lYBRHST7jIYfAYFpVZNZs_nQtywRLg4kqwD6YeTmSSX0SOeXWYPYlmhHagAIAF
 HjnJhqOuzk0_gb-AIE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:J04lYGXltkfDUIbX4ODgLELbDywZR6AFjhdSWSa25d7wMYYLn7uu6g>
 <xmx:J04lYOGz4x5rw6aq5Df-pet2XASCuD4z440Qnd0JKQffnQXlS94Ebw>
 <xmx:J04lYBYA0PspTXXs0_aX8L6y6myJ0q0sWUqmviSz7gWO_gCwEbj3fg>
 <xmx:KE4lYHpE_I6b_8tvpJs1zmX1_5YaF50JLdnmZWO9d0Al3P4qkbgzxg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3617A240057;
 Thu, 11 Feb 2021 10:32:54 -0500 (EST)
Date: Thu, 11 Feb 2021 16:32:52 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH] hw/block/nvme: drain namespaces on sq deletion
Message-ID: <YCVOJBxHUP6ElkiS@apples.localdomain>
References: <20210127131505.394550-1-its@irrelevant.dk>
 <20210211024902.GA24885@localhost.localdomain>
 <YCUd7IT28icjAV07@apples.localdomain>
 <20210211134913.GJ24885@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="10HC0ffmdCpretR4"
Content-Disposition: inline
In-Reply-To: <20210211134913.GJ24885@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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


--10HC0ffmdCpretR4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 22:49, Minwoo Im wrote:
> On 21-02-11 13:07:08, Klaus Jensen wrote:
> > On Feb 11 11:49, Minwoo Im wrote:
> > > On 21-01-27 14:15:05, Klaus Jensen wrote:
> > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > >=20
> > > > For most commands, when issuing an AIO, the BlockAIOCB is stored in=
 the
> > > > NvmeRequest aiocb pointer when the AIO is issued. The purpose of st=
oring
> > > > this is to allow the AIO to be cancelled when deleting submission
> > > > queues (it is currently not used for Abort).
> > > >=20
> > > > Since the addition of the Dataset Management command and Zoned
> > > > Namespaces, NvmeRequests may involve more than one AIO and the AIOs=
 are
> > > > issued without saving a reference to the BlockAIOCB. This is a prob=
lem
> > > > since nvme_del_sq will attempt to cancel outstanding AIOs, potentia=
lly
> > > > with an invalid BlockAIOCB.
> > > >=20
> > > > Fix this by instead of explicitly cancelling the requests, just all=
ow
> > > > the AIOs to complete by draining the namespace blockdevs.
> > > >=20
> > > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > > ---
> > > >  hw/block/nvme.c | 18 +++++++++++++-----
> > > >  1 file changed, 13 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > > index 316858fd8adf..91f6fb6da1e2 100644
> > > > --- a/hw/block/nvme.c
> > > > +++ b/hw/block/nvme.c
> > > > @@ -403,6 +403,7 @@ static void nvme_req_clear(NvmeRequest *req)
> > > >  {
> > > >      req->ns =3D NULL;
> > > >      req->opaque =3D NULL;
> > > > +    req->aiocb =3D NULL;
> > > >      memset(&req->cqe, 0x0, sizeof(req->cqe));
> > > >      req->status =3D NVME_SUCCESS;
> > > >  }
> > > > @@ -2396,6 +2397,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, Nvme=
Request *req)
> > > >      NvmeSQueue *sq;
> > > >      NvmeCQueue *cq;
> > > >      uint16_t qid =3D le16_to_cpu(c->qid);
> > > > +    int i;
> > > > =20
> > > >      if (unlikely(!qid || nvme_check_sqid(n, qid))) {
> > > >          trace_pci_nvme_err_invalid_del_sq(qid);
> > > > @@ -2404,12 +2406,18 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, Nv=
meRequest *req)
> > > > =20
> > > >      trace_pci_nvme_del_sq(qid);
> > > > =20
> > > > -    sq =3D n->sq[qid];
> > > > -    while (!QTAILQ_EMPTY(&sq->out_req_list)) {
> > > > -        r =3D QTAILQ_FIRST(&sq->out_req_list);
> > > > -        assert(r->aiocb);
> > > > -        blk_aio_cancel(r->aiocb);
> > > > +    for (i =3D 1; i <=3D n->num_namespaces; i++) {
> > > > +        NvmeNamespace *ns =3D nvme_ns(n, i);
> > > > +        if (!ns) {
> > > > +            continue;
> > > > +        }
> > > > +
> > > > +        nvme_ns_drain(ns);
> > >=20
> > > If we just drain the entire namespaces here, commands which has nothi=
ng
> > > to do with the target sq to be deleted will be drained.  And this mig=
ht
> > > be a burden for a single SQ deletion.
> > >=20
> >=20
> > That is true. But how often would you dynamically delete and create I/O
> > submission queues in the fast path?
>=20
> Delete I/O queues are not that often in the working NVMe controller, but
> it might be a good case for the exception test from the host side like:
> I/O queue deletion during I/O workloads.  If delete I/O queues are
> returning by aborting their own requests only and quickly respond to the
> host, then I think it might be a good one to test with.  Handling
> requests gracefully sometimes don't cause corner cases from the host
> point-of-view.  But, QEMU is not only for the host testing, so I am not
> sure that QEMU NVMe device should handle things gracefully or try to do
> something exactly as the real hardware(but, we don't know all the
> hardware behavior ;)).
>=20
> (But, Right. If I'm only talking about the kernel, then kernel does not
> delete queues during the fast-path hot workloads.  But it's sometimes
> great to test something on their own driver or application)
>=20
> > > By the way, agree with the multiple AIOs references problem for newly=
 added
> > > commands.  But, shouldn't we manage the inflight AIO request referenc=
es for
> > > the newlly added commands with some other way and kill them all
> > > explicitly as it was?  Maybe some of list for AIOCBs?
> >=20
> > I was hesitant to add more stuff to NvmeRequest (like a QTAILQ to track
> > this). Getting a steady-state with draining was an easy fix.
>=20
> Graceful handling is easy to go with.  I am not expert for the overall
> purpose of the QEMU NVMe device model, but I'm curious that which one we
> need to take first between `Easy to go vs. What device should do`.
>=20

Alright, point taken :)

I'll post an RFC patch that tracks this properly instead of halfass'ing
it.

--10HC0ffmdCpretR4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAlTiIACgkQTeGvMW1P
DemYQQf+O8D3/xKZNJoosZC2kI7LWNagXkEwX5i+rN/uUzqK90lJNk1a7JfypdvN
P5Jo+ljp1iz5RyqyUi59oXlrXDBMo4cYhu5jAb3Ohtxh1Gs/mrQLh6RdTKuiuaqX
cndNPUf/Plia1Yuhx6e+YC0IdTBGpOVpzZgLrRii41MzLAH0CgofXBtevxEWYbsX
AHLXUaCBRo7gqoNnod1smUr9ERiUWUW3uSJimhD/uDiN3Nv+hR+t6gWkwFlV3aWq
YFMjKycgA1ObC9VAdM9TJkqQXWH2u6MfeWOX9vb4BjWml6QWfOsrm8abnkIntTbT
qTJHbaRCTIhreTXxcmsZIrJnnjQCPA==
=SnMO
-----END PGP SIGNATURE-----

--10HC0ffmdCpretR4--

