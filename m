Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41E0328481
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:37:45 +0100 (CET)
Received: from localhost ([::1]:33800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlYG-00088E-N8
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGlWm-0007ZN-Ap
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGlWj-00030Y-Hh
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614616567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F9Wxeq3e8bNBY2BfEdcQ+DVTz+Swe0swECdi04wFLlY=;
 b=HZ8HSL2amVU2eNIkTwvFwK/EBYz/Xa+kc3v2odTyyLXXpz4FCB+QGSWjULvRPyotRSc2Kv
 m1NkC+DLX+G5kRupgwkQgToIY1JwqLHFIap2fq1TC/eHCYZ/Dr5M834sRmRWxYKorTpf5s
 Feehj+wg05FgXRsWBeVfnN/DANG+npQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-wEmRMb2LN1ydRadSP3JaxQ-1; Mon, 01 Mar 2021 11:35:58 -0500
X-MC-Unique: wEmRMb2LN1ydRadSP3JaxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B5156D4F5;
 Mon,  1 Mar 2021 16:35:56 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEAE15D9D0;
 Mon,  1 Mar 2021 16:35:52 +0000 (UTC)
Date: Mon, 1 Mar 2021 16:35:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [virtio-dev] [VHOST USER SPEC PATCH] vhost-user.rst: add
 clarifying language about protocol negotiation
Message-ID: <YD0X58hj+al5uPWk@stefanha-x1.localdomain>
References: <20210226111619.21178-1-alex.bennee@linaro.org>
 <YDzKhnQa+LS01yTN@stefanha-x1.localdomain>
 <87czwjjdf7.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87czwjjdf7.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D2Xdtwn802IZRoFf"
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>,
 viresh.kumar@linaro.org, qemu-devel@nongnu.org, rust-vmm@lists.opendev.org,
 Jiang Liu <gerry@linux.alibaba.com>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--D2Xdtwn802IZRoFf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 11:38:47AM +0000, Alex Benn=E9e wrote:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
> > On Fri, Feb 26, 2021 at 11:16:19AM +0000, Alex Benn=E9e wrote:
> >> +However as the protocol negotiation something that only occurs betwee=
n
> >
> > Missing "is". Shortening the sentence fixes that without losing clarity=
:
> > s/something that/negotiation/
> >
> >> +parts of the backend implementation it is permissible to for the mast=
er
> >
> > "vhost-user device backend" is often used to refer to the slave (to
> > avoid saying the word "slave") but "backend" is being used in a
> > different sense here. That is confusing.
> >
> >> +to mask the feature bit from the guest.
> >
> > I think this sentence effectively says "the master MAY mask the
> > VHOST_USER_F_PROTOCOL_FEATURES bit from the VIRTIO feature bits". That
> > is not really accurate since VIRTIO devices do not advertise this
> > feature bit and so it can never be negotiated through the VIRTIO featur=
e
> > negotiation process.
> >
> > How about referring to the details from the VIRTIO 1.1 specification
> > instead. Something like this:
> >
> >   Note that VHOST_USER_F_PROTOCOL_FEATURES is the UNUSED (30) feature
> >   bit defined in `VIRTIO 1.1 6.3 Legacy Interface: Reserved Feature Bit=
s
> >   <https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01=
.html#x1-4130003>`_.
> >   VIRTIO devices do not advertise this feature bit and therefore VIRTIO
> >   drivers cannot negotiate it.
> >
> >   This reserved feature bit was reused by the vhost-user protocol to ad=
d
> >   vhost-user protocol feature negotiation in a backwards compatible
> >   fashion. Old vhost-user master and slave implementations continue to
> >   work even though they are not aware of vhost-user protocol feature
> >   negotiation.
>=20
> OK - so does that mean that feature bit will remain UNUSED for ever
> more?

It's unlikely to be repurposed in VIRTIO. It can never be used by VIRTIO
in a situation that overlaps with vhost-user. That leaves cases that
don't overlap with vhost-user but that is unlikely too since the bit had
a previous meaning (before vhost-user) and repurposing it would cause
confusion for very old drivers or devices.

> What about other feature bits? Is it permissible for the
> master/requester/vhost-user front-end/QEMU to filter any other feature
> bits the slave/vhost-user backend/daemon may offer from being read by
> the guest driver when it reads the feature bits?

Yes, the vhost-user frontend can decide how it wants to expose
VHOST_USER_GET_FEATURES feature bits on the VIRTIO device:

1. Pass-through. Allow the vhost-user device backend to control the
   feature bit.
2. Disabling. Clear a feature bit because it cannot be supported for
   some reason (e.g. VIRTIO 1.1 packed vrings are not implemented and
   therefore enabling them would prevent live migration).
3. Enabling. Enable a feature bit that does not rely on vhost-user
   device backend support. For example, message-signalled interrupts
   for virtio-mmio.

>=20
> >
> >> As noted for the
> >> +``VHOST_USER_GET_PROTOCOL_FEATURES`` and
> >> +``VHOST_USER_SET_PROTOCOL_FEATURES`` messages this occurs before a
> >> +final ``VHOST_USER_SET_FEATURES`` comes from the guest.
> >
> > I couldn't find any place where vhost-user.rst states that
> > VHOST_USER_SET_PROTOCOL_FEATURES has to come before
> > VHOST_USER_SET_FEATURES?
> >
> > The only order I found was:
> >
> > 1. VHOST_USER_GET_FEATURES to determine whether protocol features are
> >    supported.
> > 2. VHOST_USER_GET_PROTOCOL_FEATURES to fetch available protocol feature=
 bits.
> > 3. VHOST_USER_SET_PROTOCOL_FEATURES to set protocol feature bits.
> > 4. Using functionality that depends on enabled protocol feature bits.
> >
> > Is the purpose of this sentence to add a new requirement to the spec
> > that "VHOST_USER_SET_PROTOCOL_FEATURES MUST be sent before
> > VHOST_USER_SET_FEATURES"?
>=20
> No I don't want to add a new sequence requirement. But if SET_FEATURES
> doesn't acknowledge the VHOST_USER_F_PROTOCOL_FEATURES bit should that
> stop the processing of
> VHOST_USER_GET_PROTOCOL_FEATURES/VHOST_USER_SET_PROTOCOL_FEATURES
> messages? AFAICT SET_FEATURES should be irrelevant to the negotiation of
> the PROTOCOL_FEATURES right?

I agree, the value of VHOST_USER_F_PROTOCOL_FEATURES in
VHOST_USER_SET_FEATURES does not matter according to the spec:

  Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is
  present in ``VHOST_USER_GET_FEATURES``.

Since it does not mention "set in VHOST_USER_SET_FEATURES" we have to
assume existing vhost-user device backends do not care whether the
vhost-user frontend includes the bit in VHOST_USER_SET_FEATURES or not.

Stefan

--D2Xdtwn802IZRoFf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA9F+cACgkQnKSrs4Gr
c8jULAgAwuoXO5cJKYhZt3lXcomHaV5YtpMM8U67j1f3zepdDk4dYMIKrUAZtWsb
rHrHr7XXKOE3NpfnIx7BGwIL+GJyNrF9+SZHoL9vN/qaehCmQRhCkRYmAgtNuKH1
INZqtiUZDwNrrNGBtXrBT8I8YwSzBN+pXhsogqoLLx4QWvIqhmGxQqhCFLkM2zwQ
ko7ZTDhAfsNvI+XkiLb3tHP10aLCudKMyikRsJZGw6KPqb2lYhss0JSihRYMepdq
WxzEj/ghXYltND/Ab6z1/e1s2BdT++t/xkvbGEGXyo6qjWxkHVu8HSPUXuYsvDJU
gA0NbYvqWpvYAKZVwbQn7gINI39PIA==
=cKWu
-----END PGP SIGNATURE-----

--D2Xdtwn802IZRoFf--


