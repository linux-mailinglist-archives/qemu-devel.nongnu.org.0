Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AC451B00A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:03:02 +0200 (CEST)
Received: from localhost ([::1]:60298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmM9F-0000pT-PS
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6a-0006Ye-Se
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6Y-00068x-8K
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651698013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZpbfXhhFu37+qhfFpaMUS+AAe9dGLE6sTDUGZufIQeE=;
 b=eVh50sXNiFO0SI7nSsm02T+Nz+9RdmlbAB49ObAKfze2vRnyNLjuGlF4AqmvnESiH5Pb1Z
 4DNlykhy3WLw6AOnUe6F7BD+WygAjFLf/vtp6UF1M6Bab2tkjGN5zIk0h5wh3YW7AR+hNv
 sqcFk6OgjJoqDQU7hULvMWob7BvkAKI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-gNIoul4gPWeg9YXxcflawg-1; Wed, 04 May 2022 17:00:11 -0400
X-MC-Unique: gNIoul4gPWeg9YXxcflawg-1
Received: by mail-ej1-f71.google.com with SMTP id
 qb36-20020a1709077ea400b006f45e182187so1491142ejc.14
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 14:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZpbfXhhFu37+qhfFpaMUS+AAe9dGLE6sTDUGZufIQeE=;
 b=zJCq0lUZX4v5hBCbEyf/NqpKUqI/AB+TD0Cjhn/4pvWBkfAROyUu427HcpDcP4LPki
 kvg6mlz7k1BHNDbG46KIpZMzO5BgAjo51B3unKw64kDkf3mKsFL2oTWZEqm0YT1F1xE8
 RDaIXC0oNsTmn8PjBn5TQ5HQH57TQGaNwOjXX8LemWv7OsmaUTzc7SjEhJtBbKbxjuBG
 2bYyGsGriKGvldyq2o9TCvdrwJc/CfVSAb+MkX9UPng8rfFev84yz4vCwL3WBqhzctM3
 eW9gbriLg5OZjl5ga9/zz2OZLqnpr0ObxMwWJIPa7UN64j5Asn3lw81HLmYgZi/56q5y
 PuPg==
X-Gm-Message-State: AOAM533LKz9MEcwL596C0M94RHh6JQZnpKrUecv3wmIrgPRfg08/O+5h
 zA3owD42D5gtjoKtSzyKSfrZzWTa3pauKyOieDJGEhuVQG9opMTmSdVpQgD8uO27MApPo+q1GnV
 QuvE0/Wtq9pL3D7ijDezM+47qgeYWQaIKcueUEfcKTHob/rlmUc4gWJnsy4+wIrc++Uo=
X-Received: by 2002:a17:906:58ca:b0:6f4:444f:31ef with SMTP id
 e10-20020a17090658ca00b006f4444f31efmr16107838ejs.135.1651698010383; 
 Wed, 04 May 2022 14:00:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhiVilalOqStR4a555syKmLdhyvdAsHzeisgUiyTFqgFpaj5MYDWg4W4P3eGipbC3JKja4PQ==
X-Received: by 2002:a17:906:58ca:b0:6f4:444f:31ef with SMTP id
 e10-20020a17090658ca00b006f4444f31efmr16107804ejs.135.1651698010092; 
 Wed, 04 May 2022 14:00:10 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 ml20-20020a170906cc1400b006f3ef214dc6sm6087593ejb.44.2022.05.04.14.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:00:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: [PATCH 4/5] net: slirp: add support for CFI-friendly timer API
Date: Wed,  4 May 2022 23:00:00 +0200
Message-Id: <20220504210001.678419-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504210001.678419-1-pbonzini@redhat.com>
References: <20220504210001.678419-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

libslirp 4.7 introduces a CFI-friendly version of the .timer_new callback.
The new callback replaces the function pointer with an enum; invoking the
callback is done with a new function slirp_handle_timer.

Support the new API so that CFI can be made compatible with using a system
libslirp.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 net/slirp.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index b3a92d6e38..57af42299d 100644
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
 
-    cfg.version = 3;
+    cfg.version = SLIRP_CHECK_VERSION(4,7,0) ? 4 : 3;
     cfg.restricted = restricted;
     cfg.in_enabled = ipv4;
     cfg.vnetwork = net;
-- 
2.35.1


