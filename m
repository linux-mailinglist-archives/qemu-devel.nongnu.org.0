Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC2938271E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 10:34:32 +0200 (CEST)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liYhq-00062X-Fs
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 04:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1liYgr-0005M0-Di
 for qemu-devel@nongnu.org; Mon, 17 May 2021 04:33:29 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:27655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1liYgm-00032Q-R5
 for qemu-devel@nongnu.org; Mon, 17 May 2021 04:33:29 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-b5xujykXPPWDez5gkmzhbg-1; Mon, 17 May 2021 04:33:18 -0400
X-MC-Unique: b5xujykXPPWDez5gkmzhbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D10419251B2;
 Mon, 17 May 2021 08:33:17 +0000 (UTC)
Received: from bahia.lan (ovpn-112-167.ams2.redhat.com [10.36.112.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C61970587;
 Mon, 17 May 2021 08:33:01 +0000 (UTC)
Date: Mon, 17 May 2021 10:32:59 +0200
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 0/4] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <20210517103259.4689ad2d@bahia.lan>
In-Reply-To: <YJv84RIViv6KvCHb@stefanha-x1.localdomain>
References: <20210507165905.748196-1-groug@kaod.org>
 <YJv84RIViv6KvCHb@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vX1LD.Wes1QJjYlOIPBjuGm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/vX1LD.Wes1QJjYlOIPBjuGm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 12 May 2021 17:05:53 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Fri, May 07, 2021 at 06:59:01PM +0200, Greg Kurz wrote:
> > Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> > a serious slow down may be observed on setups with a big enough number
> > of vCPUs.
> >=20
> > Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threa=
ds):
> >=20
> >               virtio-scsi      virtio-blk
> >=20
> > 1		0m20.922s	0m21.346s
> > 2		0m21.230s	0m20.350s
> > 4		0m21.761s	0m20.997s
> > 8		0m22.770s	0m20.051s
> > 16		0m22.038s	0m19.994s
> > 32		0m22.928s	0m20.803s
> > 64		0m26.583s	0m22.953s
> > 128		0m41.273s	0m32.333s
> > 256		2m4.727s 	1m16.924s
> > 384		6m5.563s 	3m26.186s
> >=20
> > Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> > the ioeventfds:
> >=20
> >  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
> >   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_single
> >   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> > =3D>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioevent=
fd_before
> > =3D>2.12%  qemu-kvm        qemu-kvm           [.] address_space_update_=
ioeventfds
> >   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_single
> >=20
> > address_space_update_ioeventfds() is called when committing an MR
> > transaction, i.e. for each ioeventfd with the current code base,
> > and it internally loops on all ioventfds:
> >=20
> > static void address_space_update_ioeventfds(AddressSpace *as)
> > {
> > [...]
> >     FOR_EACH_FLAT_RANGE(fr, view) {
> >         for (i =3D 0; i < fr->mr->ioeventfd_nb; ++i) {
> >=20
> > This means that the setup of ioeventfds for these devices has
> > quadratic time complexity.
> >=20
> > This series simply changes the device models to extend the transaction
> > to all virtqueueues, like already done in the past in the generic
> > code with 710fccf80d78 ("virtio: improve virtio devices initialization
> > time").
> >=20
> > Only virtio-scsi and virtio-blk are covered here, but a similar change
> > might also be beneficial to other device types such as host-scsi-pci,
> > vhost-user-scsi-pci and vhost-user-blk-pci.
> >=20
> >               virtio-scsi      virtio-blk
> >=20
> > 1		0m21.271s	0m22.076s
> > 2		0m20.912s	0m19.716s
> > 4		0m20.508s	0m19.310s
> > 8		0m21.374s	0m20.273s
> > 16		0m21.559s	0m21.374s
> > 32		0m22.532s	0m21.271s
> > 64		0m26.550s	0m22.007s
> > 128		0m29.115s	0m27.446s
> > 256		0m44.752s	0m41.004s
> > 384		1m2.884s	0m58.023s
> >=20
> > This should fix https://bugzilla.redhat.com/show_bug.cgi?id=3D1927108
> > which reported the issue for virtio-scsi-pci.
> >=20
> > Changes since v1:
> > - Add some comments (Stefan)
> > - Drop optimization on the error path in patch 2 (Stefan)
> >=20
> > Changes since RFC:
> >=20
> > As suggested by Stefan, splimplify the code by directly beginning and
> > committing the memory transaction from the device model, without all
> > the virtio specific proxying code and no changes needed in the memory
> > subsystem.
> >=20
> > Greg Kurz (4):
> >   virtio-blk: Fix rollback path in virtio_blk_data_plane_start()
> >   virtio-blk: Configure all host notifiers in a single MR transaction
> >   virtio-scsi: Set host notifiers and callbacks separately
> >   virtio-scsi: Configure all host notifiers in a single MR transaction
> >=20
> >  hw/block/dataplane/virtio-blk.c | 45 ++++++++++++++++++++-
> >  hw/scsi/virtio-scsi-dataplane.c | 72 ++++++++++++++++++++++++---------
> >  2 files changed, 97 insertions(+), 20 deletions(-)
> >=20
> > --=20
> > 2.26.3
> >=20
>=20
> Thanks, applied to my block tree:
> https://gitlab.com/stefanha/qemu/commits/block
>=20

Hi Stefan,

It seems that Michael already merged the previous version of this
patch set with its latest PR.

https://gitlab.com/qemu-project/qemu/-/commit/6005ee07c380cbde44292f5f6c96e=
7daa70f4f7d

It is thus missing the v1->v2 changes. Basically some comments to
clarify the optimization we're doing with the MR transaction and
the removal of the optimization on an error path.

The optimization on the error path isn't needed indeed but it
doesn't hurt. No need to change that now that the patches are
upstream.

I can post a follow-up patch to add the missing comments though.
While here, I'd even add these comments in the generic
virtio_device_*_ioeventfd_impl() calls as well, since they already
have the very same optimization.

Anyway, I guess you can drop the patches from your tree.

Cheers,

--
Greg

> Stefan


--Sig_/vX1LD.Wes1QJjYlOIPBjuGm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmCiKjsACgkQcdTV5YIv
c9ZQKQ/8DCSVEP+Z2lzsnGnKBl2UD4VcOQmI8iv98q7pv3glu666I9J+sdNi6Ydh
KdW1UQD+WDGxSW7x7z8dBj44xzhlNBNwZ2LJHeWglHzohHfgoL8L81Tk3TDdn/MC
PLiC5PRX6uJEtbVGd2yRnGmj5Ha4rLEnRUQHz3sIdYBRjj72PVvziJpuJMJjUFhp
dUhGUU3SpdaEZ1wtAk2iZANecZO3xk2mIp4Yx0u1IRihCc7UcyPMqlo/pe9hyeWT
98Lw45sPwgj6uf8Xn1UaX3xvXPW0vbT7rMFV4rTPfBgBv+vmmsESFWMwJTsFWd/w
fPj1PUViWsApktSDY5h+Q/Oc8oQouC8V3WaoDKDXAlHdhEUI5kKYCyytQyQt/LLk
1fpKPT0KBwahNTeo+yLxSr6UBILOGLmhYaBcmFslY5ESpzEzbHeRPnFt4sPi4SuY
/Bnkf+RAqwFJtJWmywN7R8k+Lqg4d3dxtP1RVoIbl0dIpYK4v3EvboMHPsVrRRxj
Qnx3mbZ94kwZn+RlVvzxVPDQ27Ix+ACUaCaRmASeXn0nKiK9qon92cjFH8JicGxN
QzJ9Y5BVA64cGO4YpIVu5A9COWx0LTtG0YOk4Vq3yaPOdIpYrwOI1oPN57TOdQTC
ufRfo9XYFFU5Y/V9X3kE0afz5Fmbe8rka2HXZfc4VuqSEFmSzpI=
=OJy7
-----END PGP SIGNATURE-----

--Sig_/vX1LD.Wes1QJjYlOIPBjuGm--


