Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED045FA31D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:03:49 +0200 (CEST)
Received: from localhost ([::1]:35596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohx80-0001bz-Ap
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbM-000218-Al
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbH-0006fp-NN
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmsSQG3tgR/SeJWv4vUdgBQ5eNjunHANNe2NjKH/GKc=;
 b=bv1zbCC1joPeY513Fli5YVjjtN0Fw/dkyjardc8OD7yJVMtBYIH3FTIAvIIINGtNFKoAS2
 kBN5lnw4TU+WwwvvJwUigNQBVpUxRYTrDuU61cRKFlB3xzUg+jnyTS3CdO6aG2lhvwIq0C
 xPIwjukd5zoMWq3FydVdpqWRpFSfdao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-y8tcy04lOGeE4Za_ITBT0g-1; Mon, 10 Oct 2022 13:29:58 -0400
X-MC-Unique: y8tcy04lOGeE4Za_ITBT0g-1
Received: by mail-wm1-f72.google.com with SMTP id
 i5-20020a1c3b05000000b003c47c8569easo4143228wma.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jmsSQG3tgR/SeJWv4vUdgBQ5eNjunHANNe2NjKH/GKc=;
 b=mloUVSgYFjf5iQwjKwyoioSXvaRyqVktEV5hIcH0vL3a4ODHl58KdDBrv/DhW3SqQL
 ZCLQti70M2KbpDyOxFxjFqyFpoLf2fesgbNMJf8Rjf0gc9y8QpFRsXO3R5gqUFjNJbRT
 gicpQN4Rl05BfYWznu6wB6+aJ7mdZFrGnDy0sKaFb5KOITJRaEnrTwu7d47Nq4h6IeNK
 7etyeEGQ2uI0/9Kpejomg1BBsrLQr60SV6BQ+YsJW8W8N3hwLFgIifWKAY44gLlH/HcO
 OtZWdMDsLZyv8MVhWh47mt0eXA9FYinnamY2WT+4yE3b9Lynx+ainYguDKhHfpuAf9iK
 +sTg==
X-Gm-Message-State: ACrzQf23O+1j6Or5x0FEY1oxyzdlOfiW/bEQO+XyjOA8dOx9jB3hWqpg
 /m087sYUG5CNYKNOad4Ix5ti3f8zeGhDfIvRwtIfNHNvA7I9LnKoIv93QDKqvSPFiGuPY5iRkcX
 1ivuxs0WmtIJHzV1jpzlfsnMS/4/ZqnS3V6bZ3t2f/aFZB3EQ85gGnJkM+JmM
X-Received: by 2002:a05:600c:a09:b0:3b5:2f6b:c7c5 with SMTP id
 z9-20020a05600c0a0900b003b52f6bc7c5mr13385641wmp.141.1665422996017; 
 Mon, 10 Oct 2022 10:29:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4FmHxJF736rb5iIVLjVTMzfMFrxR8ya/9qffebxLtQdXawZ5s0TEAcuXjALd+ICNeYzLSTOQ==
X-Received: by 2002:a05:600c:a09:b0:3b5:2f6b:c7c5 with SMTP id
 z9-20020a05600c0a0900b003b52f6bc7c5mr13385616wmp.141.1665422995721; 
 Mon, 10 Oct 2022 10:29:55 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c19d300b003bf6da9d2cesm15887970wmq.28.2022.10.10.10.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:55 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 17/55] tests/qtest: implement stub for VHOST_USER_GET_CONFIG
Message-ID: <20221010172813.204597-18-mst@redhat.com>
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

We don't implement the full solution because frankly none of the tests
need to at the moment. We may end up re-implementing libvhostuser in
the end.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220802095010.3330793-21-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/vhost-user-test.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index a99f55ed84..3052386634 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -79,6 +79,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_PROTOCOL_FEATURES = 16,
     VHOST_USER_GET_QUEUE_NUM = 17,
     VHOST_USER_SET_VRING_ENABLE = 18,
+    VHOST_USER_GET_CONFIG = 24,
+    VHOST_USER_SET_CONFIG = 25,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -372,6 +374,17 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         }
         break;
 
+    case VHOST_USER_GET_CONFIG:
+        /*
+         * Treat GET_CONFIG as a NOP and just reply and let the guest
+         * consider we have updated its memory. Tests currently don't
+         * require working configs.
+         */
+        msg.flags |= VHOST_USER_REPLY_MASK;
+        p = (uint8_t *) &msg;
+        qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
+        break;
+
     case VHOST_USER_SET_PROTOCOL_FEATURES:
         /*
          * We did set VHOST_USER_F_PROTOCOL_FEATURES so its valid for
-- 
MST


