Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D76240F370
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 09:41:28 +0200 (CEST)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR8Uw-0007Mi-8w
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 03:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mR8So-0004ne-Gb
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 03:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mR8Sk-00030P-Ky
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 03:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631864349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ld8s33WN58b4TAD+itq/zrOXhbS0dBqoYtJJVRqqtAo=;
 b=PjmlfTUmwbl2h/IjtXC1Am3+uznwT6LT3PrO8YAOzz6vPYjyAru3Dy+c8Ec/pNZHQ4dxfe
 DBTIumesvOkt0zOCbrdvq7FygkX8yccP9S5DA7fXV1PMe6fcku3AKhxTHt5UnVa0YJbEuy
 CUy9AOA2Sy6D5UbumkPVUkKsT+NCE1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-W5sZm7lPPHu3_fKxoSDOHQ-1; Fri, 17 Sep 2021 03:39:08 -0400
X-MC-Unique: W5sZm7lPPHu3_fKxoSDOHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E462D84A5E0;
 Fri, 17 Sep 2021 07:39:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FB027A5CF;
 Fri, 17 Sep 2021 07:38:48 +0000 (UTC)
Date: Fri, 17 Sep 2021 09:38:47 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC 00/13] hw/nvme: experimental user-creatable objects
Message-ID: <YURGB/6SfQUMu992@redhat.com>
References: <20210914203737.182571-1-its@irrelevant.dk>
 <YUM7YEQDQ2L3Qdh9@redhat.com> <YUNxQCbZSF3nMkVT@apples.localdomain>
 <YUQ0B3VQzY++MGsz@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <YUQ0B3VQzY++MGsz@apples.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UX3E0ACZhWwwf5kB"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--UX3E0ACZhWwwf5kB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 17.09.2021 um 08:21 hat Klaus Jensen geschrieben:
> On Sep 16 18:30, Klaus Jensen wrote:
> > On Sep 16 14:41, Kevin Wolf wrote:
> > > Am 14.09.2021 um 22:37 hat Klaus Jensen geschrieben:
> > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > >=20
> > > > Hi,
> > > >=20
> > > > This is an attempt at adressing a bunch of issues that have present=
ed
> > > > themselves since we added subsystem support. It's been brewing for =
a
> > > > while now.
> > > >=20
> > > > Fundamentally, I've come to the conclusion that modeling namespaces=
 and
> > > > subsystems as "devices" is wrong. They should have been user-creata=
ble
> > > > objects. We've run into multiple issues with wrt. hotplugging due t=
o how
> > > > namespaces hook up to the controller with a bus. The bus-based desi=
gn
> > > > made a lot of sense when we didn't have subsystem support and it fo=
llows
> > > > the design of hw/scsi. But, the problem here is that the bus-based
> > > > design dictates a one parent relationship, and with shared namespac=
es,
> > > > that is just not true. If the namespaces are considered to have a s=
ingle
> > > > parent, that parent is the subsystem, not any specific controller.
> > > >=20
> > > > This series adds a set of experimental user-creatable objects:
> > > >=20
> > > >   -object x-nvme-subsystem
> > > >   -object x-nvme-ns-nvm
> > > >   -object x-nvme-ns-zoned
> > > >=20
> > > > It also adds a new controller device (-device x-nvme-ctrl) that sup=
ports
> > > > these new objects (and gets rid of a bunch of deprecated and confus=
ing
> > > > parameters). This new approach has a bunch of benefits (other than =
just
> > > > fixing the hotplugging issues properly) - we also get support for s=
ome
> > > > nice introspection through some new dynamic properties:
> > > >=20
> > > >   (qemu) qom-get /machine/peripheral/nvme-ctrl-1 attached-namespace=
s
> > > >   [
> > > >       "/objects/nvm-1",
> > > >       "/objects/zns-1"
> > > >   ]
> > > >=20
> > > >   (qemu) qom-list /objects/zns-1
> > > >   type (string)
> > > >   subsys (link<x-nvme-subsystem>)
> > > >   nsid (uint32)
> > > >   uuid (string)
> > > >   attached-ctrls (str)
> > > >   eui64 (string)
> > > >   blockdev (string)
> > > >   pi-first (bool)
> > > >   pi-type (NvmeProtInfoType)
> > > >   extended-lba (bool)
> > > >   metadata-size (uint16)
> > > >   lba-size (size)
> > > >   zone-descriptor-extension-size (size)
> > > >   zone-cross-read (bool)
> > > >   zone-max-open (uint32)
> > > >   zone-capacity (size)
> > > >   zone-size (size)
> > > >   zone-max-active (uint32)
> > > >=20
> > > >   (qemu) qom-get /objects/zns-1 pi-type
> > > >   "none"
> > > >=20
> > > >   (qemu) qom-get /objects/zns-1 eui64
> > > >   "52:54:00:17:67:a0:40:15"
> > > >=20
> > > >   (qemu) qom-get /objects/zns-1 zone-capacity
> > > >   12582912
> > > >=20
> > > > Currently, there are no shortcuts, so you have to define the full
> > > > topology to get it up and running. Notice that the topology is expl=
icit
> > > > (the 'subsys' and 'attached-ctrls' links). There are no 'nvme-bus'
> > > > anymore.
> > > >=20
> > > >   -object x-nvme-subsystem,id=3Dsubsys0,subnqn=3Dfoo
> > > >   -device x-nvme-ctrl,id=3Dnvme-ctrl-0,serial=3Dfoo,subsys=3Dsubsys=
0
> > > >   -device x-nvme-ctrl,id=3Dnvme-ctrl-1,serial=3Dbar,subsys=3Dsubsys=
0
> > > >   -drive  id=3Dnvm-1,file=3Dnvm-1.img,format=3Draw,if=3Dnone,discar=
d=3Dunmap
> > > >   -object x-nvme-ns-nvm,id=3Dnvm-1,blockdev=3Dnvm-1,nsid=3D1,subsys=
=3Dsubsys0,attached-ctrls=3Dnvme-ctrl-1
> > > >   -drive  id=3Dnvm-2,file=3Dnvm-2.img,format=3Draw,if=3Dnone,discar=
d=3Dunmap
> > > >   -object x-nvme-ns-nvm,id=3Dnvm-2,blockdev=3Dnvm-2,nsid=3D2,subsys=
=3Dsubsys0,attached-ctrls=3Dnvme-ctrl-0
> > >=20
> > > I may be wrong here, but my first gut feeling when seeing this was th=
at
> > > referencing the controller device in the namespace object feels
> > > backwards. Usually, we have objects that are created independently an=
d
> > > then the devices reference them.
> > >=20
> > > Your need to use a machine_done notifier is probably related to that,
> > > too, because it goes against the normal initialisation order, so you
> > > have to wait. Error handling also isn't really possible in the notifi=
er
> > > any more, so this series seems to just print something to stderr, but
> > > ignore the error otherwise.
> > >=20
> > > Did you consider passing a list of namespaces to the controller devic=
e
> > > instead?
> > >=20
> > > I guess a problem that you have with both ways is that support for
> > > list options isn't great in QemuOpts, which is still used both for
> > > -object and -device in the system emulator...
> >=20
> > Heh. Exactly. The ability to better support lists with -object through
> > QAPI is why I did it like this...

I see. I really need to continue with the QAPIfication work, in the hope
that devices will have the same level of support for lists in the
future...

QOM really has usable support for lists, it's just the outer layer that
doesn't support them well. I wonder how hard (or how stupid) it would be
to support JSON syntax without QAPIfying things first.

> > Having the list of namespaces on the controller is preferable. I'll see
> > what I can come up with.
>=20
> There is also the issue that the x-nvme-ns-nvm -object needs a blockdev
> - and the ordering is also a problem here. That also requires the
> machine done notifier.

True, initialisation order can be a mess because QEMU tries to be clever
and figure it out automatically. But I guess for this part you could
just have an exception in object_create_early() to switch it to late
initialisation when blockdevs are already there.

Even when returning false in object_create_early(), this is still before
device creation, so the question of whether to move the list to the
device remains relevant.

Kevin

--UX3E0ACZhWwwf5kB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmFERgcACgkQfwmycsiP
L9azOQ/+K8LOE7XkJDZsHHxk0x29GhFEmeRwenQuo/b6XOaAhNhkZpJCWh9BdlMq
AUQ9RT6BhqbcCwI8JQ0wmGUsVXmQMnHlgj2Ih0KxMBqHe96OGga/YzyL7DiY1qlt
bp+5PUoIs7LTl+cKGI9qXX/JDwck6G/RdntaZeW4fExfyZ73mErzK+93GXJSuHdf
/oSo2XMhslw6nba5ndtjfYucC2Mik5+0iz3RiEZYX17HcC0yOC5omvw5bmByH/S8
SmYRpacXtlQgLNk+U0lx5EoBd3pGRPySlG6ozYuUwDCkRiSVJvZLlym5n0aNDpq/
HvSqt7hwPQuRn3oIT0mOWUXUgesi6s1IpH+7z2kHG11HERd/lgSjA8VoU/wHELrJ
R+t874rPCXsyCoOriAzGT5vTJoK+r8fcDoWlNHoc+44JY8GoOLi+q+YUfBEy+b8b
Q7tAd+uu1ut7p+rrG2nr+JsPvfNzyKZhxfjgm3YMdpnGcnzV/l1R+lapHQbYbcwc
LiDJ6U1zO555fP8EvbDdC1XDcVziEBK0mFwy65yqz7YadzqHLahQw3JTgIJ2YX40
k/62pQiOWOqWmDt7FDUPKWmB6HQObWoxDmDOVWsw6uPPMBYAkCyseUQFaU05DDGD
Jh932Q3s5ycxF+NTvUnlFS90yvcfMWT8CB2Gl9y/WTpibdurvkU=
=TmVL
-----END PGP SIGNATURE-----

--UX3E0ACZhWwwf5kB--


