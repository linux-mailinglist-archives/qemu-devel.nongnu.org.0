Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1225E5E27
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:10:00 +0200 (CEST)
Received: from localhost ([::1]:37368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIDW-0001iX-QG
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtn-0004HH-Hk
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtj-000372-TG
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXUPCEKsOWKG9QuHsF9Ng0OAJFz0RxXDrXgSaXJGzLc=;
 b=alK040UcuVSRE5ufVMD9plwMPDUuATRf1Zm/0uwd5LbQOf/jupIw+4S3Oe26Woex3KTVn8
 6+yESY3gDEW83cVjfRQ6O6OhBpW/P/3nzC2eRpodAeAwdBTmEcCR2+MuHuUCWAlqJsJG8w
 uaZCt1hCx5REMYQpIuJPdUtxN2AQwcU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-c_sh_XnTPMOygnDKkP1Cdw-1; Thu, 22 Sep 2022 04:49:29 -0400
X-MC-Unique: c_sh_XnTPMOygnDKkP1Cdw-1
Received: by mail-ej1-f69.google.com with SMTP id
 sh31-20020a1709076e9f00b00781c4e720feso3758293ejc.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LXUPCEKsOWKG9QuHsF9Ng0OAJFz0RxXDrXgSaXJGzLc=;
 b=IsZW2XncnvW4VcuCOoD6Jv9RKC5ilBZa/VTCEQqfRvUXR9luKUfgvpMXw3EKrjloco
 ti59DZCJhSeBkYxTcTfsCZx0ePeAkFZ6LK1N0/cydims/NxIagAAX4nE9EhAd5HvPSNl
 dmstHreU2MeBydmCL8RzDLEPeZI06yzoRq6GN5If5unzikM6SsYDeFavKGTWVjQxdvuN
 V/POHsFPB7QKeaaPS8ulA5JRONjuwAsmHyfoqHu2A+2AfYhFSF3oeSX7hVp8aJRNtDx0
 MM9XFe0skvXMKuBSalUy1j4YCo11NbaQfDjYe9gPcPfihc/sYbvo5hGtNGmuFusKuid1
 ZiUg==
X-Gm-Message-State: ACrzQf32YrVWGc2lowzRPzuCkPdizHvqlA8RrwTZrZ4EZB9jOh5fOLdx
 DkaeTZB4ACfyKjhfz3VPwWTnEVIf9xZXn8mtU2FbVZ2KaoLbZPWvV4KS1eKeWaZyNd1q6h1Lraa
 E/TEUq9f/U5BFEVGFz5ddtLy5uo0ZQKwfhygu6hC5RY687aIFuTAIZFBFRBvaLXSjoj8=
X-Received: by 2002:aa7:cb4f:0:b0:453:88d0:bed0 with SMTP id
 w15-20020aa7cb4f000000b0045388d0bed0mr2135427edt.127.1663836567436; 
 Thu, 22 Sep 2022 01:49:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77RCRb22hM+UzOgb3JVupCTDDGnUrz21Q1jonC9M5Sc5ud7ZLtmrDKndsxrrndSynL2cA+4Q==
X-Received: by 2002:aa7:cb4f:0:b0:453:88d0:bed0 with SMTP id
 w15-20020aa7cb4f000000b0045388d0bed0mr2135407edt.127.1663836567217; 
 Thu, 22 Sep 2022 01:49:27 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a056402079600b0044625884285sm3228003edy.49.2022.09.22.01.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 01/26] block/nvme: separate nvme_get_free_req cases for
 coroutine/non-coroutine context
Date: Thu, 22 Sep 2022 10:48:59 +0200
Message-Id: <20220922084924.201610-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nvme_get_free_req has very difference semantics when called in
coroutine context (where it waits) and in non-coroutine context
(where it doesn't).  Split the two cases to make it clear what
is being requested.

Cc: qemu-block@nongnu.org
Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nvme.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 01fb28aa63..3e6abef1ce 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -293,34 +293,42 @@ static void nvme_kick(NVMeQueuePair *q)
     q->need_kick = 0;
 }
 
-/* Find a free request element if any, otherwise:
- * a) if in coroutine context, try to wait for one to become available;
- * b) if not in coroutine, return NULL;
- */
-static NVMeRequest *nvme_get_free_req(NVMeQueuePair *q)
+static NVMeRequest *nvme_get_free_req_nofail_locked(NVMeQueuePair *q)
 {
     NVMeRequest *req;
 
-    qemu_mutex_lock(&q->lock);
-
-    while (q->free_req_head == -1) {
-        if (qemu_in_coroutine()) {
-            trace_nvme_free_req_queue_wait(q->s, q->index);
-            qemu_co_queue_wait(&q->free_req_queue, &q->lock);
-        } else {
-            qemu_mutex_unlock(&q->lock);
-            return NULL;
-        }
-    }
-
     req = &q->reqs[q->free_req_head];
     q->free_req_head = req->free_req_next;
     req->free_req_next = -1;
-
-    qemu_mutex_unlock(&q->lock);
     return req;
 }
 
+/* Return a free request element if any, otherwise return NULL.  */
+static NVMeRequest *nvme_get_free_req_nowait(NVMeQueuePair *q)
+{
+    QEMU_LOCK_GUARD(&q->lock);
+    if (q->free_req_head == -1) {
+        return NULL;
+    }
+    return nvme_get_free_req_nofail_locked(q);
+}
+
+/*
+ * Wait for a free request to become available if necessary, then
+ * return it.
+ */
+static coroutine_fn NVMeRequest *nvme_get_free_req(NVMeQueuePair *q)
+{
+    QEMU_LOCK_GUARD(&q->lock);
+
+    while (q->free_req_head == -1) {
+       trace_nvme_free_req_queue_wait(q->s, q->index);
+       qemu_co_queue_wait(&q->free_req_queue, &q->lock);
+    }
+
+    return nvme_get_free_req_nofail_locked(q);
+}
+
 /* With q->lock */
 static void nvme_put_free_req_locked(NVMeQueuePair *q, NVMeRequest *req)
 {
@@ -506,7 +514,7 @@ static int nvme_admin_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
     AioContext *aio_context = bdrv_get_aio_context(bs);
     NVMeRequest *req;
     int ret = -EINPROGRESS;
-    req = nvme_get_free_req(q);
+    req = nvme_get_free_req_nowait(q);
     if (!req) {
         return -EBUSY;
     }
-- 
2.37.3


