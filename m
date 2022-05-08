Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2789851EC84
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 11:36:10 +0200 (CEST)
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nndKi-0004Ea-U5
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 05:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGM-0001Wj-KX
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGL-0008PV-5C
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652002296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Edd3So3TMxja3Z4zgQxs9DpKzS8fV2s9+BBNNKuvyfo=;
 b=DnIR4WUpF9/OvnFKRaj08bm73aRZNSalY2HjtcZ2UtBTsCaJo3VtUifoPABPXHRAs1RqEE
 wy2m6UsS41ohgDfAaNC+6EvZhyz0aA191DHFlo1wYsZhUqTJbercbMTb3RpHc0n57knWSY
 Ft4fDV0gthp6d1fp+/wkgB9qw3x7YIE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-AidJnATtMOCR8B7tKmRPHw-1; Sun, 08 May 2022 05:31:35 -0400
X-MC-Unique: AidJnATtMOCR8B7tKmRPHw-1
Received: by mail-ed1-f71.google.com with SMTP id
 eg38-20020a05640228a600b00425d61d0302so6535607edb.17
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 02:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Edd3So3TMxja3Z4zgQxs9DpKzS8fV2s9+BBNNKuvyfo=;
 b=b/1PtT6NGs9AZp9SlCDPX3WvTdtsaS5Zu1gkMh5WIvKZ4JU1xiTqRv0UJa/92tkGI3
 xE4P6qdO9ucRpJGsOxChAsJhIkYpNxPzis58fWVtZwezAIWAgJyfQ+ILXWYKkLPHIa+b
 HmTlbFSn43EFk9eCmhdVVWlwOekll+YKyqJc3DKbo6ql0kstUMxoMlBWzMkoGXKPMAKY
 OROZEHfOWhCzkoGXj0RAopot0ki8zxShknlsa3c1Zfon9fJpxMVvbOo30uWSZVM/Te2S
 jFSrkjr/TrwMO/r4r0gxeu3iyFz4p3YtB6MwZZ3xv89a0fDJjXwWcduCDwNqJ+3/l8LO
 bnLQ==
X-Gm-Message-State: AOAM531R8ek+kCEBJ/jSFA+GYAmnJKSbkQyjmnRHsOhjrXk73qMDDvkS
 GdkNkaShYD0H8KT9fRrlYaH8taEJb2zvo8+ocJfCI782MwDBO1k02gq8L7nFm61zLSeRFAoDw5d
 uj3DynLvjo9liKjW831e6aXKITJT53d8jh3efpBzqV2QIpqz99oWY7sdy7qLRwTLsJWc=
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr9779966ejc.572.1652002293691; 
 Sun, 08 May 2022 02:31:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHNNJF/l0lHNw3Yh31phJbf9ba+m6sFb2We4rD3E6cCUETsNCuwTWkgTM+VzorC6TW+qBfPg==
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr9779945ejc.572.1652002293397; 
 Sun, 08 May 2022 02:31:33 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a170906140900b006f3ef214dcdsm3870017ejc.51.2022.05.08.02.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 02:31:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, malureau@redhat.com,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 2/5] net: slirp: introduce a wrapper struct for QemuTimer
Date: Sun,  8 May 2022 11:31:17 +0200
Message-Id: <20220508093120.173131-3-pbonzini@redhat.com>
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

This struct will be extended in the next few patches to support the
new slirp_handle_timer() call.  For that we need to store an additional
"int" for each SLIRP timer, in addition to the cb_opaque.

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Marc-André Lureau <malureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 net/slirp.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index bc5e9e4f77..f1e25d741f 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -184,23 +184,32 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 }
 
+struct SlirpTimer {
+    QEMUTimer timer;
+}
+
 static void *net_slirp_timer_new(SlirpTimerCb cb,
                                  void *cb_opaque, void *opaque)
 {
-    return timer_new_full(NULL, QEMU_CLOCK_VIRTUAL,
-                          SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
-                          cb, cb_opaque);
+    SlirpTimer *t = g_new(SlirpTimer, 1);
+    timer_init_full(&t->timer, NULL, QEMU_CLOCK_VIRTUAL,
+                    SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
+                    cb, cb_opaque);
+    return t;
 }
 
 static void net_slirp_timer_free(void *timer, void *opaque)
 {
-    timer_free(timer);
+    SlirpTimer *t = timer;
+    timer_del(&t->timer);
+    g_free(t);
 }
 
 static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
                                 void *opaque)
 {
-    timer_mod(timer, expire_timer);
+    SlirpTimer *t = timer;
+    timer_mod(&t->timer, expire_timer);
 }
 
 static void net_slirp_register_poll_fd(int fd, void *opaque)
-- 
2.35.1


