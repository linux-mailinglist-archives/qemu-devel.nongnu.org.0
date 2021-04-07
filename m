Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31C356D4C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:28:51 +0200 (CEST)
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8Ek-0001Jv-AO
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lU8Du-0000kP-PY
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lU8Ds-0000vh-3R
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617802072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZNWbI9fC0FjafKF2ydEJ83d2gErccYJQi3MSyoFf30=;
 b=e+2GcMgW1TttUu3mxt7VWHRU41KCVNrjUDu3J2gmQiC4GXjKVH41C5s79cXdA40BydnuZk
 eYBlCzfZ7jHEd9+WYcX1aYik4QD15Cr59jC1U66WhhDzvIrYYtvv0ZtgxQtJJ8L/67YIwa
 L7e7PDLV1Ja+HdfiNUhIq00AC6CT7+s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-esussP3RNQS_w1JnaMzH8A-1; Wed, 07 Apr 2021 09:27:50 -0400
X-MC-Unique: esussP3RNQS_w1JnaMzH8A-1
Received: by mail-wr1-f71.google.com with SMTP id x18so123938wrt.12
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 06:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NZNWbI9fC0FjafKF2ydEJ83d2gErccYJQi3MSyoFf30=;
 b=Tvq76r1Pzze+7ftl9G1xGs/Ube3e3ID4gc2vjTj0HNa8di4/tJAp+QMKChzZLdKCo+
 f6GAkYgXhj3sp+BGPXoGT6y+SwuVsDppBMs4ij0H2SKbn3M0E4pT2hQxLVx9OytCkm9p
 JgCZlMrqsnhWv7xPQj7hZpKIpvM/MhfMtA8VmMzYaTo2dtud5IRoru7wWfBmN1qm/38z
 Xhswr8f6Rt6CC64bs2oNJ16oU9VOnzAdCFuKkdUqWWzZ4kiCasL9WKm5I5HZg/cNmA2G
 2yRxnMvRz2EC0Xm3zlmFWTss8sUN8YW5H+EmYBl4sMjpEXteKOu2tEF4JFnvApiwQXmV
 zrOw==
X-Gm-Message-State: AOAM530vn04u8NmR1w1OJBoaE6Yy/Ekmfa29ks9EH6k9Yp71pPjYEAkM
 0Jn5mVK4Y4fjJw7M1K1J9o0bGCD5Ybr0BqAKsZhdOf5CxrtdpCa59sfO9I+Ms25Z5lJpVEaAKD4
 F6VwrvJ2nVmKer0Q=
X-Received: by 2002:a05:600c:2310:: with SMTP id
 16mr2231215wmo.28.1617802068286; 
 Wed, 07 Apr 2021 06:27:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHU06erjdPRTnkXN12wn3HU8w1UT8ZCuYUvwnDYBIlfbjP2QkQRG2KGR2C7PtQxx1vdyaNKA==
X-Received: by 2002:a05:600c:2310:: with SMTP id
 16mr2231203wmo.28.1617802068123; 
 Wed, 07 Apr 2021 06:27:48 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id o8sm9004158wrv.49.2021.04.07.06.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 06:27:46 -0700 (PDT)
Date: Wed, 7 Apr 2021 09:27:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PULL v2 11/19] pci: acpi: ensure that acpi-index is unique
Message-ID: <20210407092606-mutt-send-email-mst@kernel.org>
References: <20210322225907.541943-1-mst@redhat.com>
 <20210322225907.541943-12-mst@redhat.com>
 <YGx2IFN3mJisOR1w@redhat.com> <YGx5LRiqkKRmO4aJ@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YGx5LRiqkKRmO4aJ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 04:07:25PM +0100, Daniel P. Berrangé wrote:
> On Tue, Apr 06, 2021 at 03:54:24PM +0100, Daniel P. Berrangé wrote:
> > On Mon, Mar 22, 2021 at 07:00:18PM -0400, Michael S. Tsirkin wrote:
> > > From: Igor Mammedov <imammedo@redhat.com>
> > > 
> > > it helps to avoid device naming conflicts when guest OS is
> > > configured to use acpi-index for naming.
> > > Spec ialso says so:
> > > 
> > > PCI Firmware Specification Revision 3.2
> > > 4.6.7.  _DSM for Naming a PCI or PCI Express Device Under Operating Systems
> > > "
> > > Instance number must be unique under \_SB scope. This instance number does not have to
> > > be sequential in a given system configuration.
> > > "
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Message-Id: <20210315180102.3008391-4-imammedo@redhat.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  hw/acpi/pcihp.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 46 insertions(+)
> > > 
> > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > index ceab287bd3..f4cb3c979d 100644
> > > --- a/hw/acpi/pcihp.c
> > > +++ b/hw/acpi/pcihp.c
> > > @@ -52,6 +52,21 @@ typedef struct AcpiPciHpFind {
> > >      PCIBus *bus;
> > >  } AcpiPciHpFind;
> > >  
> > > +static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpointer user_data)
> > > +{
> > > +    return a - b;
> > > +}
> > > +
> > > +static GSequence *pci_acpi_index_list(void)
> > > +{
> > > +    static GSequence *used_acpi_index_list;
> > > +
> > > +    if (!used_acpi_index_list) {
> > > +        used_acpi_index_list = g_sequence_new(NULL);
> > > +    }
> > > +    return used_acpi_index_list;
> > > +}
> > > +
> > >  static int acpi_pcihp_get_bsel(PCIBus *bus)
> > >  {
> > >      Error *local_err = NULL;
> > > @@ -277,6 +292,23 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> > >                     ONBOARD_INDEX_MAX);
> > >          return;
> > >      }
> > > +
> > > +    /*
> > > +     * make sure that acpi-index is unique across all present PCI devices
> > > +     */
> > > +    if (pdev->acpi_index) {
> > > +        GSequence *used_indexes = pci_acpi_index_list();
> > > +
> > > +        if (g_sequence_lookup(used_indexes, GINT_TO_POINTER(pdev->acpi_index),
> > > +                              g_cmp_uint32, NULL)) {
> > > +            error_setg(errp, "a PCI device with acpi-index = %" PRIu32
> > > +                       " already exist", pdev->acpi_index);
> > > +            return;
> > > +        }
> > > +        g_sequence_insert_sorted(used_indexes,
> > > +                                 GINT_TO_POINTER(pdev->acpi_index),
> > > +                                 g_cmp_uint32, NULL);
> > > +    }
> > 
> > This doesn't appear to ensure uniqueness when using PCIe topologies:
> > 
> > $ ./build/x86_64-softmmu/qemu-system-x86_64 \
> >      -device virtio-net,acpi-index=100 \
> >      -device virtio-net,acpi-index=100
> > qemu-system-x86_64: -device virtio-net,acpi-index=100: a PCI device with acpi-index = 100 already exist
> > 
> > $ ./build/x86_64-softmmu/qemu-system-x86_64 \
> >      -M q35 \
> >      -device virtio-net,acpi-index=100
> >      -device virtio-net,acpi-index=100
> > ....happily running....
> 
> In fact the entire concept doesn't appear to work with Q35 at all as
> implemented.
> 
> The 'acpi_index' file in the guest OS never gets created and the NICs
> are still called 'eth0', 'eth1'
> 
> Only with i440fx can I can the "enoNNN" based naming to work with
> acpi-index set from QEMU

Good point, this I think is due to the fact that q35 does not
have ACPI description of PCI devices ATM.
It would be nice if this aborted instead of failing silently.
Similar for hotplug.

Igor?


> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


