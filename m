Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDA24DD63A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 09:33:02 +0100 (CET)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV82f-00046z-D6
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 04:33:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nV7vA-0007k3-7b
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:25:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nV7v6-0002VH-Kn
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647591911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0bDdul1Ia7IbCDUOWacfdymQqCmhs7lQ/tAknvVExk=;
 b=Y9Qc36Lxn3J74zjwIu12nUjxzfZbOKCU16TdWwzFPPM1R85/W3xEIS/jzwH2dCCr575fcm
 McvllpATMHI6aLHJifC8ANW4qNxpOMDat47rx7+hx2ARFDJZrB99rAOC0Cw+JMSYS1Sz5P
 FZ0eNTWATn1P1KjAhzKOBwrccLhGG6g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-g-_ZONVPNNifcLLSYSGuBg-1; Fri, 18 Mar 2022 04:25:10 -0400
X-MC-Unique: g-_ZONVPNNifcLLSYSGuBg-1
Received: by mail-qv1-f71.google.com with SMTP id
 dj3-20020a056214090300b004354a9c60aaso5889499qvb.0
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 01:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=t0bDdul1Ia7IbCDUOWacfdymQqCmhs7lQ/tAknvVExk=;
 b=IiA+8r1U4FAQYReJ7zcCvmO88FcAC3flWnPR9ITBFPVLHu3NcW8yI6TzRiohaDzUSO
 03wfYyJJwSE+DCxaqkdHvRbe2NCwD2NdwpBJTy94i7bAiQOQxFVCRs4baYjrWLRhZ+CL
 iQ7xLBV1izTTWGbI4wis/MdPY3R3n5GP1r98WRJ3tpSe+O4sr3yNCPIXnjHTAqlFnIcr
 oVkU3mNcttkqUywIoQSgNtmlA1rDzFSwbIc5ztsjkuDQYurDeyitgVJZuLXom7QRwZ3M
 Ncn92ubOrGxWgDJb3RuVsgQgPT73r0fIEI3YY6CNExOu7YtHB2MFnOz2cuPBreMGoiA1
 mo9Q==
X-Gm-Message-State: AOAM532i6RLa7RWbi8vz31Oo4+PCkJIKJuwwJQ9T5IDz0kZS0/PvH/8I
 sXRNTACR3gF953PmppC0NsekbEthWw50Ew+vFK9DqK/da6uczVETUydeiwYvlazScjBkOQWWf2d
 3lIBmtgTT6zgNUWc=
X-Received: by 2002:a05:620a:2a14:b0:67d:9535:1641 with SMTP id
 o20-20020a05620a2a1400b0067d95351641mr5134136qkp.412.1647591909440; 
 Fri, 18 Mar 2022 01:25:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8taFgvwJ9MeDk9jgXsEu0Fxe4suVBUOcMC2iURWfhnqrCitjz+eC1CeKWBMf+ZxzHdKy0GQ==
X-Received: by 2002:a05:620a:2a14:b0:67d:9535:1641 with SMTP id
 o20-20020a05620a2a1400b0067d95351641mr5134128qkp.412.1647591909148; 
 Fri, 18 Mar 2022 01:25:09 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-114.business.telecomitalia.it.
 [87.12.25.114]) by smtp.gmail.com with ESMTPSA id
 q26-20020ae9e41a000000b0067d1a20872fsm3462976qkc.94.2022.03.18.01.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 01:25:08 -0700 (PDT)
Date: Fri, 18 Mar 2022 09:25:04 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
Message-ID: <20220318082504.qxqcarorpo2jxnfk@sgarzare-redhat>
References: <20220317162638.41192-1-sgarzare@redhat.com>
 <CAC868B4-D120-4EB4-A0E9-78F38BA20FA7@kamp.de>
MIME-Version: 1.0
In-Reply-To: <CAC868B4-D120-4EB4-A0E9-78F38BA20FA7@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 07:27:05PM +0100, Peter Lieven wrote:
>
>
>> Am 17.03.2022 um 17:26 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>>
>> ﻿Commit d24f80234b ("block/rbd: increase dynamically the image size")
>> added a workaround to support growing images (eg. qcow2), resizing
>> the image before write operations that exceed the current size.
>>
>> We recently added support for write zeroes and without the
>> workaround we can have problems with qcow2.
>>
>> So let's move the resize into qemu_rbd_start_co() and do it when
>> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
>> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>> block/rbd.c | 26 ++++++++++++++------------
>> 1 file changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index 8f183eba2a..6caf35cbba 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
>>
>>     assert(!qiov || qiov->size == bytes);
>>
>> +    if (cmd == RBD_AIO_WRITE || cmd == RBD_AIO_WRITE_ZEROES) {
>> +        /*
>> +         * RBD APIs don't allow us to write more than actual size, so in order
>> +         * to support growing images, we resize the image before write
>> +         * operations that exceed the current size.
>> +         */
>> +        if (offset + bytes > s->image_size) {
>> +            int r = qemu_rbd_resize(bs, offset + bytes);
>> +            if (r < 0) {
>> +                return r;
>> +            }
>> +        }
>> +    }
>> +
>>     r = rbd_aio_create_completion(&task,
>>                                   (rbd_callback_t) qemu_rbd_completion_cb, &c);
>>     if (r < 0) {
>> @@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
>>                                  int64_t bytes, QEMUIOVector *qiov,
>>                                  BdrvRequestFlags flags)
>> {
>> -    BDRVRBDState *s = bs->opaque;
>> -    /*
>> -     * RBD APIs don't allow us to write more than actual size, so in order
>> -     * to support growing images, we resize the image before write
>> -     * operations that exceed the current size.
>> -     */
>> -    if (offset + bytes > s->image_size) {
>> -        int r = qemu_rbd_resize(bs, offset + bytes);
>> -        if (r < 0) {
>> -            return r;
>> -        }
>> -    }
>>     return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE);
>> }
>>
>> --
>> 2.35.1
>>
>
>Do we really have a use case for growing rbd images?

The use case is to have a qcow2 image on rbd.
I don't think it's very common, but some people use it and here [1] we 
had a little discussion about features that could be interesting (e.g.  
persistent dirty bitmaps for incremental backup).

In any case the support is quite simple and does not affect other use 
cases since we only increase the size when we go beyond the current 
size.

IMHO we can have it in :-)

Thanks,
Stefano

[1] 
https://lore.kernel.org/all/20190415080452.GA6031@localhost.localdomain/


