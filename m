Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9C149B23B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:52:41 +0100 (CET)
Received: from localhost ([::1]:58960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJRI-00069Q-6G
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:52:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCJKK-0001KQ-If
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCJKG-0008KT-Ki
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643107521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VBMF2dlu81/ZJnZUsJIhwiNoMsdPnoGFoWU9fgzubr0=;
 b=TOt1ic73fOp2vMeFHW3aLQrIXGqCeQcyUGCtSwhW1IemRr4Rk12nvO3y/hTrLk1Mc6fyLF
 agQAxfMqkvOeerF42obYE1EFxmq4BRG4Ep68bup5a/PH0ZT8xZMe1a7yR+rrMbHW1m4x+U
 IOgUCX45Cf00q8KAKPOerw8LiQ3IFlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-gAy6d2a7Mr6lzQ20uCaAIQ-1; Tue, 25 Jan 2022 05:45:17 -0500
X-MC-Unique: gAy6d2a7Mr6lzQ20uCaAIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B8B784DA40;
 Tue, 25 Jan 2022 10:45:16 +0000 (UTC)
Received: from localhost (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AA4F66E09;
 Tue, 25 Jan 2022 10:44:59 +0000 (UTC)
Date: Tue, 25 Jan 2022 10:44:58 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 07/18] vfio-user: set qdev bus callbacks for remote
 machine
Message-ID: <Ye/UqqSippA8LTHK@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <1dee463f227f7a865877cd98f78e4ce48ce8ab32.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Dli+V0ZyK+DvSx5t"
Content-Disposition: inline
In-Reply-To: <1dee463f227f7a865877cd98f78e4ce48ce8ab32.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Dli+V0ZyK+DvSx5t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:41:56PM -0500, Jagannathan Raman wrote:
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/machine.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index 220ff01aa9..221a8430c1 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -22,6 +22,60 @@
>  #include "hw/pci/pci_host.h"
>  #include "hw/remote/iohub.h"
> =20
> +static bool remote_machine_get_bus(const char *type, BusState **bus,
> +                                   Error **errp)
> +{
> +    ERRP_GUARD();
> +    RemoteMachineState *s =3D REMOTE_MACHINE(current_machine);
> +    BusState *root_bus =3D NULL;
> +    PCIBus *new_pci_bus =3D NULL;
> +
> +    if (!bus) {
> +        error_setg(errp, "Invalid argument");
> +        return false;
> +    }
> +
> +    if (strcmp(type, TYPE_PCI_BUS) && strcmp(type, TYPE_PCI_BUS)) {
> +        return true;
> +    }
> +
> +    root_bus =3D qbus_find_recursive(sysbus_get_default(), NULL, TYPE_PC=
IE_BUS);
> +    if (!root_bus) {
> +        error_setg(errp, "Unable to find root PCI device");
> +        return false;
> +    }
> +
> +    new_pci_bus =3D pci_isol_bus_new(root_bus, type, errp);
> +    if (!new_pci_bus) {
> +        return false;
> +    }
> +
> +    *bus =3D BUS(new_pci_bus);
> +
> +    pci_bus_irqs(new_pci_bus, remote_iohub_set_irq, remote_iohub_map_irq,
> +                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
> +
> +    return true;
> +}

Can the user create the same PCI bus via QMP commands? If so, then this
is just a convenience that saves the extra step. Or is there some magic
that cannot be done via QMP device_add?

I'm asking because there are 3 objects involved and I'd like to
understand the lifecycle/dependencies:
1. The PCIDevice we wish to export.
2. The PCIBus with isolated address spaces that contains the PCIDevice.
3. The vfio-user server that exports a given PCIDevice.

Users can already create the PCIDevice via hotplug and the vfio-user
server via object-add. So if there's no magic they could also create the
PCI bus:
1. device_add ...some PCI bus stuff here...,id=3Disol-pci-bus0
2. device_add ...the PCIDevice...,bus=3Disol-pci-bus0,id=3Dmydev
3. object-add x-vfio-user-server,device=3Dmydev

Unplug would work in the reverse order.

It may be more convenient to automatically create a PCIBus when the
PCIDevice is hotplugged, but this kind of magic also has drawbacks
(hidden devices, naming collisions, etc).

> +
> +static bool remote_machine_put_bus(BusState *bus, Error **errp)
> +{
> +    PCIBus *pci_bus =3D NULL;
> +
> +    if (!bus) {
> +        error_setg(errp, "Invalid argument");
> +        return false;
> +    }
> +
> +    if (!object_dynamic_cast(OBJECT(bus), TYPE_PCI_BUS)) {
> +        return true;
> +    }
> +
> +    pci_bus =3D PCI_BUS(bus);
> +
> +    return pci_isol_bus_free(pci_bus, errp);
> +}
> +
>  static void remote_machine_init(MachineState *machine)
>  {
>      MemoryRegion *system_memory, *system_io, *pci_memory;
> @@ -56,6 +110,9 @@ static void remote_machine_init(MachineState *machine)
>                   &s->iohub, REMOTE_IOHUB_NB_PIRQS);
> =20
>      qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
> +
> +    qdev_set_bus_cbs(remote_machine_get_bus, remote_machine_put_bus,
> +                     &error_fatal);
>  }
> =20
>  static void remote_machine_pre_plug_cb(HotplugHandler *hotplug_dev,
> --=20
> 2.20.1
>=20

--Dli+V0ZyK+DvSx5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHv1KoACgkQnKSrs4Gr
c8guXQgAyXB/TXVVaarVGu/ukXb0k+KBnf1uTER8D6/oCqRF769MXDxzt/haxIDy
o5HkBJeyDkeJeawpYQA9Ayc5WTAwy034G6FyuiZay2aWZ/hWtYHvwvNdDAmalRli
gafH0mG0qD5pAk6Ccd3p6+F/vvjleiyQg0xWXEAFZhnJrTJm6AZ8lZH8VSx8njjC
bJgr/J3M5BcsI48R9Qo3wgGK3Apl0yufIozcZ5OOWdnkO2ZAxLouuEWGeCMiwIg6
PruuGkaTZaP0txIpYr6UrKs66ymNLzhkJzDvidjpwg2FBH8ZlTHznGgeFWdmNII7
T1wid6e8fTPhX8bSLLF7DY/TJAgCqw==
=ZCC6
-----END PGP SIGNATURE-----

--Dli+V0ZyK+DvSx5t--


