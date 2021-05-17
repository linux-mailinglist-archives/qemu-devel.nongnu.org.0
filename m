Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5353638298A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:11:12 +0200 (CEST)
Received: from localhost ([::1]:56980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaDP-0002zs-Do
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1liZzN-0006Un-Od
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1liZzK-0004eB-Iq
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621245397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6hZZTxj6VIRj1+/YM5e0qKrOBuJVpfg9uz0mpqLbEcE=;
 b=Xfrs8OWXBqYcaLoAHr723k2XZPUguFpaMOqcGVFWhDfaa1g3uRllrXqAmSciBMfRSWM6Ic
 LQxjQja9XUf0gzdbOMhTwtX0E9Lz/UejejiNiR4JpbPNgrX5p4WJbXPuSJpuDD7sUZjLV0
 B/7RtQ1rJQS8p3zaqom5DjPY8Ja1FGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-Juss-5vFM76V_RMYwY3Deg-1; Mon, 17 May 2021 05:56:33 -0400
X-MC-Unique: Juss-5vFM76V_RMYwY3Deg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2871681DEE2;
 Mon, 17 May 2021 09:56:32 +0000 (UTC)
Received: from localhost (ovpn-114-183.ams2.redhat.com [10.36.114.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EE48705B6;
 Mon, 17 May 2021 09:56:31 +0000 (UTC)
Date: Mon, 17 May 2021 10:56:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: making a qdev bus available from a (non-qtree?) device
Message-ID: <YKI9zh2AqX35S8wd@stefanha-x1.localdomain>
References: <YJrKRsF4/38QheKn@apples.localdomain>
 <87im3o2m8l.fsf@dusky.pond.sub.org>
 <YJ0xar/7H5vvEnQy@stefanha-x1.localdomain>
 <YKITdgeMFo6hfzB/@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <YKITdgeMFo6hfzB/@apples.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aauTsyURCbEOPdz2"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: mst@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aauTsyURCbEOPdz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 08:55:50AM +0200, Klaus Jensen wrote:
> On May 13 15:02, Stefan Hajnoczi wrote:
> > On Wed, May 12, 2021 at 02:02:50PM +0200, Markus Armbruster wrote:
> > > Klaus Jensen <its@irrelevant.dk> writes:
> > > > I can then call `qdev_set_parent_bus()` and set the parent bus to t=
he
> > > > bus creates in the nvme-subsys device. This solves the problem sinc=
e
> > > > the namespaces are not "garbage collected" when the nvme device is
> > > > removed, but it just feels wrong you know? Also, if possible, I'd o=
f
> > > > course really like to retain the nice entries in `info qtree`.
> > >=20
> > > I'm afraid I'm too ignorant on NVME to give useful advice.
> > >=20
> > > Can you give us a brief primer on the aspects of physical NVME device=
s
> > > you'd like to model in QEMU?  What are "controllers", "namespaces", a=
nd
> > > "subsystems", and how do they work together?
> > >=20
> > > Once we understand the relevant aspects of physical devices, we can
> > > discuss how to best model them in QEMU.
> >=20
> > One specific question about the nature of devices vs subsystems vs
> > namespaces:
> >=20
> > Does the device expose all the namespaces from one subsystem, or does i=
t
> > need to be able to filter them (e.g. hide certain namespaces or present
> > a mix of namespaces from multiple subsystems)?
> >=20
>=20
> Subsystems are fully isolated. There are no interaction possible between
> different subsystems. Within a subsystem, all the "resources" (controller=
s
> and namespaces) are potentially "shared". That is, there may exists
> many-to-many relationships. A controller may have multiple namespaces
> attached and namespaces may be attached to multiple controllers.
>=20
> > The status of the namespace as a DeviceState is a bit questionable sinc=
e
> > the only possible parent it could have is a device, but multiple device=
s
> > want to use it. I understand why you're considering whether it should b=
e
> > an --object...
> >=20
>=20
> When you say parent, I think you mean parent in terms of bus-device
> relationship? In that case, then the parent can actually be the subsystem=
,
> since if the namespace is not attached to any controllers, then it is jus=
t
> an entity/object in the subsystem that the controllers (the actual device=
s)
> may attach to[1].
>=20
> Yes, the more I think about this and understand qdev I realize that it wa=
s a
> mistake to define nvme-ns to be a TYPE_DEVICE, since it does not act as a
> piece of virtual hardware. It is just an entity (object). The biggest
> mistake right now seems to be the bus_type use. It just worked wonderfull=
y
> in the absence of subsystem support, but I feel that that choice is comin=
g
> back to haunt me now. If we'd used a 'ctrl' link property we could just a=
dd
> a 'subsys' link property now and be happy.
>=20
> Is there any way that we can "overload" the implicit "bus=3D" parameter t=
o
> provide backwards compatibility (while basically changing it to function
> like a "link" parameter)?

I would consider adding new --object types and deprecating the devices
so they can be dropped in a future QEMU release. It may be necessary to
choose new names to avoid collisions with the existing ones.

Backwards compatibility might be tricky. One way might be to extract
most of the code from --device nvme-ns and move it into the new
--object, but leave the device to instantiate an object behind the
scenes? Then the device can still have its bus and translate that
relationship to --object somehow. I'm not sure, it depends on the
details of the code.

Stefan

--aauTsyURCbEOPdz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCiPc4ACgkQnKSrs4Gr
c8h0Rgf+OAEAznsN6pHDuswBCjgx4yyRGux4LBVpNZ/vwv+w5IJr/sVU6nvMUfWT
T14vIh0QXFBk34iH3rzsacrLqmtxJl4sZJ64qOdtpV8JMdHu0MNfX5dh0GyYc7Vr
a6MFwWRiXgi1Bq+9Ph+g78Awvtg8JX9av5IK+icprIxCRJGylHyCggk4QokfHkio
Wr0hEUQIuwFM4zBWbKXpAxE3iePQgvyncuR4llWS2D2g22zfE8orPkHeyyGEf/2v
oPLzuGTcICwofWjKRHwQI7lFtMy0jA7+CZv7btKfwRGO9aFaiRuAdQ5xWOAAEwMY
M+QdVj0uikXvQqlb5rcWznPXcIairA==
=v0pp
-----END PGP SIGNATURE-----

--aauTsyURCbEOPdz2--


