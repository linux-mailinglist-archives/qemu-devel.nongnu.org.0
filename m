Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72815373926
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:18:10 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFXd-0001cN-9y
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1leFVc-0000ce-8e
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:16:04 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:34084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1leFVX-0004YW-5L
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:16:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 6D9392733EF;
 Wed,  5 May 2021 13:15:54 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 5 May 2021
 13:15:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0038c78f4dc-e531-4b8a-bc70-b82b7b3497e9,
 FB9A53C33CE493E52F97C59693F06259F03A7A1A) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 5 May 2021 13:15:51 +0200
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [for-6.1 2/4] virtio-blk: Configure all host notifiers in a
 single MR transaction
Message-ID: <20210505131551.011f5516@bahia.lan>
In-Reply-To: <YJJv/5jWOwEu92C/@stefanha-x1.localdomain>
References: <20210407143501.244343-1-groug@kaod.org>
 <20210407143501.244343-3-groug@kaod.org>
 <YJJv/5jWOwEu92C/@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Dat7bsC2JbOp5omncNyovl.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 5fcfe869-f753-4833-ba10-b394d15d7cd1
X-Ovh-Tracer-Id: 9109093199654656303
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdefkedgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Dat7bsC2JbOp5omncNyovl.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 5 May 2021 11:14:23 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Wed, Apr 07, 2021 at 04:34:59PM +0200, Greg Kurz wrote:
> > This allows the virtio-blk-pci device to batch the setup of all its
> > host notifiers. This significantly improves boot time of VMs with a
> > high number of vCPUs, e.g. from 3m26.186s down to 0m58.023s for a
> > pseries machine with 384 vCPUs.
> >=20
> > Note that memory_region_transaction_commit() must be called before
> > virtio_bus_cleanup_host_notifier() because the latter might close
> > ioeventfds that the transaction still assumes to be around when it
> > commits.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  hw/block/dataplane/virtio-blk.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >=20
> > diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virti=
o-blk.c
> > index d7b5c95d26d9..cd81893d1d01 100644
> > --- a/hw/block/dataplane/virtio-blk.c
> > +++ b/hw/block/dataplane/virtio-blk.c
> > @@ -198,19 +198,30 @@ int virtio_blk_data_plane_start(VirtIODevice *vde=
v)
> >          goto fail_guest_notifiers;
> >      }
> > =20
> > +    memory_region_transaction_begin();
>=20
> This call is optional and an optimization. It would be nice to have a
> comment here explaining that - otherwise people may wonder why this is
> necessary.
>=20

Indeed. Same goes for patch 4 actually.

Michael,

Should I re-post an updated version of this series or can the
comments be added in a followup ?

> > +
> >      /* Set up virtqueue notify */
> >      for (i =3D 0; i < nvqs; i++) {
> >          r =3D virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, true);
> >          if (r !=3D 0) {
> > +            int j =3D i;
> > +
> >              fprintf(stderr, "virtio-blk failed to set host notifier (%=
d)\n", r);
> >              while (i--) {
> >                  virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, fals=
e);
> > +            }
> > +
> > +            memory_region_transaction_commit();
> > +
> > +            while (j--) {
> >                  virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
> >              }
> >              goto fail_host_notifiers;
> >          }
> >      }
> > =20
> > +    memory_region_transaction_commit();
> > +
> >      s->starting =3D false;
> >      vblk->dataplane_started =3D true;
> >      trace_virtio_blk_data_plane_start(s);
> > @@ -246,8 +257,15 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
> >      return 0;
> > =20
> >    fail_aio_context:
> > +    memory_region_transaction_begin();
>=20
> Probably unnecessary since this is an error code path. We don't need to
> optimize it.
>=20
> Doesn't hurt though.

True. I can drop this if I repost.

--Sig_/Dat7bsC2JbOp5omncNyovl.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmCSfmcACgkQcdTV5YIv
c9bP4w//V2nBu6W7XCZOaKHuvCaEpadPo8BzrmA2+mEY9VDlDvmbU8PyLAn0F8vd
jctltJNeK6hbKsL4r1Y3RkqyYv0z5r7Vkz3rY7vboyC4ed7YjiQl7C7rIVQhmTA8
xPAVpnVGKLyVXYyc7nEO69G8b7I0CCzn0s/WacqMFxK+23DA6WaM4Y3834iLC1VP
EPe4R6FaYxUfOXjnQJROA5y3j9gvwS4Wkcmhx39PqlcimUQOIRiNI4kVx5Yf6kBr
P7k2sXcBbwWH3A9iVAfVR5Wue2yimQwy6cpPvxeasjVyg7mMYsn/MvJlbYFXM0dB
PDCBglIrnbS0aUn4SfITMQHUSEMPvTvEFrg7kksZmcuUU8H5oxwN4ZgF/w+A13wt
iG2BlwpBVij3utA1v393+1eV6hrMcBGqckIom64GMSc63bE4E74mmcJ02m6omLuz
5BndnlFHI12VNUGn7DSdlPJ5wod4Lx3uIQixqmGVc6DdIcz//Dx+Kn4uJMwkHRj8
54iFP1RxyYfsmkEHzTQWrVoKJ7rQ40fzBwRs1pxzGp3jvOYi37OwbehC0id/yIbJ
LyT6ltgKvo8qvkz1HueEyFRrn8hCur5+0BZEmgDgKekMnotOdn54mxSmw7RSPy5n
saZvD9mZFjrS4I3D5oVPTILzHw//RWOfjC12/re/syEBKLdP+kE=
=UJZN
-----END PGP SIGNATURE-----

--Sig_/Dat7bsC2JbOp5omncNyovl.--

