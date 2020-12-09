Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53CB2D4B22
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:59:42 +0100 (CET)
Received: from localhost ([::1]:51690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5cj-0008BQ-V3
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kn4w4-00019v-06
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:15:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kn4w1-0003em-9A
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607541330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EV42uk9zXU0mS3m5+2kmPbekn011LQfdSjD/Evueflc=;
 b=Cu5DqWEm8fVSB/wSbsdYTfLCNPofrJ7l1atqheghrNhTX6Zw8SD2ajdU5aPkyoOzPYJxj7
 zI4/OTNXU8ioNN1TlaSYdsvKpygFYkCn0KT3FsOZ72TEDfsO5+bbNzB9xHVsfFRcG6Xxww
 K+nKUiN/6jFEL5oLYir3E16N2seNn68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-M6J2S3W0PIC4OR3vEO4GMA-1; Wed, 09 Dec 2020 14:15:28 -0500
X-MC-Unique: M6J2S3W0PIC4OR3vEO4GMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F809102C7CF;
 Wed,  9 Dec 2020 19:15:27 +0000 (UTC)
Received: from [10.36.113.30] (ovpn-113-30.ams2.redhat.com [10.36.113.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC38D163CC;
 Wed,  9 Dec 2020 19:15:06 +0000 (UTC)
Subject: Re: [PATCH] virtio-pmem: add trace events
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, mst@redhat.com
References: <20201117115705.32195-1-pankaj.gupta.linux@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <37d62ca6-2f2b-d8c5-5700-9324c41ee812@redhat.com>
Date: Wed, 9 Dec 2020 20:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117115705.32195-1-pankaj.gupta.linux@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.11.20 12:57, Pankaj Gupta wrote:
> This patch adds trace events for virtio-pmem functionality.
> Adding trace events for virtio pmem request, reponse and host
> side fsync functionality.
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> ---
>  hw/virtio/trace-events  | 5 +++++
>  hw/virtio/virtio-pmem.c | 4 ++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 2060a144a2..c62727f879 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -122,3 +122,8 @@ virtio_mem_unplug_all_request(void) ""
>  virtio_mem_resized_usable_region(uint64_t old_size, uint64_t new_size) "old_size=0x%" PRIx64 "new_size=0x%" PRIx64
>  virtio_mem_state_request(uint64_t addr, uint16_t nb_blocks) "addr=0x%" PRIx64 " nb_blocks=%" PRIu16
>  virtio_mem_state_response(uint16_t state) "state=%" PRIu16
> +
> +# virtio-pmem.c
> +virtio_pmem_flush_request(void) "flush request"
> +virtio_pmem_response(void) "flush response"
> +virtio_pmem_flush_done(int type) "fsync return=%d"
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index ddb0125901..d83e973bf2 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -24,6 +24,7 @@
>  #include "sysemu/hostmem.h"
>  #include "block/aio.h"
>  #include "block/thread-pool.h"
> +#include "trace.h"
>  
>  typedef struct VirtIODeviceRequest {
>      VirtQueueElement elem;
> @@ -41,6 +42,7 @@ static int worker_cb(void *opaque)
>  
>      /* flush raw backing image */
>      err = fsync(req_data->fd);
> +    trace_virtio_pmem_flush_done(err);
>      if (err != 0) {
>          err = 1;
>      }
> @@ -59,6 +61,7 @@ static void done_cb(void *opaque, int ret)
>      /* Callbacks are serialized, so no need to use atomic ops. */
>      virtqueue_push(req_data->pmem->rq_vq, &req_data->elem, len);
>      virtio_notify((VirtIODevice *)req_data->pmem, req_data->pmem->rq_vq);
> +    trace_virtio_pmem_response();
>      g_free(req_data);
>  }
>  
> @@ -69,6 +72,7 @@ static void virtio_pmem_flush(VirtIODevice *vdev, VirtQueue *vq)
>      HostMemoryBackend *backend = MEMORY_BACKEND(pmem->memdev);
>      ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
>  
> +    trace_virtio_pmem_flush_request();
>      req_data = virtqueue_pop(vq, sizeof(VirtIODeviceRequest));
>      if (!req_data) {
>          virtio_error(vdev, "virtio-pmem missing request data");
> 

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


