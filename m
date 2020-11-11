Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608B92AF476
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:11:37 +0100 (CET)
Received: from localhost ([::1]:44066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrma-0000td-FE
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcrlY-0000KZ-0C
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:10:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcrlV-0000O8-Sk
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605107428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjGRHvorxXLG603Hs0pfzr90auwRdNKbzWh3oPgL1YI=;
 b=HiDmncjPs+Tifh9jt7kb+LEzfTNkC4hWj3hHOe4Qd3lpxeu2vLNRhfeBo+P5RWMihRw7Pu
 k9xeOhYyrYAZxy+WMhnTYe45+dFzZ7gHmRiFVu7ckB1UBJ/T/95yOLPUpsvh6gQ0YomZ7E
 fN9We1CCay0DsGQVfz/y0OQt3DUUNp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-G3fj7UwwN_-ooWd5x2G0RQ-1; Wed, 11 Nov 2020 10:10:26 -0500
X-MC-Unique: G3fj7UwwN_-ooWd5x2G0RQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F46387951F;
 Wed, 11 Nov 2020 15:10:25 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84A8719C71;
 Wed, 11 Nov 2020 15:10:15 +0000 (UTC)
Date: Wed, 11 Nov 2020 15:10:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111151014.GB1421166@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201110131404.2c0f0d9d@w520.home>
MIME-Version: 1.0
In-Reply-To: <20201110131404.2c0f0d9d@w520.home>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
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
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 01:14:04PM -0700, Alex Williamson wrote:
> On Tue, 10 Nov 2020 09:53:49 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Documentation/filesystems/sysfs.rst:
> ---
> Attributes
> ~~~~~~~~~~
>=20
> Attributes can be exported for kobjects in the form of regular files in
> the filesystem. Sysfs forwards file I/O operations to methods defined
> for the attributes, providing a means to read and write kernel
> attributes.
>=20
> Attributes should be ASCII text files, preferably with only one value
> per file. It is noted that it may not be efficient to contain only one
> value per file, so it is socially acceptable to express an array of
> values of the same type.
>=20
> Mixing types, expressing multiple lines of data, and doing fancy
> formatting of data is heavily frowned upon. Doing these things may get
> you publicly humiliated and your code rewritten without notice.
> ---
>=20
> We'd either need to address your TODO and create a hierarchical
> representation or find another means to exchange this format.

Okay, thanks for pointing this out. If the limitations on sysfs
directory structure are really what I think they are, then we can work
around the lack of sub-directories by flattening the hierarchical
information in an attribute name prefix, but it's ugly:

  <parent-device>/<mdev_supported_types>/<type-id>/
    migration_param_FOO_off_value
    migration_param_FOO_init_value
    migration_param_FOO_description
    migration_param_FOO_type

It makes enumerating migration parameters more awkward for userspace
because they need to skip many of the files when scanning for parameter
names.

Or we could create a kobject for each migration parameter, but that
seems wrong too.

Or we could investigate other file systems like configfs. Maybe this is
why tracefs and other specific file systems exist - sysfs is too
limited?

> > Device models supported by an mdev driver and their details can be read=
 from
> > the migration_info.json attr. Each mdev type supports one device model.=
 If a
> > parent device supports multiple device models then each device model ha=
s an
> > mdev type. There may be multiple mdev types for a single device model w=
hen they
> > offer different migration parameters such as resource capacity or featu=
re
> > availability.
> >=20
> > For example, a graphics card that supports 4 GB and 8 GB device instanc=
es would
> > provide gfx-4GB and gfx-8GB mdev types with memory=3D4096 and memory=3D=
8192
> > migration parameters, respectively.
>=20
>=20
> I think this example could be expanded for clarity.  I think this is
> suggesting we have mdev_types of gfx-4GB and gfx-8GB, which each
> implement some common device model, ie. com.gfx/GPU, where the
> migration parameter 'memory' for each defaults to a value matching the
> type name.  But it seems like this can also lead to some combinatorial
> challenges for management tools if these parameters are writable.  For
> example, should a management tool create a gfx-4GB device and change to
> memory parameter to 8192 or a gfx-8GB device with the default parameter?

Right, if gfx-4GB and gfx-8GB both offer variable "memory" migration
parameters. Userspace will eliminate mdevs whose device model string and
allowed parameter values are incompatible, and then it will choose a
remaining mdev type. If creating the device fails then it can try
another remaining mdev type.

> > The following mdev device sysfs attrs relate to a specific device insta=
nce::
> >=20
> >   /sys/.../<parent-device>/<uuid>/
> >     mdev_type/ - symlink to mdev type sysfs attrs, e.g. to fetch migrat=
ion/model
>=20
>=20
> We need a mechanism that translates to non-mdev vfio devices as well,
> the device "model" creates a clean separation from an mdev-type, we
> shouldn't reintroduce that dependency here.

Okay. The user will need the device model string and the migration
parameter info.

Is there an example of a non-mdev VFIO device that has software
functionality (e.g. device-specific sysfs attrs)?

> >     migration/ - migration related files
> >       <param> - read/write migration parameter "param"
> >       ...
> >=20
> > When the device is created all migration/<param> attrs take their
> > migration_info.json "init_value".
> >=20
> > When preparing for migration on the source, each migration parameter fr=
om
> > migration/<param> is read and added to the migration parameter list if =
its
> > value differs from "off_value" in migration_info.json. If a migration p=
arameter
> > in the list is not available on the destination, then migration is not
> > possible. If a migration parameter value is not in the destination
> > "allowed_values" migration_info.json then migration is not possible.
> >=20
> > In order to prepare an mdev device instance for an incoming migration o=
n the
> > destination, the "off_value" from migration_info.json is written to eac=
h
> > migration parameter in migration/<param>. Then the migration parameter =
list
> > from the source is written to migration/<param> one migration parameter=
 at a
> > time. If an error occurs while writing a migration parameter on the des=
tination
> > then migration is not possible. Once the migration parameter list has b=
een
> > written the mdev can be opened and migration can proceed.
>=20
>=20
> What's the logic behind setting the value twice?  If we have a
> preconfigured pool of devices where the off_value might use less
> resources, we risk that resources might be consumed elsewhere if we
> release them and try to get them back.  It also seems rather
> inefficient.

The description above was sub-optimal. Each parameter only needs to be
written once:

  for param in dest_params:
      if param in source_params:
          val =3D source_params[param]
      else:
          val =3D param_json['off_value']

      sysfs_write(f'migration/{param}', val)

We either write the value from the source or the off_value from the
destination.

> > An open mdev device typically does not allow migration parameters to be=
 changed
> > at runtime. However, certain migration/params attrs may allow writes at
> > runtime. Usually these migration parameters only affect the device stat=
e
> > representation and not the hardware interface. This makes it possible t=
o
> > upgrade or downgrade the device state representation at runtime so that
> > migration is possible to newer or older device implementations.
>=20
>=20
> Which begs the question of how we'd determine which can be modified
> runtime...  Thanks,

Deciding to modify a parameter at runtime requires knowledge of what
that parameter does. (Unlike the migration compatibility algorithm,
which blindly processes all migration parameters.)

Therefore, I'm not sure it's necessary to add metadata for this. The
user must know what they are doing when modifying parameters at runtime.
If the device implementation doesn't support modifying the parameter at
runtime then -EBUSY can be returned from write(2).

Stefan

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+r/tYACgkQnKSrs4Gr
c8iuxwf/SPKewhS9H8cDx4YiR3Smo2YZaARUUI/Nj5zMw2ZHCTo0gK1gV+JNqvUU
quCrGOytrQfaCKcZaiYuP2rFq2yHnwzqYkEjfjRtOdHbE3nEhJfL2Scb6l6C36lO
HJumrQhCEpf+wSuPVe1Qai6V3cmtYJFP9RK7DFXGlA4QfwEOh4cjvMUjIbtxThv7
obOrjDevfUM+Sz0dlW0d10EtM62RRtzRqTGVeDXs/3YLaHd/aWo0iKLnoDrWg1Mr
QFbKZZ5tKHErYpKYKqgdtVZLTusIkPsOcM0HG4RYTlDg3+zJ0C5kPfJTv0qMykGP
VJDdQh31KnL3DoTithmTfZAlbvXEWA==
=qC+6
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--


