Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8D73E1BEE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:02:11 +0200 (CEST)
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBid8-0000Vn-Mk
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mBibS-0007LY-2G
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:00:26 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:45917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mBibK-0002o1-FC
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:00:22 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 s21-20020a4ae5550000b02902667598672bso1575587oot.12
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gNErPtfqYyZAY2mJUojVz7Vnz4ZTZCkkObjtgAUW1hs=;
 b=tp7OWotlAQs8sNsURijfa6HGbFCxW8A6ObZVg7qSB7USaasAcK8pRbUmUNnJWQWelX
 o/knwx0qjy4FgzGUGc0rp0JNWdRs5+myE39WHEOxDtTLBGYbZ6b+sSFFIHzu2VbOxHRC
 iwVUgu/W9GH5KHMs8QdhYO7pkRSbhsNN3cAUZnNpwMsnXb/Aikvr12+V+MZbY5gqSfk5
 PLHcWh8z7dw15abDCPxxl8lkbtB3/VODSog9k6u1bB4KBdhYyOycD2UCz8jhLTtfFGeJ
 wVMYz/IXqcX6H2YufgvECqbXnv113nzY7gXSPOD+7c7k5D9Qm17l2RakOGN7bI6AH0Hm
 RaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gNErPtfqYyZAY2mJUojVz7Vnz4ZTZCkkObjtgAUW1hs=;
 b=DRauqj9FkyAv4GFLYYa+9FbrXvsRMH4D8zyhT7GjZ7k36D+afv+Z6O445SHHKOI50L
 YIIMGnVWQfp2odOUTyMI7+2fe1e1/fl8icRmsgcIGRoSqZEEVnuxfuVGEL9/9GVJIsqj
 P/puHBecuf6RDqLPV7QawYGrzGEMwzA+O5YFEgd7SqFLUzZzFHSUl4BTNOaB5HLn+3LH
 Z0Nkp306sucSYI4lLy8shvuJM8TtnE06KVJSnLIr91BgNqpD/mXZbXwptYpBD/OtBhX1
 bIonVAClik9TXo2yNjShqqvND2j0p7c1EJxIfe2iX2qHQoVAMMUatyuqeiTrUR0EquQU
 +X1Q==
X-Gm-Message-State: AOAM533pSRmghUI9G0GCo9k+DCl0CVfWgk5HhO/edQJyWNuR3ezFO1n+
 0eJervOiQEVKxNh9MEuoXDbzaJPcgtbx+zwsDUCO4g==
X-Google-Smtp-Source: ABdhPJzT/8GQou3/2oZu1ROOsgYCNi2f7/PtSK2z3VT3RqNAJSyNXvQMkAQbEQ7YQrBy9oQ33+dfjXPdD5dzy8kmF7M=
X-Received: by 2002:a4a:e64a:: with SMTP id q10mr4357566oot.48.1628190015879; 
 Thu, 05 Aug 2021 12:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210706222607.1058040-1-jiang.wang@bytedance.com>
 <20210707083312.algmreafmfofg7el@steredhat>
 <CAP_N_Z-NbofkoDbWby9Pe=VH1CjYQL6-gSbrwWDBZBNDwcnmuA@mail.gmail.com>
 <20210707172737.j2xpyd45wmufdqc5@steredhat.lan>
 <CAP_N_Z8ktMLHSG8J7t4WA9MCC5i0o=CUF+VfPSOBnWrMd21idg@mail.gmail.com>
 <20210804064103.gvhz3a7ck6xlwsm6@steredhat>
 <CAGxU2F4b0evZfKhZ62S7RmDMWG1jq72q5tii_WuKbNeBuveLsg@mail.gmail.com>
In-Reply-To: <CAGxU2F4b0evZfKhZ62S7RmDMWG1jq72q5tii_WuKbNeBuveLsg@mail.gmail.com>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Thu, 5 Aug 2021 12:00:05 -0700
Message-ID: <CAP_N_Z_aJ62bMA6kR-e-FnPh-uNhJsQSf67RKPS67bq6=jO-2Q@mail.gmail.com>
Subject: Re: Re: [RFC v3] virtio/vsock: add two more queues for datagram types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=jiang.wang@bytedance.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jason Wang <jasowang@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 3, 2021 at 11:49 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Wed, Aug 4, 2021 at 8:41 AM Stefano Garzarella <sgarzare@redhat.com>
> wrote:
> >
> > On Tue, Aug 03, 2021 at 11:58:27AM -0700, Jiang Wang . wrote:
> > >On Wed, Jul 7, 2021 at 10:27 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > >> On Wed, Jul 07, 2021 at 09:52:46AM -0700, Jiang Wang . wrote:
> > >> >On Wed, Jul 7, 2021 at 1:33 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > >> >> On Tue, Jul 06, 2021 at 10:26:07PM +0000, Jiang Wang wrote:
> >
> > [...]
> >
> > >> >> >+
> > >> >> >+    if (nvqs < 0)
> > >> >> >+        nvqs = MAX_VQS_WITHOUT_DGRAM;
> > >> >> >+
> > >> >> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
> > >> >> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> > >> >> >+                                              vhost_vsock_common_handle_output);
> > >> >> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> > >> >> >+                                               vhost_vsock_common_handle_output);
> > >> >> >+    }
> > >> >> >+
> > >> >> >     /* The event queue belongs to QEMU */
> > >> >> >     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> > >> >> >                                        vhost_vsock_common_handle_output);
> > >> >>
> > >> >> Did you do a test with a guest that doesn't support datagram with QEMU
> > >> >> and hosts that do?
> > >> >>
> > >> >Yes, and it works.
> > >> >
> > >> >> I repost my thoughts that I had on v2:
> > >> >>
> > >> >>      What happen if the guest doesn't support dgram?
> > >> >>
> > >> >>      I think we should dynamically use the 3rd queue or the 5th queue for
> > >> >>      the events at runtime after the guest acked the features.
> > >> >>
> > >> >>      Maybe better to switch to an array of VirtQueue.
> > >> >>
> > >> >I think in current V3, it  already dynamically use 3rd or 5th queue
> > >> >depending
> > >> >on the feature bit.
> > >>
> > >> I'm not sure. IIUC when vhost_vsock_common_realize() is called, we don't
> > >> know the features acked by the guest, so how can it be dynamic?
> > >>
> > >> Here we should know only if the host kernel supports it.
> > >>
> > >> Maybe it works, because in QEMU we use the event queue only after a
> > >> migration to send a reset event, so you can try to migrate a guest to
> > >> check this path.
> > >>
> > >I tried VM migration and didn't see any problems. The migration looks fine
> > >and vsock dgram still works after migration. Is there any more specific test
> > >you want to run to check for this code path?
> > >
> >
> > I meant a migration of a guest from QEMU without this patch to a QEMU
> > with this patch. Of course in that case testing a socket stream.
> >
>
> Sorry, I meant the opposite.
>
> You should try to migrate a guest that does not support dgrams starting
> from a QEMU with this patch (and kernel that supports dgram, so qemu
> uses the 5th queue for event), to a QEMU without this patch.
>
Got it. I tried what you said and saw errors on the destination qemu. Then
I moved event queue up to be number 3 (before adding dgram vqs),
as the following:

+    /* The event queue belongs to QEMU */
+    vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                       vhost_vsock_common_handle_output);
+

     nvqs = vhost_vsock_get_max_qps(enable_dgram);

@@ -253,10 +257,6 @@ void vhost_vsock_common_realize(VirtIODevice
*vdev, const char *name, bool enabl

vhost_vsock_common_handle_output);
     }

-    /* The event queue belongs to QEMU */
-    vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
-                                       vhost_vsock_common_handle_output);
-

But I still see following errors on the destination qemu:
qemu-system-x86_64: Error starting vhost vsock: 14

Any idea if my above code change is wrong or missing something?

Take one step back, what should be the host kernel version? With or
without dgram support? I tried both.  The new dest kernel shows the above error.
The old dest kernel shows a msr error probably not related to vsock.

To explain the above qemu 14 error, I think the issue is that the
source host kernel
supports dgram by always setting the DGRAM feature bit(in my
implementation). Then the source
qemu query the source host kernel, and use 5 for event vq. Even if the source
guest kernel does not support dgram, it currently has no way to tell the source
host or the source qemu.

On the source machine, when we start qemu process,  and the guest VM
is still in BIOS or early boot process ( before vsock is initialized), I think
at this time, the qemu vhost_vsock_common_realize() is already called.
So qemu can only check if the host kernel supports dgram or not, but has
no knowledge about the guest kernel. After the guest kernel is fully boot up,
it can tell qemu or the host if it supports dgram or not ( or the host or qemu
detect for that). But I don't think we will change the vq numbers at that time.

Maybe we should fix that too and change vq numbers ( delete vq and add
back?) at a later
time after the guest kernel is fully boot-up?

> I still think the event queue should remain the third and those dgrams
> the next 2.
>
> Thanks,
> Stefano
>

