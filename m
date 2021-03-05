Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EAB32F261
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:22:33 +0100 (CET)
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF5s-0007DU-7x
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lIEUS-0007d3-Ez
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:43:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lIEUP-0007g0-Kf
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614966226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9iWKRaWAntXQZmwNr7jLugxgD2usriFaDmbp6SVkg3c=;
 b=fp7sJnoxaRqIpH+0e8rlJQP4IF4sQrEv25IzVAf6k/54A9Cbs6h1QqKwmKk4CGGJOrKiVQ
 4AoiROC4N0tagKbNoCKX0CMDR9AbLDgUS7G0SngVyHTWr6K2of7+BjFKU47R1xQzs9b518
 ZG2xvpvzUS9SbFaH/JfKPyyRAxh3yME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-OrHhihYRNT2Az4OGajt6og-1; Fri, 05 Mar 2021 12:43:44 -0500
X-MC-Unique: OrHhihYRNT2Az4OGajt6og-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A486E100A448;
 Fri,  5 Mar 2021 17:43:42 +0000 (UTC)
Received: from localhost (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21EC8179B3;
 Fri,  5 Mar 2021 17:43:41 +0000 (UTC)
Date: Fri, 5 Mar 2021 17:43:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2] vhost-user.rst: add clarifying language about
 protocol negotiation
Message-ID: <YEJtzdJOeq6OwfNH@stefanha-x1.localdomain>
References: <20210303145011.14547-1-alex.bennee@linaro.org>
 <20210303165554-mutt-send-email-mst@kernel.org>
 <YEEXhBClR6GRLDu6@stefanha-x1.localdomain>
 <87tupqg51c.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87tupqg51c.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n2neJD9eI/OdjSch"
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
Cc: Jiang Liu <gerry@linux.alibaba.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--n2neJD9eI/OdjSch
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 04, 2021 at 06:11:26PM +0000, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > On Wed, Mar 03, 2021 at 05:01:05PM -0500, Michael S. Tsirkin wrote:
> >> On Wed, Mar 03, 2021 at 02:50:11PM +0000, Alex Benn=E9e wrote:
> >> Also, are we sure it's ok to send the messages and then send
> >> VHOST_USER_SET_FEATURES with VHOST_USER_F_PROTOCOL_FEATURES clear?
> >> Looks more like a violation to me ...
> >
> > Looking again I agree it would be a violation to omit
> > VHOST_USER_F_PROTOCOL_FEATURES in VHOST_USER_SET_FEATURES.
> >
> > Previously I only looked at VHOST_USER_SET_PROTOCOL_FEATURES where the
> > spec says:
> >
> >   Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is prese=
nt in
> >   ``VHOST_USER_GET_FEATURES``.
> >
> > So negotiation is *not* necessary for sending
> > VHOST_USER_SET_PROTOCOL_FEATURES.
> >
> > However, I missed that other features *do* require negotiation of
> > VHOST_USER_F_PROTOCOL_FEATURES according to the spec. For example:
> >
> >   If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
> >   ring is initialized in an enabled state.
> >
> > Now I think:
> >
> > 1. VHOST_USER_F_PROTOCOL_FEATURES *must* be included
> >    VHOST_USER_SET_FEATURES if the master supports it.
>=20
> So added by the master - still invisible to the guest?

The relationship between a guest-visible VIRTIO device and a vhost-user
device is not covered by any specification AFAIK.

My opinion is that VMMs should not expose VHOST_USER_F_PROTOCOL_FEATURES
to the guest since that bit has a different meaning in VIRTIO.

If VMMs do expose it to the guest then they'll probably get away with it
since bit 30 is unused in VIRTIO. Drivers will probably not enable the
bit, even if the device reports it.

> >
> > 2. VHOST_USER_SET_PROTOCOL_FEATURES does not require negotiation,
> >    instead the master just needs to check that
> >    VHOST_USER_F_PROTOCOL_FEATURES is included in the
> >    VHOST_USER_GET_FEATURES reply. It's an exception.
>=20
> OK I'm now thoroughly confused but I guess that's a good thing. However
> if we make the changes to QEMU to honour this won't we break with
> existing vhost-user receivers? We'll also need to track the state of a
> SET_FEATURES has happened and then gate the sending of things like
> reply_ack requests?

(To avoid confusion below when I write about negotiating
VHOST_USER_F_PROTOCOL_FEATURES it means sending VHOST_USER_SET_FEATURES
with the feature bit enabled. It shouldn't be confused with sending
VHOST_USER_SET_PROTOCOL_FEATURES to negotiate protocol features.)

I went through the spec and checked where VHOST_USER_F_PROTOCOL_FEATURES
must be negotiated. There is only one place: ring initialization state
(enabled/disabled). This makes sense: for backwards compatibility the
device backend needs to know whether or not the master supports
VHOST_USER_F_PROTOCOL_FEATURES.

There are also two messages where the spec says they "should" only be
sent when VHOST_USER_F_PROTOCOL_FEATURES has been negotiated:
VHOST_USER_SET_VRING_ENABLE and VHOST_USER_SET_SLAVE_REQ_FD. However,
QEMU's vhost-user master implementation actually sends
VHOST_USER_SET_SLAVE_REQ_FD before negotiating
VHOST_USER_F_PROTOCOL_FEATURES. I *think* VHOST_USER_SET_VRING_ENABLE is
really only sent after VHOST_USER_F_PROTOCOL_FEATURES has been
negotiated but I haven't checked all code paths.

All other mentions of VHOST_USER_F_PROTOCOL_FEATURES in the spec only
require checking VHOST_USER_GET_FEATURES, not negotiation.

So QEMU follows the current spec pretty closely. I don't anything needs
to be changed in QEMU. Have you found something?

Stefan

--n2neJD9eI/OdjSch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBCbcwACgkQnKSrs4Gr
c8i6uQgAwN6usmyeVdUX6Yzp2L7p3NtlZvcSv9uY8FxK1FF4OgLPgh+9OawqA/qu
vwkPbUO4fToIjMpqvGD3hrihBUoTB9CYg9nQtX069XeGZHXBV/NM2gXlwgmsWevR
/AQ6TgmoM2RLVyd6oVWyz/Uo1lupYL5GSpYeBW2mPLfsfrZ9ROlczaHazeaPnkzO
m3hXL235t1jexL11cDdetbCDpHjs+GUed3T/YpCo47AQb28Drjv5KMYCbabNI8KK
XinDWiHgXFnZNbUGS9sjfaA4+Z8nIYMxTiXCE/49f04gSqgKiInOPJCmfd+0SxOl
bW6a6lFmYYzfptFyB29K8xO/sN5Aog==
=NgpB
-----END PGP SIGNATURE-----

--n2neJD9eI/OdjSch--


