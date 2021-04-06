Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBC355B26
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 20:18:17 +0200 (CEST)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTqHH-0001OD-Tm
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 14:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTqFM-0000mW-1c
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTqF7-0008Qv-Kg
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617732958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhLvoSY5Sh66vEo0NEMAfZfphoGBOrDUAggJ1006W2U=;
 b=X1e6RcwZ5a4kIhDh352NAXDAd89M/txOdPACsU46sJI4eJByaHeNjUYBaKRbqYpsTjyRTr
 0/Pc64ib44Mxp7FAbxHwH/aqEme3HQdR8nU+XDqDfzLPSyob2js7jyNxDof3f3Kb/lCl5a
 TgO+h9PJ/YX/Xv1yF4NEQ8+W0aUbDWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-C05Eiu7yNaWpYNIi4TluwA-1; Tue, 06 Apr 2021 14:15:56 -0400
X-MC-Unique: C05Eiu7yNaWpYNIi4TluwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02033E99C0;
 Tue,  6 Apr 2021 18:15:56 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49ED550F70;
 Tue,  6 Apr 2021 18:15:48 +0000 (UTC)
Date: Tue, 6 Apr 2021 20:15:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PULL v2 11/19] pci: acpi: ensure that acpi-index is unique
Message-ID: <20210406201546.2377830e@redhat.com>
In-Reply-To: <YGx5LRiqkKRmO4aJ@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
 <20210322225907.541943-12-mst@redhat.com>
 <YGx2IFN3mJisOR1w@redhat.com> <YGx5LRiqkKRmO4aJ@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 16:07:25 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Apr 06, 2021 at 03:54:24PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Mon, Mar 22, 2021 at 07:00:18PM -0400, Michael S. Tsirkin wrote: =20
> > > From: Igor Mammedov <imammedo@redhat.com>
> > >=20
> > > it helps to avoid device naming conflicts when guest OS is
> > > configured to use acpi-index for naming.
> > > Spec ialso says so:
> > >=20
> > > PCI Firmware Specification Revision 3.2
> > > 4.6.7.  _DSM for Naming a PCI or PCI Express Device Under Operating S=
ystems
> > > "
> > > Instance number must be unique under \_SB scope. This instance number=
 does not have to
> > > be sequential in a given system configuration.
> > > "
> > >=20
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Message-Id: <20210315180102.3008391-4-imammedo@redhat.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  hw/acpi/pcihp.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 46 insertions(+)
> > >=20
> > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > index ceab287bd3..f4cb3c979d 100644
> > > --- a/hw/acpi/pcihp.c
> > > +++ b/hw/acpi/pcihp.c
> > > @@ -52,6 +52,21 @@ typedef struct AcpiPciHpFind {
> > >      PCIBus *bus;
> > >  } AcpiPciHpFind;
> > > =20
> > > +static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpointer =
user_data)
> > > +{
> > > +    return a - b;
> > > +}
> > > +
> > > +static GSequence *pci_acpi_index_list(void)
> > > +{
> > > +    static GSequence *used_acpi_index_list;
> > > +
> > > +    if (!used_acpi_index_list) {
> > > +        used_acpi_index_list =3D g_sequence_new(NULL);
> > > +    }
> > > +    return used_acpi_index_list;
> > > +}
> > > +
> > >  static int acpi_pcihp_get_bsel(PCIBus *bus)
> > >  {
> > >      Error *local_err =3D NULL;
> > > @@ -277,6 +292,23 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandle=
r *hotplug_dev,
> > >                     ONBOARD_INDEX_MAX);
> > >          return;
> > >      }
> > > +
> > > +    /*
> > > +     * make sure that acpi-index is unique across all present PCI de=
vices
> > > +     */
> > > +    if (pdev->acpi_index) {
> > > +        GSequence *used_indexes =3D pci_acpi_index_list();
> > > +
> > > +        if (g_sequence_lookup(used_indexes, GINT_TO_POINTER(pdev->ac=
pi_index),
> > > +                              g_cmp_uint32, NULL)) {
> > > +            error_setg(errp, "a PCI device with acpi-index =3D %" PR=
Iu32
> > > +                       " already exist", pdev->acpi_index);
> > > +            return;
> > > +        }
> > > +        g_sequence_insert_sorted(used_indexes,
> > > +                                 GINT_TO_POINTER(pdev->acpi_index),
> > > +                                 g_cmp_uint32, NULL);
> > > +    } =20
> >=20
> > This doesn't appear to ensure uniqueness when using PCIe topologies:
> >=20
> > $ ./build/x86_64-softmmu/qemu-system-x86_64 \
> >      -device virtio-net,acpi-index=3D100 \
> >      -device virtio-net,acpi-index=3D100
> > qemu-system-x86_64: -device virtio-net,acpi-index=3D100: a PCI device w=
ith acpi-index =3D 100 already exist
> >=20
> > $ ./build/x86_64-softmmu/qemu-system-x86_64 \
> >      -M q35 \
> >      -device virtio-net,acpi-index=3D100
> >      -device virtio-net,acpi-index=3D100
> > ....happily running.... =20
>=20
> In fact the entire concept doesn't appear to work with Q35 at all as
> implemented.
>=20
> The 'acpi_index' file in the guest OS never gets created and the NICs
> are still called 'eth0', 'eth1'
>=20
> Only with i440fx can I can the "enoNNN" based naming to work with
> acpi-index set from QEMU

It is not supported on Q35 yet as it depends on ACPI PCI hotplug infrastruc=
ture.
Once Julia is done with porting it to Q35, acpi-index will be pulled along =
with it.


> Regards,
> Daniel


