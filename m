Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFA430C356
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:17:28 +0100 (CET)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xQl-0003MG-PZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1l6x5A-00019i-Hw
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:55:08 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:36095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1l6x58-0006jY-KN
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:55:08 -0500
Received: by mail-io1-xd2e.google.com with SMTP id n14so7725475iog.3
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5LuiyzmmFfKnvBQSigaRwssg2Zlo09pcSH4huzo7XvY=;
 b=hycGiYC771jiBIanjkVG0aAWO+tRwufG1Kf37t5AJsUO7qXdNeS4wgTp7yqdJ8kzqF
 kPcYHG0e3mu+y8mrOcLVilrS40AUArwTr/bnV3P/qnpIilm9tuSTweg2fIrc3q59Lbda
 OhKV7Q5C6miBot/SmOC+HO3B4ma1jqieNTOGIEFDPCcUGtYfurHWWVpfXYXvNXKMHWF/
 r7AgzLUPHPehTOnwuDeYEXxFnUyITLAwP/J4jrOvbA0m2QEpkGObQ9TRiJZL8bYXYC6g
 eO180G1Mnacq3gtNuFz3q6wFkJJObaGYlXpr1Bs/F7KAUQH0HkRA8olB2xcv9a9Od9SK
 o6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5LuiyzmmFfKnvBQSigaRwssg2Zlo09pcSH4huzo7XvY=;
 b=GKKLjXWzqSKLGZ/LeKX92ELoGY2NgDKWWlsL69f5ortalp5fPsoboW+r9JtuV4tpvk
 v8x3U7kI5XxFgn3vrql0pQ3AuwcRcAmHo2DvJLMFRZlYafjjIX5fl1xJYuJS79aHM5MZ
 DixcIH3adbsToEfDN/HUJXJB3curqoPy1seiiTnj3ivimLd3M6zDnRe4FO1uqQ3zdCOw
 y+f/Bysl/WqfOdlL+QlcyiLymdlgrSUpjCzWJTT3QbAVnwZanI/w8fIRx/6WEQjhzuyB
 AVuyP0Iq+d5x++f+G7BsE1fS4TS/oJ/GAQq4zrxUNxrRrYNLykk3/XZkv8S6YWcS63r4
 wntA==
X-Gm-Message-State: AOAM532QoPQygLg6gyPnAD0zG8+pspMZiKyYXIawqwY6hSQ154CJObUZ
 CyEhiEqBfJVU/wVtgxf0ukgnAVOtfOxvy+as8T8=
X-Google-Smtp-Source: ABdhPJzJAMhEV3GRv69SsqfvJrUioWRAH/7CfGT7pPs7lS6Gsqk5IahaOl0ZTHg/K0t2zxo0i0EvKz8Ty6xGMjvQDLA=
X-Received: by 2002:a05:6638:22c5:: with SMTP id
 j5mr20759082jat.89.1612277704861; 
 Tue, 02 Feb 2021 06:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20201117115705.32195-1-pankaj.gupta.linux@gmail.com>
 <37d62ca6-2f2b-d8c5-5700-9324c41ee812@redhat.com>
In-Reply-To: <37d62ca6-2f2b-d8c5-5700-9324c41ee812@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 2 Feb 2021 15:54:53 +0100
Message-ID: <CAM9Jb+iVygWHanWDVacH4CswjsqTuHLWU+X30V_kUNGTv6+Pag@mail.gmail.com>
Subject: Re: [PATCH] virtio-pmem: add trace events
To: "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd2e.google.com
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

Ping

@M

On Wed, 9 Dec 2020 at 20:15, David Hildenbrand <david@redhat.com> wrote:
>
> On 17.11.20 12:57, Pankaj Gupta wrote:
> > This patch adds trace events for virtio-pmem functionality.
> > Adding trace events for virtio pmem request, reponse and host
> > side fsync functionality.
> >
> > Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> > ---
> >  hw/virtio/trace-events  | 5 +++++
> >  hw/virtio/virtio-pmem.c | 4 ++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 2060a144a2..c62727f879 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -122,3 +122,8 @@ virtio_mem_unplug_all_request(void) ""
> >  virtio_mem_resized_usable_region(uint64_t old_size, uint64_t new_size) "old_size=0x%" PRIx64 "new_size=0x%" PRIx64
> >  virtio_mem_state_request(uint64_t addr, uint16_t nb_blocks) "addr=0x%" PRIx64 " nb_blocks=%" PRIu16
> >  virtio_mem_state_response(uint16_t state) "state=%" PRIu16
> > +
> > +# virtio-pmem.c
> > +virtio_pmem_flush_request(void) "flush request"
> > +virtio_pmem_response(void) "flush response"
> > +virtio_pmem_flush_done(int type) "fsync return=%d"
> > diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> > index ddb0125901..d83e973bf2 100644
> > --- a/hw/virtio/virtio-pmem.c
> > +++ b/hw/virtio/virtio-pmem.c
> > @@ -24,6 +24,7 @@
> >  #include "sysemu/hostmem.h"
> >  #include "block/aio.h"
> >  #include "block/thread-pool.h"
> > +#include "trace.h"
> >
> >  typedef struct VirtIODeviceRequest {
> >      VirtQueueElement elem;
> > @@ -41,6 +42,7 @@ static int worker_cb(void *opaque)
> >
> >      /* flush raw backing image */
> >      err = fsync(req_data->fd);
> > +    trace_virtio_pmem_flush_done(err);
> >      if (err != 0) {
> >          err = 1;
> >      }
> > @@ -59,6 +61,7 @@ static void done_cb(void *opaque, int ret)
> >      /* Callbacks are serialized, so no need to use atomic ops. */
> >      virtqueue_push(req_data->pmem->rq_vq, &req_data->elem, len);
> >      virtio_notify((VirtIODevice *)req_data->pmem, req_data->pmem->rq_vq);
> > +    trace_virtio_pmem_response();
> >      g_free(req_data);
> >  }
> >
> > @@ -69,6 +72,7 @@ static void virtio_pmem_flush(VirtIODevice *vdev, VirtQueue *vq)
> >      HostMemoryBackend *backend = MEMORY_BACKEND(pmem->memdev);
> >      ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
> >
> > +    trace_virtio_pmem_flush_request();
> >      req_data = virtqueue_pop(vq, sizeof(VirtIODeviceRequest));
> >      if (!req_data) {
> >          virtio_error(vdev, "virtio-pmem missing request data");
> >
>
> LGTM
>
> Reviewed-by: David Hildenbrand <david@redhat.com>
>
> --
> Thanks,
>
> David / dhildenb
>

