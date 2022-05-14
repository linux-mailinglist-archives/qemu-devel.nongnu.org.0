Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9348C526E5D
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 08:56:34 +0200 (CEST)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nplhZ-0002f0-MN
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 02:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nplbd-0008Eg-3b
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:50:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nplbb-0007gt-Ja
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652511023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edU4OXAwzh264fIq2BVPPoCPtmc3OUf+gsAgJ6ZekKs=;
 b=cXsw9GJnyrO0xSolACVquzZzs0LIK9NzcWdZb0hzJdMyAAxWmSE9VFo0frFmtflvviLlz+
 ZSdY1bwhVOgFgvhIyUyb/UnDg2w4fswXPzZ5YEMUhtNUWnJHRWri41UROXDzXFIC2XMp2N
 2LsQg8FTeGmtIBc4x8BK0puKVQD5AAo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-45hPsQ_gNEi0TloNbX0lqw-1; Sat, 14 May 2022 02:50:21 -0400
X-MC-Unique: 45hPsQ_gNEi0TloNbX0lqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g14-20020a1c4e0e000000b0039425ef54d6so3839290wmh.9
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 23:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edU4OXAwzh264fIq2BVPPoCPtmc3OUf+gsAgJ6ZekKs=;
 b=A0xu7tQeLAip4gkL0S1yoeKPKfpO+uIpSNxM47qNFBZXBnms1YlR2K2vTAnGTFl+iK
 u1vWI6fMfueic5GP4StRfzYl2n6PUk97w5/g5qHLRldSCI2nPRIr89jABzsYWFSNayHA
 D3Gxf+X4KVgdxLI5EbZaDvKKcDAlJMlY9exlgfLqzIYHmd7cINkk3H9vkvoL7vQTasuY
 oS+KbP+lb5nltsI9kPx2Jgmiucy6XjYtn38lj/p7RWkFORY5L8rHOrYIwo+tK68lKqUV
 IOVJuP+Rgd8J1hV0U6LZoXSCmdBftGUMQDsYnxrCLXEWBI3itdiVCcInemdGLgJIRhXS
 Syyw==
X-Gm-Message-State: AOAM533nc//wv+q03nvrp+rP32z6uQmYkBlfYpX5vw/k14W7zMbcH3r3
 mO+cy5xIqAZvwtWxLqauYbI3jGvuVXHmBKs/H+OHiu9oiLeqDdqmvs9YEgMvqP1qAWQeRpwe2xt
 XW4dkkSEKhY2wlGICk/tJgqJxKPMxYWf48638ZCpEfCBeBdSr3lyFqcL0vvCi9R4NuOk=
X-Received: by 2002:a05:600c:3b10:b0:394:69a0:9d73 with SMTP id
 m16-20020a05600c3b1000b0039469a09d73mr7600502wms.193.1652511020010; 
 Fri, 13 May 2022 23:50:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUWFldmOZy3bydDHwX3l44L/qHR92KxMTACUgjxcaK8hv1SnQ8XDlYWSjM+h2+BP2hZexuRA==
X-Received: by 2002:a05:600c:3b10:b0:394:69a0:9d73 with SMTP id
 m16-20020a05600c3b1000b0039469a09d73mr7600481wms.193.1652511019720; 
 Fri, 13 May 2022 23:50:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 h16-20020adfaa90000000b0020c5253d8d4sm3799550wrc.32.2022.05.13.23.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 23:50:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	nsaenzju@redhat.com
Subject: [PATCH v3 3/3] thread-pool: remove stopping variable
Date: Sat, 14 May 2022 08:50:12 +0200
Message-Id: <20220514065012.1149539-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220514065012.1149539-1-pbonzini@redhat.com>
References: <20220514065012.1149539-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just setting the max threads to 0 is enough to stop all workers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 6bbf24754a..507c998827 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -69,7 +69,6 @@ struct ThreadPool {
     int idle_threads;
     int new_threads;     /* backlog of threads we need to create */
     int pending_threads; /* threads created but not running yet */
-    bool stopping;
     int min_threads;
     int max_threads;
 };
@@ -82,7 +81,7 @@ static void *worker_thread(void *opaque)
     pool->pending_threads--;
     do_spawn_thread(pool);
 
-    while (!pool->stopping && pool->cur_threads <= pool->max_threads) {
+    while (pool->cur_threads <= pool->max_threads) {
         ThreadPoolElement *req;
         int ret;
 
@@ -370,7 +369,7 @@ void thread_pool_free(ThreadPool *pool)
     pool->new_threads = 0;
 
     /* Wait for worker threads to terminate */
-    pool->stopping = true;
+    pool->max_threads = 0;
     qemu_cond_broadcast(&pool->request_cond);
     while (pool->cur_threads > 0) {
         qemu_cond_wait(&pool->worker_stopped, &pool->lock);
-- 
2.36.0


