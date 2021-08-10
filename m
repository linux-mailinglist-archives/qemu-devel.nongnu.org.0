Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA33E560A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:56:04 +0200 (CEST)
Received: from localhost ([::1]:36590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNYH-0000M6-Q2
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mDNTy-0002t6-Re
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mDNTv-0003Ze-2n
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628585489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=geZMj4TqiWSEAmTEUELSLdIUTjOgb6krTdjcP+ebyTY=;
 b=RWdG52a8Wnql/uog75qwejgcFDVWhh6HXPm19n7FVOpsWd9hGbGZ7LnJg1jXtT0FiiMkx1
 /yJV5FJ97Qr3DXGr2fvdH3KFPqFw2HAeNov6ew13E5IdxSn7CO6Fy81PfW2n0HogL7MoWd
 wiFz2psrO09973f6K6dQcjyNJ4oLOww=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-xr6_Nk8sPy2xbXL8_ZTyeg-1; Tue, 10 Aug 2021 04:51:28 -0400
X-MC-Unique: xr6_Nk8sPy2xbXL8_ZTyeg-1
Received: by mail-ej1-f69.google.com with SMTP id
 q19-20020a170906b293b029058a1e75c819so5297700ejz.16
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=geZMj4TqiWSEAmTEUELSLdIUTjOgb6krTdjcP+ebyTY=;
 b=RV+8/HEnuvkIpchvPopvto7NOVw9NJtr5UwG5Zc8gHefnBP/q4C9i5pep4IHRA3C/Q
 q1RlkmrozB70MKcLohjYAjSpudB+Bgl+pA2uOUheAa10+UODScmMG5nLG8CIPQgMw21o
 RJ+do6DkYfxjWyafJVKKkbcBaiXe4GDZkwzHpNKF5tCLBNx2hNfgvQtOEA3KERTwUKQb
 WSsDy9jakFOhX+gMsqLkMYE6Qjmf3qm9+fB8sG5LWN3m9jrQPw0NqCX4eyaxTd/OZ8dB
 knrqYFvcezdPAB/rz9noAE7hbpKj7yEclE1AmUinHYdnxugbDD9rFDLQgbxS2uCvYfkD
 wfJQ==
X-Gm-Message-State: AOAM5321XqWKnP4TTovsZLdX9PL3LasRZvfih4Vfzi8gFJwWEA56ftvs
 lWrlEyfHYrJC4HHSkiumhkblhLC3piXnSTwvXET/FsyscoLF5g96GQH+lWE3oZhbrWdF73iAk/X
 pTJn0kSJscC+Gk2M=
X-Received: by 2002:a17:906:38db:: with SMTP id
 r27mr7552066ejd.338.1628585487164; 
 Tue, 10 Aug 2021 01:51:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGAtvlVhbZ5O2EC2hybo93g8LPEEm+3zqybRCUQUqijR6RHi8/hnWMfoCHhmYirao588NdkQ==
X-Received: by 2002:a17:906:38db:: with SMTP id
 r27mr7552048ejd.338.1628585486919; 
 Tue, 10 Aug 2021 01:51:26 -0700 (PDT)
Received: from steredhat (a-nu5-14.tin.it. [212.216.181.13])
 by smtp.gmail.com with ESMTPSA id b25sm9338990edv.9.2021.08.10.01.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:51:26 -0700 (PDT)
Date: Tue, 10 Aug 2021 10:51:24 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH] block/rbd: implement bdrv_co_block_status
Message-ID: <20210810085124.iwyd3g2jms6suzpi@steredhat>
References: <20210809134136.23140-1-pl@kamp.de>
MIME-Version: 1.0
In-Reply-To: <20210809134136.23140-1-pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, ct@flyingcircus.io, mreitz@redhat.com,
 pbonzini@redhat.com, idryomov@gmail.com, idryomov@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 09, 2021 at 03:41:36PM +0200, Peter Lieven wrote:

Please, can you add a description?
For example also describing what happens if RBD image does not support 
RBD_FEATURE_FAST_DIFF.

>Signed-off-by: Peter Lieven <pl@kamp.de>
>---
> block/rbd.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 119 insertions(+)
>
>diff --git a/block/rbd.c b/block/rbd.c
>index dcf82b15b8..ef1eaa6af3 100644
>--- a/block/rbd.c
>+++ b/block/rbd.c
>@@ -88,6 +88,7 @@ typedef struct BDRVRBDState {
>     char *namespace;
>     uint64_t image_size;
>     uint64_t object_size;
>+    uint64_t features;
> } BDRVRBDState;
>
> typedef struct RBDTask {
>@@ -983,6 +984,14 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>     s->image_size = info.size;
>     s->object_size = info.obj_size;
>
>+    r = rbd_get_features(s->image, &s->features);
>+    if (r < 0) {
>+        error_setg_errno(errp, -r, "error getting image features from %s",
>+                         s->image_name);
>+        rbd_close(s->image);
>+        goto failed_open;
           ^
You can use `failed_post_open` label here, so you can avoid to call 
rbd_close().

>+    }
>+
>     /* If we are using an rbd snapshot, we must be r/o, otherwise
>      * leave as-is */
>     if (s->snap != NULL) {
>@@ -1259,6 +1268,115 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
>     return spec_info;
> }
>
>+typedef struct rbd_diff_req {
>+    uint64_t offs;
>+    uint64_t bytes;
>+    int exists;
>+} rbd_diff_req;
>+
>+static int qemu_rbd_co_block_status_cb(uint64_t offs, size_t len,
>+                                       int exists, void *opaque)
>+{
>+    struct rbd_diff_req *req = opaque;
>+
>+    assert(req->offs + req->bytes <= offs);
>+    assert(offs >= req->offs + req->bytes);

I think just one of the two asserts is enough, isn't that the same 
condition?

>+
>+    if (req->exists && offs > req->offs + req->bytes) {
>+        /*
>+         * we started in an allocated area and jumped over an unallocated area,
>+         * req->bytes contains the length of the allocated area before the
>+         * unallocated area. stop further processing.
>+         */
>+        return -9000;
                  ^
What is this magical value?

Please add a macro (with a comment) and also use it below in other 
places.

>+    }
>+    if (req->exists && !exists) {
>+        /*
>+         * we started in an allocated area and reached a hole.  
>req->bytes
>+         * contains the length of the allocated area before the hole.
>+         * stop further processing.
>+         */
>+        return -9000;
>+    }
>+    if (!req->exists && exists && offs > req->offs) {
>+        /*
>+         * we started in an unallocated area and hit the first allocated
>+         * block. req->bytes must be set to the length of the unallocated area
>+         * before the allocated area. stop further processing.
>+         */
>+        req->bytes = offs - req->offs;
>+        return -9000;
>+    }
>+
>+    /*
>+     * assert that we catched all cases above and allocation state has not
>+     * changed during callbacks.
>+     */
>+    assert(exists == req->exists || !req->bytes);
>+    req->exists = exists;
>+
>+    /*
>+     * assert that we either return an unallocated block or have got callbacks
>+     * for all allocated blocks present.
>+     */
>+    assert(!req->exists || offs == req->offs + req->bytes);
>+    req->bytes = offs + len - req->offs;
>+
>+    return 0;
>+}
>+
>+static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>+                                                 bool want_zero, int64_t offset,
>+                                                 int64_t bytes, int64_t *pnum,
>+                                                 int64_t *map,
>+                                                 BlockDriverState **file)
>+{
>+    BDRVRBDState *s = bs->opaque;
>+    int ret, r;
>+    struct rbd_diff_req req = { .offs = offset };
>+
>+    assert(offset + bytes <= s->image_size);
>+
>+    /* default to all sectors allocated */
>+    ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
>+    if (map) {
>+        *map = offset;
>+    }
>+    *pnum = bytes;
>+
>+    /* RBD image does not support fast-diff */
>+    if (!(s->features & RBD_FEATURE_FAST_DIFF)) {
>+        goto out;
>+    }
>+
>+    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
>+                          qemu_rbd_co_block_status_cb, &req);
>+    if (r < 0 && r != -9000) {
>+        goto out;
>+    }
>+    assert(req.bytes <= bytes);
>+    if (!req.exists) {
>+        if (r == 0 && !req.bytes) {
>+            /*
>+             * rbd_diff_iterate2 does not invoke callbacks for 
>unallocated areas
>+             * except for the case where an overlay has a hole where 
>the parent
>+             * has not. This here catches the case where no callback 
>was
>+             * invoked at all.
>+             */
>+            req.bytes = bytes;
>+        }
>+        ret &= ~BDRV_BLOCK_DATA;
>+        ret |= BDRV_BLOCK_ZERO;
>+    }
>+    *pnum = req.bytes;
>+
>+out:
>+    if (ret > 0 && ret & BDRV_BLOCK_OFFSET_VALID && file) {

Can ret be zero at this point?
Doesn't BDRV_BLOCK_OFFSET_VALID always stay set?

Thanks,
Stefano


