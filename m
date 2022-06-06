Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7758953E52A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:53:59 +0200 (CEST)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyE7C-0005R5-H6
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr8-00026b-8D
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr4-0000Xd-IZ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sIPOhTLQlwR5isH3e+n1CCQhooUx4MPtdUkaeU4PXWw=;
 b=SyBdzxIbjjKhCj3hVFbsmsq1bOyU9Myin+Ct5XBhdNJyaucLb/fdS3+Ln9vlYBbU8xsLKz
 DxtCmvLQI35TSgWuYDqpdSX8229HffZXVI6cGynCI4upEg88yp+rd/SD/mcFiKnR2D4Rg5
 41xN2HaCBEv7vnYPp+nSiTENGvORE3U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-A7BOTl4cNwevuML-Wk4cUA-1; Mon, 06 Jun 2022 10:37:06 -0400
X-MC-Unique: A7BOTl4cNwevuML-Wk4cUA-1
Received: by mail-wm1-f72.google.com with SMTP id
 e19-20020a05600c4e5300b0039c4b6acd83so2800488wmq.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sIPOhTLQlwR5isH3e+n1CCQhooUx4MPtdUkaeU4PXWw=;
 b=2TCGZrsGIDXCF6/oR8xuetkkmwDdx9JjhuItLPgo7I66J1lm1apEav2EBN5Aq8JbBf
 aYszRxCMrVh1T34Oj/AFCyvvHfrxoGZaTx6/d8YqzQo18nd3YHT40qkUXSXMNuz72GfH
 wfB5uAVxvjshHcQ4AZXVwQBnc2Zt/btDlJK8+tkzwQn+NjfZnGxxVQhPI5YnK6cq+O4L
 lXjrZP4a2QSU0F3MkWAN23IiweE9rzrFQqJ5TsQ254ULbXSLT2AuZhRMlSHydGHnf45b
 CVmzlMaJKoKlxY29YMPL7HVYr3IUEXo3vbVgq30ByCcJiDcG5JdXKp5bftYt5fwAU4eM
 PwhA==
X-Gm-Message-State: AOAM531jf4wj10hUOAVVkYvozI42z6wFXl5azU1/7bgfS1eLyUGWTjxf
 xFXPxeAxbdXYm9XwV40BDslm08QRpPeHV1JbPZVjXjr9AgWjZ2MO/xZP287WBCUWJHuDbuWxGdO
 3N8ozKrp7R9hed0Y/ixTnABcxKNy2ysboE3d0M3TIv7VQ1SCQ+oAAHwrHg7ltFOw34eI=
X-Received: by 2002:adf:eacb:0:b0:217:dd5:445f with SMTP id
 o11-20020adfeacb000000b002170dd5445fmr9428641wrn.359.1654526224587; 
 Mon, 06 Jun 2022 07:37:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV/zNxifT+hyxptKe/NJ3tqLuC6+3T0YzPzSIK/Ml5jCBKxgBrmv0luari4S+KW7HNv18nUw==
X-Received: by 2002:adf:eacb:0:b0:217:dd5:445f with SMTP id
 o11-20020adfeacb000000b002170dd5445fmr9428610wrn.359.1654526224296; 
 Mon, 06 Jun 2022 07:37:04 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 u18-20020a5d5152000000b0020cdcb0efa2sm15380031wrt.34.2022.06.06.07.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/29] replay: simplify async event processing
Date: Mon,  6 Jun 2022 16:36:24 +0200
Message-Id: <20220606143644.1151112-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
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

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch joins replay event id and async event id into single byte in the log.
It makes processing a bit faster and log a bit smaller.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

--

v2: minor enum fixes (suggested by Richard Henderson)
Message-Id: <165364838393.688121.8191379555130516329.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 replay/replay-events.c   | 36 ++++++++++++++----------------------
 replay/replay-internal.h | 31 ++++++++++++++-----------------
 replay/replay-snapshot.c |  1 -
 replay/replay.c          |  5 +++--
 4 files changed, 31 insertions(+), 42 deletions(-)

diff --git a/replay/replay-events.c b/replay/replay-events.c
index db1decf9dd..af0721cc1a 100644
--- a/replay/replay-events.c
+++ b/replay/replay-events.c
@@ -174,8 +174,8 @@ static void replay_save_event(Event *event)
 {
     if (replay_mode != REPLAY_MODE_PLAY) {
         /* put the event into the file */
-        replay_put_event(EVENT_ASYNC);
-        replay_put_byte(event->event_kind);
+        g_assert(event->event_kind < REPLAY_ASYNC_COUNT);
+        replay_put_event(EVENT_ASYNC + event->event_kind);
 
         /* save event-specific data */
         switch (event->event_kind) {
@@ -220,14 +220,10 @@ void replay_save_events(void)
 static Event *replay_read_event(void)
 {
     Event *event;
-    if (replay_state.read_event_kind == -1) {
-        replay_state.read_event_kind = replay_get_byte();
-        replay_state.read_event_id = -1;
-        replay_check_error();
-    }
+    ReplayAsyncEventKind event_kind = replay_state.data_kind - EVENT_ASYNC;
 
     /* Events that has not to be in the queue */
-    switch (replay_state.read_event_kind) {
+    switch (event_kind) {
     case REPLAY_ASYNC_EVENT_BH:
     case REPLAY_ASYNC_EVENT_BH_ONESHOT:
         if (replay_state.read_event_id == -1) {
@@ -236,17 +232,17 @@ static Event *replay_read_event(void)
         break;
     case REPLAY_ASYNC_EVENT_INPUT:
         event = g_new0(Event, 1);
-        event->event_kind = replay_state.read_event_kind;
+        event->event_kind = event_kind;
         event->opaque = replay_read_input_event();
         return event;
     case REPLAY_ASYNC_EVENT_INPUT_SYNC:
         event = g_new0(Event, 1);
-        event->event_kind = replay_state.read_event_kind;
+        event->event_kind = event_kind;
         event->opaque = 0;
         return event;
     case REPLAY_ASYNC_EVENT_CHAR_READ:
         event = g_new0(Event, 1);
-        event->event_kind = replay_state.read_event_kind;
+        event->event_kind = event_kind;
         event->opaque = replay_event_char_read_load();
         return event;
     case REPLAY_ASYNC_EVENT_BLOCK:
@@ -256,18 +252,17 @@ static Event *replay_read_event(void)
         break;
     case REPLAY_ASYNC_EVENT_NET:
         event = g_new0(Event, 1);
-        event->event_kind = replay_state.read_event_kind;
+        event->event_kind = event_kind;
         event->opaque = replay_event_net_load();
         return event;
     default:
-        error_report("Unknown ID %d of replay event",
-            replay_state.read_event_kind);
+        error_report("Unknown ID %d of replay event", event_kind);
         exit(1);
         break;
     }
 
     QTAILQ_FOREACH(event, &events_list, events) {
-        if (event->event_kind == replay_state.read_event_kind
+        if (event->event_kind == event_kind
             && (replay_state.read_event_id == -1
                 || replay_state.read_event_id == event->id)) {
             break;
@@ -276,12 +271,8 @@ static Event *replay_read_event(void)
 
     if (event) {
         QTAILQ_REMOVE(&events_list, event, events);
-    } else {
-        return NULL;
     }
 
-    /* Read event-specific data */
-
     return event;
 }
 
@@ -289,13 +280,14 @@ static Event *replay_read_event(void)
 void replay_read_events(void)
 {
     g_assert(replay_mutex_locked());
-    while (replay_state.data_kind == EVENT_ASYNC) {
+    while (replay_state.data_kind >= EVENT_ASYNC
+        && replay_state.data_kind <= EVENT_ASYNC_LAST) {
         Event *event = replay_read_event();
         if (!event) {
             break;
         }
         replay_finish_event();
-        replay_state.read_event_kind = -1;
+        replay_state.read_event_id = -1;
         replay_run_event(event);
 
         g_free(event);
@@ -304,7 +296,7 @@ void replay_read_events(void)
 
 void replay_init_events(void)
 {
-    replay_state.read_event_kind = -1;
+    replay_state.read_event_id = -1;
 }
 
 void replay_finish_events(void)
diff --git a/replay/replay-internal.h b/replay/replay-internal.h
index d6e631a394..89e377be90 100644
--- a/replay/replay-internal.h
+++ b/replay/replay-internal.h
@@ -12,6 +12,19 @@
  *
  */
 
+/* Asynchronous events IDs */
+
+typedef enum ReplayAsyncEventKind {
+    REPLAY_ASYNC_EVENT_BH,
+    REPLAY_ASYNC_EVENT_BH_ONESHOT,
+    REPLAY_ASYNC_EVENT_INPUT,
+    REPLAY_ASYNC_EVENT_INPUT_SYNC,
+    REPLAY_ASYNC_EVENT_CHAR_READ,
+    REPLAY_ASYNC_EVENT_BLOCK,
+    REPLAY_ASYNC_EVENT_NET,
+    REPLAY_ASYNC_COUNT
+} ReplayAsyncEventKind;
+
 /* Any changes to order/number of events will need to bump REPLAY_VERSION */
 enum ReplayEvents {
     /* for instruction event */
@@ -22,6 +35,7 @@ enum ReplayEvents {
     EVENT_EXCEPTION,
     /* for async events */
     EVENT_ASYNC,
+    EVENT_ASYNC_LAST = EVENT_ASYNC + REPLAY_ASYNC_COUNT - 1,
     /* for shutdown requests, range allows recovery of ShutdownCause */
     EVENT_SHUTDOWN,
     EVENT_SHUTDOWN_LAST = EVENT_SHUTDOWN + SHUTDOWN_CAUSE__MAX,
@@ -49,21 +63,6 @@ enum ReplayEvents {
     EVENT_COUNT
 };
 
-/* Asynchronous events IDs */
-
-enum ReplayAsyncEventKind {
-    REPLAY_ASYNC_EVENT_BH,
-    REPLAY_ASYNC_EVENT_BH_ONESHOT,
-    REPLAY_ASYNC_EVENT_INPUT,
-    REPLAY_ASYNC_EVENT_INPUT_SYNC,
-    REPLAY_ASYNC_EVENT_CHAR_READ,
-    REPLAY_ASYNC_EVENT_BLOCK,
-    REPLAY_ASYNC_EVENT_NET,
-    REPLAY_ASYNC_COUNT
-};
-
-typedef enum ReplayAsyncEventKind ReplayAsyncEventKind;
-
 typedef struct ReplayState {
     /*! Cached clock values. */
     int64_t cached_clock[REPLAY_CLOCK_COUNT];
@@ -83,8 +82,6 @@ typedef struct ReplayState {
     uint64_t block_request_id;
     /*! Prior value of the host clock */
     uint64_t host_clock_last;
-    /*! Asynchronous event type read from the log */
-    int32_t read_event_kind;
     /*! Asynchronous event id read from the log */
     uint64_t read_event_id;
 } ReplayState;
diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
index 7e935deb15..10a7cf7992 100644
--- a/replay/replay-snapshot.c
+++ b/replay/replay-snapshot.c
@@ -59,7 +59,6 @@ static const VMStateDescription vmstate_replay = {
         VMSTATE_UINT32(has_unread_data, ReplayState),
         VMSTATE_UINT64(file_offset, ReplayState),
         VMSTATE_UINT64(block_request_id, ReplayState),
-        VMSTATE_INT32(read_event_kind, ReplayState),
         VMSTATE_UINT64(read_event_id, ReplayState),
         VMSTATE_END_OF_LIST()
     },
diff --git a/replay/replay.c b/replay/replay.c
index ccd7edec76..4c396bb376 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -22,7 +22,7 @@
 
 /* Current version of the replay mechanism.
    Increase it when file format changes. */
-#define REPLAY_VERSION              0xe0200b
+#define REPLAY_VERSION              0xe0200c
 /* Size of replay log header */
 #define HEADER_SIZE                 (sizeof(uint32_t) + sizeof(uint64_t))
 
@@ -221,7 +221,8 @@ bool replay_has_event(void)
         replay_account_executed_instructions();
         res = EVENT_CHECKPOINT <= replay_state.data_kind
               && replay_state.data_kind <= EVENT_CHECKPOINT_LAST;
-        res = res || replay_state.data_kind == EVENT_ASYNC;
+        res = res || (EVENT_ASYNC <= replay_state.data_kind
+                     && replay_state.data_kind <= EVENT_ASYNC_LAST);
     }
     return res;
 }
-- 
2.36.1



