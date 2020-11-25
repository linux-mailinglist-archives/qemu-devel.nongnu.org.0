Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3262C4A47
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 22:54:20 +0100 (CET)
Received: from localhost ([::1]:36270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki2jx-0005aq-Cr
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 16:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PtK-XwMKCuEGMHJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--dje.bounces.google.com>)
 id 1ki2io-0005A6-Pp
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 16:53:07 -0500
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:39855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PtK-XwMKCuEGMHJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--dje.bounces.google.com>)
 id 1ki2im-0007VD-Mk
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 16:53:06 -0500
Received: by mail-pf1-x449.google.com with SMTP id x20so20147pfm.6
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 13:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=1c+hkc6fKPTVXFNT+nM6f3Sk60lyM5QT+iK7Y7bzRdI=;
 b=vHfqAjSwJQdhy8lB3ZR2kOqnlIOICInyKoBfclBhuXp801qF0DCC4YVmm+j1Ugz29Y
 hdvfzDtjMEUN62S9OA+nUie1hvF6TXpPFcV5jJ54MgCg7TKHBp81IoRSFkJzenLE/vwo
 4u7mCJfnem7pbBLS2FQiLWCJH0KTmKAS56iYmqKUtTHflNME0sAbT0JT1Z4QFRENGMsm
 QNCUPS9rXVKi9xTM5OHL8V8lgwEHIs/1FOX5yb8c6lBM934efU4sDEbMVke6D7ZocxvG
 0l2ueJHqgKGTZN6/CPOfAzFJ4SAerzPcy9cFsqkq5B43MOCprVZ7BsGJ6C4jYQfD8Oxy
 I3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=1c+hkc6fKPTVXFNT+nM6f3Sk60lyM5QT+iK7Y7bzRdI=;
 b=sjIFK3uMfiT8Kj/5UghhMy+EhvfquHnWS70ssThDvSU5CcLy7mUtzMV+pbHWVg/5D8
 TJjL+z9TTUpLiKQRMIgL/mEbZkpFJiFAhhktkMuU0qxhSjcNesPIJgmkcp87kwIBxEA4
 KLqT+kBXfRbx+i63JuRueILIt/dYGpwn3wzHy5ySUmZ7FSwrhbaRSReKhI+VQDSTGJ/G
 LFBn52qK6R8bRVlgsOXi55GKwkrCosJvDGvE0PluX+nnZl+TWhQxwFy8uiP1iSnM7tf1
 U4/F6PhrLRIleRPPsV+LhCKLgBk12tu/jxCA5com/Xn7vWnYyVzdpmeNiXLNl43ycp6x
 ppGQ==
X-Gm-Message-State: AOAM533Ci1J8NH8ax17Axe1KfQYpRWFRFKlb/NrHuQK9wH0Wcr3nVc2G
 8o9/V9QKFdrdDDFs0A8CRobrO/MMUj80szceYWjBTfM18wqQ+hmL1FC91Mp97NvotRhTb5G0rfZ
 n6emhE7tJNTB5uyO3Dz0Fb8ymMTHA/+twmKU8nsXf5z5TE25enHIJ
X-Google-Smtp-Source: ABdhPJztIthtYJw1R6DxLLwh6O3QURQXLjYedBZpxMacQjSOvdz4h0R9/73kjzcxwskZjMifdbtV8Ww=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4a0f:cfff:fe66:e570])
 (user=dje job=sendgmr) by 2002:a17:90a:4497:: with SMTP id
 t23mr6606467pjg.39.1606341182432; Wed, 25 Nov 2020 13:53:02 -0800 (PST)
Date: Wed, 25 Nov 2020 13:52:45 -0800
Message-Id: <20201125215245.3514695-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH 1/1] trace: Send "-d trace:help" output to stdout
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3PtK-XwMKCuEGMHJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--dje.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Doug Evans <dje@google.com>
From: Doug Evans via <qemu-devel@nongnu.org>

... for consistency with "-d help".

Signed-off-by: Doug Evans <dje@google.com>
---
 trace/control.c | 12 ++++++------
 trace/control.h |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/trace/control.c b/trace/control.c
index b82fb87316..cd04dd4e0c 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -125,18 +125,18 @@ TraceEvent *trace_event_iter_next(TraceEventIter *iter)
     return NULL;
 }
 
-void trace_list_events(void)
+void trace_list_events(FILE *f)
 {
     TraceEventIter iter;
     TraceEvent *ev;
     trace_event_iter_init(&iter, NULL);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
-        fprintf(stderr, "%s\n", trace_event_get_name(ev));
+        fprintf(f, "%s\n", trace_event_get_name(ev));
     }
 #ifdef CONFIG_TRACE_DTRACE
-    fprintf(stderr, "This list of names of trace points may be incomplete "
-                    "when using the DTrace/SystemTap backends.\n"
-                    "Run 'qemu-trace-stap list %s' to print the full list.\n",
+    fprintf(f, "This list of names of trace points may be incomplete "
+               "when using the DTrace/SystemTap backends.\n"
+               "Run 'qemu-trace-stap list %s' to print the full list.\n",
             error_get_progname());
 #endif
 }
@@ -176,7 +176,7 @@ static void do_trace_enable_events(const char *line_buf)
 void trace_enable_events(const char *line_buf)
 {
     if (is_help_option(line_buf)) {
-        trace_list_events();
+        trace_list_events(stdout);
         if (monitor_cur() == NULL) {
             exit(0);
         }
diff --git a/trace/control.h b/trace/control.h
index 05b95ea453..9522a7b318 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -201,10 +201,11 @@ void trace_fini_vcpu(CPUState *vcpu);
 
 /**
  * trace_list_events:
+ * @f: Where to send output.
  *
  * List all available events.
  */
-void trace_list_events(void);
+void trace_list_events(FILE *f);
 
 /**
  * trace_enable_events:
-- 
2.29.2.454.gaff20da3a2-goog


