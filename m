Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA23DFB99
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 08:51:02 +0200 (CEST)
Received: from localhost ([::1]:36876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBAk1-0006Ok-B9
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 02:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mBAiQ-0005dL-AB
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 02:49:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mBAiN-0005nR-TL
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 02:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628059758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VJbVnU2elSkdMjrNwd1lCBWuYOfkleaulmNXsYT49jo=;
 b=AzkA0lrgP/tRsWZxO8FMCFcBalWR0A7VW4OrYxNrzBgRhHoAz93irkMmFIosDmC2uBKOLY
 BlExiNPZOrzXtftUkE2nqM6b2WbeJLB4SsKmeFpXDuHu221BvtYe+jfhi0M8t1LsNfYyI6
 q2nfV4lbpC9PCZPcCUxkfKt45Sv69U4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-Xst08BS7Ot2BLi4WPx2LFQ-1; Wed, 04 Aug 2021 02:49:16 -0400
X-MC-Unique: Xst08BS7Ot2BLi4WPx2LFQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 c16-20020aa7d6100000b02903bc4c2a387bso936091edr.21
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 23:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VJbVnU2elSkdMjrNwd1lCBWuYOfkleaulmNXsYT49jo=;
 b=s9uO4+r7UzQU4den5nKGAfKEnk35K+ZQ6r/co9XD41FKDNSqT/cMxqZioN8KBK9M2b
 lNQQBpFLxQ2S60FKmOUf9gLxj0PSf6C+Wogp0X2iRW8VZ2btXYDd1BfBJo7YetqPaiAT
 YJv7C96UDQLw9LMChwyx/h04YDRh85CLDjI1xZKbBfagZR9LZEBWeZ2TQQ+WoIYBGIVJ
 JbsS5wHX+y5GSQRDCm0Qn3Ud6FeNHZmpodciT/MD3WvKZBkH7Sf8qEvf7O8tF8rrN2kv
 gIQHW8Lx5QJnLkyVRDahw/VKXZx0KDgCg08Nbm6wrROtQ9nxlj8rTshArwT5v8+d9FMF
 jUXQ==
X-Gm-Message-State: AOAM5328z52s2Swcj3oEdzcJ5suw7AGu/YSNjN1NhnzJBlzSnL2x3aQz
 Oeln8YCBbnreu9pBs71UyfbhXH+hKPknR/PaOqFaP1w/Jt4mkL+dhGnUSsWRU5XGVmBz6luO2WE
 ghTBgeFcKWKbq00Y=
X-Received: by 2002:a17:907:6289:: with SMTP id
 nd9mr24111001ejc.384.1628059755789; 
 Tue, 03 Aug 2021 23:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRzwtxVVOzK8CPzBmpb8acKSgr89w7RK1SZEX7ofc+UfF8uFGYIewBqDPBYm11cPLAbJqIOw==
X-Received: by 2002:a17:907:6289:: with SMTP id
 nd9mr24110982ejc.384.1628059755524; 
 Tue, 03 Aug 2021 23:49:15 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id cb4sm364222ejb.72.2021.08.03.23.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 23:49:15 -0700 (PDT)
Date: Wed, 4 Aug 2021 08:49:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [RFC v3] virtio/vsock: add two more queues for datagram types
Message-ID: <CAGxU2F4b0evZfKhZ62S7RmDMWG1jq72q5tii_WuKbNeBuveLsg@mail.gmail.com>
References: <20210706222607.1058040-1-jiang.wang@bytedance.com>
 <20210707083312.algmreafmfofg7el@steredhat>
 <CAP_N_Z-NbofkoDbWby9Pe=VH1CjYQL6-gSbrwWDBZBNDwcnmuA@mail.gmail.com>
 <20210707172737.j2xpyd45wmufdqc5@steredhat.lan>
 <CAP_N_Z8ktMLHSG8J7t4WA9MCC5i0o=CUF+VfPSOBnWrMd21idg@mail.gmail.com>
 <20210804064103.gvhz3a7ck6xlwsm6@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210804064103.gvhz3a7ck6xlwsm6@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Aug 4, 2021 at 8:41 AM Stefano Garzarella <sgarzare@redhat.com> 
wrote:
>
> On Tue, Aug 03, 2021 at 11:58:27AM -0700, Jiang Wang . wrote:
> >On Wed, Jul 7, 2021 at 10:27 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >> On Wed, Jul 07, 2021 at 09:52:46AM -0700, Jiang Wang . wrote:
> >> >On Wed, Jul 7, 2021 at 1:33 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >> >> On Tue, Jul 06, 2021 at 10:26:07PM +0000, Jiang Wang wrote:
>
> [...]
>
> >> >> >+
> >> >> >+    if (nvqs < 0)
> >> >> >+        nvqs = MAX_VQS_WITHOUT_DGRAM;
> >> >> >+
> >> >> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
> >> >> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >> >+                                              vhost_vsock_common_handle_output);
> >> >> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >> >+                                               vhost_vsock_common_handle_output);
> >> >> >+    }
> >> >> >+
> >> >> >     /* The event queue belongs to QEMU */
> >> >> >     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >> >                                        vhost_vsock_common_handle_output);
> >> >>
> >> >> Did you do a test with a guest that doesn't support datagram with QEMU
> >> >> and hosts that do?
> >> >>
> >> >Yes, and it works.
> >> >
> >> >> I repost my thoughts that I had on v2:
> >> >>
> >> >>      What happen if the guest doesn't support dgram?
> >> >>
> >> >>      I think we should dynamically use the 3rd queue or the 5th queue for
> >> >>      the events at runtime after the guest acked the features.
> >> >>
> >> >>      Maybe better to switch to an array of VirtQueue.
> >> >>
> >> >I think in current V3, it  already dynamically use 3rd or 5th queue
> >> >depending
> >> >on the feature bit.
> >>
> >> I'm not sure. IIUC when vhost_vsock_common_realize() is called, we don't
> >> know the features acked by the guest, so how can it be dynamic?
> >>
> >> Here we should know only if the host kernel supports it.
> >>
> >> Maybe it works, because in QEMU we use the event queue only after a
> >> migration to send a reset event, so you can try to migrate a guest to
> >> check this path.
> >>
> >I tried VM migration and didn't see any problems. The migration looks fine
> >and vsock dgram still works after migration. Is there any more specific test
> >you want to run to check for this code path?
> >
>
> I meant a migration of a guest from QEMU without this patch to a QEMU
> with this patch. Of course in that case testing a socket stream.
>

Sorry, I meant the opposite.

You should try to migrate a guest that does not support dgrams starting 
from a QEMU with this patch (and kernel that supports dgram, so qemu 
uses the 5th queue for event), to a QEMU without this patch.

I still think the event queue should remain the third and those dgrams 
the next 2.

Thanks,
Stefano


