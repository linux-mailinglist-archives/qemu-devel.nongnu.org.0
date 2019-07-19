Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBE26E69F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 15:38:06 +0200 (CEST)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoT5I-0001tk-UT
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 09:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37927)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1hoT3v-0004u4-My
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:36:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1hoT3u-0007u7-JF
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:36:39 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43320)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1hoT3u-0007tf-Ds; Fri, 19 Jul 2019 09:36:38 -0400
Received: by mail-pf1-x443.google.com with SMTP id i189so14205901pfg.10;
 Fri, 19 Jul 2019 06:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eFjnzxuAegStXPBjOt40eXvFDqL2hXLnGuTLIfY9ow8=;
 b=RebFAGVJkcZKtmrkzEZ4nebaOaPuqSOBSXT7C7NhIEQtEEx6YKpcA3hHRhJdLbJSvH
 URBTRkpK9uHKtvdDYOW2mo55hy3sumUsrzuh7gh5RPC3ABn+gThmGBpbv0Zu830Aqmty
 K3uXM8Eg/lTb73V7Z0rPOpKGBrlBgn7Lnt6E3lMUGSIKuUoQlYxuOQaYO2IHospQ7dPc
 FFpbAHInTiOqAJpXOM4e38t9SmjJCKreTRnYQbFOp2+qf0vk9OV7leGQmCsxSou/0LkT
 SUFedYLAdS49K85v5wHxTxwWB7s0dIK1VIWG7X5H9ZR6FvYbsYFmXsW8VsHsqw36mEYD
 TvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFjnzxuAegStXPBjOt40eXvFDqL2hXLnGuTLIfY9ow8=;
 b=Zl9cczvO5s6UWMY3Po0CetFxSVndAYNhWB4PTndQ4Mwv04y5WEsW6ibiYPqygIzJG7
 5Vb/unt6CXnlC/tLVED4v7q8O4AtlQW+noRdOgXLeJVsVkhigFo2kcyXK8UiuOfRz17D
 wYWhUB6BavMYGsPOspZildo5n3KtuFpYPGpSctbj/PWORqifNVeqrGt2xIrO1YPzedF4
 hjZWwgmSJGMRJz/OuH7/10B5Ok7QE3Rv6hL4ImdKC//GMDavo7eVG8oVlC3nMT3x/eUN
 os7nhI9q8tgo5x/StUyDSnUi4ORGYpt+PM0/B0iZD04E1Nmw50Gv+aQx4X8++b5sFk2p
 EpJQ==
X-Gm-Message-State: APjAAAUnvQyUuSRyR1G6i1yRDwCtKMKgU0i6djrZzWVJrnd1EdxArYrI
 RSU/mxcwCrUFMBjd6BJQQb+d53IQp1A=
X-Google-Smtp-Source: APXvYqwmXFfy9NqCX/JJQrrktnjZR0cu+A+s15Lyx/8B4c+e1WdAiiUVkpdncNU8trpBveQXjnEf5w==
X-Received: by 2002:a17:90a:25af:: with SMTP id
 k44mr56882008pje.122.1563543397184; 
 Fri, 19 Jul 2019 06:36:37 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:433:31a4:f2fb:dab8:3a89:c056])
 by smtp.gmail.com with ESMTPSA id 11sm31895369pfw.33.2019.07.19.06.36.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 06:36:36 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 19:05:22 +0530
Message-Id: <20190719133530.28688-7-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190719133530.28688-1-mehta.aaru20@gmail.com>
References: <20190719133530.28688-1-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH v6 06/14] util/async: add aio interfaces for
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 saket.sinha89@gmail.com, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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


