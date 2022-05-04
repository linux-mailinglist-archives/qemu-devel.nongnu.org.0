Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9496051B009
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:03:00 +0200 (CEST)
Received: from localhost ([::1]:60124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmM9D-0000im-Gg
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6W-0006SO-Ln
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6U-00068R-PF
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651698010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R4ZvnlIoUjZtjWvuejYgl9KVhXxnZ5y5G5J4vXB5mhQ=;
 b=eYJO72zmziQp/g/Z67Z7aAb0MqjmZ0nfBrhNV+ZTrQb2gL/bGgrSCTDawP81I7N4z4GeH7
 tUjlGa53l9GbLUErce9MYSUhAuWOKLzT0LKBVhA2M9ey1CrLtLDBBUTmnZ8o00QT2jbOhm
 t05D0Y6B8vLz/+Vo6jPQl3xac1rFKyk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-cBSgSCYxPUOdpT1cKtW2kg-1; Wed, 04 May 2022 17:00:08 -0400
X-MC-Unique: cBSgSCYxPUOdpT1cKtW2kg-1
Received: by mail-ej1-f71.google.com with SMTP id
 i14-20020a17090639ce00b006dabe6a112fso1484788eje.13
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 14:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4ZvnlIoUjZtjWvuejYgl9KVhXxnZ5y5G5J4vXB5mhQ=;
 b=OtruzuQq4g2eL8JX5KDsyKP5FrXoCPgG/Ab0DoufbtDuXLaYXKPghjCP4CmABqy7TY
 Ut8qPqFBC6f56rukDfDqz0ClY2Fg0x77fes2QbYPVVx82rd1DlKcvv6xFJUlKJzkboYd
 8wkjAx9nr7wjqaRrTFatVtsQKpxqJ9gbv65j0KSiY+tGIfS/OmGePP+dqJN6AbOi26zB
 EXw23YbmRiAOvxXygSg/0piCIZMlOW5qGtqOKKQ4d0XDF3ShGNlR4PLnbpyJhrNM6nlE
 zybigLimAZui+3hLS4WRzi27PFEp+aIR7JCkX/g2nRXtbHEx+Oxqhxz70wnXxUdHRN54
 gcgA==
X-Gm-Message-State: AOAM5314u9snKgv54SGZ505ix2/9p2B++mHhCRI3sX3KTZWkG8nI8SnG
 BYVMVuWNdTpl40aEa3Mm0xmTvUKzM+eiFbolBxM7mWgzOPArk/7oM/j3zjqVRRjgk3rR0smlMta
 qtJ4tJrtJyY7jR/8UjsW/IZMaIuS5KeHhsPmQv8EiquJST35z8LsgfeHctqm/HfC2AAM=
X-Received: by 2002:a05:6402:909:b0:416:6f3c:5c1d with SMTP id
 g9-20020a056402090900b004166f3c5c1dmr24987063edz.108.1651698006954; 
 Wed, 04 May 2022 14:00:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx12JUubqLRfA0SpAavXAIi0SbLQH0qHmFKBS/Q4z6sliyh3H8AuttqDczvULUOF9eMIqNLbA==
X-Received: by 2002:a05:6402:909:b0:416:6f3c:5c1d with SMTP id
 g9-20020a056402090900b004166f3c5c1dmr24987030edz.108.1651698006618; 
 Wed, 04 May 2022 14:00:06 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709070b1400b006f3ef214db8sm5990781ejl.30.2022.05.04.14.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:00:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: [PATCH 2/5] net: slirp: introduce a wrapper struct for QemuTimer
Date: Wed,  4 May 2022 22:59:58 +0200
Message-Id: <20220504210001.678419-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504210001.678419-1-pbonzini@redhat.com>
References: <20220504210001.678419-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

This struct will be extended in the next few patches to support the
new slirp_handle_timer() call.  For that we need to store an additional
"int" for each SLIRP timer, in addition to the cb_opaque.

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


