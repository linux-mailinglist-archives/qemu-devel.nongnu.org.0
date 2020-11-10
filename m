Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE2E2AD29E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:39:39 +0100 (CET)
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQ7l-00072k-La
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcQ6X-0006b6-MD
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcQ6U-0004wE-5X
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605001096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OlFHMt9OmwyzmJoZ+XhbbVz8IGer7Ok7M6pl2srBXO4=;
 b=Ha40Z1l1fxYm79rx+ogefcr9XGhy1cRm9Igd72kw+nM1GVQR7EPgG2UcMWvJHvs8C4ic2V
 b+YjNq24CmRJ7vUFNPIDxhMgzB15vvCyqpc+9kPS5VUwC8Qatwhb9w4KazdRtX2x1ZfD72
 BA5FptqLuE6bUEP69lRTbjQng2flNOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-Eg8c72t8PpmhvGLx5y3PSA-1; Tue, 10 Nov 2020 04:38:12 -0500
X-MC-Unique: Eg8c72t8PpmhvGLx5y3PSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D0F55720A;
 Tue, 10 Nov 2020 09:38:10 +0000 (UTC)
Received: from localhost (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A67B96EF79;
 Tue, 10 Nov 2020 09:37:58 +0000 (UTC)
Date: Tue, 10 Nov 2020 09:37:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC v2] VFIO Migration
Message-ID: <20201110093757.GB1080921@stefanha-x1.localdomain>
References: <20201105150902.GA472489@stefanha-x1.localdomain>
 <20201105165220.7ad2d1a6.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201105165220.7ad2d1a6.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 04:52:20PM +0100, Cornelia Huck wrote:
> On Thu, 5 Nov 2020 15:09:02 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> (...)
>=20
> <did not fully read through the v1 thread, so apologies if I missed
> something>
>=20
> > VFIO/mdev Devices
> > -----------------
> > TODO this is a first draft, more thought needed around enumerating supp=
orted
> > parameters, representing default values, etc
> >=20
> > The following mdev type sysfs attrs are available for managing device
> > instances:
> >=20
> >   /sys/.../<parent-device>/mdev_supported_types/<type-id>/
> >       create - writing a UUID to this file instantiates a device
> >       migration/ - migration related files
> >           model - unique device model string, e.g. vendor-a.com/my-nic
> >=20
> > Device models supported by an mdev driver can be enumerated by reading =
the
> > migration/model attr for each <type-id>.
>=20
> IIUC, we're grouping together all users of a specific mdev_type, but
> support a variety of sub-configurations? Does that include parameters
> or not? If not, shouldn't we already be covered by mdev_type?

I will include an explanation of how mdev types relate to migration
parameters in the next revision of this document.

> >=20
> > The following mdev device sysfs attrs relate to a specific device insta=
nce:
> >=20
> >   /sys/.../<parent-device>/<uuid>/
> >       mdev_type/ - symlink to mdev type sysfs attrs, e.g. to fetch migr=
ation/model
> >       migration/ - migration related files
> >           applied - Write "1" to apply current migration parameter valu=
es or
> >                     "0" to reset migration parameter values to their de=
faults.
> >                     Parameters can only be applied or reset while the m=
dev is
> >                     not opened.
> >           params/ - migration parameters
> >               <my-param> - read/write migration parameter "my-param"
> >               ...
> >=20
> > When the device is created the migration/applied attr is "0". Migration
> > parameters are accessible in migration/params/ and read 0 bytes because=
 they
> > are at their default values.  At the point opening the mdev device will=
 fail
> > because migration parameters must be applied first. Migration parameter=
s can be
> > set to the desired values or left at their defaults. "1" must be writte=
n to
> > migration/applied before opening the mdev device.
> >=20
> > If writing to a migration/params/<param> attr or setting migration/appl=
ied to
> > "1" fails, then the device implementation does not support the migratio=
n
> > parameters.
> >=20
> > An open mdev device typically does not allow migration parameters to be=
 changed
> > at runtime. However, certain migration/params attrs may allow writes at
> > runtime. Usually these migration parameters only affect the device stat=
e
> > representation and not the hardware interface. This makes it possible t=
o
> > upgrade or downgrade the device state representation at runtime so that
> > migration is possible to newer or older device implementations.
> >=20
> > An existing mdev device instance can be reused by closing the mdev devi=
ce and
> > writing "0" to migration/applied. This resets parameters to their defau=
lts so
> > that a new list of migration parameters can be applied.
> >=20
> > The migration parameter list for an mdev device that is in operation ca=
n be
> > read from migration/params/. Parameters that read 0 bytes are at their =
default
> > value.
>=20
> I'm trying to figure out what that means for the mdevs I'm most
> familiar with, ccw and ap. Both of them currently support a single
> mdev_type.
>=20
> For ccw, there are some things that I could imagine as parameters, like
> the device number, or channel paths. Maybe we could include the channel
> path type (FICON, ...) in the migration device model? We should not
> include device numbers etc. in the device model.

That sounds good. Usually the host-specifics (which host device number
is being passed through) are not guest-visible and shouldn't be
migration parameters. Anything that affects the guest-visible hardware
interface or device state representation needs to be a migration
parameter.

> For ap, we have matrices covering tuples (APQNs) derived from a
> cross-product of card/domains configure via sysfs attributes. I think
> later modification of these is desired. I think we also might be able
> to mix-and-match different types within the same matrix, so not sure if
> we can put these into any device model. In fact, I'm a bit at a loss
> how the device model for ap would look like (other than simply
> 'matrix'). Can we deal with dynamic parameters?

Migration parameters are static. If you might need migration parameters
foo1, foo2, foo3, foo4, foo5 at runtime then they can be defined
statically but default to off.

Also, this migration compatibility scheme is progressive rather than a
binary "full compatibility checking" vs "no compatibility checking"
choice. QEMU relies on the user or management tool to set up compatible
source and destinations with a few sanity checks in cases where QEMU
developers thought it was helpful. So QEMU is somewhere in the middle of
the spectrum. I'm not trying to force anyone to express everything in
migration parameters. Public device models (e.g. if we device one for
virtio-net-pci) will probably be towards the "full compatibility
checking" side of the spectrum so that variations between device
implementations can be detected and handled. A proprietary device model
might be fine with just a single hardware-revision=3DN parameter that is
incremented every time something changes. It can be as simple or complex
as needed.

Stefan

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+qX3UACgkQnKSrs4Gr
c8g4Ugf9F2bIzpyzaO6G6UdOSj4smn/en2SSr5jIvtdGd1T4bJrBC/LpREBb8sej
ep+L4t2fvz7zioVwM2KJQM+u4U2uH899K+YtbksA8VuC+YE3jP6zl9vDpqzQ9KS5
GWsS+UJZlgLeYi29Nd/0xwAd5kY+3AaZn8tWp5lsrnwDr05h79Y7Rnw6u3MXL2An
+5wXqmtzj0ddkRKO2+rmBqm3UySg5ECBsKg50ecYuBMexeKer2MTOai9yHfBSVqL
BMi/Bh3hbuK4b/DA4zr8YxVVYUQCKhqUjQtGgNmspZrbIK0kks/6INuBYaUXTHM7
NLFhKqCbVvODuy717SET73YO+8JItg==
=6R4A
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--


