Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311E6E68E5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:05:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ponp2-0001K2-04; Tue, 18 Apr 2023 12:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ponoh-0001Gk-4Z
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:04:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ponoe-0005xN-2J
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681833862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GNwsAQX71w9P8jYpXb5VK62JCSpL67c54tLvMxLPiaE=;
 b=JWBYqa63V+Xi5uE7d2nc0Ut0tOnl0P9CWKQyKtPYzsaiBv9d7X9/1rZcK7mQHZuzajU+Sd
 QHn5Ef9vEpiAo/ETAQK8ETmgOKY4KbTjiA8wH4b7rknqYr4IX04fGt/I/4IBh/z9EI0HwM
 qTyJ1VmHqyk+XQWMEVUwUUEv1wBmLak=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-qbJAwL3zMf2Osf9m6nN3mQ-1; Tue, 18 Apr 2023 12:04:18 -0400
X-MC-Unique: qbJAwL3zMf2Osf9m6nN3mQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFA86855304;
 Tue, 18 Apr 2023 16:04:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F09284085720;
 Tue, 18 Apr 2023 16:04:16 +0000 (UTC)
Date: Tue, 18 Apr 2023 12:04:15 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, virtio-fs@redhat.com,
 Erik Schilling <erik.schilling@linaro.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 00/12] virtio: add vhost-user-generic and reduce copy and
 paste
Message-ID: <20230418160415.GB4048149@fedora>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
 <CAJSP0QURbJrEoFY8FhMnq_B6tx-qYspfu-OB6=6hz5=qAwE=6A@mail.gmail.com>
 <87ttxeeatd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qG0Ivx1WmQAdGIuU"
Content-Disposition: inline
In-Reply-To: <87ttxeeatd.fsf@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--qG0Ivx1WmQAdGIuU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 05:14:59PM +0100, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>=20
> > On Fri, 14 Apr 2023 at 12:06, Alex Benn=E9e <alex.bennee@linaro.org> wr=
ote:
> >>
> >> A lot of our vhost-user stubs are large chunks of boilerplate that do
> >> (mostly) the same thing. This series attempts to fix that by defining
> >> a new base class for vhost-user devices and then converting the rng
> >> and gpio devices to be based off them. You can even use
> >> vhost-user-device directly if you supply it with the right magic
> >> numbers (which is helpful for development).
> >>
> >> However the final patch runs into the weeds because I don't yet have a
> >> clean way to represent in QOM the fixing of certain properties for the
> >> specialised classes.
> >>
> >> The series is a net reduction in code and an increase in
> >> documentation but obviously needs to iron out a few more warts. I'm
> >> open to suggestions on the best way to tweak the QOM stuff.
> >
> > --device vhost-user-device is not really possible because vhost-user
> > devices are not full VIRTIO devices. vhost-user devices depend on
> > device-specific code in the VMM by design.
>=20
> What device specific code? You certainly need to instantiate stuff in
> the DTB/ACPI tables for -M virt but everything else can be handed off to
> the vhost-user daemon.

There are vhost-user device types that lack functionality entirely, like
vhost-user-net's lack of the controlq virtqueue and configuration space.
It is not even possible to query the MAC address from a vhost-user-net
device. It's not a full virtio-net device and the VMM has to fill in the
gaps to emulate the missing virtqueues and configuration space.

There are device type-specific vhost-user messages like
VHOST_USER_SEND_RARP and VHOST_USER_CREATE_CRYPTO_SESSION that can't
really be supported by a generic --device vhost-user-device.

Live migration is another device-specific aspect that is handled by the
vhost-user frontend.

> Indeed the split brain is a bit silly in some places. For example is
> QEMU really the best arbiter of a block device config when the actual
> backend is a separate process. We have config passing in the vhost-user
> spec.

Optional vhost-user messages like configuration space access may be in
the spec, but existing device types cannot rely on them for backwards
compatibility reasons. Therefore most existing device types don't use
the configuration space. Those that do may only access parts of the
configuration space from the backend and emulate the rest.

The blog post I linked mentions a new protocol feature bit
(VHOST_USER_PROTOCOL_F_VDPA) to distinguish new vhost-user backends that
are full VIRTIO devices. This doesn't exist today, but I think something
like that is necessary to detect devices that will work with --device
vhost-user-device.

> > The "subset of a VIRTIO device" design made sense for vhost_net.
> > Nowadays there are other device types that are close to full VIRTIO
> > devices, although the vhost-user protocol doesn't support the full
> > VIRTIO device lifecycle.
>=20
> What are we missing?

vhost-user needs:
- A GET_DEVICE_ID message.
- A GET_CONFIG_SIZE message. Today it is assumed that the vhost-user
  frontend already knows the configuration space size.
- A protocol feature bit indicating that the device is a full VIRTIO
  device. These devices also need to implement the SET_STATUS message,
  which is rarely implemented today.

> > I think a user-creatable --device vhost-user-device is not a good idea
> > today. It creates confusion. Many people aren't aware of the
> > architectural difference between vhost-user and VIRTIO devices. The
> > result is that VMMs and vhost-user backends implement increasingly
> > brittle VIRTIO configuration space and feature bit logic as they
> > knowingly or unknowingly try to paper over the fact that a traditional
> > vhost-user device isn't a full VIRTIO device.
>=20
> I've always found the device feature gating in QEMU confusing. Surely we
> can rely on the daemon to properly enumerate the features it supports?

The backend's features cannot be passed through to the guest because
there is also an emulated VIRTIO transport (virtio-pci, virtio-mmio,
virtio-ccw) involved. The transport may support a different feature set
=66rom the vhost-user backend. For example, the transport may support
Packed Virtqueues but the backend may not. So some filtering is
necessary in the VMM.

Since some of the device-specific functionality may be handled by the
VMM, then this extends beyond just the transport feature bits.

But I agree with you that it's ugly and complex. I have to re-read the
code every time because it works in a strange way.

> > It is possible to resolve this difference and make --device
> > vhost-user-device work properly for devices that want to be full
> > VIRTIO devices. See "Making VMM device shims optional" here:
> > https://blog.vmsplice.net/2020/09/on-unifying-vhost-user-and-virtio.html
> >
> > Even after extending the vhost-user protocol to solve the current
> > limitations, existing backends would still only be partial VIRTIO
> > devices that wouldn't work with --device vhost-user-device.
>=20
> It works for RNG, GPIO (and soon I'll be testing i2c and SCSI). All we
> need is the virtioid and the number of virtio queues.

There is already a vhost-user message for querying the number of
virtqueues: VHOST_USER_GET_QUEUE_NUM.

See above for other missing stuff.

> > Reducing boilerplate is helpful, but I think --device
> > vhost-user-device should not be user-creatable.
>=20
> After this series lands it will certainly make adding new shims easier
> but having a vhost-user-device will make testing of new backends easier.
> Can we not simply document it as an advanced feature for those who know
> what they are doing? I'm not intending to deprecate the existing shims.

If you add the missing pieces to vhost-user then --device
vhost-user-device can be done properly. Two messages and one protocol
feature bit are required, it's not that bad.

Stefan

--qG0Ivx1WmQAdGIuU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQ+v38ACgkQnKSrs4Gr
c8ieHwf8CfoIaa37ul/ZKEojrKqPFoTvHGgzGZpyIQrLEUhmH+3bvyOhOddIGCF2
LCygbmLX1iv4L8T0FFnw7XmL6xJveN2p2cU2dPmN7i4h+l6tY++tHmyMRwGQ2MSk
2BZOVdvJd3CS3GKJUjo5Fuu0jdfbBPfDPxTr5BmC5IMx3Wr5ML5lCZr5skrbzbZR
eoHEzGlFrKPc7iHnq1n16vOH1MMM/Zxv68us7Is2ZHnHSpUwro2em7w0D+ZR0SsG
1w05q4zam0oW243KDEmmXFqU8R/daLxG3bP0TuH+3rlJabcRdXje/asQzdH2MgyT
cZa26+nWnLTiJK9kX1V4OzaPC7ALZg==
=mC+3
-----END PGP SIGNATURE-----

--qG0Ivx1WmQAdGIuU--


