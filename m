Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1DD5FBDE6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:44:37 +0200 (CEST)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNzI-0006Yy-1p
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNwr-0001qr-Ob
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 18:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNwo-0001cp-K8
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 18:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665528120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6d9bkOd3BNy2hN6yorv0iwCbvrwpybUqg2X7NPYmqD0=;
 b=bJcos4EFewpuarn0Ow2MCdptwAptSu+e5vGfPvYgSZV9i5dqIvgdtVB98ZjKYSFODqLww3
 nxT8uojbQxQdrUVkHytf8rq9xFBBaLYbDoogf5nJsJzFNi7dYwD6HGJu3BjC/S/XpyKQKc
 qMcdzg5/dSL2tU5NUHB9jNqrOxagv3A=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-YUMkZE3oOIaDvIVygPMLQg-1; Tue, 11 Oct 2022 18:41:59 -0400
X-MC-Unique: YUMkZE3oOIaDvIVygPMLQg-1
Received: by mail-qk1-f199.google.com with SMTP id
 bm16-20020a05620a199000b006ee95743ad2so224854qkb.14
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 15:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6d9bkOd3BNy2hN6yorv0iwCbvrwpybUqg2X7NPYmqD0=;
 b=aJopDbpj27q24vUlUOz4eks1q9uJQrZ2Hk0Xmy6jN1nENsgqPHFqrhLcweye3Wjf7R
 494/OFAcU0xEfNFKrltWtLn3uWc66g4DnjjDHfbo/ZJqnihr00ixxXzVT60Vr4N/s02E
 N+uzhZClR1N8Dek35CxogQGB+HlqCqd1OssLg5BSUProjrdHOgP0spee4lB+TFrvqUSk
 dHQqfii1KI+f3Jgc5WTjBTKE62GHvy8PCCCWl9bkzPmKfbcLyW2MmO3z/NU/SVPvZiqv
 H8YXBB9MtlqAyMlMrmm9t5dByTScetp169Qnq0e7MRRJIdUaswdhEVVGGnppupLhAZln
 NfBw==
X-Gm-Message-State: ACrzQf0tVt/GRXrLphDipQiHXnKxM07BXIRIOrd57lT4ZNPBssPMsJTq
 XYQkzvcivvfmavUUX3ULSeBpQsWSoBCqbH8IemTbmXP7DuoW3NVVd1WzslRSGHmTMFL1me6/Ubj
 NoWVYD+TGjFXvp7C6Fyppj2HnUB0n6uT+AKhRDcp5McpDJe3pT40aUq4DESZItz5t
X-Received: by 2002:a05:622a:1711:b0:35c:ed48:83cb with SMTP id
 h17-20020a05622a171100b0035ced4883cbmr21652173qtk.264.1665528119124; 
 Tue, 11 Oct 2022 15:41:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CtZ9Wph72/m3iiGbf8O2nXmDbV//kS6OCCBjmSUhxJ/2wBEvM/B8Mt3SMdKVZzOImq1hQJA==
X-Received: by 2002:a05:622a:1711:b0:35c:ed48:83cb with SMTP id
 h17-20020a05622a171100b0035ced4883cbmr21652154qtk.264.1665528118848; 
 Tue, 11 Oct 2022 15:41:58 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 h17-20020ac87771000000b0039ad65104fasm4258660qtu.12.2022.10.11.15.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 15:41:58 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yury Kotov <yury-kotov@yandex-team.ru>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 2/2] qemu-thread: Fail hard for suspecious mutex unlocks
Date: Tue, 11 Oct 2022 18:41:54 -0400
Message-Id: <20221011224154.644379-3-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011224154.644379-1-peterx@redhat.com>
References: <20221011224154.644379-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Add a field for QemuMutex to remember the locked status, then assert
properly when CONFIG_DEBUG_MUTEX enabled on illegal unlocks.

The pthread library is by default quite loose on this by allowing the
unlock to quietly succeed.  But that could cause the follow up things very
unpredictable so if there's a bug it'll be harder to track than failing
early at the illegal unlock.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qemu/thread-posix.h |  1 +
 util/qemu-thread-common.h   | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index 5f2f3d1386..e13bd5492c 100644
--- a/include/qemu/thread-posix.h
+++ b/include/qemu/thread-posix.h
@@ -9,6 +9,7 @@ struct QemuMutex {
 #ifdef CONFIG_DEBUG_MUTEX
     const char *file;
     int line;
+    bool locked;
 #endif
     bool initialized;
 };
diff --git a/util/qemu-thread-common.h b/util/qemu-thread-common.h
index 2af6b12085..ed74bdb0d1 100644
--- a/util/qemu-thread-common.h
+++ b/util/qemu-thread-common.h
@@ -21,6 +21,7 @@ static inline void qemu_mutex_post_init(QemuMutex *mutex)
 #ifdef CONFIG_DEBUG_MUTEX
     mutex->file = NULL;
     mutex->line = 0;
+    mutex->locked = false;
 #endif
     mutex->initialized = true;
 }
@@ -37,6 +38,7 @@ static inline void qemu_mutex_post_lock(QemuMutex *mutex,
 #ifdef CONFIG_DEBUG_MUTEX
     mutex->file = file;
     mutex->line = line;
+    mutex->locked = true;
 #endif
     trace_qemu_mutex_locked(mutex, file, line);
 }
@@ -47,6 +49,14 @@ static inline void qemu_mutex_pre_unlock(QemuMutex *mutex,
 #ifdef CONFIG_DEBUG_MUTEX
     mutex->file = NULL;
     mutex->line = 0;
+    /*
+     * pthread_mutex_unlock() by default silently ignore unlocking a mutex
+     * even if it's not locked.  Make it strict with QEMU when DEBUG_MUTEX
+     * is enabled, so that we can capture it at the exact wrong unlock.
+     * It'll be easier to track this than having misterious deadlock later.
+     */
+    assert(mutex->locked);
+    mutex->locked = false;
 #endif
     trace_qemu_mutex_unlock(mutex, file, line);
 }
-- 
2.37.3


