Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272E413DE3F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:06:06 +0100 (CET)
Received: from localhost ([::1]:43568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is6ii-0002uQ-08
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1is6fl-00011y-QS
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:03:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1is6fh-0003rG-RQ
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:03:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34088
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1is6fh-0003qk-NP
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579186977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rOk3xK3CFzKz6I8avhZUakElSY2+RJyPNdQuqpVKTeU=;
 b=B27mTyRjW41kMqHlSTi/fpx6f4Zk+W0yUezdY+h271xRwcah9UuOIn1cw0P3Ov1AwpbVZu
 6q4tk+R/K0H4WxWl5M5rOl2EEZGuWaM8ma5YrHh4oV+QJgASZL/pjEYVMFlwnkcYWBfbuZ
 vcK0d28K5u2engoIo0aS4bpG6BmuKa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-KAmZeN-cMiSt6OXiFGWSaA-1; Thu, 16 Jan 2020 10:02:53 -0500
X-MC-Unique: KAmZeN-cMiSt6OXiFGWSaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8EC114E0;
 Thu, 16 Jan 2020 15:02:51 +0000 (UTC)
Received: from gondolin (unknown [10.36.117.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1DA260C63;
 Thu, 16 Jan 2020 15:02:42 +0000 (UTC)
Date: Thu, 16 Jan 2020 16:02:29 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 3/5] virtio-scsi: default num_queues to -smp N
Message-ID: <20200116160230.37e9ff6c.cohuck@redhat.com>
In-Reply-To: <20200116141654.GK163546@stefanha-x1.localdomain>
References: <20200116105842.271179-1-stefanha@redhat.com>
 <20200116105842.271179-4-stefanha@redhat.com>
 <20200116125349.6a3aeaa9.cohuck@redhat.com>
 <20200116141654.GK163546@stefanha-x1.localdomain>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; boundary="Sig_///2ZsY0GyEZtQ5B_KdZZ4ip";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_///2ZsY0GyEZtQ5B_KdZZ4ip
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Jan 2020 14:16:54 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Jan 16, 2020 at 12:53:49PM +0100, Cornelia Huck wrote:
> > On Thu, 16 Jan 2020 10:58:40 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >  =20
> > > Automatically size the number of request virtqueues to match the numb=
er
> > > of vCPUs.  This ensures that completion interrupts are handled on the
> > > same vCPU that submitted the request.  No IPI is necessary to complet=
e
> > > an I/O request and performance is improved.
> > >=20
> > > Remember that virtqueue numbering assumptions are being removed from =
the
> > > virtio-pci proxy object, so the Control and Event virtqueues are coun=
ted
> > > by ->get_num_virtqueues() and we only add 1 for the Configuration Cha=
nge
> > > interrupt:
> > >=20
> > >      if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
> > > -        vpci_dev->nvectors =3D vs->conf.num_queues + 3;
> > > +        vpci_dev->nvectors =3D vdc->get_num_virtqueues(VIRTIO_DEVICE=
(vdev)) + 1;
> > >      }
> > >=20
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  hw/core/machine.c               |  3 +++
> > >  hw/scsi/vhost-scsi.c            |  2 ++
> > >  hw/scsi/vhost-user-scsi.c       |  2 ++
> > >  hw/scsi/virtio-scsi.c           | 18 ++++++++++++++++++
> > >  hw/virtio/vhost-scsi-pci.c      |  4 ++--
> > >  hw/virtio/vhost-user-scsi-pci.c |  4 ++--
> > >  hw/virtio/virtio-scsi-pci.c     |  4 ++--
> > >  include/hw/virtio/virtio-scsi.h |  1 +
> > >  8 files changed, 32 insertions(+), 6 deletions(-)
> > >  =20
> >  =20
> > > @@ -878,6 +879,18 @@ static struct SCSIBusInfo virtio_scsi_scsi_info =
=3D {
> > >      .load_request =3D virtio_scsi_load_request,
> > >  };
> > > =20
> > > +static uint32_t virtio_scsi_get_num_virtqueues(VirtIODevice *vdev)
> > > +{
> > > +    VirtIOSCSICommon *s =3D VIRTIO_SCSI_COMMON(vdev);
> > > +    uint32_t request_queues =3D s->conf.num_queues;
> > > +
> > > +    if (s->conf.num_queues =3D=3D 1 && s->conf.auto_num_queues) {
> > > +        request_queues =3D current_machine->smp.cpus;
> > > +    }
> > > +
> > > +    return VIRTIO_SCSI_VQ_NUM_FIXED + request_queues; =20
> >=20
> > I'm not sure doing this at the device level is the right thing to do.
> > For now, only virtio-pci will call this function, and there basing the
> > number of virtqueues off the number of cpus makes sense; but that's a
> > property of the transport, not of the device.
> >=20
> > Consider e.g. a virtio-scsi-ccw device: If we wanted to introduce a way
> > to automatically pick a good number of virtqueues there, this functions
> > likely would not return a particularly useful value, as queue interrupt
> > processing does not really relate to the number of cpus with adapter
> > interrupts. It's not a problem right now, as only virtio-pci calls
> > this, but someone looking at this callback is likely getting the
> > impression that this is a generically useful function. =20
>=20
> That's a great point.  Maybe the direction should be reversed so that
> the device asks the transport to suggest the optimal number of queues
> when auto-num-queues is enabled.

Maybe the device also specifying that it needs at least m queues, and
the transport can then return max(m, n) (with n being the number of
cpus in the pci case).

My next problem is that I'm not sure what 'optimal number of queues'
would mean from a ccw viewpoint. "Remaining free bits in the indicator
area" will be way too much in the general case :) Giving an upper limit
is easy, but not a value that we'd want to autoconfigure, and I really
don't want to return 42 all the time. Would it make sense to make this
feature opt-in per transport?

--Sig_///2ZsY0GyEZtQ5B_KdZZ4ip
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAl4gewYACgkQ3s9rk8bw
L68ezw/8CV55W7cfK36KsdF6twvFk3cJp5nVAofReV95Fnv8m9UHMqNHkZIZFMzK
6NcFj0zUhrK8EMzhfo9n+Au8FZggPFnbdBHsHHsScxyWCNcNegfJf/NU0RaIQSxK
Px7yDcjbTTyJZ3oBFMNYrA0JBxKb2H6+B+Qjt9jK1/TprVnKGrX4J4+tWNBWpc3A
j8NINAGbfcru0nRj8hyYPzD0ro4XnSbnyrxIYTT2F75S25VdU6tq9K5nzX5ISqwf
v7ZdhBHmMR/GXGdmmpeNzJOtMbkmxdVtbjMDf0J2S/KfvfAqVGb2Fvv7T/bcXWXO
shYsCkUrac/eppqwhdqGZg2ptGfAEmiHOBOKRmPQOYoOSyxKHNBZZWW9xs1eTAn/
TQ8NI1dLHfxOsME7rbT1oy5yoRPbPSboMF1lE8FlRtqUI7pTQjjbIkNc0VATRqHP
ml7gaTtyWPfMhfsU4hCUrDpdY2RYFunxIi5RBdbP+VsqUWR4WjkJQMJ2BTSUzvOI
LOaEjVhauOQsFTgjty3mYFQkNCZjjtvziZLlhu3qRwYTBqhSqxoHj3m+ySFgKrdi
4ZZBg6SBUXDWw4rcOovQF56LwuN7j3PSRCv9fck4a8JPaEna6tW6Ng+l3NEgCBse
bWzavrm7/+Iede2LJvQUTTUOPNrkJNhDxDMQzlUd0zwoOSa4WmU=
=LP12
-----END PGP SIGNATURE-----

--Sig_///2ZsY0GyEZtQ5B_KdZZ4ip--


