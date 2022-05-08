Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F0C51EC86
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 11:37:15 +0200 (CEST)
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nndLm-0007aV-HI
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 05:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGS-0001jD-IB
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGP-0008Q3-NJ
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652002301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Q0oZqb6yj0OcLtD/ZphSKvdIEW4L+ncCKHPCunEiwQ=;
 b=L74wbjpBKBFr15EbEFgoteDkAtmQXtWF6wUIfN1B/+ACroliqSaAIizaMqYWf9vltxQfE2
 FGk8VeZFnZXi0wyaS1C0DtkzaX5tHRAviiCoT6lAYh80FGZMi8k3Z696dhh9Xv8kLLYw2D
 y5BXa6LVlas/CBqZ3qDykXFGrqVGAh4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-xBjjHiKXMyOLU2dVNlv_sA-1; Sun, 08 May 2022 05:31:40 -0400
X-MC-Unique: xBjjHiKXMyOLU2dVNlv_sA-1
Received: by mail-ed1-f69.google.com with SMTP id
 r26-20020a50aada000000b00425afa72622so6486464edc.19
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 02:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Q0oZqb6yj0OcLtD/ZphSKvdIEW4L+ncCKHPCunEiwQ=;
 b=uOToo4JqdX1Sj4d2GHF8veQqo4kvmLUdtlMMwLD6smYdSaTVKsld3jigkXu6VEjJja
 7nZRp1b9WXOyp/XbemJmSthvSoHZ5T0ZtYeQAKaIFNcCi5O15Hq2pPcXmM8j8ZzLA65k
 2YA3X7g7TDMaWIJpJmJEL6E6maKNnGVoE5TYA+CNRhInAWVXvRlKuNQas5FIUYvtlAru
 rEw1T16tqBxNWsZpdXy7qLDsE8fmar6opZHl0Tvxk+thZKpNdaEbDIMHFxKzibpmqmD1
 B+ReCfRr3AIJZpoZG+SBmeCvomtbTS8q8qvTcCsPjxxilbSVWr1c6p/VL6Ai8mPi6oyW
 pIIQ==
X-Gm-Message-State: AOAM533Prz3kzigDJ20syarRbjA2WwHGRymEeVKBEHgf6FZj3ok+yYou
 wOPjys22pKPmC1napajYsWnFGGHXEnNV5lU9oUx+ywRuLAMi1Vysu+5RT15g813W3azijtLEm33
 BkQIxlT6ZzMSFF68FNmP5CBN3J5HTgwBpnq8LA7hqbhKJkCLKw1hJ0Px8IvBgpWgEMjI=
X-Received: by 2002:a05:6402:3485:b0:427:cde4:2097 with SMTP id
 v5-20020a056402348500b00427cde42097mr11678877edc.264.1652002298598; 
 Sun, 08 May 2022 02:31:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQyhxHzDtEwijVmZhPQMzUGyAWwDcVsJBFoTinWJu2BegRixmnf75O6HZDU6WKsI3aid020Q==
X-Received: by 2002:a05:6402:3485:b0:427:cde4:2097 with SMTP id
 v5-20020a056402348500b00427cde42097mr11678845edc.264.1652002298252; 
 Sun, 08 May 2022 02:31:38 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 gc35-20020a1709072b2300b006f3ef214db7sm3849744ejc.29.2022.05.08.02.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 02:31:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, malureau@redhat.com,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 4/5] net: slirp: add support for CFI-friendly timer API
Date: Sun,  8 May 2022 11:31:19 +0200
Message-Id: <20220508093120.173131-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220508093120.173131-1-pbonzini@redhat.com>
References: <20220508093120.173131-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libslirp 4.7 introduces a CFI-friendly version of the .timer_new callback.
The new callback replaces the function pointer with an enum; invoking the
callback is done with a new function slirp_handle_timer.

Support the new API so that CFI can be made compatible with using a system
libslirp.

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Marc-André Lureau <malureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 net/slirp.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index b7464be86b..8679be6444 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -184,10 +184,43 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 }
 
+typedef struct SlirpTimer SlirpTimer;
 struct SlirpTimer {
     QEMUTimer timer;
+#if SLIRP_CHECK_VERSION(4,7,0)
+    Slirp *slirp;
+    SlirpTimerId id;
+    void *cb_opaque;
+#endif
+};
+
+#if SLIRP_CHECK_VERSION(4,7,0)
+static void net_slirp_init_completed(Slirp *slirp, void *opaque)
+{
+    SlirpState *s = opaque;
+    s->slirp = slirp;
 }
 
+static void net_slirp_timer_cb(void *opaque)
+{
+    SlirpTimer *t = opaque;
+    slirp_handle_timer(t->slirp, t->id, t->cb_opaque);
+}
+
+static void *net_slirp_timer_new_opaque(SlirpTimerId id,
+                                        void *cb_opaque, void *opaque)
+{
+    SlirpState *s = opaque;
+    SlirpTimer *t = g_new(SlirpTimer, 1);
+    t->slirp = s->slirp;
+    t->id = id;
+    t->cb_opaque = cb_opaque;
+    timer_init_full(&t->timer, NULL, QEMU_CLOCK_VIRTUAL,
+                    SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
+                    net_slirp_timer_cb, t);
+    return t;
+}
+#else
 static void *net_slirp_timer_new(SlirpTimerCb cb,
                                  void *cb_opaque, void *opaque)
 {
@@ -197,6 +230,7 @@ static void *net_slirp_timer_new(SlirpTimerCb cb,
                     cb, cb_opaque);
     return t;
 }
+#endif
 
 static void net_slirp_timer_free(void *timer, void *opaque)
 {
@@ -231,7 +265,12 @@ static const SlirpCb slirp_cb = {
     .send_packet = net_slirp_send_packet,
     .guest_error = net_slirp_guest_error,
     .clock_get_ns = net_slirp_clock_get_ns,
+#if SLIRP_CHECK_VERSION(4,7,0)
+    .init_completed = net_slirp_init_completed,
+    .timer_new_opaque = net_slirp_timer_new_opaque,
+#else
     .timer_new = net_slirp_timer_new,
+#endif
     .timer_free = net_slirp_timer_free,
     .timer_mod = net_slirp_timer_mod,
     .register_poll_fd = net_slirp_register_poll_fd,
@@ -578,7 +617,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
 
     s = DO_UPCAST(SlirpState, nc, nc);
 
-    cfg.version = 1;
+    cfg.version = SLIRP_CHECK_VERSION(4,7,0) ? 4 : 1;
     cfg.restricted = restricted;
     cfg.in_enabled = ipv4;
     cfg.vnetwork = net;
-- 
2.35.1


