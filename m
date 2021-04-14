Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E30435EF7C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:25:28 +0200 (CEST)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWapz-0001eL-EC
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWam2-0004Et-Fo
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:21:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWalz-0005oc-Ch
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618388478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hJ3kvC8CvkhBLujPb+2j/Z7huIu0oZGW/75YnbdaZFI=;
 b=bmB9CxPbZ9mblE736OQmtAgYidMkShvRD7FmfUP3kdmysay0Y52QteKSQQYRPADU4kUzjt
 ywPRMYvcBgNddaDz7kDt+8jrc4SEQXEqO2+cip6yMCBCeZs5AYWqXengePle1UEDTkg+me
 FJU8rnSwgsRfqpecxnf5OYH8IedlKTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-eD9MUkMuO12z4WomhENjYg-1; Wed, 14 Apr 2021 04:21:14 -0400
X-MC-Unique: eD9MUkMuO12z4WomhENjYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC9B8018A7;
 Wed, 14 Apr 2021 08:21:13 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B22D6772E0;
 Wed, 14 Apr 2021 08:21:06 +0000 (UTC)
Date: Wed, 14 Apr 2021 08:00:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] vhost-user-fs: fix features handling
Message-ID: <YHaTGM0JebV1XYpc@stefanha-x1.localdomain>
References: <20210408195534.647895-1-antonkuchin@yandex-team.ru>
 <YHVakoU5hY0wif2n@stefanha-x1.localdomain>
 <20210413133534.GA1235549@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210413133534.GA1235549@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Po2/+ykJwIjfF6dK"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Po2/+ykJwIjfF6dK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 09:35:34AM -0400, Vivek Goyal wrote:
> On Tue, Apr 13, 2021 at 09:47:14AM +0100, Stefan Hajnoczi wrote:
> > On Thu, Apr 08, 2021 at 10:55:34PM +0300, Anton Kuchin wrote:
> > > Make virtio-fs take into account server capabilities.
> > >=20
> > > Just returning requested features assumes they all of then are implem=
ented
> > > by server and results in setting unsupported configuration if some of=
 them
> > > are absent.
> > >=20
> > > Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> > > ---
> > >  hw/virtio/vhost-user-fs.c | 17 +++++++++++++----
> > >  1 file changed, 13 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > index ac4fc34b36..6cf983ba0e 100644
> > > --- a/hw/virtio/vhost-user-fs.c
> > > +++ b/hw/virtio/vhost-user-fs.c
> > > @@ -24,6 +24,14 @@
> > >  #include "monitor/monitor.h"
> > >  #include "sysemu/sysemu.h"
> > > =20
> > > +static const int user_feature_bits[] =3D {
> > > +    VIRTIO_F_VERSION_1,
> > > +    VIRTIO_RING_F_INDIRECT_DESC,
> > > +    VIRTIO_RING_F_EVENT_IDX,
> > > +    VIRTIO_F_NOTIFY_ON_EMPTY,
> > > +    VHOST_INVALID_FEATURE_BIT
> > > +};
> >=20
> > Please add:
> >=20
> > VIRTIO_F_RING_PACKED
> > VIRTIO_F_IOMMU_PLATFORM
>=20
> Hi Stefan,
>=20
> What about
>=20
> VIRTIO_F_ANY_LAYOUT
>=20
> I see this one is currently set in requested_features. IIUC, qemu will
> assume that device supports VIRTIO_F_ANY_LAYOUT if we don't reset it.

virtio-fs requires VIRTIO 1.1+ where the "any layout" semantics are
mandatory. The Legacy device interface is not supported by virtio-fs so
this feature bit isn't used.

Here is the VIRTIO_F_ANY_LAYOUT section in the spec if you want to read
more about it:
https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x=
1-4130003

> And I see two more flags.
>=20
> VIRTIO_F_ORDER_PLATFORM
> VIRTIO_F_SR_IOV
>=20
> Should this be part of user_feature_bits[] too?

VIRTIO_F_ORDER_PLATFORM is unclear. It could be used in some way if the
vhost-user device backend passes the virtqueue memory to a physical PCI
device, but I think vhost-user doesn't support that (instead vDPA would
be used).

VIRTIO_F_SR_IOV is not relevant to vhost-user device backends. It's
unlikely to be implemented but if so, then the hypervisor would handle
it as part of virtio-pci device emulation and the vhost-user device
backend would be unaware.

So I think these 3 feature bits do not need to be negotiated with the
vhost-user device backend.

Stefan

--Po2/+ykJwIjfF6dK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB2kxgACgkQnKSrs4Gr
c8hcBggAxxpMo6AYZlKsrlDzinbNxJ0Xz25Q/ivNmMCb5Vdmy2pjC93IYNeSKrDZ
qPj+h/usJZ9D1WwLainDhp9aGmt/TYCu10IQ5AFgF+M4+Qng+1RWczT/P+RPgS95
gop52WTRx+TyjTWT6DkvXEm2NBPEENNgPmZ7elRLW0+uhhFuuUMsQ7rncT299mVn
+P6rxwMnodOtp3jD+d9JgxGd3DpYdL0ohZkLycRG8QNSeudNZ6WR29EGJuzf2YEE
aan6HknrZ5k2bWPkYs3GpHLEOsYeFVmMdahBoJjDAdpgsOYEK5nTd7BX6NhaySo+
YJ67cYnub+r1J5Ac0R6Y/ps29CyzCg==
=88IN
-----END PGP SIGNATURE-----

--Po2/+ykJwIjfF6dK--


