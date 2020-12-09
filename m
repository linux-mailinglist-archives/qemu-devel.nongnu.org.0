Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08542D484F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:52:30 +0100 (CET)
Received: from localhost ([::1]:39574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3dd-0002ir-LG
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn3b3-0000t3-Aa
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:49:49 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:38360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn3ay-0001nJ-3K
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:49:48 -0500
Received: by mail-il1-x143.google.com with SMTP id v3so2389195ilo.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dPFLr7NQpcFoub5bv6rBiHyT+fmrV7vi5FL4kEc2c9k=;
 b=FrruIZ0HrUHjwgK+HW9l2Qh/5h5AA2zCHkCkc/7S0abAA5iSYBdM7p55HyxseBwZsX
 Cse2IWjFXcURMkk4Pglr3WYOimRa+Ra1PnhYsOG090szI3tBYwyl4ZNOpAteoJUKtCrJ
 6OXt1ZvT3ChyRCcV0OU4cnkYgWt8NIBCitPawIdEf3JZgstDt+Cx7k4VyBKinV8YXXwf
 CQId34q2fafz1Eg0LrSc+M7zNv8mkRxz0qG07hTcyoYjaObYjhzZ6DsVPsvk0ma8haau
 cc/k9LCkdqPsUQO2WIfeZpuMqGfYGw6vHVK1SLEWkJgSyzKuP1A86sNd14SjlCgMWVhq
 Kbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dPFLr7NQpcFoub5bv6rBiHyT+fmrV7vi5FL4kEc2c9k=;
 b=UvqJDS3DoyWRtX80fL1EOmz/yqgmosV3d22hmum4V6kxh+mxhDF3CQyA8BTMvsZjaV
 Nag+TyLJ53JrH2eLvnuwAyohESr3cg8EzWKQvHiptoEC5F149ynZio27rGmYuRR/rIyx
 3K5fOaF3GhvCS5cPKVIvPNoEUie1Rff2nbd4/RQDIqFhGg+iWC8fCfabZd75J0TLSJZI
 LZopvLeGIX6pd7cFYrepiT2T/b9PyReqbcTwg3rO1cyPWMor+HlhmndP30sTlJakwi7t
 Te+YpX1W3HChVphyLGwbdkFnskrBEg/ESfkbfU2Lu3eDKTyAJQPk4xbx5eM4OFNSAjUX
 251g==
X-Gm-Message-State: AOAM530C5lc8y4AyzMa+CTzOoeMkMKwrJJrkZpaVsX589tG4lGnWcpRs
 BOpSSTL4hQXRT09uuzVvoFcStQdv2qOTPrYxYuM=
X-Google-Smtp-Source: ABdhPJxPHiXdUIMHV/Owmz5ur0AJ+xvBDqESqmc0vCbkwFyVrE3uIstpvxbMXedBqc5kiySRUaXgs/TQXJtHuMvXcQw=
X-Received: by 2002:a05:6e02:8d:: with SMTP id
 l13mr4355922ilm.163.1607536183041; 
 Wed, 09 Dec 2020 09:49:43 -0800 (PST)
MIME-Version: 1.0
References: <20201117115705.32195-1-pankaj.gupta.linux@gmail.com>
In-Reply-To: <20201117115705.32195-1-pankaj.gupta.linux@gmail.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 9 Dec 2020 18:49:32 +0100
Message-ID: <CAM9Jb+h-obbnKMvwJLuks1rmeodSz8x_6gcBhs7CKPLD7P-j0w@mail.gmail.com>
Subject: Re: [PATCH] virtio-pmem: add trace events
To: "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x143.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Qemu Developers <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping.

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
> --
> 2.20.1
>

