Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A586B53E52B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:54:22 +0200 (CEST)
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyE7Z-00067X-HL
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr8-00026i-DC
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr4-0000XZ-JE
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fo5STQNw+03ymu9gYP+ud+ZniYSeWLU21YJqYEKwa7c=;
 b=gYlVtGPucyCujh+SA8p72w6igIuM0ChRYuFwkANIvp+CA+4c0wLhysz4wooPZVLrBV0Nd6
 v24y11ij/MUbNXimP6ZzTC5gAXwTdNRSpwqsy4t/8it1cLxTwzXOXlkoDdRB8PCoHTLC9x
 9RDlhdAHAL1tzsxDBIJAuW0c8kJKo4U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-1xofJq8IO8mm_m_8m9e89g-1; Mon, 06 Jun 2022 10:37:05 -0400
X-MC-Unique: 1xofJq8IO8mm_m_8m9e89g-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg13-20020a05600c3c8d00b003974d0ff917so7804774wmb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fo5STQNw+03ymu9gYP+ud+ZniYSeWLU21YJqYEKwa7c=;
 b=0yh9+j8xjeMvWH3R5giCf5ZyGso+R9o125TjA8JIU7za0jhuwj5ZbEluaMdygkFd8u
 l2IKAfIEN4rthGI0Vosbn3Z9z2cB73vXGg7keEciObVFi8PPbV2aid/aSTrZ50s/wjeK
 zvHUZDdaQKBJyI/OJuqeKm2p59tVJJhYYyGgBJ26aXGaWce2bXBOLLk69biH+mYOnd9F
 eMxueIWeA18FpLu5y4z9YrQRXEfcPBAgeYAvQ27hzxN+jq9gBD4p2PuLCbzq4UDv4oMc
 S2LComKRYm770Z8G9amfXgkzmOql6OgGbiPDO19h03h8BWKzMQhIIh1rme/LO2VVp4OE
 AKJg==
X-Gm-Message-State: AOAM531VQoUJafNNH2uHyZiZoefuSwMU3wnaHQnywuEfGZiWO0HOQ5QR
 LslUCbvUfh6WcgXq9DVQkRRXH8Qxi7tSgipyQj2ciqq4wFN2JGAalg64MD7/KY2JcRE4WpkfDbV
 wkH48ziWeLx3cseWTBQElIaSgfrWXMjUjJsNYjTINE/sNt7a1u6MsKeam0o4khDKmFWI=
X-Received: by 2002:a05:6000:1091:b0:213:b515:f46f with SMTP id
 y17-20020a056000109100b00213b515f46fmr18839338wrw.632.1654526222996; 
 Mon, 06 Jun 2022 07:37:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDOOlQsCCyc8aZH9A2yrLrpTYkAUA+q49fFJybwws9V3SBf1vd0skC4FV5dTAWUyC+H24dCg==
X-Received: by 2002:a05:6000:1091:b0:213:b515:f46f with SMTP id
 y17-20020a056000109100b00213b515f46fmr18839294wrw.632.1654526222560; 
 Mon, 06 Jun 2022 07:37:02 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 l13-20020adfe9cd000000b0020c5253d8edsm5324679wrn.57.2022.06.06.07.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 08/29] replay: rewrite async event handling
Date: Mon,  6 Jun 2022 16:36:23 +0200
Message-Id: <20220606143644.1151112-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

This patch decouples checkpoints and async events.
It was a tricky part of replay implementation. Now it becomes
much simpler and easier to maintain.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <165364837856.688121.8785039478408995979.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/tcg-accel-ops-icount.c |  5 +--
 docs/replay.txt                  | 11 ++---
 include/sysemu/replay.h          |  9 +++-
 replay/replay-events.c           | 20 +++------
 replay/replay-internal.h         |  6 +--
 replay/replay-snapshot.c         |  1 -
 replay/replay.c                  | 74 +++++++++++++-------------------
 softmmu/icount.c                 |  4 +-
 8 files changed, 54 insertions(+), 76 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index 24520ea112..8f1dda4344 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -84,8 +84,7 @@ void icount_handle_deadline(void)
      * Don't interrupt cpu thread, when these events are waiting
      * (i.e., there is no checkpoint)
      */
-    if (deadline == 0
-        && (replay_mode != REPLAY_MODE_PLAY || replay_has_checkpoint())) {
+    if (deadline == 0) {
         icount_notify_aio_contexts();
     }
 }
@@ -109,7 +108,7 @@ void icount_prepare_for_run(CPUState *cpu)
 
     replay_mutex_lock();
 
-    if (cpu->icount_budget == 0 && replay_has_checkpoint()) {
+    if (cpu->icount_budget == 0) {
         icount_notify_aio_contexts();
     }
 }
diff --git a/docs/replay.txt b/docs/replay.txt
index 5b008ca491..6c9fdff09d 100644
--- a/docs/replay.txt
+++ b/docs/replay.txt
@@ -366,11 +366,9 @@ Here is the list of events that are written into the log:
    Argument: 4-byte number of executed instructions.
  - EVENT_INTERRUPT. Used to synchronize interrupt processing.
  - EVENT_EXCEPTION. Used to synchronize exception handling.
- - EVENT_ASYNC. This is a group of events. They are always processed
-   together with checkpoints. When such an event is generated, it is
-   stored in the queue and processed only when checkpoint occurs.
-   Every such event is followed by 1-byte checkpoint id and 1-byte
-   async event id from the following list:
+ - EVENT_ASYNC. This is a group of events. When such an event is generated,
+   it is stored in the queue and processed in icount_account_warp_timer().
+   Every such event has it's own id from the following list:
      - REPLAY_ASYNC_EVENT_BH. Bottom-half callback. This event synchronizes
        callbacks that affect virtual machine state, but normally called
        asynchronously.
@@ -405,6 +403,5 @@ Here is the list of events that are written into the log:
  - EVENT_CLOCK + clock_id. Group of events for host clock read operations.
    Argument: 8-byte clock value.
  - EVENT_CHECKPOINT + checkpoint_id. Checkpoint for synchronization of
-   CPU, internal threads, and asynchronous input events. May be followed
-   by one or more EVENT_ASYNC events.
+   CPU, internal threads, and asynchronous input events.
  - EVENT_END. Last event in the log.
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 0f3b0f7eac..73dee9ccdf 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -160,9 +160,14 @@ void replay_shutdown_request(ShutdownCause cause);
     Returns 0 in PLAY mode if checkpoint was not found.
     Returns 1 in all other cases. */
 bool replay_checkpoint(ReplayCheckpoint checkpoint);
-/*! Used to determine that checkpoint is pending.
+/*! Used to determine that checkpoint or async event is pending.
     Does not proceed to the next event in the log. */
-bool replay_has_checkpoint(void);
+bool replay_has_event(void);
+/*
+ * Processes the async events added to the queue (while recording)
+ * or reads the events from the file (while replaying).
+ */
+void replay_async_events(void);
 
 /* Asynchronous events queue */
 
diff --git a/replay/replay-events.c b/replay/replay-events.c
index ac47c89834..db1decf9dd 100644
--- a/replay/replay-events.c
+++ b/replay/replay-events.c
@@ -170,12 +170,11 @@ void replay_block_event(QEMUBH *bh, uint64_t id)
     }
 }
 
-static void replay_save_event(Event *event, int checkpoint)
+static void replay_save_event(Event *event)
 {
     if (replay_mode != REPLAY_MODE_PLAY) {
         /* put the event into the file */
         replay_put_event(EVENT_ASYNC);
-        replay_put_byte(checkpoint);
         replay_put_byte(event->event_kind);
 
         /* save event-specific data */
@@ -206,34 +205,27 @@ static void replay_save_event(Event *event, int checkpoint)
 }
 
 /* Called with replay mutex locked */
-void replay_save_events(int checkpoint)
+void replay_save_events(void)
 {
     g_assert(replay_mutex_locked());
-    g_assert(checkpoint != CHECKPOINT_CLOCK_WARP_START);
-    g_assert(checkpoint != CHECKPOINT_CLOCK_VIRTUAL);
     while (!QTAILQ_EMPTY(&events_list)) {
         Event *event = QTAILQ_FIRST(&events_list);
-        replay_save_event(event, checkpoint);
+        replay_save_event(event);
         replay_run_event(event);
         QTAILQ_REMOVE(&events_list, event, events);
         g_free(event);
     }
 }
 
-static Event *replay_read_event(int checkpoint)
+static Event *replay_read_event(void)
 {
     Event *event;
     if (replay_state.read_event_kind == -1) {
-        replay_state.read_event_checkpoint = replay_get_byte();
         replay_state.read_event_kind = replay_get_byte();
         replay_state.read_event_id = -1;
         replay_check_error();
     }
 
-    if (checkpoint != replay_state.read_event_checkpoint) {
-        return NULL;
-    }
-
     /* Events that has not to be in the queue */
     switch (replay_state.read_event_kind) {
     case REPLAY_ASYNC_EVENT_BH:
@@ -294,11 +286,11 @@ static Event *replay_read_event(int checkpoint)
 }
 
 /* Called with replay mutex locked */
-void replay_read_events(int checkpoint)
+void replay_read_events(void)
 {
     g_assert(replay_mutex_locked());
     while (replay_state.data_kind == EVENT_ASYNC) {
-        Event *event = replay_read_event(checkpoint);
+        Event *event = replay_read_event();
         if (!event) {
             break;
         }
diff --git a/replay/replay-internal.h b/replay/replay-internal.h
index 97649ed8d7..d6e631a394 100644
--- a/replay/replay-internal.h
+++ b/replay/replay-internal.h
@@ -87,8 +87,6 @@ typedef struct ReplayState {
     int32_t read_event_kind;
     /*! Asynchronous event id read from the log */
     uint64_t read_event_id;
-    /*! Asynchronous event checkpoint id read from the log */
-    int32_t read_event_checkpoint;
 } ReplayState;
 extern ReplayState replay_state;
 
@@ -152,9 +150,9 @@ void replay_finish_events(void);
 /*! Returns true if there are any unsaved events in the queue */
 bool replay_has_events(void);
 /*! Saves events from queue into the file */
-void replay_save_events(int checkpoint);
+void replay_save_events(void);
 /*! Read events from the file into the input queue */
-void replay_read_events(int checkpoint);
+void replay_read_events(void);
 /*! Adds specified async event to the queue */
 void replay_add_event(ReplayAsyncEventKind event_kind, void *opaque,
                       void *opaque2, uint64_t id);
diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
index e8767a1937..7e935deb15 100644
--- a/replay/replay-snapshot.c
+++ b/replay/replay-snapshot.c
@@ -61,7 +61,6 @@ static const VMStateDescription vmstate_replay = {
         VMSTATE_UINT64(block_request_id, ReplayState),
         VMSTATE_INT32(read_event_kind, ReplayState),
         VMSTATE_UINT64(read_event_id, ReplayState),
-        VMSTATE_INT32(read_event_checkpoint, ReplayState),
         VMSTATE_END_OF_LIST()
     },
 };
diff --git a/replay/replay.c b/replay/replay.c
index 2d3607998a..ccd7edec76 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -22,7 +22,7 @@
 
 /* Current version of the replay mechanism.
    Increase it when file format changes. */
-#define REPLAY_VERSION              0xe0200a
+#define REPLAY_VERSION              0xe0200b
 /* Size of replay log header */
 #define HEADER_SIZE                 (sizeof(uint32_t) + sizeof(uint64_t))
 
@@ -171,64 +171,49 @@ void replay_shutdown_request(ShutdownCause cause)
 
 bool replay_checkpoint(ReplayCheckpoint checkpoint)
 {
-    bool res = false;
-    static bool in_checkpoint;
     assert(EVENT_CHECKPOINT + checkpoint <= EVENT_CHECKPOINT_LAST);
 
-    if (!replay_file) {
-        return true;
-    }
-
-    if (in_checkpoint) {
-        /*
-           Recursion occurs when HW event modifies timers.
-           Prevent performing icount warp in this case and
-           wait for another invocation of the checkpoint.
-        */
-        g_assert(replay_mode == REPLAY_MODE_PLAY);
-        return false;
-    }
-    in_checkpoint = true;
-
     replay_save_instructions();
 
     if (replay_mode == REPLAY_MODE_PLAY) {
         g_assert(replay_mutex_locked());
         if (replay_next_event_is(EVENT_CHECKPOINT + checkpoint)) {
             replay_finish_event();
-        } else if (replay_state.data_kind != EVENT_ASYNC) {
-            res = false;
-            goto out;
+        } else {
+            return false;
         }
-        replay_read_events(checkpoint);
-        /* replay_read_events may leave some unread events.
-           Return false if not all of the events associated with
-           checkpoint were processed */
-        res = replay_state.data_kind != EVENT_ASYNC;
     } else if (replay_mode == REPLAY_MODE_RECORD) {
         g_assert(replay_mutex_locked());
         replay_put_event(EVENT_CHECKPOINT + checkpoint);
-        /* This checkpoint belongs to several threads.
-           Processing events from different threads is
-           non-deterministic */
-        if (checkpoint != CHECKPOINT_CLOCK_WARP_START
-            /* FIXME: this is temporary fix, other checkpoints
-                      may also be invoked from the different threads someday.
-                      Asynchronous event processing should be refactored
-                      to create additional replay event kind which is
-                      nailed to the one of the threads and which processes
-                      the event queue. */
-            && checkpoint != CHECKPOINT_CLOCK_VIRTUAL) {
-            replay_save_events(checkpoint);
-        }
-        res = true;
     }
-out:
-    in_checkpoint = false;
-    return res;
+    return true;
 }
 
-bool replay_has_checkpoint(void)
+void replay_async_events(void)
+{
+    static bool processing = false;
+    /*
+     * If we are already processing the events, recursion may occur
+     * in case of incorrect implementation when HW event modifies timers.
+     * Timer modification may invoke the icount warp, event processing,
+     * and cause the recursion.
+     */
+    g_assert(!processing);
+    processing = true;
+
+    replay_save_instructions();
+
+    if (replay_mode == REPLAY_MODE_PLAY) {
+        g_assert(replay_mutex_locked());
+        replay_read_events();
+    } else if (replay_mode == REPLAY_MODE_RECORD) {
+        g_assert(replay_mutex_locked());
+        replay_save_events();
+    }
+    processing = false;
+}
+
+bool replay_has_event(void)
 {
     bool res = false;
     if (replay_mode == REPLAY_MODE_PLAY) {
@@ -236,6 +221,7 @@ bool replay_has_checkpoint(void)
         replay_account_executed_instructions();
         res = EVENT_CHECKPOINT <= replay_state.data_kind
               && replay_state.data_kind <= EVENT_CHECKPOINT_LAST;
+        res = res || replay_state.data_kind == EVENT_ASYNC;
     }
     return res;
 }
diff --git a/softmmu/icount.c b/softmmu/icount.c
index 1cafec5014..4504433e16 100644
--- a/softmmu/icount.c
+++ b/softmmu/icount.c
@@ -322,7 +322,7 @@ void icount_start_warp_timer(void)
              * to vCPU was processed in advance and vCPU went to sleep.
              * Therefore we have to wake it up for doing someting.
              */
-            if (replay_has_checkpoint()) {
+            if (replay_has_event()) {
                 qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
             }
             return;
@@ -404,6 +404,8 @@ void icount_account_warp_timer(void)
         return;
     }
 
+    replay_async_events();
+
     /* warp clock deterministically in record/replay mode */
     if (!replay_checkpoint(CHECKPOINT_CLOCK_WARP_ACCOUNT)) {
         return;
-- 
2.36.1



