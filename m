Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D41D5D73A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 21:57:10 +0200 (CEST)
Received: from localhost ([::1]:56788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiOtp-0006Pl-2z
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 15:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58899)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pagupta@redhat.com>) id 1hiMNN-0006Yh-Cp
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 13:15:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pagupta@redhat.com>) id 1hiMNG-000179-Ok
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 13:15:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55542)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1hiMNC-0000OU-Jl
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 13:15:19 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E2CF81DE1;
 Tue,  2 Jul 2019 17:14:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 904791992E;
 Tue,  2 Jul 2019 17:14:01 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70E1F3D87;
 Tue,  2 Jul 2019 17:14:00 +0000 (UTC)
Date: Tue, 2 Jul 2019 13:14:00 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <19081828.38694222.1562087640399.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190702130653-mutt-send-email-mst@kernel.org>
References: <20190619094907.10131-1-pagupta@redhat.com>
 <20190619094907.10131-5-pagupta@redhat.com>
 <20190702135519.46a9e3f2.cohuck@redhat.com>
 <20190702130653-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.116.51, 10.4.195.10]
Thread-Topic: virtio-pci: Proxy for virtio-pmem
Thread-Index: E4gUT8mtQWccN9zJgDBMzMChW0zxiw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 02 Jul 2019 17:14:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 4/7] virtio-pci: Proxy for virtio-pmem
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
Cc: kwolf@redhat.com, aarcange@redhat.com,
 xiaoguangrong eric <xiaoguangrong.eric@gmail.com>, riel@surriel.com,
 armbru@redhat.com, Cornelia Huck <cohuck@redhat.com>, david@redhat.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com, lcapitulino@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 dan j williams <dan.j.williams@intel.com>, nilal@redhat.com,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> 
> On Tue, Jul 02, 2019 at 01:55:19PM +0200, Cornelia Huck wrote:
> > On Wed, 19 Jun 2019 15:19:04 +0530
> > Pankaj Gupta <pagupta@redhat.com> wrote:
> > 
> > > We need a proxy device for virtio-pmem, and this device has to be the
> > > actual memory device so we can cleanly hotplug it.
> > > 
> > > Forward memory device class functions either to the actual device or use
> > > properties of the virtio-pmem device to implement these in the proxy.
> > > 
> > > virtio-pmem will only be compiled for selected, supported architectures
> > > (that can deal with virtio/pci devices being memory devices). An
> > > architecture that is prepared for that can simply enable
> > > CONFIG_VIRTIO_PMEM to make it work.
> > > 
> > > As not all architectures support memory devices (and CONFIG_VIRTIO_PMEM
> > > will be enabled per supported architecture), we have to move the PCI
> > > proxy
> > > to a separate file.
> > > 
> > > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> > > [ split up patches, memory-device changes, move pci proxy]
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >  hw/virtio/Makefile.objs     |   1 +
> > >  hw/virtio/virtio-pmem-pci.c | 131
> > >  ++++++++++++++++++++++++++++++++++++++++++++
> > >  hw/virtio/virtio-pmem-pci.h |  34 ++++++++++++
> > >  include/hw/pci/pci.h        |   1 +
> > >  4 files changed, 167 insertions(+)
> > >  create mode 100644 hw/virtio/virtio-pmem-pci.c
> > >  create mode 100644 hw/virtio/virtio-pmem-pci.h
> > 
> > (...)
> > 
> > > +static const VirtioPCIDeviceTypeInfo virtio_pmem_pci_info = {
> > > +    .base_name             = TYPE_VIRTIO_PMEM_PCI,
> > > +    .generic_name          = "virtio-pmem-pci",
> > > +    .transitional_name     = "virtio-pmem-pci-transitional",
> > 
> > Do we even have a transitional device for this? I.e., do we have a
> > legacy version? I don't think that makes sense for new devices.
> 
> 
> I agree - I applied so pls send a patch on top.
> Or if you end up having to respin pls include this.

Sure. Thank you!

> 
> > > +    .non_transitional_name = "virtio-pmem-pci-non-transitional",
> 
> Neither do we need a non transitional name.

o.k

Best regards,
Pankaj
> 
> > > +    .instance_size = sizeof(VirtIOPMEMPCI),
> > > +    .instance_init = virtio_pmem_pci_instance_init,
> > > +    .class_init    = virtio_pmem_pci_class_init,
> > > +    .interfaces = (InterfaceInfo[]) {
> > > +        { TYPE_MEMORY_DEVICE },
> > > +        { }
> > > +    },
> > > +};
> > 
> > (...)
> 

