Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1BF7E6C3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 01:46:55 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htKmc-0005c1-D4
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 19:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1htKhb-00062W-Nk
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 19:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1htKhZ-0002pt-FL
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 19:41:43 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1htKhZ-0002of-7m; Thu, 01 Aug 2019 19:41:41 -0400
Received: by mail-pf1-x441.google.com with SMTP id t16so34922784pfe.11;
 Thu, 01 Aug 2019 16:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eFjnzxuAegStXPBjOt40eXvFDqL2hXLnGuTLIfY9ow8=;
 b=hBN4ObvFwtE9So5SJPGbx4BGev2mPDVjEvvGPe7ZQdWqsxbU+sOZCbZbHi5uOfbo8I
 taW3/sxt/jaNZykeGnHHIBm7jjiKPgahW2wa7m/yKgrOrPYEIyoZXNBcCg/gcyo1avOC
 8UBawDGYpvXUG0/nz9viYlB80/uwyUNiBlNzkuLCx26eCzWmqPopYPY7ojiSw73dj8bo
 cvrfwOBDl8dk0GirwK9paH9+UCbpTObZJhSJ+LQnuf77XB57jJFyJHDoeWRfa7ZgmIA2
 I1T+J2kLA1EGbfb2ZPrzHcxMbpvRnjbBF8NorAXlEZAWjKRZv1mJBUKbQzr1sD7TofG+
 GVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFjnzxuAegStXPBjOt40eXvFDqL2hXLnGuTLIfY9ow8=;
 b=tAERQgahKy7dZX2PUXjs1zAM3JIxjTf/WoZIsXqOCvnRPwMn5/DnFi6RkKHus2NH45
 NYpASZCYpsvwPiM+j1znOsVWUSVILnU9bmPC23R87bMl98B2YBdsrjXyxlmsGknQl0KQ
 z4AjorlsG75JQxptZmQE3o/9Q7OVHIgE3qBRyQsHgc+8rj+FzDDFQXcnakOl5To/p/L4
 ZQe3Uz+dCgQXZX/vgcbbFmVaj49kTXAXFWaVa+1hRHCMrlIYZow/MpFzCrm+qq+/bHkq
 UyfB/ge6d6R6bKY5HjIylb1wobbfnJewjo6gWlmCmdEqPbRoA6wOxMDhdrkUX/jD3vS7
 oM/Q==
X-Gm-Message-State: APjAAAVit5hRwOoOorauTAl3GghBsMYoV0tLdKUpbkiqSsQK3Kx221PA
 lxkjFoMX2soyfOehwqsjKDgBVQ7gHY6i6A==
X-Google-Smtp-Source: APXvYqzknEzI3d8LNFMiWr34n5QpGEU74eolJiUbJb392IXoHKZFp17+ZqSs6kiS3FFq3p+VrnTKLA==
X-Received: by 2002:a62:7990:: with SMTP id
 u138mr54062389pfc.191.1564702899107; 
 Thu, 01 Aug 2019 16:41:39 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:572:3de5:765:cb16:92cd:ee3e])
 by smtp.gmail.com with ESMTPSA id
 g18sm117975426pgm.9.2019.08.01.16.41.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 16:41:38 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 05:10:20 +0530
Message-Id: <20190801234031.29561-7-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190801234031.29561-1-mehta.aaru20@gmail.com>
References: <20190801234031.29561-1-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH v9 06/17] util/async: add aio interfaces for
 io_uring
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 saket.sinha89@gmail.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefan@redhat.com>, Julia Suvorova <jusual@mail.ru>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/async.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/util/async.c b/util/async.c
index 8d2105729c..2e0a5e20ac 100644
--- a/util/async.c
+++ b/util/async.c
@@ -276,6 +276,14 @@ aio_ctx_finalize(GSource     *source)
     }
 #endif
 
+#ifdef CONFIG_LINUX_IO_URING
+    if (ctx->linux_io_uring) {
+        luring_detach_aio_context(ctx->linux_io_uring, ctx);
+        luring_cleanup(ctx->linux_io_uring);
+        ctx->linux_io_uring = NULL;
+    }
+#endif
+
     assert(QSLIST_EMPTY(&ctx->scheduled_coroutines));
     qemu_bh_delete(ctx->co_schedule_bh);
 
@@ -340,6 +348,29 @@ LinuxAioState *aio_get_linux_aio(AioContext *ctx)
 }
 #endif
 
+#ifdef CONFIG_LINUX_IO_URING
+LuringState *aio_setup_linux_io_uring(AioContext *ctx, Error **errp)
+{
+    if (ctx->linux_io_uring) {
+        return ctx->linux_io_uring;
+    }
+
+    ctx->linux_io_uring = luring_init(errp);
+    if (!ctx->linux_io_uring) {
+        return NULL;
+    }
+
+    luring_attach_aio_context(ctx->linux_io_uring, ctx);
+    return ctx->linux_io_uring;
+}
+
+LuringState *aio_get_linux_io_uring(AioContext *ctx)
+{
+    assert(ctx->linux_io_uring);
+    return ctx->linux_io_uring;
+}
+#endif
+
 void aio_notify(AioContext *ctx)
 {
     /* Write e.g. bh->scheduled before reading ctx->notify_me.  Pairs
@@ -431,6 +462,11 @@ AioContext *aio_context_new(Error **errp)
 #ifdef CONFIG_LINUX_AIO
     ctx->linux_aio = NULL;
 #endif
+
+#ifdef CONFIG_LINUX_IO_URING
+    ctx->linux_io_uring = NULL;
+#endif
+
     ctx->thread_pool = NULL;
     qemu_rec_mutex_init(&ctx->lock);
     timerlistgroup_init(&ctx->tlg, aio_timerlist_notify, ctx);
-- 
2.21.0


