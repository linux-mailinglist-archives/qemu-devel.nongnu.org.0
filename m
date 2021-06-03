Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4933939A045
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:53:08 +0200 (CEST)
Received: from localhost ([::1]:60756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loluN-0006OR-6z
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lolsw-00046v-20
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:51:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lolsu-0004Bm-CJ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622721095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/Ygqgz8gR4YG9C9GuamU4mFhDFCSVOjUOaVGPDiPgk=;
 b=iJ8UnH+wME6fjL7xZkMUq7MMCvFZIc29LWPyDchOWt4TDBhuRLv7iLaPLzF6E1rpyQbFdd
 5Swxzci1Bo/EFgzDpfKwgea62z0p8jndFk59lobwW+gtllKKp+jS8w+44HeFO9nKO7VtWd
 NDgfy9GScS6lmed3OOKftYMkySpaEkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ehaM-jVlNsO-mkTB18qatw-1; Thu, 03 Jun 2021 07:51:33 -0400
X-MC-Unique: ehaM-jVlNsO-mkTB18qatw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 453A6101371C;
 Thu,  3 Jun 2021 11:51:32 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B61F60853;
 Thu,  3 Jun 2021 11:51:31 +0000 (UTC)
Date: Thu, 3 Jun 2021 12:51:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 1/2] hw/nvme: add support for boot partiotions
Message-ID: <YLjCQi1zsBiErRqb@stefanha-x1.localdomain>
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144234epcas5p153e855ad673876cf67e57d4b539dc274@epcas5p1.samsung.com>
 <20210601143749.1669-2-anaidu.gollu@samsung.com>
 <YLilZqgEZyQjnRwX@stefanha-x1.localdomain>
 <YLipFmd3ePdqgyXU@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <YLipFmd3ePdqgyXU@apples.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GxyiU6nov2y9G4PO"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 mreitz@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GxyiU6nov2y9G4PO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 03, 2021 at 12:04:06PM +0200, Klaus Jensen wrote:
> On Jun  3 10:48, Stefan Hajnoczi wrote:
> > On Tue, Jun 01, 2021 at 08:07:48PM +0530, Gollu Appalanaidu wrote:
> > > @@ -5546,6 +5665,47 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr=
 offset, uint64_t data,
> > >          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbsz_readonly,
> > >                         "invalid write to read only CMBSZ, ignored");
> > >          return;
> > > +    case 0x44:  /* BPRSEL */
> > > +        n->bar.bprsel =3D data & 0xffffffff;
> > > +        size_t bp_len =3D NVME_BPRSEL_BPRSZ(n->bar.bprsel) * 4 * KiB=
;
> > > +        int64_t bp_offset =3D NVME_BPRSEL_BPROF(n->bar.bprsel) * 4 *=
 KiB;
> > > +        int64_t off =3D 0;
> > > +        struct nvme_bp_read_ctx *ctx;
> > > +
> > > +        trace_pci_nvme_mmio_bprsel(data, n->bar.bprsel,
> > > +                                   NVME_BPRSEL_BPID(n->bar.bpinfo),
> > > +                                   bp_offset, bp_len);
> > > +
> > > +        if (bp_len + bp_offset > n->bp_size) {
> > > +            NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
> > > +            NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_ERROR=
);
> > > +            return;
> > > +        }
> > > +
> > > +        off =3D NVME_BPRSEL_BPID(n->bar.bpinfo) * n->bp_size + bp_of=
fset;
> > > +
> > > +        NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
> > > +        NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_READING);
> > > +
> > > +        ctx =3D g_new(struct nvme_bp_read_ctx, 1);
> > > +
> > > +        ctx->n =3D n;
> > > +
> > > +        pci_dma_sglist_init(&ctx->qsg, &n->parent_obj, 1);
> > > +
> > > +        qemu_sglist_add(&ctx->qsg, n->bar.bpmbl, bp_len);
> > > +
> > > +        dma_blk_read(n->blk_bp, &ctx->qsg, off , BDRV_SECTOR_SIZE,
> > > +                     nvme_bp_read_cb, ctx);
> >=20
> > The returned BlockAIOCB is not stored. Two questions:
> >=20
>=20
> Thanks for these comments Stefan, I've commented below how I think they
> can be resolved.
>=20
> > 1. Can the guest allocate unbounded amounts of QEMU memory (struct
> >   nvme_bp_read_ctx) by repeatedly writing to this register?
> >=20
>=20
> Yeah, the QSQ should just be a member of the controller struct and then h=
ave
> that as the cb_arg to dma_blk_read. Then, the QSG can be initialized and =
the
> host address added when BPMBL is written instead of here.
>=20
> We don't want the QSG to change while the read is in progress, so the wri=
te
> to BPMBL should check BPINFO.BRS and not do anything if the QSG is "in us=
e".
> The spec says that the host *shall* not modify the registers when a read =
is
> in progress, so we can safely just ignore the write.
>=20
> > 2. What happens if the NVMe device is hot unplugged or reset while a
> >   boot partition read request is in flight?
>=20
> The spec also says that the host *shall* not reset or shutdown the
> controller while a read is in progress, but again, we need to protect QEM=
U
> so the aiocb must be saved on the controller struct and cancelled
> appropriately.

Sounds good.

There is documentation about secure coding practices in
docs/devel/secure-coding-practices.rst (especially the stuff specific to
device emulation is interesting). It's possible that -device nvme will
become common in production virtual machines and it's hard to address
stability and security after the code has been written. Thanks for
taking this feedback on board even though it may not be relevant to NVMe
test/bringup/prototyping use cases.

Stefan

--GxyiU6nov2y9G4PO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC4wkIACgkQnKSrs4Gr
c8giwQf+PoYFEAw6tITWmLpDUW5nP8ZKBuUnTAGAmTlml5wnIO9CyUzW8hWrFbnr
AKDJMQbLanG847aGk4E/Q75X+o6cWWiyuHs3/++aeLzjls429kZzx0owhlt2Ul/a
hKZvK6acF8e0zyr4PEDH6zm2NhOOiqNjnHRfzWtez2gTepfv5Y64B8QABlZrmyap
5PNobHq8/1Q7TojR5GqRCB+lhXpab5qRmwTlEx02R79CrRFYro6JckOfhbTtOntW
QOZzV+neESxnxLsvmyIlTNk9U0WErtD1++LFY08zYQ67LIpmuftGstVZVVkPTWtC
8Y8LjltGGi5sxbviBz8TGdi9m6jphQ==
=h7m7
-----END PGP SIGNATURE-----

--GxyiU6nov2y9G4PO--


