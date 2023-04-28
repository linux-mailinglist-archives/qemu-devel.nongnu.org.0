Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E06F1670
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 13:14:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psM29-0003r4-EO; Fri, 28 Apr 2023 07:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psM25-0003qZ-4w
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psM22-0008U4-Qv
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682680373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rIwXzpsEeYgwGPkRxLk+Npitz0eRVuDL/9QLse3G2ZE=;
 b=euNTUwDD91qNZUUyHI4jOoa5w5oIFRzxCXPm7toNNp0KI4yIdqvkAUSMoYlTVgAOgXTu9p
 QEJ1Wp/Z/sn2e781gIxBFo0DYy/Z3k9Otu16wiHs5Ks6NgbP/a6WoEFe0hUx5RW4nwLZQK
 yMMSoBX+MdAyFKz1Hj57gm08I6QB8xM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-qRm2jdU8Nu6CtTjUG3-hCA-1; Fri, 28 Apr 2023 07:12:51 -0400
X-MC-Unique: qRm2jdU8Nu6CtTjUG3-hCA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f443ca3357so3599512f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 04:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682680370; x=1685272370;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rIwXzpsEeYgwGPkRxLk+Npitz0eRVuDL/9QLse3G2ZE=;
 b=Xg+CSa/PxHGUX7TTjipfqpBwor0RX/+6WlGiY+8vQagRQQKJqnGkjSFyoXT8dhwxnX
 vs0e7YoGIIKOVL7rI2N+Y+Es6tAO4BZ55wPwDB2bdbFLLJOfpnBz9XjMwmq0paDrX1Rz
 5yoskrSRYd7Pn3WqL5mbw9NpOWFECyahb9MhWP6+bnkRn1san0y3tGwt7wCl54qFgrTO
 HLlaJjgi45Rb8hNWu6NJbgym1sWexjH605WalvZTTYaNJxVgibzRH69+P0PUV3eJROpK
 5K9JzGp08iyvJGOeTfmOTvwINiyZOjdyYGWnzKnVWoOvsGGXujPSpq8Q12Xy8y/U8tGt
 mr2A==
X-Gm-Message-State: AC+VfDxZ95z9q7FXUp6ReIDLWEIdA2EYR5butDAukcQG8KPA6cQ6JvmM
 RfPQplxKKVsMTyrmDIGs2WTfRQMvp+mFwKtQlamoiIkChQFaSH3hL4aUPlBze/Df8Z/UFcnYPfP
 J9ZiST4VTg4QUuQWNVC1hELhb3hRjP0rXHd0uE8Vp/mtqCBq0Cpl/Qk1sTmpexH9b5dQ5zG6hyZ
 E=
X-Received: by 2002:a05:6000:50f:b0:2fa:631a:9f38 with SMTP id
 a15-20020a056000050f00b002fa631a9f38mr3984820wrf.2.1682680370226; 
 Fri, 28 Apr 2023 04:12:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4XDFJQbRN5Spw6BjMwqe9CLqnnu/QoLbWEp65pY6l9l1O9GJkYFoOqLJfWFbxsB574RfEN0w==
X-Received: by 2002:a05:6000:50f:b0:2fa:631a:9f38 with SMTP id
 a15-20020a056000050f00b002fa631a9f38mr3984794wrf.2.1682680369764; 
 Fri, 28 Apr 2023 04:12:49 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b003047ae72b14sm12522040wrl.82.2023.04.28.04.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 04:12:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PATCH] test-aio-multithread: do not use mb_read/mb_set for simple
 flags
Date: Fri, 28 Apr 2023 13:12:48 +0200
Message-Id: <20230428111248.145037-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The remaining use of mb_read/mb_set is just to force a thread to exit
eventually.  It does not order two memory accesses and therefore can be
just read/set.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-aio-multithread.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-aio-multithread.c b/tests/unit/test-aio-multithread.c
index a555cc883505..3c61526a0b46 100644
--- a/tests/unit/test-aio-multithread.c
+++ b/tests/unit/test-aio-multithread.c
@@ -202,7 +202,7 @@ static CoMutex comutex;
 
 static void coroutine_fn test_multi_co_mutex_entry(void *opaque)
 {
-    while (!qatomic_mb_read(&now_stopping)) {
+    while (!qatomic_read(&now_stopping)) {
         qemu_co_mutex_lock(&comutex);
         counter++;
         qemu_co_mutex_unlock(&comutex);
@@ -236,7 +236,7 @@ static void test_multi_co_mutex(int threads, int seconds)
 
     g_usleep(seconds * 1000000);
 
-    qatomic_mb_set(&now_stopping, true);
+    qatomic_set(&now_stopping, true);
     while (running > 0) {
         g_usleep(100000);
     }
@@ -327,7 +327,7 @@ static void mcs_mutex_unlock(void)
 
 static void test_multi_fair_mutex_entry(void *opaque)
 {
-    while (!qatomic_mb_read(&now_stopping)) {
+    while (!qatomic_read(&now_stopping)) {
         mcs_mutex_lock();
         counter++;
         mcs_mutex_unlock();
@@ -355,7 +355,7 @@ static void test_multi_fair_mutex(int threads, int seconds)
 
     g_usleep(seconds * 1000000);
 
-    qatomic_mb_set(&now_stopping, true);
+    qatomic_set(&now_stopping, true);
     while (running > 0) {
         g_usleep(100000);
     }
@@ -383,7 +383,7 @@ static QemuMutex mutex;
 
 static void test_multi_mutex_entry(void *opaque)
 {
-    while (!qatomic_mb_read(&now_stopping)) {
+    while (!qatomic_read(&now_stopping)) {
         qemu_mutex_lock(&mutex);
         counter++;
         qemu_mutex_unlock(&mutex);
@@ -411,7 +411,7 @@ static void test_multi_mutex(int threads, int seconds)
 
     g_usleep(seconds * 1000000);
 
-    qatomic_mb_set(&now_stopping, true);
+    qatomic_set(&now_stopping, true);
     while (running > 0) {
         g_usleep(100000);
     }
-- 
2.40.0


