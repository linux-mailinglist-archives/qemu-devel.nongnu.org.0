Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1868212CCB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 21:09:19 +0200 (CEST)
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr4aF-0002CM-0p
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 15:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jr4ZL-00019L-P7
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 15:08:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59565
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jr4ZJ-0001vE-71
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 15:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593716899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YuSa6A609nCROWP7gC5jQIgxvOmH9Y437gf1RGlTqlE=;
 b=cV5NA5UZJurdJoCEtA/Vq922B8vqA0msD7ea6V22cGtGaXAvgLU3PNjXNGZKBbnszGwrXu
 U90O54Eh0t84sc7kYI9Qb808GOZuki3BF9TpUIAAmgiq8jUrbu+o1v4ePD72UNgWIqzGeK
 fV5d4gof8xZ8or9JBdpruZQ9fUyM2dA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-o0rWxKUQPRqPEDkLcsJRvA-1; Thu, 02 Jul 2020 15:08:16 -0400
X-MC-Unique: o0rWxKUQPRqPEDkLcsJRvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D82D51005513;
 Thu,  2 Jul 2020 19:08:14 +0000 (UTC)
Received: from work-vm (ovpn-114-239.ams2.redhat.com [10.36.114.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D49E757DF;
 Thu,  2 Jul 2020 19:08:07 +0000 (UTC)
Date: Thu, 2 Jul 2020 20:08:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 19/21] virtio-mem: Add trace events
Message-ID: <20200702190804.GG14863@work-vm>
References: <20200626072248.78761-1-david@redhat.com>
 <20200626072248.78761-20-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626072248.78761-20-david@redhat.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> Let's add some trace events that might come in handy later.
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/virtio/trace-events | 10 ++++++++++
>  hw/virtio/virtio-mem.c | 10 +++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 6427a0047d..292fc15e29 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -74,3 +74,13 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
>  virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
>  virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
>  virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
> +
> +# virtio-mem.c
> +virtio_mem_send_response(uint16_t type) "type=%" PRIu16
> +virtio_mem_plug_request(uint64_t addr, uint16_t nb_blocks) "addr=0x%" PRIx64 " nb_blocks=%" PRIu16
> +virtio_mem_unplug_request(uint64_t addr, uint16_t nb_blocks) "addr=0x%" PRIx64 " nb_blocks=%" PRIu16
> +virtio_mem_unplugged_all(void) ""
> +virtio_mem_unplug_all_request(void) ""
> +virtio_mem_resized_usable_region(uint64_t old_size, uint64_t new_size) "old_size=0x%" PRIx64 "new_size=0x%" PRIx64
> +virtio_mem_state_request(uint64_t addr, uint16_t nb_blocks) "addr=0x%" PRIx64 " nb_blocks=%" PRIu16
> +virtio_mem_state_response(uint16_t state) "state=%" PRIu16
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 6ed5409669..fdd4dbb42c 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -30,6 +30,7 @@
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
>  #include "config-devices.h"
> +#include "trace.h"
>  
>  /*
>   * Use QEMU_VMALLOC_ALIGN, so no THP will have to be split when unplugging
> @@ -100,6 +101,7 @@ static void virtio_mem_send_response(VirtIOMEM *vmem, VirtQueueElement *elem,
>      VirtIODevice *vdev = VIRTIO_DEVICE(vmem);
>      VirtQueue *vq = vmem->vq;
>  
> +    trace_virtio_mem_send_response(le16_to_cpu(resp->type));
>      iov_from_buf(elem->in_sg, elem->in_num, 0, resp, sizeof(*resp));
>  
>      virtqueue_push(vq, elem, sizeof(*resp));
> @@ -195,6 +197,7 @@ static void virtio_mem_plug_request(VirtIOMEM *vmem, VirtQueueElement *elem,
>      const uint16_t nb_blocks = le16_to_cpu(req->u.plug.nb_blocks);
>      uint16_t type;
>  
> +    trace_virtio_mem_plug_request(gpa, nb_blocks);
>      type = virtio_mem_state_change_request(vmem, gpa, nb_blocks, true);
>      virtio_mem_send_response_simple(vmem, elem, type);
>  }
> @@ -206,6 +209,7 @@ static void virtio_mem_unplug_request(VirtIOMEM *vmem, VirtQueueElement *elem,
>      const uint16_t nb_blocks = le16_to_cpu(req->u.unplug.nb_blocks);
>      uint16_t type;
>  
> +    trace_virtio_mem_unplug_request(gpa, nb_blocks);
>      type = virtio_mem_state_change_request(vmem, gpa, nb_blocks, false);
>      virtio_mem_send_response_simple(vmem, elem, type);
>  }
> @@ -225,6 +229,7 @@ static void virtio_mem_resize_usable_region(VirtIOMEM *vmem,
>          return;
>      }
>  
> +    trace_virtio_mem_resized_usable_region(vmem->usable_region_size, newsize);
>      vmem->usable_region_size = newsize;
>  }
>  
> @@ -247,7 +252,7 @@ static int virtio_mem_unplug_all(VirtIOMEM *vmem)
>          vmem->size = 0;
>          notifier_list_notify(&vmem->size_change_notifiers, &vmem->size);
>      }
> -
> +    trace_virtio_mem_unplugged_all();
>      virtio_mem_resize_usable_region(vmem, vmem->requested_size, true);
>      return 0;
>  }
> @@ -255,6 +260,7 @@ static int virtio_mem_unplug_all(VirtIOMEM *vmem)
>  static void virtio_mem_unplug_all_request(VirtIOMEM *vmem,
>                                            VirtQueueElement *elem)
>  {
> +    trace_virtio_mem_unplug_all_request();
>      if (virtio_mem_unplug_all(vmem)) {
>          virtio_mem_send_response_simple(vmem, elem, VIRTIO_MEM_RESP_BUSY);
>      } else {
> @@ -272,6 +278,7 @@ static void virtio_mem_state_request(VirtIOMEM *vmem, VirtQueueElement *elem,
>          .type = cpu_to_le16(VIRTIO_MEM_RESP_ACK),
>      };
>  
> +    trace_virtio_mem_state_request(gpa, nb_blocks);
>      if (!virtio_mem_valid_range(vmem, gpa, size)) {
>          virtio_mem_send_response_simple(vmem, elem, VIRTIO_MEM_RESP_ERROR);
>          return;
> @@ -284,6 +291,7 @@ static void virtio_mem_state_request(VirtIOMEM *vmem, VirtQueueElement *elem,
>      } else {
>          resp.u.state.state = cpu_to_le16(VIRTIO_MEM_STATE_MIXED);
>      }
> +    trace_virtio_mem_state_response(le16_to_cpu(resp.u.state.state));
>      virtio_mem_send_response(vmem, elem, &resp);
>  }
>  
> -- 
> 2.26.2
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


