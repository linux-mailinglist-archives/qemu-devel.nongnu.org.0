Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362E22AD2DE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:53:25 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQL6-0003jz-AB
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcQKK-0003KR-81
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcQKH-0001Q2-4L
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605001951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ttKKMlvcqglr2eYxoZyKakPAWQthy9k/c5IVklZDUsQ=;
 b=biH6usZMCq236HoUR+eE/J8IR7fMLffL/0RCi9iy5TnmF/j/wDDseTAYbN4S7qcU147i8F
 ma9BE4WMI4mAS4QhA3aVjfmx1qWQrvVWzoE1cfuGQQJEPRtfdR/hp1CDX7s+neIGEp/eWM
 M1UQqqX4pUhA5ygtpIY5OaV9fqbOd1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-WytwKZsPNPSi3Gz17aa_nA-1; Tue, 10 Nov 2020 04:52:26 -0500
X-MC-Unique: WytwKZsPNPSi3Gz17aa_nA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 589B31006C9C;
 Tue, 10 Nov 2020 09:52:25 +0000 (UTC)
Received: from localhost (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC9426EF79;
 Tue, 10 Nov 2020 09:52:18 +0000 (UTC)
Date: Tue, 10 Nov 2020 09:52:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v2] VFIO Migration
Message-ID: <20201110095217.GC1080921@stefanha-x1.localdomain>
References: <20201105150902.GA472489@stefanha-x1.localdomain>
 <20201105123708.6e9329fd@w520.home>
MIME-Version: 1.0
In-Reply-To: <20201105123708.6e9329fd@w520.home>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 12:37:08PM -0700, Alex Williamson wrote:
> On Thu, 5 Nov 2020 15:09:02 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > The disk image file may indirectly affect the hardware interface, for e=
xample
> > by constraining the device's block size. In this case a block-size=3DN =
migration
> > parameter is required to ensure migration compatibility, but the host f=
ile
> > system path of the disk image file still does not require a migration
> > parameter.
> >=20
>=20
> I'm not sure what the above section defined.  We refer to these as
> migration parameters, just as in the previous section, but are they
> read-only and must match exactly?

I will try to clarify this in the next revision. In this example
block-size=3DN is determined by the properties of the physical block
device. The device can only be migrated to a destination with the same
block size. The block-size=3DN migration parameter expresses this
constraint.

> > Device State Representation
> > ---------------------------
> > Device state contains both data accessible through the device's hardwar=
e
> > interface and device-internal state needed to restore device operation.
> >=20
> > The contents of hardware registers are usually included in the device s=
tate if
> > they can change at runtime. Hardware registers with constant or compute=
d data
> > may not need to be part of the device state provided that device
> > implementations can produce the necessary data.
> >=20
> > Device-internal state includes the portion of the device's state that c=
annot be
> > reconstructed from the hardware interface alone. Defining device-intern=
al state
> > in the most general way instead of exposing device implementation detai=
ls
> > allows for flexibility in the future. For example, device implementatio=
ns often
> > maintain a ring index, which is not available through the hardware inte=
rface,
> > to keep track of which ring elements have already been consumed. The ri=
ng index
> > must be included in the device state so that the destination can resume
> > processing from the correct point in the ring. Representing this as an =
index
> > into the ring in the hardware interface is more general than adding dev=
ice
> > implementation-specific request tracking data structures into the devic=
e state.
> >=20
> > The *device state representation* defines the binary data layout of the=
 device
> > state. The device state representation is specific to each device and i=
s beyond
> > the scope of this document, but aspects pertaining to migration compati=
bility
> > are discussed here.
> >=20
> > Each change to the device state representation that affects migration
> > compatibility requires a migration parameter. When a new field is added=
 to the
> > device state representation then a new migration parameter must be adde=
d to
> > reflect this change. Often a single migration parameter expresses both =
a change
> > to the hardware interface and the device state representation. It is al=
so
> > possible to change the device state representation without changing the
> > hardware interface, for example when some state was forgotten while des=
igning
> > the previous device state representation.
> >=20
> > The device state representation may support extra data that can be safe=
ly
> > ignored by old device implementations. In this case migration compatibi=
lity is
> > unaffected and a migration parameter is not required to indicate such e=
xtra
> > data has been added.
> >=20
> > Device Models
> > -------------
> > The combination of the hardware interface, device state representation,=
 and
> > migration parameter definitions is called a *device model*. Device mode=
ls are
> > identified by a unique UTF-8 string starting with a domain name and fol=
lowed by
> > path components separated with backslashes ('/'). Examples include
> > vendor-a.com/my-nic, gitlab.com/user/my-device, virtio-spec.org/pci/vir=
tio-net,
> > and qemu.org/pci/10ec/8139.
> >=20
> > The unique device model string is not changed as the device evolves. In=
stead,
> > migration parameters are added to express variations in a device.
> >=20
> > The device model is not tied to a specific device implementation. The s=
ame
> > device model could be implemented as a VFIO/dev driver or as a vfio-use=
r device
> > emulation program.
> >=20
> > Multiple device implementations can support the same device model. Doin=
g so
> > means that the device implementations can offer migration compatiblity =
because
> > they support the same hardware interface, device state representation, =
and
> > migration parameters.
> >=20
> > Multiple device models can exist for the same hardware interface, each =
with a
> > different device state representation and migration parameters. This ma=
kes it
> > possible to fork and independently develop device models.
> >=20
> > Device models can evolve over time as the hardware interface and device=
 state
> > representation change. The corresponding migration parameters ensure th=
at
> > migration compatibility can be established between device implementatio=
ns.
> >=20
> > Orchestrating Migrations
> > ------------------------
> > The following steps must be followed to migrate devices:
> >=20
> > 1. Check that the source and destination support the same device model.
> >=20
> > 2. Check that the destination supports the migration parameter list fro=
m the
> >    source.
> >=20
> > 3. Configure the destination so it is prepared to load the device state=
. This
> >    may involve instantiating a new device instance or resetting an exis=
ting
> >    device instance to a configuration that is compatible with the sourc=
e.
> >=20
> >    The migration parameter list may be used as part of this configurati=
on, but
> >    note that not all of the configuration is captured in the migration
> >    parameter list. For example, the physical network port for a network=
 card or
> >    the host file system path for a disk image file is typically not cap=
tured in
> >    the migration parameters and must be provided through other means.
> >=20
> > 4. Save the device state on the source and load it on the destination.
> >=20
> > 5. If migration succeeds then the destination resumes operation and the=
 source
> >    must not resume operation. If the migration fails then the source re=
sumes
> >    operation and the destination must not resume operation.
> >=20
> > Note that these steps impose a conservative bound on device states that=
 can be
> > migrated successfully. Not all configuration parameters may be strictly
> > required to match on the source and destination devices. For example, i=
f the
> > device's hardware interface has not yet been initialized then changes t=
o the
> > advertised features may not yet affect the device driver. However, accu=
rately
> > representing runtime constraints is complex and risks introducing migra=
tion
> > bugs, so no attempt is made to support them.
> >=20
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
>=20
>=20
> This seems problematic, why aren't parameters applied on write so that
> userspace can understand the bad values?

I found a way to get rid of the "applied" sysfs attr. Will fix in the
next revision.

> >           params/ - migration parameters
> >               <my-param> - read/write migration parameter "my-param"
> >               ...
>=20
>=20
> Where do we learn the type and possibly valid values for a parameter?

The next revision will add that information.

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
>=20
>=20
> This breaks existing users, there cannot be a new requirement to apply
> parameters or manipulate a new sysfs attribute before a device is
> usable.  Besides, shouldn't default values always be acceptable?  This
> presents a pretty high barrier for new features too, there will always
> be a step where userspace must know about and actively enable that
> feature.  That puts vendors in a difficult situation, either they break
> migration by creating a new device model which enables features by
> default or they need to go to extraordinary lengths to get userspace to
> enable new features.  Is there intended to be a policy where all
> parameters are enabled if we're not trying to match an existing device?
> How would a value be determined where the parameter is not binary?

Good points, the next revision will solve this so the device is created
with the latest supported migration parameter values by default instead
of the oldest/most compatible ones.

> > If writing to a migration/params/<param> attr or setting migration/appl=
ied to
> > "1" fails, then the device implementation does not support the migratio=
n
> > parameters.
>=20
>=20
> s/parameter/value/  If the parameter is not supported, the attribute
> shouldn't be present, right?  It might also be a resource issue that
> prevents a value from being applied, errno might provide insight to
> which it is.

Yes, will fix.

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
> Who does this and when?  How do we determine which are runtime and what
> are acceptable values?  This seems really hard to orchestrate.

Modifying a device at runtime is an explicit operation. The user needs
to know what they are doing. I'm not sure if trying to define metadata
is useful since it cannot be done without an understanding of the
migration parameter's effect.

> > An existing mdev device instance can be reused by closing the mdev devi=
ce and
> > writing "0" to migration/applied. This resets parameters to their defau=
lts so
> > that a new list of migration parameters can be applied.
>=20
>=20
> Nope, can't make new requirements for re-use of an mdev device either.
> I would expect an mdev device to retain it's configuration for the next
> use, userspace can reset parameters as necessary or remove and recreate
> the device.  Thanks,

Will fix in the next revision.

Stefan

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+qYtEACgkQnKSrs4Gr
c8j5vAgAg9GkleTbjvxSlw1bHqy1P6nxL6Tro+3Xn6RFTEHoH5kNDNffwc1UlHhy
4nExSc5FBiMT77JEDJkINysquiUop0jdNOuyMMQ1yDTyONt/4cDqzbHa6t+ymlRg
cIzcD1dM17pjJJ2qf3m1W1ireyfr2iiVQ2ZEsFgj9C3kbdLEmlrwpcYdk97jVpDY
ym/+2lf07OoZ6K8OQDt5uzku1FIfh8QuxG5tSmfIs9entUWzcSfvOKp6gEllTyXd
ws05V4ZpmwZvA+0Iss2Mfo4a3iaoXmO3husk2dh3sTYyKY0OPC8x6Fzpflu/ecwa
VhkHvo4t+t5+tzjOr+L1j/Zb/7vbJg==
=KUKb
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--


