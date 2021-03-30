Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81DF34E543
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:19:10 +0200 (CEST)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBSn-0007O9-Od
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lRBRY-0006Wm-0B
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:17:53 -0400
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:47829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lRBRU-0004St-3B
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:17:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.105])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 1CC3B27A0AC;
 Tue, 30 Mar 2021 12:17:43 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 30 Mar
 2021 12:17:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00451804402-59a6-49ed-97bd-226d60a33351,
 ACC3036D4A0BACA70991A0E48D5F19CB1CCAE693) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 30 Mar 2021 12:17:40 +0200
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 3/8] virtio: Add API to batch set host notifiers
Message-ID: <20210330121740.73825957@bahia.lan>
In-Reply-To: <YGIKIUIJbkNTfXKC@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-4-groug@kaod.org>
 <YGIKIUIJbkNTfXKC@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x9mX.LrUjNr7QVb2NxkSxju";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d1af0a61-019e-42d3-acb0-e91debd17df1
X-Ovh-Tracer-Id: 18070130555809470767
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtfeerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueeuhffghefhffeludethfegffffjeevleduhfefvefhleegjefhhfffueelleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=groug@kaod.org;
 helo=9.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/x9mX.LrUjNr7QVb2NxkSxju
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Mar 2021 18:10:57 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Mar 25, 2021 at 04:07:30PM +0100, Greg Kurz wrote:
> > Introduce VirtioBusClass methods to begin and commit a transaction
> > of setting/unsetting host notifiers. These handlers will be implemented
> > by virtio-pci to batch addition and deletion of ioeventfds for multique=
ue
> > devices like virtio-scsi-pci or virtio-blk-pci.
> >=20
> > Convert virtio_bus_set_host_notifiers() to use these handlers. Note that
> > virtio_bus_cleanup_host_notifier() closes eventfds, which could still be
> > passed to the KVM_IOEVENTFD ioctl() when the transaction ends and fail
> > with EBADF. The cleanup of the host notifiers is thus pushed to a
> > separate loop in virtio_bus_unset_and_cleanup_host_notifiers(), after
> > transaction commit.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/virtio/virtio-bus.h |  4 ++++
> >  hw/virtio/virtio-bus.c         | 34 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 38 insertions(+)
> >=20
> > diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-=
bus.h
> > index 6d1e4ee3e886..99704b2c090a 100644
> > --- a/include/hw/virtio/virtio-bus.h
> > +++ b/include/hw/virtio/virtio-bus.h
> > @@ -82,6 +82,10 @@ struct VirtioBusClass {
> >       */
> >      int (*ioeventfd_assign)(DeviceState *d, EventNotifier *notifier,
> >                              int n, bool assign);
> > +
> > +    void (*ioeventfd_assign_begin)(DeviceState *d);
> > +    void (*ioeventfd_assign_commit)(DeviceState *d);
>=20
> Please add doc comments for these new functions.
>=20

Will do.

> > +
> >      /*
> >       * Whether queue number n is enabled.
> >       */
> > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > index c9e7cdb5c161..156484c4ca14 100644
> > --- a/hw/virtio/virtio-bus.c
> > +++ b/hw/virtio/virtio-bus.c
> > @@ -295,6 +295,28 @@ int virtio_bus_set_host_notifier(VirtioBusState *b=
us, int n, bool assign)
> >      return r;
> >  }
> > =20
> > +static void virtio_bus_set_host_notifier_begin(VirtioBusState *bus)
> > +{
> > +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(bus);
> > +    DeviceState *proxy =3D DEVICE(BUS(bus)->parent);
> > +
> > +    if (k->ioeventfd_assign_begin) {
> > +        assert(k->ioeventfd_assign_commit);
> > +        k->ioeventfd_assign_begin(proxy);
> > +    }
> > +}
> > +
> > +static void virtio_bus_set_host_notifier_commit(VirtioBusState *bus)
> > +{
> > +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(bus);
> > +    DeviceState *proxy =3D DEVICE(BUS(bus)->parent);
> > +
> > +    if (k->ioeventfd_assign_commit) {
> > +        assert(k->ioeventfd_assign_begin);
> > +        k->ioeventfd_assign_commit(proxy);
> > +    }
> > +}
> > +
> >  void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n)
> >  {
> >      VirtIODevice *vdev =3D virtio_bus_get_device(bus);
> > @@ -308,6 +330,7 @@ void virtio_bus_cleanup_host_notifier(VirtioBusStat=
e *bus, int n)
> >      event_notifier_cleanup(notifier);
> >  }
> > =20
> > +/* virtio_bus_set_host_notifier_begin() must have been called */
> >  static void virtio_bus_unset_and_cleanup_host_notifiers(VirtioBusState=
 *bus,
> >                                                          int nvqs, int =
n_offset)
> >  {
> > @@ -315,6 +338,10 @@ static void virtio_bus_unset_and_cleanup_host_noti=
fiers(VirtioBusState *bus,
> > =20
> >      for (i =3D 0; i < nvqs; i++) {
> >          virtio_bus_set_host_notifier(bus, i + n_offset, false);
> > +    }
> > +    /* Let address_space_update_ioeventfds() run before closing ioeven=
tfds */
>=20
> assert(memory_region_transaction_depth =3D=3D 0)?
>=20

Hmm... appart from the fact that memory_region_transaction_depth is
a memory internal thing that shouldn't be exposed here, it seems to
me that memory_region_transaction_depth can be !=3D 0 when, e.g. when
batching is used... or I'm missing something ?

I was actually thinking of adding some asserts for that in the
memory_region_*_eventfd_full() functions introduced by patch 1.

    if (!transaction) {
        memory_region_transaction_begin();
    }
    assert(memory_region_transaction_depth !=3D 0);

> > +    virtio_bus_set_host_notifier_commit(bus);
> > +    for (i =3D 0; i < nvqs; i++) {
> >          virtio_bus_cleanup_host_notifier(bus, i + n_offset);
> >      }
> >  }
> > @@ -327,17 +354,24 @@ int virtio_bus_set_host_notifiers(VirtioBusState =
*bus, int nvqs, int n_offset,
> >      int rc;
> > =20
> >      if (assign) {
> > +        virtio_bus_set_host_notifier_begin(bus);
> > +
> >          for (i =3D 0; i < nvqs; i++) {
> >              rc =3D virtio_bus_set_host_notifier(bus, i + n_offset, tru=
e);
> >              if (rc !=3D 0) {
> >                  warn_report_once("%s: Failed to set host notifier (%s)=
.\n",
> >                                   vdev->name, strerror(-rc));
> > =20
> > +                /* This also calls virtio_bus_set_host_notifier_commit=
() */
> >                  virtio_bus_unset_and_cleanup_host_notifiers(bus, i, n_=
offset);
> >                  return rc;
> >              }
> >          }
> > +
> > +        virtio_bus_set_host_notifier_commit(bus);
> >      } else {
> > +        virtio_bus_set_host_notifier_begin(bus);
> > +        /* This also calls virtio_bus_set_host_notifier_commit() */
> >          virtio_bus_unset_and_cleanup_host_notifiers(bus, nvqs, n_offse=
t);
> >      }
> > =20
> > --=20
> > 2.26.3
> >=20


--Sig_/x9mX.LrUjNr7QVb2NxkSxju
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBi+sQACgkQcdTV5YIv
c9aiAhAAwaOupYtOjHWeC/Pw4eSG0O5SIrv51+79jf7y5Lkbv1H4tOhHJmgIBISs
VLE7e3EZf7tmRydiYZWABDjfidGaQ9hvH2XqTCSFPg3+5cL/wnKGTlFLk/JE8GZZ
/ZXToh78o7SAFyAh3EfU8rCT6robisw6I3Z2W8W7zNFTYZmYe1mvojVJCvS7IBc2
FdtZ8x9WqfbUD1dSY/U+hBihy/UKy8k7sBAWDYDEweAf8vluVXS0t+QVCcBvrR7e
TxWkRVmB/VCeW+jnnTeRbo881tF9p6CpoyfI0bnnMms3/f39GAsxj6VwlXO6ux7E
PUE+rea2jmW8OmDci3Tej3HBVPCioN7xOld2CXyQhQhW+30m+PDbO+ejp2TL9kjU
ti7EQXg/9V0ykBIFrYlGSBiMTkk180jz7XhXDkRxUGLY5opho/28fP8DNt+beLcf
xEDi0seVkMPb2Rrmppfo8vbYRJN656yBnZwjJHC0XzuWi1TjygFhP9CNg954l0LJ
aA5atOaNOwqdcZC5ZNvoJlap/o5A3s4EUY480ZnyUGIzQbZ0fIrWNno+oiD0qBRz
XPIgpCV60YSIxc+8vuMLUIBWgvAc/ww2gI8fJQiGoUxvvRjg3tAXTRpMzbVsaQD8
ycJEKrYF4NlwEtVKEaN0PLBOqNcgEWcWtuaARXtQ0oV3tV/zs2U=
=qQKR
-----END PGP SIGNATURE-----

--Sig_/x9mX.LrUjNr7QVb2NxkSxju--

