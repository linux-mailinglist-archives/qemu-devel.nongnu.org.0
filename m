Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BCE524AE5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:59:14 +0200 (CEST)
Received: from localhost ([::1]:33324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6XJ-0004bQ-Nx
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1np6Ia-0004JA-QD
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:44:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1np6IZ-0003Jo-3x
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652352238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/12CmEbLbHXUJxd3DGB69n0aydSWt4UrIgscf0xzh0=;
 b=QuN3F3jI7rKwpWiWFBiC9HeuEhstS3voskgxeWoVDQ1aGUuPGE0IfGKebq1WxhLj8mTjrl
 UAW1NTz5EpdQqaWneLL93SoCXexTKQLce5tmn6imHV5dMlO5cyC5Wsi1tOfnBi8iIkw+oz
 zi64Z8CoTlHQ8IJppYzXk9aWlKKy87g=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-5W4H-A-9NTyTVrX_9prC2g-1; Thu, 12 May 2022 06:43:57 -0400
X-MC-Unique: 5W4H-A-9NTyTVrX_9prC2g-1
Received: by mail-ej1-f72.google.com with SMTP id
 p7-20020a170906614700b006f87f866117so2630427ejl.21
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 03:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/12CmEbLbHXUJxd3DGB69n0aydSWt4UrIgscf0xzh0=;
 b=K+VHYl81XfYfJdCaJWtbe6SV4j0NiuDFsPTjZI0CZGvISsICGuQaImNAJo8IIP4k+e
 ldqrKFP1x/6cYIVzIuo509KG8060CSwqSJe8EL0zgCa36o6ByuHPYFCeJQy4pxeckkMV
 G9kne8fvffhsiSVYW7rBXwmOrfGP8NXNDtoCB7/q07J/AOY8IG4J/DY9Ps4mdi8bq+H1
 imuTHmZt8EZ5CHfX/a2PiEI+gn9X2Xjfb9/5srzj8Qfu05xcpMPiR0KgFzJjCPTwWXtj
 pP8EflBdmKxejGRC8U6ovXUGbxE1Q33M1JuNXvU39D6LrXNi+2/ha9m1tF8iNFzI7wer
 Tn5w==
X-Gm-Message-State: AOAM533kyuu/TjYl7VJ0h/xe4y2JQFmcuTO70z7QruewILoRNf2W0yL6
 cnlMTW6ssbgj63E4XB38uDMbWUewTtp2KKxspGMOz9J+vXYyUXIuhuP3dek/o6UtH8xb2XvkfXO
 F3mTTLMm9eiLJeJUdHCck5oKEeRA4MSb2+Q9UOBqtM2vlel8JiIowUP8aNFUErpyZQsU=
X-Received: by 2002:a17:907:7e99:b0:6fd:c2a2:9620 with SMTP id
 qb25-20020a1709077e9900b006fdc2a29620mr10571766ejc.554.1652352235649; 
 Thu, 12 May 2022 03:43:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLBg9wf4bCAdIxp5azFjsoy4O/DMS5lKXXEeWhJ7ZcH+12spZ0qZTOpfmIVnYBBZpanJW/Fg==
X-Received: by 2002:a17:907:7e99:b0:6fd:c2a2:9620 with SMTP id
 qb25-20020a1709077e9900b006fdc2a29620mr10571748ejc.554.1652352235425; 
 Thu, 12 May 2022 03:43:55 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a1709060fc300b006f3ef214e16sm1957238ejk.124.2022.05.12.03.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 03:43:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: nsaenzju@redhat.com,
	stefanha@redhat.com
Subject: [PATCH v2 3/3] thread-pool: remove stopping variable
Date: Thu, 12 May 2022 12:43:46 +0200
Message-Id: <20220512104346.865536-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512104346.865536-1-pbonzini@redhat.com>
References: <20220512104346.865536-1-pbonzini@redhat.com>
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
index da189d9338..392c7d7843 100644
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
 
@@ -366,7 +365,7 @@ void thread_pool_free(ThreadPool *pool)
     pool->new_threads = 0;
 
     /* Wait for worker threads to terminate */
-    pool->stopping = true;
+    pool->max_threads = 0;
     qemu_cond_broadcast(&pool->request_cond);
     while (pool->cur_threads > 0) {
         qemu_cond_wait(&pool->worker_stopped, &pool->lock);
-- 
2.36.0


