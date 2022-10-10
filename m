Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC45FA317
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:02:00 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohx6F-0007RK-Pt
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbQ-00027Z-Qe
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbM-0006ji-9N
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wr3TVnZ7tk/u0Lm4bIhIKs4gYKeGgKd9uCvxQFfv5EM=;
 b=d9WXmRBdycEvi3VLKKaSkBZ5t9wr4wLBvEfZxjodT6O/D/RJ4p7/BaZzX2t97j2GsulZBZ
 C6oW8l2gpuP8KvimNYuHgUok2VHe2CLkWu8Y6sc/ijJPSJoGGiH0ViK8DXyT+T4edCeFwD
 +UmB/b0GdJUgt/YpOMCnwFkBCseGWRw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-nPJt9wF4Oom_ktKMfcPCNw-1; Mon, 10 Oct 2022 13:30:02 -0400
X-MC-Unique: nPJt9wF4Oom_ktKMfcPCNw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i5-20020a1c3b05000000b003c47c8569easo4143320wma.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wr3TVnZ7tk/u0Lm4bIhIKs4gYKeGgKd9uCvxQFfv5EM=;
 b=62wHyI6kgeR2fOAznaYNAcp+Sms7dUZQw0REfQlKlX+gGPb4nXtHbWzc6Zp1mUWkQB
 WT/CXvxSWI7MtoD6q7lZAi3q/kuxkEsNUa0e42sPa8selVt6VsY+SoZCyvEyt4AtDhUe
 Tw1hoEbK0ivbS45gPdp2r0KH+BeiiswYdUO2BxV3SFxNmocUZ0dyLMTOyzVLxCslssNK
 LMb/nUqKhqB4TiD7uOS0OmksMeL0hXOrilgzJWqgrdRbRbVMeQstQLfv0pF61MaqIdQJ
 MDMfdgB+IRVnR5pSHTGmagpYCfuzCeWAxppfYiUba2XUCYm0H5guW6I4o3FIU/dEafY4
 khrw==
X-Gm-Message-State: ACrzQf26ijHEX64YmDZyR8JHVEAFUaBuEj1YaxbRbG31ajY5UJKTV1cR
 ygNQ4b0w9Vpv/sGnRF8XVJu/llHnSXiXsGrtjCXTIlGR4vtJ2G/LxMBgtzt58/hy14SlRWufyhM
 nh2rRvAIjryO2VQx299i3pjsyQ3ZVUydZrifuXlUWtTRMuC+ZjOcr+WtKc0vD
X-Received: by 2002:a05:600c:3c84:b0:3b4:eff4:ab69 with SMTP id
 bg4-20020a05600c3c8400b003b4eff4ab69mr20441174wmb.104.1665423000747; 
 Mon, 10 Oct 2022 10:30:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NLmptfnnAhUUEu7T+QsjdZfIQa53Us2Mj/FL7vravmr4qfPROmwkj1d7aoaKc0T2Ds2dquA==
X-Received: by 2002:a05:600c:3c84:b0:3b4:eff4:ab69 with SMTP id
 bg4-20020a05600c3c8400b003b4eff4ab69mr20441153wmb.104.1665423000431; 
 Mon, 10 Oct 2022 10:30:00 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 y8-20020a5d6208000000b0022c96d3b6f2sm11926483wru.54.2022.10.10.10.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:00 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 18/55] tests/qtest: add a get_features op to vhost-user-test
Message-ID: <20221010172813.204597-19-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

As we expand this test for more virtio devices we will need to support
different feature sets. Add a mandatory op field to fetch the list of
features needed for the test itself.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220802095010.3330793-22-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/vhost-user-test.c | 37 +++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 3052386634..4f4fcc09f5 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -171,10 +171,11 @@ struct vhost_user_ops {
             const char *chr_opts);
 
     /* VHOST-USER commands. */
+    uint64_t (*get_features)(TestServer *s);
     void (*set_features)(TestServer *s, CharBackend *chr,
-            VhostUserMsg *msg);
+                         VhostUserMsg *msg);
     void (*get_protocol_features)(TestServer *s,
-            CharBackend *chr, VhostUserMsg *msg);
+                                  CharBackend *chr, VhostUserMsg *msg);
 };
 
 static const char *init_hugepagefs(void);
@@ -338,20 +339,22 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
 
     switch (msg.request) {
     case VHOST_USER_GET_FEATURES:
+        /* Mandatory for tests to define get_features */
+        g_assert(s->vu_ops->get_features);
+
         /* send back features to qemu */
         msg.flags |= VHOST_USER_REPLY_MASK;
         msg.size = sizeof(m.payload.u64);
-        msg.payload.u64 = 0x1ULL << VHOST_F_LOG_ALL |
-            0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
-        if (s->queues > 1) {
-            msg.payload.u64 |= 0x1ULL << VIRTIO_NET_F_MQ;
-        }
+
         if (s->test_flags >= TEST_FLAGS_BAD) {
             msg.payload.u64 = 0;
             s->test_flags = TEST_FLAGS_END;
+        } else {
+            msg.payload.u64 = s->vu_ops->get_features(s);
         }
-        p = (uint8_t *) &msg;
-        qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
+
+        qemu_chr_fe_write_all(chr, (uint8_t *) &msg,
+                              VHOST_USER_HDR_SIZE + msg.size);
         break;
 
     case VHOST_USER_SET_FEATURES:
@@ -995,8 +998,21 @@ static void test_multiqueue(void *obj, void *arg, QGuestAllocator *alloc)
     wait_for_rings_started(s, s->queues * 2);
 }
 
+
+static uint64_t vu_net_get_features(TestServer *s)
+{
+    uint64_t features = 0x1ULL << VHOST_F_LOG_ALL |
+        0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
+
+    if (s->queues > 1) {
+        features |= 0x1ULL << VIRTIO_NET_F_MQ;
+    }
+
+    return features;
+}
+
 static void vu_net_set_features(TestServer *s, CharBackend *chr,
-        VhostUserMsg *msg)
+                                VhostUserMsg *msg)
 {
     g_assert(msg->payload.u64 & (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES));
     if (s->test_flags == TEST_FLAGS_DISCONNECT) {
@@ -1025,6 +1041,7 @@ static struct vhost_user_ops g_vu_net_ops = {
 
     .append_opts = append_vhost_net_opts,
 
+    .get_features = vu_net_get_features,
     .set_features = vu_net_set_features,
     .get_protocol_features = vu_net_get_protocol_features,
 };
-- 
MST


