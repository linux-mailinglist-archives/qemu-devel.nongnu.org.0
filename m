Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A44490ACC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:53:58 +0100 (CET)
Received: from localhost ([::1]:57022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9TOP-0005Br-G7
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:53:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n9SvW-0005N4-9e
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:24:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n9SvT-0003sA-9L
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642429442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v0MYrwTxN26u/ssoscmPZrGEi61IZwPDgVQsQKg5zTU=;
 b=ICo967XCQSXdr7fLCESAntwA6wXXWJlYIbuux0mRweN+gPSjKkj1AQL80ivsac02GUNfdT
 oMK6UxbpsXaGBlHI4zy4InqBsMn0qGT7r0BhM4f6mHU3+sjl8ZSB52/g3ALJ8O6hlJu4E3
 6jHxRQPtjVjAxqQafIis9EvtyKpsxBQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-4tmnevu9PcCGm_iE53C2EA-1; Mon, 17 Jan 2022 09:23:55 -0500
X-MC-Unique: 4tmnevu9PcCGm_iE53C2EA-1
Received: by mail-qk1-f199.google.com with SMTP id
 z191-20020a3765c8000000b00478d7915c95so13480878qkb.9
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 06:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v0MYrwTxN26u/ssoscmPZrGEi61IZwPDgVQsQKg5zTU=;
 b=AoZRChFpG6yoRjqXmlbLrVF5RFqnyjFH4A/bGePGFe6QZ3DT8COmVvoOlgvezeaXZb
 txpJfFTaFAoY0MISSQnPCKm4zBcgis0iz0O0SCGNPsKWoP6+2SSQ304Bk6Gv1e7p+DEx
 DM2uzYCbTWffgLG9ER5iQeTwI9oxzt5jlMys9RH+YI1q6tWiwjDarGnXZgOnRzNo8ABB
 bHMQMM0CueGnPbwAk70n8zWvAB1SL+O9iGA4/lYb8uh2Bu9Il5TT9CVcD7NRARpIy75c
 2fsjNQUXKReVSil8gnu0ROrFEsOU8USm02/ZZ+QSgK4ZXN/nZsAMAYhzi/yV8YPb4y6e
 Dqqw==
X-Gm-Message-State: AOAM530Tqmsgv3vXxyhcn9JpnQjZsZ4+1JaHmC8f3EUMkplvkg6hzVx2
 G5AF4BGoNm/baLjY+lKaKr4AThEr31wPdk2A1Ofw71SvK1BPaHVu7aOF3b7vNlZvIjdO5zZvByE
 SbZoiyCFegobLFL0=
X-Received: by 2002:a05:620a:13f7:: with SMTP id
 h23mr14442141qkl.771.1642429435097; 
 Mon, 17 Jan 2022 06:23:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtExeVOe6Ywckivn3Luts2+BXBjLU0qoFCIhEC7bPwDMqVPeQPV1gbAMDLlk5QmpaIvDZsVw==
X-Received: by 2002:a05:620a:13f7:: with SMTP id
 h23mr14442127qkl.771.1642429434854; 
 Mon, 17 Jan 2022 06:23:54 -0800 (PST)
Received: from steredhat (host-95-238-125-214.retail.telecomitalia.it.
 [95.238.125.214])
 by smtp.gmail.com with ESMTPSA id h9sm9057175qkp.106.2022.01.17.06.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:23:54 -0800 (PST)
Date: Mon, 17 Jan 2022 15:23:48 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V2 for-6.2 2/2] block/rbd: workaround for ceph issue #53784
Message-ID: <20220117142348.oq3gcr6wsxxo3owa@steredhat>
References: <20220113144426.4036493-1-pl@kamp.de>
 <20220113144426.4036493-3-pl@kamp.de>
MIME-Version: 1.0
In-Reply-To: <20220113144426.4036493-3-pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 ct@flyingcircus.io, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, pbonzini@redhat.com, idryomov@gmail.com,
 idryomov@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 03:44:26PM +0100, Peter Lieven wrote:
>librbd had a bug until early 2022 that affected all versions of ceph that
>supported fast-diff. This bug results in reporting of incorrect offsets
>if the offset parameter to rbd_diff_iterate2 is not object aligned.
>
>This patch works around this bug for pre Quincy versions of librbd.
>

I'm not sure, but maybe we could add the fixes tag also to this patch, 
since without this workaround we can have issues with buggy librbd.

Fixes: 0347a8fd4c3faaedf119be04c197804be40a384b

>Cc: qemu-stable@nongnu.org
>Signed-off-by: Peter Lieven <pl@kamp.de>
>---
> block/rbd.c | 42 ++++++++++++++++++++++++++++++++++++++++--
> 1 file changed, 40 insertions(+), 2 deletions(-)

Tested-by: Stefano Garzarella <sgarzare@redhat.com>


>
>diff --git a/block/rbd.c b/block/rbd.c
>index 20bb896c4a..d174d51659 100644
>--- a/block/rbd.c
>+++ b/block/rbd.c
>@@ -1320,6 +1320,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>     int status, r;
>     RBDDiffIterateReq req = { .offs = offset };
>     uint64_t features, flags;
>+    uint64_t head = 0;
>
>     assert(offset + bytes <= s->image_size);
>
>@@ -1347,7 +1348,43 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>         return status;
>     }
>
>-    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
>+#if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 17, 0)
>+    /*
>+     * librbd had a bug until early 2022 that affected all versions of ceph that
>+     * supported fast-diff. This bug results in reporting of incorrect offsets
>+     * if the offset parameter to rbd_diff_iterate2 is not object aligned.
>+     * Work around this bug by rounding down the offset to object boundaries.
>+     * This is OK because we call rbd_diff_iterate2 with whole_object = true.
>+     * However, this workaround only works for non cloned images with default
>+     * striping.
>+     *
>+     * See: https://tracker.ceph.com/issues/53784
>+     */
>+
>+    /*  check if RBD image has non-default striping enabled */
>+    if (features & RBD_FEATURE_STRIPINGV2) {
>+        return status;
>+    }
>+
>+#pragma GCC diagnostic push
>+#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>+    /*
>+     * check if RBD image is a clone (= has a parent).
>+     *
>+     * rbd_get_parent_info is deprecated from Nautilus onwards, but the
>+     * replacement rbd_get_parent is not present in Luminous and Mimic.
>+     */
>+    if (rbd_get_parent_info(s->image, NULL, 0, NULL, 0, NULL, 0) != -ENOENT) {
>+        return status;
>+    }
>+#pragma GCC diagnostic pop
>+
>+    head = req.offs & (s->object_size - 1);
>+    req.offs -= head;
>+    bytes += head;
>+#endif
>+
>+    r = rbd_diff_iterate2(s->image, NULL, req.offs, bytes, true, true,
>                           qemu_rbd_diff_iterate_cb, &req);
>     if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
>         return status;
>@@ -1366,7 +1403,8 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>         status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
>     }
>
>-    *pnum = req.bytes;
>+    assert(req.bytes > head);
>+    *pnum = req.bytes - head;
>     return status;
> }
>
>-- 
>2.25.1
>
>
>


