Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6A525471
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:08:10 +0200 (CEST)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDEO-0008K9-KG
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZU-00050Y-29
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZS-0005El-E9
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uN41KdvmokQ6BbPR7lVRx/nvOulv1cDFTFX/c66c08E=;
 b=XrfeNmMXcO9uMHm90dJixUcTOAqroXfYV+1X2sO5ej8rDKsrRda7t5j/aL8dlbXFYLDDkE
 To2Jq4dICDOfvkw14JNZFTIo87YJ5R9DgsYyrjKhO8GI7omR0zfwiUct20B2iCQLUvJILC
 w2EnrL0LZEa88myq6/L16mqqQ91CLn0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-xkUK2GlvNhSuktgUSswcXA-1; Thu, 12 May 2022 13:25:48 -0400
X-MC-Unique: xkUK2GlvNhSuktgUSswcXA-1
Received: by mail-ej1-f69.google.com with SMTP id
 qb36-20020a1709077ea400b006f45e182187so3160705ejc.14
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uN41KdvmokQ6BbPR7lVRx/nvOulv1cDFTFX/c66c08E=;
 b=bSNsYrYGQRUegFc8BFBPdFnw7UKeOL//Qx1X0qVsHuqo2zCffdkpT+2Z74YOy0SLWB
 ZBky3yDjjtr+3BzI33TUmtnvkUdfIhq6N4qrFFp/LFiKUE9i/NE0aZWff9nsO1C7laBl
 pcBLRWcQ4KUm9jv/N5ycMRSxtKZqKImHgCWCIOe1WRUVN9fKfNIGL7kvhAm4unt1vF5H
 6UR2tGfLggLO3zDoVGtUXtJD0I0MMLYF96kvh/F68i0HFy5OOv42zNIBruK4Hn0bh9tt
 aivKgQB2LXNU9WJl4wDB+11C1TN1hjhoQTVegaX3vlbHdqgxJpfuVDnsYEdS9RaapQYP
 WxEQ==
X-Gm-Message-State: AOAM533YUch0AiNGE7yAhRrydc0Xz6FXGAB6JWAu5ajJy1sPRQ4gkH2Q
 DosNzpPwyUHsWyslrvMVADbpD68Zb3kst4wqYLNwY4O/N9k+EjZGmnUDASJ4H3GguMr33KQaKLz
 TdhCvGHAERV4epQkrkqT7ABgghfN02x2tZynOZUMWT9zi8LHB+tkIuGJs1b6H2MrCvXs=
X-Received: by 2002:a50:ee11:0:b0:425:b5b3:a48d with SMTP id
 g17-20020a50ee11000000b00425b5b3a48dmr36093336eds.246.1652376347018; 
 Thu, 12 May 2022 10:25:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybP3V9wZuOGejmSUZAUUrh7dpCxJJyxcz4CmxRph8lEJGPJGzHHMWtAd20bDroC67CwyFQ2Q==
X-Received: by 2002:a50:ee11:0:b0:425:b5b3:a48d with SMTP id
 g17-20020a50ee11000000b00425b5b3a48dmr36093320eds.246.1652376346758; 
 Thu, 12 May 2022 10:25:46 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170906645300b006f3ef214e69sm2278243ejn.207.2022.05.12.10.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <malureau@redhat.com>
Subject: [PULL 19/27] net: slirp: add support for CFI-friendly timer API
Date: Thu, 12 May 2022 19:24:57 +0200
Message-Id: <20220512172505.1065394-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
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
2.36.0


