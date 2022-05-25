Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DBC53445E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:39:55 +0200 (CEST)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwrK-0002EU-82
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwh0-0004uj-8F
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgy-0003qC-NY
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkUlZaj01t2bCfTppKPLk/Ku3NdW+VbBibGk84xlesw=;
 b=aAarSp0jRCT3qDOalhCFwqSQ8INnF/fqrJfU5H/rJ1QDb2U5sJTp+0XLY9MVYUHWZktxQQ
 KD9baCt1uruT+LMo9MuCuofAGQPpyB81DiWRNK/o/dK3bV/ZGHUNE/XrI2p2X0TFm3vPUd
 F+28kMVBAsMEds5uMQTdRffmKo/wqsE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-yTJnJVXfPkKgcPe8_mR-Jw-1; Wed, 25 May 2022 15:29:10 -0400
X-MC-Unique: yTJnJVXfPkKgcPe8_mR-Jw-1
Received: by mail-ej1-f71.google.com with SMTP id
 gs6-20020a170906f18600b006fe7a9ffacbso9893286ejb.3
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkUlZaj01t2bCfTppKPLk/Ku3NdW+VbBibGk84xlesw=;
 b=BLqdtSlppaXLc3l7uhKlNiuOkjRzg5AD/v6IIv/HqVj367JuLt7klP450U7AxqHJmp
 uoodMwIld+uoLnPAVqmhuYfAnYWTDSwuHSPaMVTjuqrt76g/PcEh+yhgIwtz4VeQDzGL
 SRQIzn2tefixHck7PCCMsA0jdvv467ohiQkzsvzFDZ3MJ+Tnx/U5an60SDWiqZfMHfE0
 4fArRplh+WLOkPmsz3J7aFxxcaMAKPKm7cEkp2pFYlIEUKJpZCbRnQFTLH5bsrnogU/d
 Ysp2IXAheDA7dK0TSj7H8cmGmKACLU+vSlo7OxOADTQ9MlqZpdCbOfw6TTANi6UjWx8d
 7+VQ==
X-Gm-Message-State: AOAM533K3DlftQwpjqglIghK6RsXfYDGeV6uqCrF4lWIIjgc9AeQfvp2
 b6obiI06YQEJcRMsYF6eQFZkvZgSN1KniaGDzNWdqSrYJ8yO4E9tHSm5Gj86nNrZ+1dbvgPSZUv
 25MyS9xHk5DSsLMtezoUnC6igfULtV6nNO+lhACdpgJvuylBY/aTr17Cb7focsvSkaNg=
X-Received: by 2002:a05:6402:370c:b0:42a:adfa:9150 with SMTP id
 ek12-20020a056402370c00b0042aadfa9150mr36180278edb.57.1653506948177; 
 Wed, 25 May 2022 12:29:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5HQEU/sgYYRFjLfpVLF/p41umNAM8fm4Qd+eVdifB2xNEEJqHDtajXat1n6VKzazh3D5TLg==
X-Received: by 2002:a05:6402:370c:b0:42a:adfa:9150 with SMTP id
 ek12-20020a056402370c00b0042aadfa9150mr36180263edb.57.1653506947928; 
 Wed, 25 May 2022 12:29:07 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 gv45-20020a1709072bed00b006fe9e717143sm6770986ejc.94.2022.05.25.12.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: [PULL 05/17] thread-pool: remove stopping variable
Date: Wed, 25 May 2022 21:28:40 +0200
Message-Id: <20220525192852.301633-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Message-Id: <20220514065012.1149539-4-pbonzini@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 6e3d4e4a2f..31113b5860 100644
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
2.36.1



