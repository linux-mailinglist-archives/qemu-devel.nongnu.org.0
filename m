Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6629B6EAEA2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:03:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptBG-00049s-T1; Fri, 21 Apr 2023 12:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pptBD-00049V-OH
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:00:11 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pptBB-00041W-TR
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:00:11 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-54f8b46d031so20579537b3.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682092808; x=1684684808;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ui9pJ95GbL/6JFW4RwTwu7KLJRsSUBAQdDQ2yvnkYdU=;
 b=fUsW9+1WUvZVzFmBu679zTJcC3xSeDg9PkbGzfGuaLL5wPsZTpWs9GE+gTY7kdI2mq
 66Yg2X9b941yDcX+gddCw8YkueUv3FOdysRTAM0VPAYM+ZthOssldk+LTyXLKgnm8H0A
 juo+twiOSOF2y0mixK3Dd+xlm4DQ6ujQ5psYGxxKYp1xbVEnerlB791jtUywNppQ8byn
 Dlsezwf1ek049PkRJXvHGIxElk88usMpYCcCWprfdXJfFX9bB+ZnzZJrKjsRHrxP+XJF
 rbFyRoT4V1TlpsMroFSxNwH3RiEf5FVlV8rIOmyS2kKytvRQD0XBzrtfZg9PMOruXhuv
 O5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682092808; x=1684684808;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ui9pJ95GbL/6JFW4RwTwu7KLJRsSUBAQdDQ2yvnkYdU=;
 b=NIAdTQJCC3LonCZcilOvISZUYogduOtoBx8v6FTSsWN417zJxkB3zFEvtJeCcgWhk6
 FU8Xyf36M9VtVAHjrNo8vmu3hTXpGUNsKGjKAb7IXxZOnO9SiRN6ltS0m+xwxY9ejBzi
 Hbzv/ERWHkP+ttqx1/Cq3TJMxIPW/TM7O2qtiRZr3KcQmauSQdVpnsW7ErrnD5Y/U7kM
 M033Klk8XsilG4KgYpS9i61AvkpnMyehWH7tT0mMl1n4TaswlE+sbYp9I9Tw9J6NAxDa
 Uq1wRqGKi4gGVd3JWm+qIdNzeU6ki59FYBDEtxQ7dB7339/wlnytpnbASJx4TIbRCI41
 mLpA==
X-Gm-Message-State: AAQBX9fCQfcI4txy4WI+C8MY6nr8cp9zbUaTsVeWiti5VjwCV7PtDqJA
 lVGXW/4dha7mfStLYji3oUoyJ+K+mhPMmnsZeoE=
X-Google-Smtp-Source: AKy350ZKBJkEQP54RYEsXGfp8lXNJP1sY/hbjuvOcXQmRyfn6I+sZ12cbt7xy3dyBAwzL8T4fQesQyynpJHXyHgunys=
X-Received: by 2002:a81:8495:0:b0:544:75c2:d4a1 with SMTP id
 u143-20020a818495000000b0054475c2d4a1mr2339877ywf.17.1682092808045; Fri, 21
 Apr 2023 09:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <20230421011223.718-14-gurchetansingh@chromium.org>
In-Reply-To: <20230421011223.718-14-gurchetansingh@chromium.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 21 Apr 2023 11:59:56 -0400
Message-ID: <CAJSP0QWLOmTG2SSzQwhkSf0++VT5y3NBTnVURuHG=PQi-vss5g@mail.gmail.com>
Subject: Re: [RFC PATCH 13/13] HACK: schedule fence return on main AIO context
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@linaro.org, 
 david@redhat.com, stefanha@redhat.com, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com, 
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 20 Apr 2023 at 21:13, Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> gfxstream and both cross-domain (and even newer versions
> virglrenderer: see VIRGL_RENDERER_ASYNC_FENCE_CB) like to signal
> fence completion on threads ("callback threads") that are
> different from the thread that processes the command queue
> ("main thread").
>
> This is generally possible with locking, and this what we do
> in crosvm and other virtio-gpu1.1 implementations.  However, on
> QEMU a deadlock is observed if virtio_gpu_ctrl_response_nodata(..)
> [used in the fence callback] is used from a thread that is not the
> main thread.
>
> The reason is the main thread takes the big QEMU lock (bql) somewhere
> when processing the command queue, and virtio_gpu_ctrl_response_nodata(..)
> needs that lock.  If you add in the lock needed to protect &g->fenceq
> from concurrent access by the main thread and the callback threads,
> you end can end up with deadlocks.
>
> It's possible to workaround this by scheduling the return of the fence
> descriptors via aio_bh_schedule_oneshot_full(..), but that somewhat
> negates the rationale for the asynchronous callbacks.
>
> I also played around with aio_context_acquire()/aio_context_release(),
> doesn't seem to help.
>
> Is signaling the virtio_queue outside of the main thread possible?  If
> so, how?

Yes, if you want a specific thread to process a virtqueue, monitor the
virtqueue's host_notifier (aka ioeventfd) from the thread. That's how
--device virtio-blk,iothread= works. It attaches the host_notifier to
the IOThread's AioContext. Whenever the guest kicks the virtqueue, the
IOThread will respond instead of QEMU's main loop thread.

That said, I don't know the threading model of your code. Could you
explain which threads are involved? Do you want to process all buffers
from virtqueue in a specific thread or only these fence buffers?

>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  hw/display/virtio-gpu-rutabaga.c | 29 ++++++++++++++++++++++++++---
>  include/hw/virtio/virtio-gpu.h   |  1 +
>  2 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/hw/display/virtio-gpu-rutabaga.c b/hw/display/virtio-gpu-rutabaga.c
> index 196267aac2..5c296aeef1 100644
> --- a/hw/display/virtio-gpu-rutabaga.c
> +++ b/hw/display/virtio-gpu-rutabaga.c
> @@ -31,6 +31,11 @@ static int virtio_gpu_rutabaga_init(VirtIOGPU *g);
>
>  #define CHECK_RESULT(result, cmd) CHECK(result == 0, cmd)
>
> +struct rutabaga_aio_data {
> +    struct VirtIOGPUGL *virtio_gpu;
> +    struct rutabaga_fence fence;
> +};
> +
>  static void
>  virtio_gpu_rutabaga_update_cursor(VirtIOGPU *g, struct virtio_gpu_scanout *s,
>                                    uint32_t resource_id)
> @@ -823,10 +828,11 @@ virtio_gpu_rutabaga_process_cmd(VirtIOGPU *g,
>  }
>
>  static void
> -virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
> -                             struct rutabaga_fence fence_data)
> +virtio_gpu_rutabaga_aio_cb(void *opaque)
>  {
> -    VirtIOGPU *g = (VirtIOGPU *)(void*)(uintptr_t)user_data;
> +    struct rutabaga_aio_data *data =  (struct rutabaga_aio_data *)opaque;
> +    VirtIOGPU *g = (VirtIOGPU *)data->virtio_gpu;
> +    struct rutabaga_fence fence_data = data->fence;
>      struct virtio_gpu_ctrl_command *cmd, *tmp;
>
>      bool signaled_ctx_specific = fence_data.flags & RUTABAGA_FLAG_INFO_RING_IDX;
> @@ -856,6 +862,22 @@ virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
>          QTAILQ_REMOVE(&g->fenceq, cmd, next);
>          g_free(cmd);
>      }
> +
> +    g_free(data);
> +}
> +
> +static void
> +virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
> +                             struct rutabaga_fence fence_data) {
> +    struct rutabaga_aio_data *data;
> +    VirtIOGPU *g = (VirtIOGPU *)(void*)(uintptr_t)user_data;
> +    GET_VIRTIO_GPU_GL(g);
> +
> +    data = g_new0(struct rutabaga_aio_data, 1);
> +    data->virtio_gpu = virtio_gpu;
> +    data->fence = fence_data;
> +    aio_bh_schedule_oneshot_full(virtio_gpu->ctx, virtio_gpu_rutabaga_aio_cb,
> +                                 (void *)data, "aio");
>  }
>
>  static int virtio_gpu_rutabaga_init(VirtIOGPU *g)
> @@ -912,6 +934,7 @@ static int virtio_gpu_rutabaga_init(VirtIOGPU *g)
>          free(channels.channels);
>      }
>
> +    virtio_gpu->ctx = qemu_get_aio_context();
>      return result;
>  }
>
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 034c71e8f5..b33ad0c68f 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -225,6 +225,7 @@ struct VirtIOGPUGL {
>      char *wayland_socket_path;
>      uint32_t num_capsets;
>      void *rutabaga;
> +    AioContext *ctx;
>  };
>
>  struct VhostUserGPU {
> --
> 2.40.0.634.g4ca3ef3211-goog
>
>

