Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728973566DF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 10:32:10 +0200 (CEST)
Received: from localhost ([::1]:49878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU3bd-0005CD-1R
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 04:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lU3Zi-0004XE-EG
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 04:30:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lU3Ze-0004qK-Vx
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 04:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617784205;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWvrVPKrlR0eZL7Dmqcjx3TzNpNYPqpYDhLF9YU9jes=;
 b=jQ20u+ZatO7m9L3av4vSceLCSl1dkqGevjIRacy9XK6CJ+d3HkbGsEkS38lWGlQuXLar20
 NgeEzlNXDFYVxyXS3+U48/CqvIa6wdw0lTz1P7B46b6/kahunJUERfiEyPr4HPtcSPgKWI
 6e6lLRKFCOyWKmZty+F9b7ELS5DD3jY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-tm_hZna7NbiI6345CAeZ1Q-1; Wed, 07 Apr 2021 04:29:56 -0400
X-MC-Unique: tm_hZna7NbiI6345CAeZ1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6C711922962;
 Wed,  7 Apr 2021 08:29:55 +0000 (UTC)
Received: from redhat.com (ovpn-115-28.ams2.redhat.com [10.36.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31167100239A;
 Wed,  7 Apr 2021 08:29:47 +0000 (UTC)
Date: Wed, 7 Apr 2021 09:29:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL v2 11/19] pci: acpi: ensure that acpi-index is unique
Message-ID: <YG1teaGjOvee87Rj@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
 <20210322225907.541943-12-mst@redhat.com>
 <YGx2IFN3mJisOR1w@redhat.com> <YGx5LRiqkKRmO4aJ@redhat.com>
 <20210406201546.2377830e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210406201546.2377830e@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 08:15:46PM +0200, Igor Mammedov wrote:
> On Tue, 6 Apr 2021 16:07:25 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Tue, Apr 06, 2021 at 03:54:24PM +0100, Daniel P. Berrangé wrote:
> > > On Mon, Mar 22, 2021 at 07:00:18PM -0400, Michael S. Tsirkin wrote:  
> > > > From: Igor Mammedov <imammedo@redhat.com>
> > > > 
> > > > it helps to avoid device naming conflicts when guest OS is
> > > > configured to use acpi-index for naming.
> > > > Spec ialso says so:
> > > > 
> > > > PCI Firmware Specification Revision 3.2
> > > > 4.6.7.  _DSM for Naming a PCI or PCI Express Device Under Operating Systems
> > > > "
> > > > Instance number must be unique under \_SB scope. This instance number does not have to
> > > > be sequential in a given system configuration.
> > > > "
> > > > 
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > Message-Id: <20210315180102.3008391-4-imammedo@redhat.com>
> > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  hw/acpi/pcihp.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 46 insertions(+)
> > > > 
> > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > index ceab287bd3..f4cb3c979d 100644
> > > > --- a/hw/acpi/pcihp.c
> > > > +++ b/hw/acpi/pcihp.c
> > > > @@ -52,6 +52,21 @@ typedef struct AcpiPciHpFind {
> > > >      PCIBus *bus;
> > > >  } AcpiPciHpFind;
> > > >  
> > > > +static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpointer user_data)
> > > > +{
> > > > +    return a - b;
> > > > +}
> > > > +
> > > > +static GSequence *pci_acpi_index_list(void)
> > > > +{
> > > > +    static GSequence *used_acpi_index_list;
> > > > +
> > > > +    if (!used_acpi_index_list) {
> > > > +        used_acpi_index_list = g_sequence_new(NULL);
> > > > +    }
> > > > +    return used_acpi_index_list;
> > > > +}
> > > > +
> > > >  static int acpi_pcihp_get_bsel(PCIBus *bus)
> > > >  {
> > > >      Error *local_err = NULL;
> > > > @@ -277,6 +292,23 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> > > >                     ONBOARD_INDEX_MAX);
> > > >          return;
> > > >      }
> > > > +
> > > > +    /*
> > > > +     * make sure that acpi-index is unique across all present PCI devices
> > > > +     */
> > > > +    if (pdev->acpi_index) {
> > > > +        GSequence *used_indexes = pci_acpi_index_list();
> > > > +
> > > > +        if (g_sequence_lookup(used_indexes, GINT_TO_POINTER(pdev->acpi_index),
> > > > +                              g_cmp_uint32, NULL)) {
> > > > +            error_setg(errp, "a PCI device with acpi-index = %" PRIu32
> > > > +                       " already exist", pdev->acpi_index);
> > > > +            return;
> > > > +        }
> > > > +        g_sequence_insert_sorted(used_indexes,
> > > > +                                 GINT_TO_POINTER(pdev->acpi_index),
> > > > +                                 g_cmp_uint32, NULL);
> > > > +    }  
> > > 
> > > This doesn't appear to ensure uniqueness when using PCIe topologies:
> > > 
> > > $ ./build/x86_64-softmmu/qemu-system-x86_64 \
> > >      -device virtio-net,acpi-index=100 \
> > >      -device virtio-net,acpi-index=100
> > > qemu-system-x86_64: -device virtio-net,acpi-index=100: a PCI device with acpi-index = 100 already exist
> > > 
> > > $ ./build/x86_64-softmmu/qemu-system-x86_64 \
> > >      -M q35 \
> > >      -device virtio-net,acpi-index=100
> > >      -device virtio-net,acpi-index=100
> > > ....happily running....  
> > 
> > In fact the entire concept doesn't appear to work with Q35 at all as
> > implemented.
> > 
> > The 'acpi_index' file in the guest OS never gets created and the NICs
> > are still called 'eth0', 'eth1'
> > 
> > Only with i440fx can I can the "enoNNN" based naming to work with
> > acpi-index set from QEMU
> 
> It is not supported on Q35 yet as it depends on ACPI PCI hotplug infrastructure.
> Once Julia is done with porting it to Q35, acpi-index will be pulled along with it.

Will the PCI hotplug support work in the same way

Looking at this doc I see two options:

  https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/

 1. Names incorporating Firmware/BIOS provided index numbers for on-board devices (example: eno1)
 2. Names incorporating Firmware/BIOS provided PCI Express hotplug slot index numbers (example: ens1) 

Is the stuff Julia is implementing for Q35 going to end up
triggering scenario (1) still, or will it trigger scenario two
which mentions "hotplug slot index" as a distinct concept from
the ACPI index we're setting for i440fx ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


