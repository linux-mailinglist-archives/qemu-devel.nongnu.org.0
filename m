Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C7CFFB4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 19:21:28 +0200 (CEST)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHtAs-0000io-Hh
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 13:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7Q-0006az-4M
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:17:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7M-0002Bz-4c
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:17:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33543)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7L-0002BR-Qv
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:17:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b9so20370918wrs.0
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3TNOdz92e/qBT6KrqIxG70SsX0V9K71FFrgsUzEswP0=;
 b=RqDnjTInbiI1VNGzi7gMr2x6o6AMcFW6+sZ5sQ2BRTqI5CA89bPcuspRR71MuV7xs+
 gL9bI+vim46pmuWe1UTEIvkz/A3CuX6REOXMacQCBaITIRfGhwEYLegIrDK3xexnROi6
 pWUhGnRRgG9WDfGIXLHAUeMXvq+RpWD0Bm6G8MKZ95I1KWMhZQnJx900A/QmfDwEmEF5
 uaEPbYgw5CRkOXlpy1AI7v9/FAsujlw8PAN+QiTk4UEgoFmj+7kZQyCZaxVajo+BajGE
 Sfu1gSlwsppwBeZIFYIoY2onxt8COVVOOsUw15UVccvs1QEDU0uu9lOohlYqSWVTPOq7
 ylIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3TNOdz92e/qBT6KrqIxG70SsX0V9K71FFrgsUzEswP0=;
 b=j/KB6iegRg8uWn5m37FdgKOxqTCC3bnLOzkoIELPllnQ1yK/o9qNk/VXi1YIB8F4kC
 vkcC0yZut2Ec7XA+UMAuByShlH/mdjADCE/ZWnK+D9f5RDf+d40yqTVggPIFG/A0O2bT
 5BKdJiB6ErfTQLiPzqFWNj1jlc3374Ge/tKgsW/qcmne8n068T627hlzB+hIOHtF0sH2
 jGZeczpjN/MHgTaZo9IetwgpYMkFhSGiUbDt5b9kzFW3v/L76T4BycpTQaU1idAYt/gv
 NC7kD9/qIwcZex2hx2hGHN+Pnrvldiz/A1MGG5R0c0s87rjzCuJJP4leQmnGwZrWEUwF
 7rsA==
X-Gm-Message-State: APjAAAUR32ZChN+CfOFDOn/sPiJzCabX2qEfGfjmj9k7gsF6+d1+ytjj
 TCfUOZEznxGOZJ98qwz5qsj0pw==
X-Google-Smtp-Source: APXvYqyZeI91ektFtwepSPY3yaLlUMB73Yaf+7xQEsJXuCnJ27XUgldojTVD8E8H474buk7k/hzuJA==
X-Received: by 2002:adf:e610:: with SMTP id p16mr16688388wrm.313.1570555066280; 
 Tue, 08 Oct 2019 10:17:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:17:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/21] ptimer: Provide new transaction-based API
Date: Tue,  8 Oct 2019 18:17:21 +0100
Message-Id: <20191008171740.9679-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42d
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the new transaction-based API. If a ptimer is created
using ptimer_init() rather than ptimer_init_with_bh(), then
instead of providing a QEMUBH, it provides a pointer to the
callback function directly, and has opted into the transaction
API. All calls to functions which modify ptimer state:
 - ptimer_set_period()
 - ptimer_set_freq()
 - ptimer_set_limit()
 - ptimer_set_count()
 - ptimer_run()
 - ptimer_stop()
must be between matched calls to ptimer_transaction_begin()
and ptimer_transaction_commit(). When ptimer_transaction_commit()
is called it will evaluate the state of the timer after all the
changes in the transaction, and call the callback if necessary.

In the old API the individual update functions generally would
call ptimer_trigger() immediately, which would schedule the QEMUBH.
In the new API the update functions will instead defer the
"set s->next_event and call ptimer_reload()" work to
ptimer_transaction_commit().

Because ptimer_trigger() can now immediately call into the
device code which may then call other ptimer functions that
update ptimer_state fields, we must be more careful in
ptimer_reload() not to cache fields from ptimer_state across
the ptimer_trigger() call. (This was harmless with the QEMUBH
mechanism as the BH would not be invoked until much later.)

We use assertions to check that:
 * the functions modifying ptimer state are not called outside
   a transaction block
 * ptimer_transaction_begin() and _commit() calls are paired
 * the transaction API is not used with a QEMUBH ptimer

There is some slight repetition of code:
 * most of the set functions have similar looking "if s->bh
   call ptimer_reload, otherwise set s->need_reload" code
 * ptimer_init() and ptimer_init_with_bh() have similar code
We deliberately don't try to avoid this repetition, because
it will all be deleted when the QEMUBH version of the API
is removed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes since v1:
 * ptimer_transaction_begin() now sets need_reload to false
 * fixed assert condition in ptimer_transaction_begin()
 * ptimer_transaction_commit() now has a loop to call
   ptimer_reload() again if the callback function updated
   the ptimer state such that it needs to trigger again
 * fixed callback_opaque arg name mismatch in doc comment
 * don't cache delta, period, etc across ptimer_trigger() call

RTH: I know you gave a reviewed-by-with-caveats to v1 of
this patch but I feel like there turned out to be enough
things needing fixing that I'd rather you looked at v2 afresh.
---
 include/hw/ptimer.h |  72 +++++++++++++++++++++
 hw/core/ptimer.c    | 152 +++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 209 insertions(+), 15 deletions(-)

diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 2fb9ba1915e..4c321f65dcb 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -91,6 +91,38 @@ typedef void (*ptimer_cb)(void *opaque);
  */
 ptimer_state *ptimer_init_with_bh(QEMUBH *bh, uint8_t policy_mask);
 
+/**
+ * ptimer_init - Allocate and return a new ptimer
+ * @callback: function to call on ptimer expiry
+ * @callback_opaque: opaque pointer passed to @callback
+ * @policy: PTIMER_POLICY_* bits specifying behaviour
+ *
+ * The ptimer returned must be freed using ptimer_free().
+ *
+ * If a ptimer is created using this API then will use the
+ * transaction-based API for modifying ptimer state: all calls
+ * to functions which modify ptimer state:
+ *  - ptimer_set_period()
+ *  - ptimer_set_freq()
+ *  - ptimer_set_limit()
+ *  - ptimer_set_count()
+ *  - ptimer_run()
+ *  - ptimer_stop()
+ * must be between matched calls to ptimer_transaction_begin()
+ * and ptimer_transaction_commit(). When ptimer_transaction_commit()
+ * is called it will evaluate the state of the timer after all the
+ * changes in the transaction, and call the callback if necessary.
+ *
+ * The callback function is always called from within a transaction
+ * begin/commit block, so the callback should not call the
+ * ptimer_transaction_begin() function itself. If the callback changes
+ * the ptimer state such that another ptimer expiry is triggered, then
+ * the callback will be called a second time after the first call returns.
+ */
+ptimer_state *ptimer_init(ptimer_cb callback,
+                          void *callback_opaque,
+                          uint8_t policy_mask);
+
 /**
  * ptimer_free - Free a ptimer
  * @s: timer to free
@@ -100,6 +132,28 @@ ptimer_state *ptimer_init_with_bh(QEMUBH *bh, uint8_t policy_mask);
  */
 void ptimer_free(ptimer_state *s);
 
+/**
+ * ptimer_transaction_begin() - Start a ptimer modification transaction
+ *
+ * This function must be called before making any calls to functions
+ * which modify the ptimer's state (see the ptimer_init() documentation
+ * for a list of these), and must always have a matched call to
+ * ptimer_transaction_commit().
+ * It is an error to call this function for a BH-based ptimer;
+ * attempting to do this will trigger an assert.
+ */
+void ptimer_transaction_begin(ptimer_state *s);
+
+/**
+ * ptimer_transaction_commit() - Commit a ptimer modification transaction
+ *
+ * This function must be called after calls to functions which modify
+ * the ptimer's state, and completes the update of the ptimer. If the
+ * ptimer state now means that we should trigger the timer expiry
+ * callback, it will be called directly.
+ */
+void ptimer_transaction_commit(ptimer_state *s);
+
 /**
  * ptimer_set_period - Set counter increment interval in nanoseconds
  * @s: ptimer to configure
@@ -108,6 +162,9 @@ void ptimer_free(ptimer_state *s);
  * Note that if your counter behaviour is specified as having a
  * particular frequency rather than a period then ptimer_set_freq()
  * may be more appropriate.
+ *
+ * This function will assert if it is called outside a
+ * ptimer_transaction_begin/commit block, unless this is a bottom-half ptimer.
  */
 void ptimer_set_period(ptimer_state *s, int64_t period);
 
@@ -121,6 +178,9 @@ void ptimer_set_period(ptimer_state *s, int64_t period);
  * as setting the frequency then this function is more appropriate,
  * because it allows specifying an effective period which is
  * precise to fractions of a nanosecond, avoiding rounding errors.
+ *
+ * This function will assert if it is called outside a
+ * ptimer_transaction_begin/commit block, unless this is a bottom-half ptimer.
  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq);
 
@@ -148,6 +208,9 @@ uint64_t ptimer_get_limit(ptimer_state *s);
  * Set the limit value of the down-counter. The @reload flag can
  * be used to emulate the behaviour of timers which immediately
  * reload the counter when their reload register is written to.
+ *
+ * This function will assert if it is called outside a
+ * ptimer_transaction_begin/commit block, unless this is a bottom-half ptimer.
  */
 void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload);
 
@@ -169,6 +232,9 @@ uint64_t ptimer_get_count(ptimer_state *s);
  * Set the value of the down-counter. If the counter is currently
  * enabled this will arrange for a timer callback at the appropriate
  * point in the future.
+ *
+ * This function will assert if it is called outside a
+ * ptimer_transaction_begin/commit block, unless this is a bottom-half ptimer.
  */
 void ptimer_set_count(ptimer_state *s, uint64_t count);
 
@@ -183,6 +249,9 @@ void ptimer_set_count(ptimer_state *s, uint64_t count);
  * the counter value will then be reloaded from the limit and it will
  * start counting down again. If @oneshot is non-zero, then the counter
  * will disable itself when it reaches zero.
+ *
+ * This function will assert if it is called outside a
+ * ptimer_transaction_begin/commit block, unless this is a bottom-half ptimer.
  */
 void ptimer_run(ptimer_state *s, int oneshot);
 
@@ -195,6 +264,9 @@ void ptimer_run(ptimer_state *s, int oneshot);
  *
  * Note that this can cause it to "lose" time, even if it is immediately
  * restarted.
+ *
+ * This function will assert if it is called outside a
+ * ptimer_transaction_begin/commit block, unless this is a bottom-half ptimer.
  */
 void ptimer_stop(ptimer_state *s);
 
diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index f0d3ce11398..7239b8227cc 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -31,6 +31,16 @@ struct ptimer_state
     uint8_t policy_mask;
     QEMUBH *bh;
     QEMUTimer *timer;
+    ptimer_cb callback;
+    void *callback_opaque;
+    /*
+     * These track whether we're in a transaction block, and if we
+     * need to do a timer reload when the block finishes. They don't
+     * need to be migrated because migration can never happen in the
+     * middle of a transaction block.
+     */
+    bool in_transaction;
+    bool need_reload;
 };
 
 /* Use a bottom-half routine to avoid reentrancy issues.  */
@@ -39,13 +49,16 @@ static void ptimer_trigger(ptimer_state *s)
     if (s->bh) {
         replay_bh_schedule_event(s->bh);
     }
+    if (s->callback) {
+        s->callback(s->callback_opaque);
+    }
 }
 
 static void ptimer_reload(ptimer_state *s, int delta_adjust)
 {
-    uint32_t period_frac = s->period_frac;
-    uint64_t period = s->period;
-    uint64_t delta = s->delta;
+    uint32_t period_frac;
+    uint64_t period;
+    uint64_t delta;
     bool suppress_trigger = false;
 
     /*
@@ -58,11 +71,20 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         (s->policy_mask & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT)) {
         suppress_trigger = true;
     }
-    if (delta == 0 && !(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)
+    if (s->delta == 0 && !(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)
         && !suppress_trigger) {
         ptimer_trigger(s);
     }
 
+    /*
+     * Note that ptimer_trigger() might call the device callback function,
+     * which can then modify timer state, so we must not cache any fields
+     * from ptimer_state until after we have called it.
+     */
+    delta = s->delta;
+    period = s->period;
+    period_frac = s->period_frac;
+
     if (delta == 0 && !(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_RELOAD)) {
         delta = s->delta = s->limit;
     }
@@ -136,6 +158,15 @@ static void ptimer_tick(void *opaque)
     ptimer_state *s = (ptimer_state *)opaque;
     bool trigger = true;
 
+    /*
+     * We perform all the tick actions within a begin/commit block
+     * because the callback function that ptimer_trigger() calls
+     * might make calls into the ptimer APIs that provoke another
+     * trigger, and we want that to cause the callback function
+     * to be called iteratively, not recursively.
+     */
+    ptimer_transaction_begin(s);
+
     if (s->enabled == 2) {
         s->delta = 0;
         s->enabled = 0;
@@ -164,6 +195,8 @@ static void ptimer_tick(void *opaque)
     if (trigger) {
         ptimer_trigger(s);
     }
+
+    ptimer_transaction_commit(s);
 }
 
 uint64_t ptimer_get_count(ptimer_state *s)
@@ -263,10 +296,15 @@ uint64_t ptimer_get_count(ptimer_state *s)
 
 void ptimer_set_count(ptimer_state *s, uint64_t count)
 {
+    assert(s->in_transaction || !s->callback);
     s->delta = count;
     if (s->enabled) {
-        s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s, 0);
+        if (!s->callback) {
+            s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            ptimer_reload(s, 0);
+        } else {
+            s->need_reload = true;
+        }
     }
 }
 
@@ -274,6 +312,8 @@ void ptimer_run(ptimer_state *s, int oneshot)
 {
     bool was_disabled = !s->enabled;
 
+    assert(s->in_transaction || !s->callback);
+
     if (was_disabled && s->period == 0) {
         if (!qtest_enabled()) {
             fprintf(stderr, "Timer with period zero, disabling\n");
@@ -282,8 +322,12 @@ void ptimer_run(ptimer_state *s, int oneshot)
     }
     s->enabled = oneshot ? 2 : 1;
     if (was_disabled) {
-        s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s, 0);
+        if (!s->callback) {
+            s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            ptimer_reload(s, 0);
+        } else {
+            s->need_reload = true;
+        }
     }
 }
 
@@ -291,35 +335,50 @@ void ptimer_run(ptimer_state *s, int oneshot)
    is immediately restarted.  */
 void ptimer_stop(ptimer_state *s)
 {
+    assert(s->in_transaction || !s->callback);
+
     if (!s->enabled)
         return;
 
     s->delta = ptimer_get_count(s);
     timer_del(s->timer);
     s->enabled = 0;
+    if (s->callback) {
+        s->need_reload = false;
+    }
 }
 
 /* Set counter increment interval in nanoseconds.  */
 void ptimer_set_period(ptimer_state *s, int64_t period)
 {
+    assert(s->in_transaction || !s->callback);
     s->delta = ptimer_get_count(s);
     s->period = period;
     s->period_frac = 0;
     if (s->enabled) {
-        s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s, 0);
+        if (!s->callback) {
+            s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            ptimer_reload(s, 0);
+        } else {
+            s->need_reload = true;
+        }
     }
 }
 
 /* Set counter frequency in Hz.  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 {
+    assert(s->in_transaction || !s->callback);
     s->delta = ptimer_get_count(s);
     s->period = 1000000000ll / freq;
     s->period_frac = (1000000000ll << 32) / freq;
     if (s->enabled) {
-        s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s, 0);
+        if (!s->callback) {
+            s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            ptimer_reload(s, 0);
+        } else {
+            s->need_reload = true;
+        }
     }
 }
 
@@ -327,12 +386,17 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
    count = limit.  */
 void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
 {
+    assert(s->in_transaction || !s->callback);
     s->limit = limit;
     if (reload)
         s->delta = limit;
     if (s->enabled && reload) {
-        s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s, 0);
+        if (!s->callback) {
+            s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            ptimer_reload(s, 0);
+        } else {
+            s->need_reload = true;
+        }
     }
 }
 
@@ -341,6 +405,32 @@ uint64_t ptimer_get_limit(ptimer_state *s)
     return s->limit;
 }
 
+void ptimer_transaction_begin(ptimer_state *s)
+{
+    assert(!s->in_transaction || !s->callback);
+    s->in_transaction = true;
+    s->need_reload = false;
+}
+
+void ptimer_transaction_commit(ptimer_state *s)
+{
+    assert(s->in_transaction);
+    /*
+     * We must loop here because ptimer_reload() can call the callback
+     * function, which might then update ptimer state in a way that
+     * means we need to do another reload and possibly another callback.
+     * A disabled timer never needs reloading (and if we don't check
+     * this then we loop forever if ptimer_reload() disables the timer).
+     */
+    while (s->need_reload && s->enabled) {
+        s->need_reload = false;
+        s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        ptimer_reload(s, 0);
+    }
+    /* Now we've finished reload we can leave the transaction block. */
+    s->in_transaction = false;
+}
+
 const VMStateDescription vmstate_ptimer = {
     .name = "ptimer",
     .version_id = 1,
@@ -377,9 +467,41 @@ ptimer_state *ptimer_init_with_bh(QEMUBH *bh, uint8_t policy_mask)
     return s;
 }
 
+ptimer_state *ptimer_init(ptimer_cb callback, void *callback_opaque,
+                          uint8_t policy_mask)
+{
+    ptimer_state *s;
+
+    /*
+     * The callback function is mandatory; so we use it to distinguish
+     * old-style QEMUBH ptimers from new transaction API ptimers.
+     * (ptimer_init_with_bh() allows a NULL bh pointer and at least
+     * one device (digic-timer) passes NULL, so it's not the case
+     * that either s->bh != NULL or s->callback != NULL.)
+     */
+    assert(callback);
+
+    s = g_new0(ptimer_state, 1);
+    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ptimer_tick, s);
+    s->policy_mask = policy_mask;
+    s->callback = callback;
+    s->callback_opaque = callback_opaque;
+
+    /*
+     * These two policies are incompatible -- trigger-on-decrement implies
+     * a timer trigger when the count becomes 0, but no-immediate-trigger
+     * implies a trigger when the count stops being 0.
+     */
+    assert(!((policy_mask & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT) &&
+             (policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)));
+    return s;
+}
+
 void ptimer_free(ptimer_state *s)
 {
-    qemu_bh_delete(s->bh);
+    if (s->bh) {
+        qemu_bh_delete(s->bh);
+    }
     timer_free(s->timer);
     g_free(s);
 }
-- 
2.20.1


