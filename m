Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A482F3576C2
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 23:25:18 +0200 (CEST)
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUFfp-0007Lv-Kr
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 17:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lUFeC-0006OQ-W6
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:23:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lUFe9-0007p7-Pz
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617830612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fh7IuNt/LN6GglsAP3oisMRpXDlFvlMwkfrE9MtCzq0=;
 b=FZuMEcdyxLe8ycofYBRoW5Npf6I7+KDDBY16+eOMEo3own0sFjCGIhhUHm/K3jox2seOMq
 mmZKIktjACR5UjnZ5fBq9G6Hc+12CjuegdQQXdv1I9i9mtMQn0oPAg4IgisVBfD7xT+8bq
 gwEn1BKbXV7F9tIFKpiT6x2m0Ij1Wog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-OOCVp2SYPbeXE8fsae6shw-1; Wed, 07 Apr 2021 17:23:30 -0400
X-MC-Unique: OOCVp2SYPbeXE8fsae6shw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75F2519611A1;
 Wed,  7 Apr 2021 21:23:29 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5282F19C78;
 Wed,  7 Apr 2021 21:23:20 +0000 (UTC)
Date: Wed, 7 Apr 2021 23:23:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PULL v2 11/19] pci: acpi: ensure that acpi-index is unique
Message-ID: <20210407232318.60d8aaf7@redhat.com>
In-Reply-To: <20210407092759-mutt-send-email-mst@kernel.org>
References: <20210322225907.541943-1-mst@redhat.com>
 <20210322225907.541943-12-mst@redhat.com>
 <YGx2IFN3mJisOR1w@redhat.com> <YGx5LRiqkKRmO4aJ@redhat.com>
 <20210406201546.2377830e@redhat.com>
 <20210407092759-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Julia Suvorova <jusual@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 09:29:22 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Apr 06, 2021 at 08:15:46PM +0200, Igor Mammedov wrote:
> > On Tue, 6 Apr 2021 16:07:25 +0100
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >  =20
> > > On Tue, Apr 06, 2021 at 03:54:24PM +0100, Daniel P. Berrang=C3=A9 wro=
te: =20
> > > > On Mon, Mar 22, 2021 at 07:00:18PM -0400, Michael S. Tsirkin wrote:=
   =20
> > > > > From: Igor Mammedov <imammedo@redhat.com>
> > > > >=20
> > > > > it helps to avoid device naming conflicts when guest OS is
> > > > > configured to use acpi-index for naming.
> > > > > Spec ialso says so:
> > > > >=20
> > > > > PCI Firmware Specification Revision 3.2
> > > > > 4.6.7.  _DSM for Naming a PCI or PCI Express Device Under Operati=
ng Systems
> > > > > "
> > > > > Instance number must be unique under \_SB scope. This instance nu=
mber does not have to
> > > > > be sequential in a given system configuration.
> > > > > "
> > > > >=20
> > > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > > Message-Id: <20210315180102.3008391-4-imammedo@redhat.com>
> > > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > ---
> > > > >  hw/acpi/pcihp.c | 46 +++++++++++++++++++++++++++++++++++++++++++=
+++
> > > > >  1 file changed, 46 insertions(+)
> > > > >=20
> > > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > > index ceab287bd3..f4cb3c979d 100644
> > > > > --- a/hw/acpi/pcihp.c
> > > > > +++ b/hw/acpi/pcihp.c
> > > > > @@ -52,6 +52,21 @@ typedef struct AcpiPciHpFind {
> > > > >      PCIBus *bus;
> > > > >  } AcpiPciHpFind;
> > > > > =20
> > > > > +static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpoin=
ter user_data)
> > > > > +{
> > > > > +    return a - b;
> > > > > +}
> > > > > +
> > > > > +static GSequence *pci_acpi_index_list(void)
> > > > > +{
> > > > > +    static GSequence *used_acpi_index_list;
> > > > > +
> > > > > +    if (!used_acpi_index_list) {
> > > > > +        used_acpi_index_list =3D g_sequence_new(NULL);
> > > > > +    }
> > > > > +    return used_acpi_index_list;
> > > > > +}
> > > > > +
> > > > >  static int acpi_pcihp_get_bsel(PCIBus *bus)
> > > > >  {
> > > > >      Error *local_err =3D NULL;
> > > > > @@ -277,6 +292,23 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHa=
ndler *hotplug_dev,
> > > > >                     ONBOARD_INDEX_MAX);
> > > > >          return;
> > > > >      }
> > > > > +
> > > > > +    /*
> > > > > +     * make sure that acpi-index is unique across all present PC=
I devices
> > > > > +     */
> > > > > +    if (pdev->acpi_index) {
> > > > > +        GSequence *used_indexes =3D pci_acpi_index_list();
> > > > > +
> > > > > +        if (g_sequence_lookup(used_indexes, GINT_TO_POINTER(pdev=
->acpi_index),
> > > > > +                              g_cmp_uint32, NULL)) {
> > > > > +            error_setg(errp, "a PCI device with acpi-index =3D %=
" PRIu32
> > > > > +                       " already exist", pdev->acpi_index);
> > > > > +            return;
> > > > > +        }
> > > > > +        g_sequence_insert_sorted(used_indexes,
> > > > > +                                 GINT_TO_POINTER(pdev->acpi_inde=
x),
> > > > > +                                 g_cmp_uint32, NULL);
> > > > > +    }   =20
> > > >=20
> > > > This doesn't appear to ensure uniqueness when using PCIe topologies=
:
> > > >=20
> > > > $ ./build/x86_64-softmmu/qemu-system-x86_64 \
> > > >      -device virtio-net,acpi-index=3D100 \
> > > >      -device virtio-net,acpi-index=3D100
> > > > qemu-system-x86_64: -device virtio-net,acpi-index=3D100: a PCI devi=
ce with acpi-index =3D 100 already exist
> > > >=20
> > > > $ ./build/x86_64-softmmu/qemu-system-x86_64 \
> > > >      -M q35 \
> > > >      -device virtio-net,acpi-index=3D100
> > > >      -device virtio-net,acpi-index=3D100
> > > > ....happily running....   =20
> > >=20
> > > In fact the entire concept doesn't appear to work with Q35 at all as
> > > implemented.
> > >=20
> > > The 'acpi_index' file in the guest OS never gets created and the NICs
> > > are still called 'eth0', 'eth1'
> > >=20
> > > Only with i440fx can I can the "enoNNN" based naming to work with
> > > acpi-index set from QEMU =20
> >=20
> > It is not supported on Q35 yet as it depends on ACPI PCI hotplug infras=
tructure.
> > Once Julia is done with porting it to Q35, acpi-index will be pulled al=
ong with it. =20
>=20
>=20
> Right. But for now, should we make it fail instead of being ignored silen=
tly?
> If we don't how will managament find out it's not really supported?
> And if we make it fail how will management then find out when it's finall=
y
> supported?

I had an idea to add capability flag to MachineInfo in QMP schema
and then do ugly check from PCIDevice.realize()
1)
     if (acpi_index!=3D0 && current_machine->has_pci_acpi_index)
          error out

However Daniel said that he didn't think that MachineInfo was
the right place for it.

Problem is that we can't check acpi-index unsupported configuration
at PCIDevice.realize() time since we don't know about availability
of the feature before first reset event that overrides native PCI
hot-plug (SHPC or PCI-E) with ACPI one if it's enabled. Which is
too late, since all devices are already created.

Neither seems right to do check at PCIDevice.reset() time, as
 *) it would depend if device hosting ACPI hotplug were reset first
 *) make every PCI device query for ACPI hotplug controller
    which is the same current_machine->has_pci_acpi_index only uglier

Hence acpi-index is just ignored on machines that do not support it.

I don't see any good option to do this check without refactoring
ACPI hotplug the way where it's enabled at device creation time.
(I think Julia had similar issues with creation/reset ordering
in her last Q35 ACPI PCI hotplug series)

Any suggestions are welcome.

As a quick ugly temporary solution it could be MachineInfo QAPI schema
flag or (PC)Machine property with [1] check.
After all, It's a board feature and should originate from there
(instead of 'random' acpi hw we decided abuse as hotplug controller),
and later we can re-factor it internally to propagate flag along PCI
hierarchy properly (but external probing will stay the same).

PS:
I also didn't consider rising a error in mixed configurations,
where only some of bridges support ACPI hotplug while some use
native one. So that's something to work on.


> > > Regards,
> > > Daniel =20
>=20


