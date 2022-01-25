Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469D449B724
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:02:57 +0100 (CET)
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNLT-0001YE-SG
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:02:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCMze-0001u3-SA
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:40:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCMzc-0000rl-0o
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643121619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y5LEtAn9EgVGisy7k41Dq1Ch5NmTpAGmof3n9FztpgA=;
 b=jQ0l7DwDX8WWok+9YrlJKLjkIkvsclu/C3N8bunNZbOHzG2hLV0H8+lloDH3RRPIKQwCf3
 9mbHkJirN8oiSFofy1xdzN01xeQLSW0tljBbkcO9qq4+yqsl10xCF/ll0bKNfVrkV+ZhzR
 2UEFkZEQIP5bzqjFFUV75gpjEi2mbnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-CzFnaVaeMme0FRj4SYTk4g-1; Tue, 25 Jan 2022 09:40:15 -0500
X-MC-Unique: CzFnaVaeMme0FRj4SYTk4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A63583DBA4;
 Tue, 25 Jan 2022 14:40:13 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F83D78AA7;
 Tue, 25 Jan 2022 14:40:12 +0000 (UTC)
Date: Tue, 25 Jan 2022 14:19:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <YfAG/X+6aI7mDvlj@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <Ye/JPI6yJ0zOce5e@stefanha-x1.localdomain>
 <34FCB9A6-4E69-47C4-BBE9-3D92216908D6@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2aDImdTgbHX4uF0E"
Content-Disposition: inline
In-Reply-To: <34FCB9A6-4E69-47C4-BBE9-3D92216908D6@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
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


--2aDImdTgbHX4uF0E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 01:49:23PM +0000, Jag Raman wrote:
>=20
>=20
> > On Jan 25, 2022, at 4:56 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman wrote:
> >> Allow PCI buses to be part of isolated CPU address spaces. This has a
> >> niche usage.
> >>=20
> >> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI devices in
> >> the same machine/server. This would cause address space collision as
> >> well as be a security vulnerability. Having separate address spaces for
> >> each PCI bus would solve this problem.
> >>=20
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> include/hw/pci/pci.h     |  2 ++
> >> include/hw/pci/pci_bus.h | 17 +++++++++++++++++
> >> hw/pci/pci.c             | 17 +++++++++++++++++
> >> hw/pci/pci_bridge.c      |  5 +++++
> >> 4 files changed, 41 insertions(+)
> >>=20
> >> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >> index 023abc0f79..9bb4472abc 100644
> >> --- a/include/hw/pci/pci.h
> >> +++ b/include/hw/pci/pci.h
> >> @@ -387,6 +387,8 @@ void pci_device_save(PCIDevice *s, QEMUFile *f);
> >> int pci_device_load(PCIDevice *s, QEMUFile *f);
> >> MemoryRegion *pci_address_space(PCIDevice *dev);
> >> MemoryRegion *pci_address_space_io(PCIDevice *dev);
> >> +AddressSpace *pci_isol_as_mem(PCIDevice *dev);
> >> +AddressSpace *pci_isol_as_io(PCIDevice *dev);
> >>=20
> >> /*
> >>  * Should not normally be used by devices. For use by sPAPR target
> >> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> >> index 347440d42c..d78258e79e 100644
> >> --- a/include/hw/pci/pci_bus.h
> >> +++ b/include/hw/pci/pci_bus.h
> >> @@ -39,9 +39,26 @@ struct PCIBus {
> >>     void *irq_opaque;
> >>     PCIDevice *devices[PCI_SLOT_MAX * PCI_FUNC_MAX];
> >>     PCIDevice *parent_dev;
> >> +
> >>     MemoryRegion *address_space_mem;
> >>     MemoryRegion *address_space_io;
> >=20
> > This seems like a good point to rename address_space_mem,
> > address_space_io, as well as PCIIORegion->address_space since they are
> > all MemoryRegions and not AddressSpaces. Names could be
> > mem_space_mr/io_space_mr and PCIIORegion->container_mr. This avoids
> > confusion with the actual AddressSpaces that are introduced in this
> > patch.
>=20
> Are you referring to renaming address_space_mem, address_space_io and
> PCIIORegion->address_space alone? I=E2=80=99m asking because there are ma=
ny
> other symbols in the code which are named similarly.

I only see those symbols in hw/pci/pci.c. Which ones were you thinking
about?

> >=20
> >>=20
> >> +    /**
> >> +     * Isolated address spaces - these allow the PCI bus to be part
> >> +     * of an isolated address space as opposed to the global
> >> +     * address_space_memory & address_space_io. This allows the
> >> +     * bus to be attached to CPUs from different machines. The
> >> +     * following is not used used commonly.
> >> +     *
> >> +     * TYPE_REMOTE_MACHINE allows emulating devices from multiple
> >> +     * VM clients, as such it needs the PCI buses in the same machine
> >> +     * to be part of different CPU address spaces. The following is
> >> +     * useful in that scenario.
> >> +     *
> >> +     */
> >> +    AddressSpace *isol_as_mem;
> >> +    AddressSpace *isol_as_io;
> >=20
> > Or use the pointers unconditionally and initialize them to the global
> > address_space_memory/address_space_io? That might simplify the code so
> > isolated address spaces is no longer a special case.
>=20
> I did start off with using these pointers unconditionally - but adopted a=
n optional
> isolated address space for the following reasons:
>   - There is a potential for regression
>   - CPU address space per bus is not a common scenario. In most case, all=
 PCI
>     buses are attached to CPU sharing the same address space. Therefore, =
an
>     optional address space made sense for this special scenario
>=20
> We can also set it unconditionally if you prefer, kindly confirm.

It's a matter of taste. I don't have a strong opinion on it but
personally I would try to make it unconditional. I think the risk of
regressions is low and the code complexity will be lower than making it
a special case. If you wanted to keep it as is, that's fine.

>=20
> >=20
> > isol_as_io isn't used by this patch?
>=20
> This patch introduces these variables, defines its getters and sets them =
to NULL in
> places where new PCI buses are presently created. The following patch cre=
ates a
> separate isolated address space:
> [PATCH v5 04/18] pci: create and free isolated PCI buses
>=20
> I could merge these patches if you prefer.

The only place I saw that reads isol_as_io is "[PATCH v5 15/18]
vfio-user: handle PCI BAR accesses", but that's for PCI I/O Space
accesses. Did I miss where I/O Space BARs are mapped into isol_as_io?

Stefan

--2aDImdTgbHX4uF0E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHwBvwACgkQnKSrs4Gr
c8hjPwf+KcgMZs7px33jWOsG9RGF2iXk75MacaPGwU7rfsePwSqe2rW1Rdkm/BnR
SXhQQ0YpnP6yZXkQN02/zkYParCfier0sJxM7QV3qBrRUU7WwfZ4Y5rfTaSqT15f
aWADw3aK0Lj9F5Vr02MfYHYenft+qAn+6Dxse9caAfBrMllAB+b8uBe7M5g3yzZn
0wPhUBk5mk8D22VPU+BW+J+jgjXlLGAk43frR7BEt60c0/xbslyxUV2M41qQhwaV
euij1Bt+4yMmVeKG8yWoiyPbK6Q3q7lJmHB7T3QDKoG2JCleqGO+GSctLR/qosGa
rpnVdy7eD4LneWqeQBoDiuyzmljP+A==
=VrK0
-----END PGP SIGNATURE-----

--2aDImdTgbHX4uF0E--


