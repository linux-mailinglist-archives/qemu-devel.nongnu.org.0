Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B36C49C678
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:40:09 +0100 (CET)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCeme-0004IN-1b
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:40:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCelC-0003aY-Sd
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:38:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCelB-0002Yr-5X
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:38:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643189916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tFCnTBuEKvr54565ECCp3OFxshmqD8ZGE9yP9/cqpqU=;
 b=GDR7C2U/KkO7kgxjb+9+IZk2VdeVJhmZ3QaHaJlSUJbVwLhPX1O30B+IM+Rq76ZGkhy3Ky
 iWAPH1F2xSOBClWUGv8QDiyWBUtWLcavw4rVtdE4uNmzcpQd4Xz8VMuTOeO94YM3hezkCa
 MopgKqy3MKoTm0BZXO9fMnXWoIBeIHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-Bn8AL30NMTSAhazYDuqwsA-1; Wed, 26 Jan 2022 04:38:31 -0500
X-MC-Unique: Bn8AL30NMTSAhazYDuqwsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F6E580D680;
 Wed, 26 Jan 2022 09:38:29 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C257278DD4;
 Wed, 26 Jan 2022 09:37:52 +0000 (UTC)
Date: Wed, 26 Jan 2022 09:37:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 07/18] vfio-user: set qdev bus callbacks for remote
 machine
Message-ID: <YfEWb/hA68r3oVrt@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <1dee463f227f7a865877cd98f78e4ce48ce8ab32.1642626515.git.jag.raman@oracle.com>
 <Ye/UqqSippA8LTHK@stefanha-x1.localdomain>
 <5C83E65E-33B6-4282-9276-D651B2E56592@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5/cwVGeexmxTgRe8"
Content-Disposition: inline
In-Reply-To: <5C83E65E-33B6-4282-9276-D651B2E56592@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5/cwVGeexmxTgRe8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 09:12:28PM +0000, Jag Raman wrote:
>=20
>=20
> > On Jan 25, 2022, at 5:44 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Wed, Jan 19, 2022 at 04:41:56PM -0500, Jagannathan Raman wrote:
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> hw/remote/machine.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
> >> 1 file changed, 57 insertions(+)
> >>=20
> >> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> >> index 220ff01aa9..221a8430c1 100644
> >> --- a/hw/remote/machine.c
> >> +++ b/hw/remote/machine.c
> >> @@ -22,6 +22,60 @@
> >> #include "hw/pci/pci_host.h"
> >> #include "hw/remote/iohub.h"
> >>=20
> >> +static bool remote_machine_get_bus(const char *type, BusState **bus,
> >> +                                   Error **errp)
> >> +{
> >> +    ERRP_GUARD();
> >> +    RemoteMachineState *s =3D REMOTE_MACHINE(current_machine);
> >> +    BusState *root_bus =3D NULL;
> >> +    PCIBus *new_pci_bus =3D NULL;
> >> +
> >> +    if (!bus) {
> >> +        error_setg(errp, "Invalid argument");
> >> +        return false;
> >> +    }
> >> +
> >> +    if (strcmp(type, TYPE_PCI_BUS) && strcmp(type, TYPE_PCI_BUS)) {
> >> +        return true;
> >> +    }
> >> +
> >> +    root_bus =3D qbus_find_recursive(sysbus_get_default(), NULL, TYPE=
_PCIE_BUS);
> >> +    if (!root_bus) {
> >> +        error_setg(errp, "Unable to find root PCI device");
> >> +        return false;
> >> +    }
> >> +
> >> +    new_pci_bus =3D pci_isol_bus_new(root_bus, type, errp);
> >> +    if (!new_pci_bus) {
> >> +        return false;
> >> +    }
> >> +
> >> +    *bus =3D BUS(new_pci_bus);
> >> +
> >> +    pci_bus_irqs(new_pci_bus, remote_iohub_set_irq, remote_iohub_map_=
irq,
> >> +                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
> >> +
> >> +    return true;
> >> +}
> >=20
> > Can the user create the same PCI bus via QMP commands? If so, then this
>=20
> I think there is a way we could achieve it.
>=20
> When I looked around, both the command line and the QMP didn=E2=80=99t ha=
ve a direct
> way to create a bus. However, there are some indirect ways. For example, =
the
> TYPE_LSI53C895A device creates a SCSI bus to attach SCSI devices. Similar=
ly,
> there are some special PCI devices like TYPE_PCI_BRIDGE which create a
> secondary PCI bus.
>=20
> Similarly, we could implement a PCI device that creates a PCI bus with
> isolated address spaces.

Exactly. device_add instantiates DeviceStates, not busses, so there
needs to be a parent device like a SCSI controller, a PCI bridge, etc
that owns and creates the bus.

> > is just a convenience that saves the extra step. Or is there some magic
> > that cannot be done via QMP device_add?
> >=20
> > I'm asking because there are 3 objects involved and I'd like to
> > understand the lifecycle/dependencies:
> > 1. The PCIDevice we wish to export.
> > 2. The PCIBus with isolated address spaces that contains the PCIDevice.
> > 3. The vfio-user server that exports a given PCIDevice.
> >=20
> > Users can already create the PCIDevice via hotplug and the vfio-user
> > server via object-add. So if there's no magic they could also create the
> > PCI bus:
> > 1. device_add ...some PCI bus stuff here...,id=3Disol-pci-bus0
> > 2. device_add ...the PCIDevice...,bus=3Disol-pci-bus0,id=3Dmydev
> > 3. object-add x-vfio-user-server,device=3Dmydev
>=20
> We are able to do 2 & 3 already. We could introduce a PCI device that
> creates an isolated PCI bus. That would cover step 1 outlined above.

I wonder if a new device is needed or whether it's possible to add an
isol_as=3Don|off (default: off) option to an existing PCI bridge/expander?
Hopefully most of the code is already there.

Stefan

--5/cwVGeexmxTgRe8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxFm8ACgkQnKSrs4Gr
c8jzNQgAieWBFx5epefnoszlzdNTgPd2npdtFcGDPpQjKsoBH4XYva8MuCyyCSri
qbhxyQ55ncm91i0Vv15ToaerErwC6Uclcpx+9xId+u16DtO72XkFlqh7n+J9OxyR
JCuOQGb0Vck41J8zZIOD5P7UvFwaI8YMTv0CUk6IhH4e36JsMAfvJb60YCq1cnJo
t0b0SjoJYqcKIBhe9slDW2yWyOwyI0YEki4Z6kEE+wR9nJfbYNI6aHIWt1EobvOl
yrZDy4wAqAnT81cjAn305oZ1zB9Z1/qo6JVbzFyVlcWJKZZqhRLWvmFk6LOQGNUu
MjyBQHb/SHt0CW8On0L67h+6pTDK+A==
=AAFv
-----END PGP SIGNATURE-----

--5/cwVGeexmxTgRe8--


