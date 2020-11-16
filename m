Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932D22B41FD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:04:19 +0100 (CET)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecJ0-0007xA-MZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kecHx-0007WY-GI
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:03:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kecHv-0007a9-Kl
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605524590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bLoKy8m+qH3bYcW+szne1f18hxzn7LLqRNFCl3fL2Us=;
 b=VcQ+rFSFdUHqWjyTJ/SKkDjQsHdngT1721r5xwMK0iIWB4jFO1ereesFXmdepKkUHX8EZb
 ZqMNVMVL+LnUSkM35ju+lePNTyXEdJyTQBFb/vWKI7/Eyss+v5tPZV9qkmohxgkLnMYBaX
 AA2CAFHq428dB634lKcXWREUzH5/Nzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-ePTK7AV3PXOwt6SpxLgIIg-1; Mon, 16 Nov 2020 06:03:06 -0500
X-MC-Unique: ePTK7AV3PXOwt6SpxLgIIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEAFD64150;
 Mon, 16 Nov 2020 11:03:04 +0000 (UTC)
Received: from localhost (ovpn-114-237.ams2.redhat.com [10.36.114.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 236E850B44;
 Mon, 16 Nov 2020 11:02:52 +0000 (UTC)
Date: Mon, 16 Nov 2020 11:02:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116110251.GC96297@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201110131404.2c0f0d9d@w520.home>
 <20201111124853.5a7fa359.cohuck@redhat.com>
 <20201111151449.GC1421166@stefanha-x1.localdomain>
 <20201111163543.2839e4c7.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111163543.2839e4c7.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 04:35:43PM +0100, Cornelia Huck wrote:
> On Wed, 11 Nov 2020 15:14:49 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Wed, Nov 11, 2020 at 12:48:53PM +0100, Cornelia Huck wrote:
> > > On Tue, 10 Nov 2020 13:14:04 -0700
> > > Alex Williamson <alex.williamson@redhat.com> wrote: =20
> > > > On Tue, 10 Nov 2020 09:53:49 +0000
> > > > Stefan Hajnoczi <stefanha@redhat.com> wrote: =20
> > >  =20
> > > > > Device models supported by an mdev driver and their details can b=
e read from
> > > > > the migration_info.json attr. Each mdev type supports one device =
model. If a
> > > > > parent device supports multiple device models then each device mo=
del has an
> > > > > mdev type. There may be multiple mdev types for a single device m=
odel when they
> > > > > offer different migration parameters such as resource capacity or=
 feature
> > > > > availability.
> > > > >=20
> > > > > For example, a graphics card that supports 4 GB and 8 GB device i=
nstances would
> > > > > provide gfx-4GB and gfx-8GB mdev types with memory=3D4096 and mem=
ory=3D8192
> > > > > migration parameters, respectively.   =20
> > > >=20
> > > >=20
> > > > I think this example could be expanded for clarity.  I think this i=
s
> > > > suggesting we have mdev_types of gfx-4GB and gfx-8GB, which each
> > > > implement some common device model, ie. com.gfx/GPU, where the
> > > > migration parameter 'memory' for each defaults to a value matching =
the
> > > > type name.  But it seems like this can also lead to some combinator=
ial
> > > > challenges for management tools if these parameters are writable.  =
For
> > > > example, should a management tool create a gfx-4GB device and chang=
e to
> > > > memory parameter to 8192 or a gfx-8GB device with the default param=
eter? =20
> > >=20
> > > I would expect that the mdev types need to match in the first place.
> > > What role would the memory=3D parameter play, then? Allowing gfx-4GB =
to
> > > have memory=3D8192 feels wrong to me. =20
> >=20
> > Yes, I expected these mdev types to only accept a fixed "memory" value,
> > but there's nothing stopping a driver author from making "memory" accep=
t
> > any value.
>=20
> I'm wondering how useful the memory parameter is, then. The layer
> checking for compatibility can filter out inconsistent settings, but
> why would we need to express something that is already implied in the
> mdev type separately?

To avoid tying device instances to specific mdev types. An mdev type is
a device implementation, but the goal is to enable migration between
device implementations (new/old or completely different
implementations).

Imagine a new physical device that now offers variable memory because
users found the static mdev types too constraining.  How do you migrate
back and forth between new and old physical devices if the migration
parameters don't describe the memory size? Migration parameters make it
possible. Without them the management tool needs to hard-code knowledge
of specific mdev types that support migration.

> > > > > An open mdev device typically does not allow migration parameters=
 to be changed
> > > > > at runtime. However, certain migration/params attrs may allow wri=
tes at
> > > > > runtime. Usually these migration parameters only affect the devic=
e state
> > > > > representation and not the hardware interface. This makes it poss=
ible to
> > > > > upgrade or downgrade the device state representation at runtime s=
o that
> > > > > migration is possible to newer or older device implementations.  =
 =20
> > >=20
> > > This refers to generation of device implementations, but not to dynam=
ic
> > > configuration changes. Maybe I'm just confused by this sentence, but
> > > how are we supposed to get changes while the mdev is live across? =20
> >=20
> > This is about dynamic configuration changes. For example, if a field wa=
s
> > forgotten in the device state representation then a migration parameter
> > can be added to enable the fix. When the parameter is off the device
> > state is incomplete but migration to old device implementations still
> > works. An old device can be migrated to a new device implementation wit=
h
> > the parameter turned off. And then you can safely enable the migration
> > parameter at runtime without powering off the guest because it's purely
> > a device state representation change, not a hardware interface change
> > that would disturb the guest.
> >=20
> > This is kind of similar to QEMU migration subsections.
>=20
> Ok, I was a bit confused here.
>=20
> So, we build the stream with the then-current parameters? How is the
> compat-checking layer supposed to deal with parameters changing after
> the check -- is it a "you get to keep the pieces" situation?

Migration compatibility checking is part of orchestrating the migration.
The migration parameters are assumed to be immutable during the
migration process (i.e. the management tool won't let you change them).
But you are free to change them while there is no ongoing migration.

Changing parameters at runtime is something that requires knowledge from
the user or management tool. "I want to upgrade the device to fix a bug
and I know it affects migration compatibility." However, the migration
compatibility check still does its job: if you changed a parameter you
might find the old source is no longer compatible because it lacks
support for the new parameter you set. In that case you could revert the
parameter before migrating back to the old source.

Stefan

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+yXFsACgkQnKSrs4Gr
c8j5+gf/evgyoiGXQtdxVGPDdIpDFvztx7vIVoIFRVwtFPsH3wm4JUPfZhqpHoP7
3HN56PR527D2qE+xV/uPFOdpE7UWQUb2I4oqvAapgvnPBCqC9vAyzRoyAUEvP7q9
hXCIDKmQu7nGu4C6AqQ6+D0hgUYsojoysSRsPPBl5CUfaMkZMHg0S43ToH0i12Of
Nu0xpQ/1eHuP6WuKR8JqGgAEyW/DZXSjzNw6iTAL7MoEhmTM1hE551aPM5j01nH8
nfgv50AwRW85txHNGDfdVxyxv27jFlIGr+91wNjo4r9plsEd5C0jagxL5Brhp51M
RXioUBGz93Ct0gvWWUrK7BmYHKb/cg==
=QVCL
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--


