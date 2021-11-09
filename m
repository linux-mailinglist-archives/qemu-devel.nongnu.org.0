Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBF144A7AD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:40:19 +0100 (CET)
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLju-0002i8-Em
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:40:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mkLeC-0005Cj-Fe
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:34:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mkLeA-0001tW-17
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636443259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5GTRg9ktgA3aPIa8BXzfwFK4mP7bRZhZ8Ri72eBGrc=;
 b=JvtoWRkN1EzSG3tj1czzg6BK9ucy17R2ppIywUiZLiwsLbDdQIYMLkRXtkA3XAEkNWr2Gm
 VewF51o4s7tM+mFCrLf0E7RMHlIN2vmporDUt0fDZJrRRARD4JzWDJTtfozfWYRpQ3J5Po
 BClCgPDWJkGV1UkjEso6kK6060pXCA0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-QGFkgbBTO-Gg4s7XSw8HkQ-1; Tue, 09 Nov 2021 02:34:18 -0500
X-MC-Unique: QGFkgbBTO-Gg4s7XSw8HkQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 y40-20020a0565123f2800b003fded085638so7685620lfa.0
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 23:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J5GTRg9ktgA3aPIa8BXzfwFK4mP7bRZhZ8Ri72eBGrc=;
 b=RxME+lzi7ml0bHv/uOcdAtYgSCnuD7YI+Vb2AkBnukz1/sDtekGqttK4ZJFmq2VQ4v
 Kk97vTeW8HaGlM/HBFkVV0jN9zJ8MJ7wl9WootjMrP0soNfS5iIEuGIeK+AkCyVen4G+
 gv6EMtnobOR2sOgkVI4+BXDYDdujyVVZGHEQu1Qn8n+F1azN+syJuzd+zHLE6k3e0UhN
 ihwGzdoeMMDioUi3Kjdtr+fPd7dUpchtwz9D6vg0CPUar2JW6NpuPNeSLMpAi2kbSCGF
 7lsBf8Gxu3R2fVYb9SQTLvmaRsnVgdiYDP/tXXsHtweE+GqWj4S9fsrYRH5xiB2oduvD
 uzVQ==
X-Gm-Message-State: AOAM531TI3HV5w8vP2Z/leak5YHwsqrop2eKvVnbAXrjIW90aWz7Nz4k
 FlNrDb+her4IlzUW7PDMVkD6Dtobw2b/zI5kRm/dVlsMx8Z3VllEUGE2s2cl4VujcAZtFtTAHEP
 k4SjZTRrtiGDbRV+BAzfPCzQ+YGs+6f0=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr5227194lfh.580.1636443257171; 
 Mon, 08 Nov 2021 23:34:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMF0OxbGKfyu34KNnlj+wZYBeqzO7J4WKatNkwv+eXlhyoT9VihNsLyLSd7AWaOXridDqbz73wRd8iAM1VCc8=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr5227172lfh.580.1636443256931; 
 Mon, 08 Nov 2021 23:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20211109023744.22387-1-lulu@redhat.com>
In-Reply-To: <20211109023744.22387-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Nov 2021 15:34:06 +0800
Message-ID: <CACGkMEuwtCB9HXNMEf0AbeOz4nqg1geD8LAi__pcW3sFKQ-MYA@mail.gmail.com>
Subject: Re: [PATCH] virtio-mmio : fix the crash in the vm shutdown
To: Cindy Lu <lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 9, 2021 at 10:37 AM Cindy Lu <lulu@redhat.com> wrote:
>
> The root cause for this crash is the ioeventfd not stopped while the VM stop.
> The callback for vmstate_change was not implement in virtio-mmio bus
>
> Reproduce step
> load the vm with
>  -M microvm \
>   -netdev tap,id=net0,vhostforce,script=no,downscript=no  \
>   -device virtio-net-device,netdev=net0\
>
> After the VM boot, login the vm and then shutdown the vm
>
> System will crash
> [Current thread is 1 (Thread 0x7ffff6edde00 (LWP 374378))]
> (gdb) bt
> 0  0x00005555558f18b4 in qemu_flush_or_purge_queued_packets (purge=false, nc=0x55500252e850) at ../net/net.c:636
> 1  qemu_flush_queued_packets (nc=0x55500252e850) at ../net/net.c:656
> 2  0x0000555555b6c363 in virtio_queue_notify_vq (vq=0x7fffe7e2b010) at ../hw/virtio/virtio.c:2339
> 3  virtio_queue_host_notifier_read (n=0x7fffe7e2b08c) at ../hw/virtio/virtio.c:3583
> 4  0x0000555555de7b5a in aio_dispatch_handler (ctx=ctx@entry=0x5555567c5780, node=0x555556b83fd0) at ../util/aio-posix.c:329
> 5  0x0000555555de8454 in aio_dispatch_ready_handlers (ready_list=<optimized out>, ctx=<optimized out>) at ../util/aio-posix.c:359
> 6  aio_poll (ctx=0x5555567c5780, blocking=blocking@entry=false) at ../util/aio-posix.c:662
> 7  0x0000555555cce0cc in monitor_cleanup () at ../monitor/monitor.c:645
> 8  0x0000555555b06bd2 in qemu_cleanup () at ../softmmu/runstate.c:822
> 9  0x000055555586e693 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:51
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com

Thanks

>  hw/virtio/virtio-mmio.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 7b3ebca178..72da12fea5 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -817,6 +817,17 @@ static char *virtio_mmio_bus_get_dev_path(DeviceState *dev)
>      return path;
>  }
>
> +static void virtio_mmio_vmstate_change(DeviceState *d, bool running)
> +{
> +    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
> +
> +    if (running) {
> +        virtio_mmio_start_ioeventfd(proxy);
> +    } else {
> +        virtio_mmio_stop_ioeventfd(proxy);
> +    }
> +}
> +
>  static void virtio_mmio_bus_class_init(ObjectClass *klass, void *data)
>  {
>      BusClass *bus_class = BUS_CLASS(klass);
> @@ -832,6 +843,7 @@ static void virtio_mmio_bus_class_init(ObjectClass *klass, void *data)
>      k->ioeventfd_enabled = virtio_mmio_ioeventfd_enabled;
>      k->ioeventfd_assign = virtio_mmio_ioeventfd_assign;
>      k->pre_plugged = virtio_mmio_pre_plugged;
> +    k->vmstate_change = virtio_mmio_vmstate_change;
>      k->has_variable_vring_alignment = true;
>      bus_class->max_dev = 1;
>      bus_class->get_dev_path = virtio_mmio_bus_get_dev_path;
> --
> 2.21.3
>


