Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48622F15D3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:47:01 +0100 (CET)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxX9-000421-GK
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kyxTs-0002WJ-Qm
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:43:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kyxTo-0007zz-Kb
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610372611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtmN6T1PPNAKcaY6NnZ0I4OaAoM1CJeYxmgkJnnrdL0=;
 b=IvTH1E+9kwGPBaQKm32GQbrnzNkuDO876NtC3PvBVtFzZFJa5mciVdFIrXZ1CRGRY1sxpe
 ivpdYMn55J9w4xmgrRb1b/Z2trLZQLIX3UQ/C3OW9/+QVyla7y/T1L/Mc6Z9xcvwizxB4K
 +JJldeOnMSyYypGxUHcAVSJ5sBJ4WJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-dimQTSuOO9CjZJcO1ISnLw-1; Mon, 11 Jan 2021 08:43:27 -0500
X-MC-Unique: dimQTSuOO9CjZJcO1ISnLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 927B2835DED;
 Mon, 11 Jan 2021 13:43:26 +0000 (UTC)
Received: from gondolin (ovpn-112-169.ams2.redhat.com [10.36.112.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACDDD5D9F4;
 Mon, 11 Jan 2021 13:43:24 +0000 (UTC)
Date: Mon, 11 Jan 2021 14:43:22 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 2/3] Update linux headers to 5.11-rc2
Message-ID: <20210111144322.32812f16.cohuck@redhat.com>
In-Reply-To: <20210111075950-mutt-send-email-mst@kernel.org>
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-3-farman@linux.ibm.com>
 <20210111135404.52f18200.cohuck@redhat.com>
 <20210111075950-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 08:00:45 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Jan 11, 2021 at 01:54:04PM +0100, Cornelia Huck wrote:
> > On Mon,  4 Jan 2021 21:20:56 +0100
> > Eric Farman <farman@linux.ibm.com> wrote:
> >   
> > > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > > ---
> > >  .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-
> > >  .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |   2 +-
> > >  include/standard-headers/drm/drm_fourcc.h     | 175 +++++++++++++++++-
> > >  include/standard-headers/linux/const.h        |  36 ++++
> > >  include/standard-headers/linux/ethtool.h      |   2 +-
> > >  include/standard-headers/linux/fuse.h         |  30 ++-
> > >  include/standard-headers/linux/kernel.h       |   9 +-
> > >  include/standard-headers/linux/pci_regs.h     |  16 ++
> > >  include/standard-headers/linux/vhost_types.h  |   9 +
> > >  include/standard-headers/linux/virtio_gpu.h   |  82 ++++++++
> > >  include/standard-headers/linux/virtio_ids.h   |  44 +++--
> > >  linux-headers/asm-arm64/kvm.h                 |   3 -
> > >  linux-headers/asm-generic/unistd.h            |   6 +-
> > >  linux-headers/asm-mips/unistd_n32.h           |   1 +
> > >  linux-headers/asm-mips/unistd_n64.h           |   1 +
> > >  linux-headers/asm-mips/unistd_o32.h           |   1 +
> > >  linux-headers/asm-powerpc/unistd_32.h         |   1 +
> > >  linux-headers/asm-powerpc/unistd_64.h         |   1 +
> > >  linux-headers/asm-s390/unistd_32.h            |   1 +
> > >  linux-headers/asm-s390/unistd_64.h            |   1 +
> > >  linux-headers/asm-x86/kvm.h                   |   1 +
> > >  linux-headers/asm-x86/unistd_32.h             |   1 +
> > >  linux-headers/asm-x86/unistd_64.h             |   1 +
> > >  linux-headers/asm-x86/unistd_x32.h            |   1 +
> > >  linux-headers/linux/kvm.h                     |  56 +++++-
> > >  linux-headers/linux/userfaultfd.h             |   9 +
> > >  linux-headers/linux/vfio.h                    |   1 +
> > >  linux-headers/linux/vhost.h                   |   4 +
> > >  28 files changed, 461 insertions(+), 48 deletions(-)
> > >  create mode 100644 include/standard-headers/linux/const.h
> > > 
> > > diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > > index 7b4062a1a1..acd4c8346d 100644
> > > --- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > > +++ b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > > @@ -68,7 +68,7 @@ static inline int pvrdma_idx_valid(uint32_t idx, uint32_t max_elems)
> > >  
> > >  static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
> > >  {
> > > -	const unsigned int idx = qatomic_read(var);
> > > +	const unsigned int idx = atomic_read(var);  
> > 
> > Hm, what was the state of these qatomic* instances in this header? Is
> > it ok to rename them, or do we need to do some munging in the import
> > script?
> > 
> > (Sorry, it's been a while.)  
> 
> 
> Yea looks like it was done manually last time:
> 
> commit d73415a315471ac0b127ed3fad45c8ec5d711de1
> Author: Stefan Hajnoczi <stefanha@redhat.com>
> Date:   Wed Sep 23 11:56:46 2020 +0100
> 
>     qemu/atomic.h: rename atomic_ to qatomic_

It seems that this hunk was dropped manually last time:

commit 53ba2eee52bff5a746e96835539a1079f6bcadd1
Author: Matthew Rosato <mjrosato@linux.ibm.com>
Date:   Mon Oct 26 11:34:30 2020 -0400

    linux-headers: update against 5.10-rc1
    
    commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec
    
    Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
    [aw: drop pvrdma_ring.h changes to avoid revert of d73415a31547 ("qemu/atomic.h: rename atomic_ to qatomic_")]
    Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

I can do that as well, but I'm not sure that this is the best way
forward.

> 
> 
> 
> > >  
> > >  	if (pvrdma_idx_valid(idx, max_elems))
> > >  		return idx & (max_elems - 1);
> > > @@ -77,17 +77,17 @@ static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
> > >  
> > >  static inline void pvrdma_idx_ring_inc(int *var, uint32_t max_elems)
> > >  {
> > > -	uint32_t idx = qatomic_read(var) + 1;	/* Increment. */
> > > +	uint32_t idx = atomic_read(var) + 1;	/* Increment. */
> > >  
> > >  	idx &= (max_elems << 1) - 1;		/* Modulo size, flip gen. */
> > > -	qatomic_set(var, idx);
> > > +	atomic_set(var, idx);
> > >  }
> > >  
> > >  static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring *r,
> > >  					      uint32_t max_elems, uint32_t *out_tail)
> > >  {
> > > -	const uint32_t tail = qatomic_read(&r->prod_tail);
> > > -	const uint32_t head = qatomic_read(&r->cons_head);
> > > +	const uint32_t tail = atomic_read(&r->prod_tail);
> > > +	const uint32_t head = atomic_read(&r->cons_head);
> > >  
> > >  	if (pvrdma_idx_valid(tail, max_elems) &&
> > >  	    pvrdma_idx_valid(head, max_elems)) {
> > > @@ -100,8 +100,8 @@ static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring *r,
> > >  static inline int32_t pvrdma_idx_ring_has_data(const struct pvrdma_ring *r,
> > >  					     uint32_t max_elems, uint32_t *out_head)
> > >  {
> > > -	const uint32_t tail = qatomic_read(&r->prod_tail);
> > > -	const uint32_t head = qatomic_read(&r->cons_head);
> > > +	const uint32_t tail = atomic_read(&r->prod_tail);
> > > +	const uint32_t head = atomic_read(&r->cons_head);
> > >  
> > >  	if (pvrdma_idx_valid(tail, max_elems) &&
> > >  	    pvrdma_idx_valid(head, max_elems)) {  
> 


