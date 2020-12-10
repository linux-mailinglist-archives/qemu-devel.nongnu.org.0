Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B375D2D5A8E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:33:12 +0100 (CET)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knL8B-0006ju-NI
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knKTS-0004DK-38
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:51:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knKTQ-00082h-6l
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607601063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b5optel2eyRRXedLE/2kpzuTAJZaDhtuqBft0UNvIsQ=;
 b=hVCpFmwX1BCYvHB2yCF1HKZTJoFI7SBqc7eTa0CNuIXunze+woL/WJrsoiDod9F0mU5G2a
 Ff36MReOifC+l4QJEzosbVJwnntP1/mOuDNY3zUWoEU+E6w4E5ANrqyzc5gwVRakxbRfdP
 c0LIRcCdre9+YJyqp8bya2rpnLTBzZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-zv8SJdC7P1GfV_dS9nrbFw-1; Thu, 10 Dec 2020 06:51:01 -0500
X-MC-Unique: zv8SJdC7P1GfV_dS9nrbFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1E67180A092;
 Thu, 10 Dec 2020 11:50:57 +0000 (UTC)
Received: from localhost (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E67AD19C78;
 Thu, 10 Dec 2020 11:50:53 +0000 (UTC)
Date: Thu, 10 Dec 2020 11:50:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC PATCH 07/27] vhost: Route guest->host notification through
 qemu
Message-ID: <20201210115052.GG416119@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-8-eperezma@redhat.com>
 <20201207174233.GN203660@stefanha-x1.localdomain>
 <CAJaqyWfiMsRP9FgSv7cOj=3jHx=DJS7hRJTMbRcTTHHWng0eKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfiMsRP9FgSv7cOj=3jHx=DJS7hRJTMbRcTTHHWng0eKg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w2JjAQZceEVGylhD"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--w2JjAQZceEVGylhD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 06:08:14PM +0100, Eugenio Perez Martin wrote:
> On Mon, Dec 7, 2020 at 6:42 PM Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
> > On Fri, Nov 20, 2020 at 07:50:45PM +0100, Eugenio P=E9rez wrote:
> > > +{
> > > +    struct vhost_vring_file file =3D {
> > > +        .index =3D idx
> > > +    };
> > > +    VirtQueue *vq =3D virtio_get_queue(dev->vdev, idx);
> > > +    VhostShadowVirtqueue *svq;
> > > +    int r;
> > > +
> > > +    svq =3D g_new0(VhostShadowVirtqueue, 1);
> > > +    svq->vq =3D vq;
> > > +
> > > +    r =3D event_notifier_init(&svq->hdev_notifier, 0);
> > > +    assert(r =3D=3D 0);
> > > +
> > > +    file.fd =3D event_notifier_get_fd(&svq->hdev_notifier);
> > > +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &file);
> > > +    assert(r =3D=3D 0);
> > > +
> > > +    return svq;
> > > +}
> >
> > I guess there are assumptions about the status of the device? Does the
> > virtqueue need to be disabled when this function is called?
> >
>=20
> Yes. Maybe an assertion checking the notification state?

Sounds good.

> > > +
> > > +static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
> > > +{
> > > +    int idx;
> > > +
> > > +    vhost_dev_enable_notifiers(dev, dev->vdev);
> > > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > > +        vhost_sw_lm_shadow_vq_free(dev->sw_lm_shadow_vq[idx]);
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int vhost_sw_live_migration_start(struct vhost_dev *dev)
> > > +{
> > > +    int idx;
> > > +
> > > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > > +        dev->sw_lm_shadow_vq[idx] =3D vhost_sw_lm_shadow_vq(dev, idx=
);
> > > +    }
> > > +
> > > +    vhost_dev_disable_notifiers(dev, dev->vdev);
> >
> > There is a race condition if the guest kicks the vq while this is
> > happening. The shadow vq hdev_notifier needs to be set so the vhost
> > device checks the virtqueue for requests that slipped in during the
> > race window.
> >
>=20
> I'm not sure if I follow you. If I understand correctly,
> vhost_dev_disable_notifiers calls virtio_bus_cleanup_host_notifier,
> and the latter calls virtio_queue_host_notifier_read. That's why the
> documentation says "This might actually run the qemu handlers right
> away, so virtio in qemu must be completely setup when this is
> called.". Am I missing something?

There are at least two cases:

1. Virtqueue kicks that come before vhost_dev_disable_notifiers().
   vhost_dev_disable_notifiers() notices that and calls
   virtio_queue_notify_vq(). Will handle_sw_lm_vq() be invoked or is the
   device's vq handler function invoked?

2. Virtqueue kicks that come in after vhost_dev_disable_notifiers()
   returns. We hold the QEMU global mutex so the vCPU thread cannot
   perform MMIO/PIO dispatch immediately. The vCPU thread's
   ioctl(KVM_RUN) has already returned and will dispatch dispatch the
   MMIO/PIO access inside QEMU as soon as the global mutex is released.
   In other words, we're not taking the kvm.ko ioeventfd path but
   memory_region_dispatch_write_eventfds() should signal the ioeventfd
   that is registered at the time the dispatch occurs. Is that eventfd
   handled by handle_sw_lm_vq()?

Neither of these cases are obvious from the code. At least comments
would help but I suspect restructuring the code so the critical
ioeventfd state changes happen in a sequence would make it even clearer.

--w2JjAQZceEVGylhD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/SC5wACgkQnKSrs4Gr
c8gmTQgAhfOO28RHUnmj9f9/sxGLUrPxhmK76LXN0VHNwqhOW8QjD6e/tIABEw5p
EOtcGYWQXWANtjwVxefQcMg3gXztF8w3V84NKGKAb2UDRNkt4vLc9tek4btoxGS8
CaEpCs/jZKxFDgcUsDVIkdecBAM94CjxJYNdADglVZpcUUWH47kvzFLQV8FhD1nd
q7HbHaS6AVHd1DWVKsgm7aunJkBZb69T3Y1AvSvCSkIrRp/HICmzagnklpgYG6j4
MLIypTEEX6yr40127PZ2p3z63QUkp5okVFUkPLXuLr3nJOmc0+H29alXZjx0NHoR
vAlFre145jUFn3uWEm8FV8jdbzYccA==
=94ib
-----END PGP SIGNATURE-----

--w2JjAQZceEVGylhD--


