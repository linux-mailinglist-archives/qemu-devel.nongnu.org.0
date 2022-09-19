Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6F75BD457
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:05:26 +0200 (CEST)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaL93-0005DC-Sa
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfi-0002uK-4v
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfe-0002s7-25
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i45tsI7V00zL4kxDnjzOy3ARohfOCqpKiJ2V7Iz6pSI=;
 b=QzcB1zJQltJLdRZ9nuz4RxBcX9jy3p1zZPi/DNMUqX+xl8xMJ+9M0qUMwtO7T5puu5dP/J
 MxdL5hdwmS0OovLrXfPe1d4ahYOyxzc7vE9GR2lvq+ryoArH31WwbkDCEucoi4t9IT21fV
 z7xVr5AO6z7YoP7g5J//MZMTcbOCKL8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-Rm3lWJWbORKUKnqZQyQ1uA-1; Mon, 19 Sep 2022 13:35:00 -0400
X-MC-Unique: Rm3lWJWbORKUKnqZQyQ1uA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p24-20020a05600c1d9800b003b4b226903dso4958554wms.4
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=i45tsI7V00zL4kxDnjzOy3ARohfOCqpKiJ2V7Iz6pSI=;
 b=I+ywDsNFZUsPrlI1YGbC6GM/V+pS8K1MOhMO2LL+viKD9YdyLevgI876P0lTR4W/VF
 QppNOyKQz/s7z62XJIlkhgVmrlJKhxNqe0fwK5vL/VrgZwM5080TscZOKg5bYlmj2KKV
 vcu0KvGBG6DqnxaVWeZBet4y0xCwZh7q6c8mKwQg6FUMjitRoThLtmeqByEglCqgudDI
 JpUnEJ16NJqiUVkYUkHn+nj3pW+sG09K5sW2Z/45HgHFt0fK9T7cfGYsoaSuK1CgC1L2
 kyjrL0LAPa/h7/hHlAiUxvkuA69qjHZTmaaxhBEW1wVyF1WS7rLdOfYow5LJ9BZBmpDH
 0iTw==
X-Gm-Message-State: ACrzQf2bg+Rt3rWQRam/nO6zzLn27GAIv7i4RfLKBqx831hhyeyxk1km
 6SjGE4XWcerLecgHK8d2O/POfJMxVe8F3IH4jEeo4iiiZBbT3SIePrpiXnyPICFPrZdpeuP47Y5
 tlP61nATsa8VsZPcFe/9nRmE8GrsPOStpL58+3HN0iwmTPL3WZY2e1eKI+/1iRQDhmLU=
X-Received: by 2002:a05:600c:3d13:b0:3b4:be25:9236 with SMTP id
 bh19-20020a05600c3d1300b003b4be259236mr11646911wmb.65.1663608898788; 
 Mon, 19 Sep 2022 10:34:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5gGrGPvRAg9dOsPQBmzNguZPJOHutZx3YNaZAWM7XYjNM+qOOGb6SGx3sKqEN7dcWsSljKEw==
X-Received: by 2002:a05:600c:3d13:b0:3b4:be25:9236 with SMTP id
 bh19-20020a05600c3d1300b003b4be259236mr11646895wmb.65.1663608898511; 
 Mon, 19 Sep 2022 10:34:58 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adff685000000b0021e4829d359sm9402708wrp.39.2022.09.19.10.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:34:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 03/21] kvm: fix memory leak on failure to read stats descriptors
Date: Mon, 19 Sep 2022 19:34:31 +0200
Message-Id: <20220919173449.5864-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
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

Reported by Coverity as CID 1490142.  Since the size is constant and the
lifetime is the same as the StatsDescriptors struct, embed the struct
directly instead of using a separate allocation.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7c8ce18bdd..5acab1767f 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3908,7 +3908,7 @@ exit:
 typedef struct StatsDescriptors {
     const char *ident; /* cache key, currently the StatsTarget */
     struct kvm_stats_desc *kvm_stats_desc;
-    struct kvm_stats_header *kvm_stats_header;
+    struct kvm_stats_header kvm_stats_header;
     QTAILQ_ENTRY(StatsDescriptors) next;
 } StatsDescriptors;
 
@@ -3939,7 +3939,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
     descriptors = g_new0(StatsDescriptors, 1);
 
     /* Read stats header */
-    kvm_stats_header = g_malloc(sizeof(*kvm_stats_header));
+    kvm_stats_header = &descriptors->kvm_stats_header;
     ret = read(stats_fd, kvm_stats_header, sizeof(*kvm_stats_header));
     if (ret != sizeof(*kvm_stats_header)) {
         error_setg(errp, "KVM stats: failed to read stats header: "
@@ -3964,7 +3964,6 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
         g_free(kvm_stats_desc);
         return NULL;
     }
-    descriptors->kvm_stats_header = kvm_stats_header;
     descriptors->kvm_stats_desc = kvm_stats_desc;
     descriptors->ident = ident;
     QTAILQ_INSERT_TAIL(&stats_descriptors, descriptors, next);
@@ -3989,7 +3988,7 @@ static void query_stats(StatsResultList **result, StatsTarget target,
         return;
     }
 
-    kvm_stats_header = descriptors->kvm_stats_header;
+    kvm_stats_header = &descriptors->kvm_stats_header;
     kvm_stats_desc = descriptors->kvm_stats_desc;
     size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
 
@@ -4054,7 +4053,7 @@ static void query_stats_schema(StatsSchemaList **result, StatsTarget target,
         return;
     }
 
-    kvm_stats_header = descriptors->kvm_stats_header;
+    kvm_stats_header = &descriptors->kvm_stats_header;
     kvm_stats_desc = descriptors->kvm_stats_desc;
     size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
 
-- 
2.37.2


