Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBD74026F8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:17:16 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYAF-0006HD-Ua
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNY8h-0004np-Ag
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNY8f-0005Xd-ES
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631009736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/KJBbXI8PpKa9bD+FbXtfYGiCYZ0s0Muo1dNZO+yQFk=;
 b=SOQCEa5SiDT7HuxvjfYWznEsLpiwSFPTHVHiC9d/Bl3beN/w3tE3+0OYVtQ+vNm2CjlnCT
 jspiugb1mKbytWdotD6ksaAZ0knXaLivWfyUNPO71ZPkXF1RgZm3QWY+BXNm7wT2TRiGWQ
 kLv3MpUEc0mVblr3kdquyzqA3pXPhaI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-Yh0P8zsfNNeUpqYW45LrmA-1; Tue, 07 Sep 2021 06:15:34 -0400
X-MC-Unique: Yh0P8zsfNNeUpqYW45LrmA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y21-20020a056402359500b003cd0257fc7fso5008639edc.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 03:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/KJBbXI8PpKa9bD+FbXtfYGiCYZ0s0Muo1dNZO+yQFk=;
 b=Tgsahc6EZyNzYHF/84tKdtGDctE/C3dno7UOLTxhRcMUkmG1FGGT/x5O5wb09g6JYT
 mmjhrthghTfsrVqE9pFM6c8fqGe7ITGabU6PvvJk5kMJ9ASwYAYxN+EUWZSCHvLWtw+6
 C1zmzf1Ir3+caIxGf/MZh5BrahmCOJNhv1AbQN9Rr7kvYZAgWnkK1b34f7ybnQesNIsr
 5TmF1TwHaHuterDXUvS4CWsm2myFzeBnWI/cxg+Talg/NU7L4aLenrdTeNs1shQr6NwG
 786DuJyfPdjrNuH25xMt9cdOAjI4Krwwei/bnti+xv1oUCXOKIfGOvbYnc4F5783vFr+
 heIg==
X-Gm-Message-State: AOAM532sTKcIn6131VX+9gXRfMndHoNbD6swMjUqkwhZKdzHR7+HkM4b
 ygZqSlZW+/VTNbCNqw2NZ3WM5ZzVTyuy6C3wnTA2ICwNTkm425W0s/Vr50E3sR66/kYx53pwgZw
 9/tbBIXef4QSaaJc=
X-Received: by 2002:a05:6402:389:: with SMTP id
 o9mr1021806edv.213.1631009733640; 
 Tue, 07 Sep 2021 03:15:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCiijHWfRtbwWAZkyDLmuLDTKrMSUnsWfessZtZnsXMBENNbDsveZ6XbptzkcRJNomBS3YGA==
X-Received: by 2002:a05:6402:389:: with SMTP id
 o9mr1021784edv.213.1631009733394; 
 Tue, 07 Sep 2021 03:15:33 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id t20sm2797339ejc.105.2021.09.07.03.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:15:32 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:15:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [PATCH v4] virtio/vsock: add two more queues for datagram types
Message-ID: <20210907101530.djm2zsoo4f3pirof@steredhat>
References: <CAP_N_Z_FWCQuzxKG7uXAZRm_-X4A1m1c3Rh_FcBiDAksSbMWug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z_FWCQuzxKG7uXAZRm_-X4A1m1c3Rh_FcBiDAksSbMWug@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Sun, Sep 05, 2021 at 11:08:34AM -0700, Jiang Wang . wrote:
>On Mon, Aug 9, 2021 at 3:58 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> On Thu, Aug 05, 2021 at 12:07:02PM -0700, Jiang Wang . wrote:
>> >On Wed, Aug 4, 2021 at 1:13 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> >> On Tue, Aug 03, 2021 at 11:41:32PM +0000, Jiang Wang wrote:

[...]

>> >> >+
>> >> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
>> >> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >> >+                                              vhost_vsock_common_handle_output);
>> >> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >> >+
>> >> >vhost_vsock_common_handle_output);
>> >> >+    }
>> >> >+
>> >>
>> >> I'm still concerned about compatibility with guests that don't
>> >> support
>> >> dgram, as I mentioned in the previous email.
>> >>
>> >> I need to do some testing, but my guess is it won't work if the host
>> >> (QEMU and vhost-vsock) supports it and the guest doesn't.
>> >>
>> >> I still think that we should allocate an array of queues and then decide
>> >> at runtime which one to use for events (third or fifth) after the guest
>> >> has acked the features.
>> >>
>> >Agree. I will check where the guest ack the feature. If you have any
>>
>> I'm not sure we should delete them, I think we can allocate 5 queues and
>> then use queue 3 or 5 for events in vhost_vsock_common_start(), when the
>> guest already acked the features.
>>
>
>I think I just solved most compatibility issues during migration. The
>previous error I saw was due to a bug in vhost-vsock kernel module.

Please post the fix upstream.

>After fixing that, I did not change anything for qemu ( i.e, still the same
>version 4, btw I will fix fd issue in v5) and did a few migration tests.
>Most of them are good.
>
>There are two test cases that migration failed with "Features 0x130000002
>unsupported"error, which is due to
>SEQPACKET qemu patch (my dgram patch
>is based on seqpacket patch). Not sure if we need to
>fix it or not.  I think the compatibility is good as of now. Let me

I'm a bit lost. Do you mean because one of the QEMU doesn't support 
SEQPACKET?


>know if you have other concerns or more test cases to test.
>Otherwise, I will submit V5 soon.
>
>Test results:
>Left three columns are the source set-up,  right are destination set up.
>Host and Guest refers to the host and guest kernel respectively. These
>tests are not complete, and I make the src and dest kernel mostly the
>same version. But I did test one case where source kernel has dgram
>support while dest kernel does not and it is good. Btw, if the src kernel
>and dest kernel have a big difference( like 5.14 vs 4.19), then QEMU
>will show some msr errors which I guess is kind of expected.
>
>Host        QEMU        Guest            --> Host        QEMU            result
>dgram       no-dgram    no-dgram        dgram       no-dgram        Good
>dgram       no-dgram    dgram           dgram       no-dgram        Good
>dgram       dgram       no-dgram        dgram       dgram           Good
>dgram       dgram       no-dgram        dgram       no-dgram        Good
>dgram       dgram       dgram           dgram       no-dgram
>load feature error *1
>
>no-dgram    no-dgram    dgram           no-dgram    no-dgram        Good
>no-dgram    dgram       dgram           no-dgram    dgram             Good
>no-dgram    dgram       no-dgram        no-dgram    dgram           Good
>no-dgram    dgram       no-dgram        no-dgram    no-dgram        Good
>no-dgram    dgram       dgram           no-dgram    no-dgram
>load feature error *1
>
>dgram       dgram       no-dgram        no-dgram    no-dgram        Good
>
>*1 Qemu shows following error messages:
>qemu-system-x86_64: Features 0x130000002 unsupported. Allowed
>features: 0x179000000
>qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
>qemu-system-x86_64: error while loading state for instance 0x0 of
>device '0000:00:05.0/virtio-vhost_vsock'
>qemu-system-x86_64: load of migration failed: Operation not permitted
>
>This is due to SEQPACKET feature bit.

Can you test with both (source and destination) that support SEQPACKET 
(or not)?

I mean, it is better if the only variable is the dgram support.

Anyway the tests seem ok to me :-)

>
>
>Step back and rethink about whether the event vq number should be 3 or or 5,
>now I think it does not matter. The tx and rx queues (whether 2 or 4 queues)
>belong to vhost, but event queue belongs to QEMU. The qemu code
>allocates an array  for vhost_dev.vqs only for tx and rx queues. So
>event queue is never in that array. That means we don't need to
>worry about even queue number is 3 or 5. And my tests confirmed that.
>I think for the virtio spec, we need to put event queue somewhere and
>it looks like having a relative position to tx rx queues. But for vhost kernel
>implementation, the event queue is a special case and not related to
>tx or rx queues.

Yep, the important thing is that QEMU uses the right queue depending on 
whether DGRAM support has been negotiated or not.

Thanks,
Stefano


