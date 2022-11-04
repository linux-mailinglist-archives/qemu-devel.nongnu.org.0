Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2769E61A689
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 02:03:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or7Zl-000527-Lj; Fri, 04 Nov 2022 21:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nyoro.gachu@gmail.com>)
 id 1or5nW-0008P5-RK
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 19:08:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nyoro.gachu@gmail.com>)
 id 1or5nV-0005tt-4j
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 19:08:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 n39-20020a05600c3ba700b003cf71011cddso5880463wms.1
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 16:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v3USd2me6YkGY5oqdVtaSsk2D9cRTjSlmQwYWB0PEjc=;
 b=qm7IZNsnGRLHv4GQaGG7odzMrdvOMm/xyLkGQSz7BNCJ1LWHACMhvCuJAD2Yf0vWXB
 jsfZoJuIawZehkjV1fsHoxiijYkRYuH4z/DxFJeQU+4T+XA4rFV7xeyIKL8N5LucJn0S
 drdmnzRaSDA/9VbENMgi4OQS8IUOIb2Ja8bYtYHKDKWsi/quioev1vdSz540LD+xI1pn
 wnaGheMSund2jc+8MjPQejm144m7ZogVeXcJj0/JkEda23a6Ln9DksknyfcrDOEK1lwa
 BDBOw9lYxypBUtLG3GJwGUj3islx6gL/Z/5dipm66qQw1eBuxnZGfcCmBd2RVoW+AFJt
 hBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v3USd2me6YkGY5oqdVtaSsk2D9cRTjSlmQwYWB0PEjc=;
 b=peoEXNJzvhLQD04UwBqPebHG9LeOEkz8n6fci5KNelOIkeSOgDBl1eltuFvnVYVHV7
 gWAse9j1KxYfhMlZCsxhSot62PxP5t5RmsZ7YO4Nyb+jPcGhQkB37DdnIbtA85EBI+4q
 8hMRd4OVwtLaWKFr8hlt8GxbvDfv8vI6qY+SIXMq/qzMekSQa71nD1HqZ4b4NX0yR9rE
 48T5ogDxjzdXIg6r+slwKoEO+URGqkSV+LwqmIlp2hwKItaPsDLT8CzCYYRphEnv24S+
 vpCxFgzRrjf5rZ0Kac6umTDPFmripWS+zbzWZYyMFjq/tWOj9O5n21nV6JyTPd1KWGgs
 2QuA==
X-Gm-Message-State: ACrzQf1rcjLM/lDxpKhoom3orywaBzcaLt99zxmPkODiDh6qdZefUmYd
 lA3TumkTVyQwWlye2XzZ0kWf3Gh90V9fLA==
X-Google-Smtp-Source: AMsMyM5e3eHLcd+Y4CHNMv4TDsfBhYgBVwGOd9dL7D9Va0+i7t8D+Z5gNVZIaAhRCHyVb76xF2AP1Q==
X-Received: by 2002:a05:600c:4f4b:b0:3cf:9cd9:a88c with SMTP id
 m11-20020a05600c4f4b00b003cf9cd9a88cmr2363385wmq.3.1667603301049; 
 Fri, 04 Nov 2022 16:08:21 -0700 (PDT)
Received: from localhost.localdomain ([105.160.112.133])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adfec91000000b002366e8eee11sm461746wrn.101.2022.11.04.16.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 16:08:20 -0700 (PDT)
From: nyoro.gachu@gmail.com
X-Google-Original-From: nyoro.martin@gmail.com
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Samker <samkergachu@gmail.com>,
 M N Gachu <nyoro.gachu@gmail.com>
Subject: [PATCH] LockGuards: replace manual lock()/unlock() calls to
 WITH_QEMU_LOCK_GUARD()
Date: Sat,  5 Nov 2022 02:08:11 +0300
Message-Id: <20221104230811.7188-1-nyoro.martin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=nyoro.gachu@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Nov 2022 21:02:19 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Samker <samkergachu@gmail.com>

LockGuards are preferred to manual lock()/unlock() calls. Lock guards
help prevent common bugs when locks are not released in error code
paths. This patch
replaces calls to manual lock()/unlock() with the much preferred
WITH_QEMU_LOCK_GUARD()

Signed-off-by: M N Gachu <nyoro.gachu@gmail.com>
---
 softmmu/physmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index d9578ccfd4..fb00596777 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -24,6 +24,7 @@
 #include "qemu/cutils.h"
 #include "qemu/cacheflush.h"
 #include "qemu/madvise.h"
+#include "qemu/lockable.h"
 
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
@@ -3114,13 +3115,12 @@ void cpu_register_map_client(QEMUBH *bh)
 {
     MapClient *client = g_malloc(sizeof(*client));
 
-    qemu_mutex_lock(&map_client_list_lock);
+    WITH_QEMU_LOCK_GUARD(&map_client_list_lock);
     client->bh = bh;
     QLIST_INSERT_HEAD(&map_client_list, client, link);
     if (!qatomic_read(&bounce.in_use)) {
         cpu_notify_map_clients_locked();
     }
-    qemu_mutex_unlock(&map_client_list_lock);
 }
 
 void cpu_exec_init_all(void)
@@ -3143,7 +3143,7 @@ void cpu_unregister_map_client(QEMUBH *bh)
 {
     MapClient *client;
 
-    qemu_mutex_lock(&map_client_list_lock);
+    WITH_QEMU_LOCK_GUARD(&map_client_list_lock);
     QLIST_FOREACH(client, &map_client_list, link) {
         if (client->bh == bh) {
             cpu_unregister_map_client_do(client);
-- 
2.25.1


