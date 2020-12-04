Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E32CE964
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 09:19:56 +0100 (CET)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl6Jn-0003J8-8o
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 03:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kl6HR-0001rn-Om
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 03:17:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kl6HP-00008s-H2
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 03:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607069845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMu6Ts4aXegHwTfI5K4+wIFUI7ZOjwyzufO+hy2X5v0=;
 b=YnE3+xYG2mHFEwTW+IrbbBnvl27BNZMHd1FeNUr4xniLrUm83QtjlESz2RvH+74yL/sU4Z
 lYgibThqwDOAi1hzhBFjOxkS7eGnMulbzFmcG3U/+uIH3Ekt0zo9myXnE7yWHk2UuIATYd
 4A2sF2LkrB60SOQ1zOcIBr8IBCVQT40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-PkCGHXBdOoW3IS7HMSFR1g-1; Fri, 04 Dec 2020 03:17:21 -0500
X-MC-Unique: PkCGHXBdOoW3IS7HMSFR1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3581800D53;
 Fri,  4 Dec 2020 08:17:19 +0000 (UTC)
Received: from gondolin (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 700395C1CF;
 Fri,  4 Dec 2020 08:17:09 +0000 (UTC)
Date: Fri, 4 Dec 2020 09:17:06 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [for-6.0 v5 12/13] securable guest memory: Alter virtio default
 properties for protected guests
Message-ID: <20201204091706.4432dc1e.cohuck@redhat.com>
In-Reply-To: <d739cae2-9197-76a5-1c19-057bfe832187@de.ibm.com>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-13-david@gibson.dropbear.id.au>
 <d739cae2-9197-76a5-1c19-057bfe832187@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, dgilbert@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 berrange@redhat.com, thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Dec 2020 09:10:36 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 04.12.20 06:44, David Gibson wrote:
> > The default behaviour for virtio devices is not to use the platforms normal
> > DMA paths, but instead to use the fact that it's running in a hypervisor
> > to directly access guest memory.  That doesn't work if the guest's memory
> > is protected from hypervisor access, such as with AMD's SEV or POWER's PEF.
> > 
> > So, if a securable guest memory mechanism is enabled, then apply the
> > iommu_platform=on option so it will go through normal DMA mechanisms.
> > Those will presumably have some way of marking memory as shared with
> > the hypervisor or hardware so that DMA will work.
> > 
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  hw/core/machine.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index a67a27d03c..d16273d75d 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -28,6 +28,8 @@
> >  #include "hw/mem/nvdimm.h"
> >  #include "migration/vmstate.h"
> >  #include "exec/securable-guest-memory.h"
> > +#include "hw/virtio/virtio.h"
> > +#include "hw/virtio/virtio-pci.h"
> >  
> >  GlobalProperty hw_compat_5_1[] = {
> >      { "vhost-scsi", "num_queues", "1"},
> > @@ -1169,6 +1171,17 @@ void machine_run_board_init(MachineState *machine)
> >           * areas.
> >           */
> >          machine_set_mem_merge(OBJECT(machine), false, &error_abort);
> > +
> > +        /*
> > +         * Virtio devices can't count on directly accessing guest
> > +         * memory, so they need iommu_platform=on to use normal DMA
> > +         * mechanisms.  That requires also disabling legacy virtio
> > +         * support for those virtio pci devices which allow it.
> > +         */
> > +        object_register_sugar_prop(TYPE_VIRTIO_PCI, "disable-legacy",
> > +                                   "on", true);
> > +        object_register_sugar_prop(TYPE_VIRTIO_DEVICE, "iommu_platform",
> > +                                   "on", false);  
> 
> I have not followed all the history (sorry). Should we also set iommu_platform
> for virtio-ccw? Halil?
> 

That line should add iommu_platform for all virtio devices, shouldn't
it?


