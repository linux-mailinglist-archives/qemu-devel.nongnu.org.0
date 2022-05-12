Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F308525467
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:02:48 +0200 (CEST)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npD9D-00038O-Eo
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZQ-0004y2-8y
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZO-0005Bv-Mh
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHrr13SVmPCi8WY8+0M3Fh6bU4tF/bEOWylIC0/I66s=;
 b=Uy9H0o+UEacm1WnkheOIpMYA00LRzRSFC+4FLMHTaHTjxwvt9PtLcs0p39wO1fvhOFIrhE
 BguuGRupvJ/a6uUrP9DKxirklvdrauGC4TaD7+eI8SJEiSrgjLatbQvlPdqXoavmQ9rsWY
 DM9D3CS+JxjkHwSNPMl2RcZLoJLpZs8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-DtPuwUAYNTSFkcRQ1ay_yA-1; Thu, 12 May 2022 13:25:45 -0400
X-MC-Unique: DtPuwUAYNTSFkcRQ1ay_yA-1
Received: by mail-ed1-f72.google.com with SMTP id
 r8-20020a056402018800b00428b43999feso3489932edv.5
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hHrr13SVmPCi8WY8+0M3Fh6bU4tF/bEOWylIC0/I66s=;
 b=m0rsrDvD1T0Lhfvw7MAlaFGb1922DposJ6wB40GHV/HmCE0iipkT6TAIE5yDQ/mobp
 H8mNlfRZ1M22v76ZcDyKTgR/CEwOQsvqTAKFaqcPE4WMr8g0b4iQNmDcQDFSy/Kv+9TY
 Re/6/6fathlqhykIAqjhh2SH1OWp3Rr/5X6YC2gxlLVbJ64Ibx6mBRNx/B4LmQ9fogok
 gSTSvfnYF4HTsw0ld5LeBIEXJ4rGzD3dpOIEHLbEE+Wj+NcEtplxzrb1+yvqCy7d6JvJ
 vwHXTCgpaRkIrmZyKVgMpg+zTz6YAK58/+jWekxda0Jv/yrEgzPkdgtHJH5E2NdBqk6v
 IyVw==
X-Gm-Message-State: AOAM5308AbfTwuHwZYijWPo6KriED462x7raFsBriGt0eu5tVz/HFDJz
 32oIi0K4hsbHpYnzR673o+MjBIEs5I5eac3mVxdMTdVkQhiydRDb383bEyeC7SujIPDcwhCWZM8
 YoIUAWZ9ex+gFz7XPG/sNcYKUmCMgCwi/p13R8mk2nJWQaeED3lebjV6BVIcPaaGJZdY=
X-Received: by 2002:aa7:c6da:0:b0:428:24bc:e652 with SMTP id
 b26-20020aa7c6da000000b0042824bce652mr36194442eds.21.1652376343485; 
 Thu, 12 May 2022 10:25:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNxZ01JqylR8FKN4+vaYPxcfazHONEnCJFxIOckxUv/qRoS/2bvzVckjgtICvzB4RdQz0dNg==
X-Received: by 2002:aa7:c6da:0:b0:428:24bc:e652 with SMTP id
 b26-20020aa7c6da000000b0042824bce652mr36194424eds.21.1652376343248; 
 Thu, 12 May 2022 10:25:43 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a170906848300b006f3ef214dc6sm2270964ejx.44.2022.05.12.10.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <malureau@redhat.com>
Subject: [PULL 17/27] net: slirp: introduce a wrapper struct for QemuTimer
Date: Thu, 12 May 2022 19:24:55 +0200
Message-Id: <20220512172505.1065394-18-pbonzini@redhat.com>
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
2.36.0


