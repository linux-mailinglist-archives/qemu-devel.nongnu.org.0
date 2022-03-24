Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AAE4E61E0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 11:42:04 +0100 (CET)
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXKup-00066E-J8
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 06:42:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nXKtS-0005Gf-Ac
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 06:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nXKtQ-0005ad-6Q
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 06:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648118435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+eeZZ8LcLRfofueFofYIVQyI3RtGwxQ518YRFBWJ1s=;
 b=KYPwfYjZU1+L+ao7MRodJOazXKu0pBY/hQSUcrEkfdxLimRtZuRiFf8f5Knp8n9YP7pOSV
 o2RkldxVagFDd6NDUqLsWheUcb1YmtHEu/MTUsYHqUCBAOTeaF7kLR+JwDBd/k0eDgCPn+
 pm1UzweGkm2Mpu7mePOI1V+gzciQCYM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-Yqss2esGPWakrMs4PObYZw-1; Thu, 24 Mar 2022 06:40:34 -0400
X-MC-Unique: Yqss2esGPWakrMs4PObYZw-1
Received: by mail-qv1-f70.google.com with SMTP id
 t16-20020ad44850000000b00440e0f2a561so3298469qvy.11
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 03:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=U+eeZZ8LcLRfofueFofYIVQyI3RtGwxQ518YRFBWJ1s=;
 b=GuCU7KwDKAsTFNS2ue5tIhFVQ7VPD15fmaODiVanPu20x/CucYBP63K8KHnifSIj5M
 EuUy4uJ/AdggJBdag2hFTJCq5S/rA3Geb+m+K2+SUzN0nNEDwurVgwspEyoYFKf4Y+4u
 tWp7gIOX7P1kwZ8q3ReLzOosQ6bqCYv1BsGpYKO1PdZfNc5gHKNhXDMMIVbKkK/noCAn
 4Cht5CWaYkHDJoo1N/SrYM2AL9P02sqEv3eMvwX1xfRmteW5C8+vcaTLjfCz/Lu70bDQ
 2icGSWNlrCJ9JBqYc3D8aFU0wHDyrjWO0AYAZBsd9R9ItlF2e6Bav8q08HzZjROLYcUP
 CirQ==
X-Gm-Message-State: AOAM5316c4C7uD9AIjO7UZKGaEUKzXVjPTcN2VvY4jkzXpXjKZOoWgJI
 cCe1VqHw9C9Trq7Y6gix6ne/a3ufzRKvOalAJVFFH/iUoz7Yo/fmEcQMVSvpe/GZEru7hBD5RdL
 sg8IGhdKmdjW3g98=
X-Received: by 2002:ad4:5dca:0:b0:441:55db:2835 with SMTP id
 m10-20020ad45dca000000b0044155db2835mr3594825qvh.31.1648118433483; 
 Thu, 24 Mar 2022 03:40:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCrWHkttWO8OxlBVSykYtuQJCqk/a88ivcjQVXROlTocR3MHZ+Debjq4vItS+HrcGHJGDOwg==
X-Received: by 2002:ad4:5dca:0:b0:441:55db:2835 with SMTP id
 m10-20020ad45dca000000b0044155db2835mr3594805qvh.31.1648118433166; 
 Thu, 24 Mar 2022 03:40:33 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-114.business.telecomitalia.it.
 [87.12.25.114]) by smtp.gmail.com with ESMTPSA id
 11-20020ac8590b000000b002e1e5c5c866sm2245249qty.42.2022.03.24.03.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 03:40:32 -0700 (PDT)
Date: Thu, 24 Mar 2022 11:40:27 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
Message-ID: <20220324104027.decsksvjgj6a6ghv@sgarzare-redhat>
References: <20220318164743.vgkbcoeok2e4r6pa@sgarzare-redhat>
 <40388E21-4608-4815-B332-C6173412B6C3@kamp.de>
 <20220321083137.rtwh6gretloaipwk@sgarzare-redhat>
 <a12f9b05-1b10-02a6-111c-674d8b36df81@redhat.com>
 <02086768-ff74-e927-a691-7adf1c3b4459@kamp.de>
MIME-Version: 1.0
In-Reply-To: <02086768-ff74-e927-a691-7adf1c3b4459@kamp.de>
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

On Thu, Mar 24, 2022 at 10:52:04AM +0100, Peter Lieven wrote:
>Am 22.03.22 um 10:38 schrieb Hanna Reitz:
>>On 21.03.22 09:31, Stefano Garzarella wrote:
>>>On Sat, Mar 19, 2022 at 04:15:33PM +0100, Peter Lieven wrote:
>>>>
>>>>
>>>>>Am 18.03.2022 um 17:47 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>>>>>
>>>>>﻿On Fri, Mar 18, 2022 at 04:48:18PM +0100, Peter Lieven wrote:
>>>>>>
>>>>>>
>>>>>>>>Am 18.03.2022 um 09:25 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>>>>>>>
>>>>>>>﻿On Thu, Mar 17, 2022 at 07:27:05PM +0100, Peter Lieven wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>>>Am 17.03.2022 um 17:26 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>>>>>>>>>
>>>>>>>>>﻿Commit d24f80234b ("block/rbd: increase dynamically the image size")
>>>>>>>>>added a workaround to support growing images (eg. qcow2), resizing
>>>>>>>>>the image before write operations that exceed the current size.
>>>>>>>>>
>>>>>>>>>We recently added support for write zeroes and without the
>>>>>>>>>workaround we can have problems with qcow2.
>>>>>>>>>
>>>>>>>>>So let's move the resize into qemu_rbd_start_co() and do it when
>>>>>>>>>the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>>>>>>>>>
>>>>>>>>>Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
>>>>>>>>>Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
>>>>>>>>>Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>>>>>>>>---
>>>>>>>>>block/rbd.c | 26 ++++++++++++++------------
>>>>>>>>>1 file changed, 14 insertions(+), 12 deletions(-)
>>>>>>>>>
>>>>>>>>>diff --git a/block/rbd.c b/block/rbd.c
>>>>>>>>>index 8f183eba2a..6caf35cbba 100644
>>>>>>>>>--- a/block/rbd.c
>>>>>>>>>+++ b/block/rbd.c
>>>>>>>>>@@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
>>>>>>>>>
>>>>>>>>>  assert(!qiov || qiov->size == bytes);
>>>>>>>>>
>>>>>>>>>+    if (cmd == RBD_AIO_WRITE || cmd == RBD_AIO_WRITE_ZEROES) {
>>>>>>>>>+        /*
>>>>>>>>>+         * RBD APIs don't allow us to write more than actual size, so in order
>>>>>>>>>+         * to support growing images, we resize the image before write
>>>>>>>>>+         * operations that exceed the current size.
>>>>>>>>>+         */
>>>>>>>>>+        if (offset + bytes > s->image_size) {
>>>>>>>>>+            int r = qemu_rbd_resize(bs, offset + bytes);
>>>>>>>>>+            if (r < 0) {
>>>>>>>>>+                return r;
>>>>>>>>>+            }
>>>>>>>>>+        }
>>>>>>>>>+    }
>>>>>>>>>+
>>>>>>>>>  r = rbd_aio_create_completion(&task,
>>>>>>>>>                                (rbd_callback_t) qemu_rbd_completion_cb, &c);
>>>>>>>>>  if (r < 0) {
>>>>>>>>>@@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
>>>>>>>>>                               int64_t bytes, QEMUIOVector *qiov,
>>>>>>>>>                               BdrvRequestFlags flags)
>>>>>>>>>{
>>>>>>>>>-    BDRVRBDState *s = bs->opaque;
>>>>>>>>>-    /*
>>>>>>>>>-     * RBD APIs don't allow us to write more than actual size, so in order
>>>>>>>>>-     * to support growing images, we resize the image before write
>>>>>>>>>-     * operations that exceed the current size.
>>>>>>>>>-     */
>>>>>>>>>-    if (offset + bytes > s->image_size) {
>>>>>>>>>-        int r = qemu_rbd_resize(bs, offset + bytes);
>>>>>>>>>-        if (r < 0) {
>>>>>>>>>-            return r;
>>>>>>>>>-        }
>>>>>>>>>-    }
>>>>>>>>>  return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE);
>>>>>>>>>}
>>>>>>>>>
>>>>>>>>>-- 2.35.1
>>>>>>>>>
>>>>>>>>
>>>>>>>>Do we really have a use case for growing rbd images?
>>>>>>>
>>>>>>>The use case is to have a qcow2 image on rbd.
>>>>>>>I don't think it's very common, but some people use it and here [1] we had a little discussion about features that could be interesting (e.g.  persistent dirty bitmaps for incremental backup).
>>>>>>>
>>>>>>>In any case the support is quite simple and does not affect other use cases since we only increase the size when we go beyond the current size.
>>>>>>>
>>>>>>>IMHO we can have it in :-)
>>>>>>>
>>>>>>
>>>>>>The QCOW2 alone doesn’t make much sense, but additional metadata might be a use case.
>>>>>
>>>>>Yep.
>>>>>
>>>>>>Be aware that the current approach will serialize requests. If there is a real use case, we might think of a better solution.
>>>>>
>>>>>Good point, but it only happens when we have to resize, so maybe it's okay for now, but I agree we could do better ;-)
>>>>
>>>>There might also be a problem if a write for a higher offset 
>>>>past eof will be executed shortly before a write to a slightly 
>>>>lower offset past eof. The second resize will fail as it would 
>>>>shrink the image. We would need proper locking to avoid this. 
>>>>Maybe we need to check if we write past eof. If yes, take a lock 
>>>>around the resize op and then check again if it’s still eof and 
>>>>only resize if true.
>>>
>>>I thought rbd_resize() was synchronous. Indeed when you said this could serialize writes it sounded like confirmation to me.
>>>
>>>Since we call rbd_resize() before rbd_aio_writev(), I thought this case could not occur.
>>>
>>>Can you please elaborate?
>>
>>Seconding this request, because if rbd_resize() is allowed to shrink data, it being asynchronous might cause data corruption.
>>
>>I’ll keep your patch because I find this highly unlikely, though: qemu_rbd_resize() itself is definitely synchronous, it can’t invoke qemu_coroutine_yield().
>>
>>The only other possibility that comes to my mind is that 
>>rbd_resize() might delay the actual resize operation, but I would 
>>still expect consecutive resize requests to be executed in order, 
>>and since we call rbd_aio_writev()/rbd_aio_write_zeroes() 
>>immediately after the rbd_resize() (with no yielding in between), 
>>everything should be executed in the order that we expect.
>
>
>Maybe my assumption of parallelism here was wrong. I was thinking of:
>
>
>Request A: write at offset (EOL + 4k).
>
>Request A: rbd_resize is invoked (size EOL + 4k)

IIUC Request B can't start until Request A calls qemu_coroutine_yield(), 
but I'm waiting for a confirmation from Hanna :-)

Thanks,
Stefano

>
>Request B: write at offset (EOL + 2k)
>
>Request B: rbd_resize is invoked (size EOL + 2k) because image_size is not yet updated
>
>Request A: rbd_resize finishes image_size is set to EOL + 4k
>
>Request B: rbd_resize fails or shrinks the image to EOL + 2k
>
>
>If this can't happen with coroutines, please ignore my concern.
>
>
>Peter
>
>
>


