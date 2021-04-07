Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B6A3576C9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 23:27:39 +0200 (CEST)
Received: from localhost ([::1]:51964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUFi6-0001vx-MC
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 17:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lUFgK-0008RN-RK
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lUFgI-0000kB-Ir
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617830744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/RvME+9U5dt/9u40HYrG3PxY+rIFX/d4QGP7Iqra6k=;
 b=K6kwwhVrCrEJY0TQx5WPRL6RgaUoC8kelxXLjt0HfWhPLskuAuBQKbb+hC5gdmxTyejXVy
 UnQ83mAz5Fz5bdd/Un41CoRoMf91i96a7tTLJ1X7WYc6xInijGz1GJGFHgCwSlfLi1xbKV
 TXK3llNV8GiaNc8ig1+kiNkUPvWosdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-7XLV-58aPr6NVCKaVhtspA-1; Wed, 07 Apr 2021 17:25:41 -0400
X-MC-Unique: 7XLV-58aPr6NVCKaVhtspA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A3B4107ACE3;
 Wed,  7 Apr 2021 21:25:40 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0683B39A5F;
 Wed,  7 Apr 2021 21:25:31 +0000 (UTC)
Date: Wed, 7 Apr 2021 23:25:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PULL v2 11/19] pci: acpi: ensure that acpi-index is unique
Message-ID: <20210407232530.79088fc2@redhat.com>
In-Reply-To: <YG1teaGjOvee87Rj@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
 <20210322225907.541943-12-mst@redhat.com>
 <YGx2IFN3mJisOR1w@redhat.com> <YGx5LRiqkKRmO4aJ@redhat.com>
 <20210406201546.2377830e@redhat.com> <YG1teaGjOvee87Rj@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 09:29:45 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

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
> Will the PCI hotplug support work in the same way
>=20
> Looking at this doc I see two options:
>=20
>   https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInt=
erfaceNames/
>=20
>  1. Names incorporating Firmware/BIOS provided index numbers for on-board=
 devices (example: eno1)
>  2. Names incorporating Firmware/BIOS provided PCI Express hotplug slot i=
ndex numbers (example: ens1)=20
>=20
> Is the stuff Julia is implementing for Q35 going to end up
> triggering scenario (1) still, or will it trigger scenario two
> which mentions "hotplug slot index" as a distinct concept from
> the ACPI index we're setting for i440fx ?

it will trigger (1) unless she adds code to disable acpi-index machinery

>=20
> Regards,
> Daniel


