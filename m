Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4153A0FF1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:07:39 +0200 (CEST)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv7a-0003Cj-Oq
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5D-0000Iy-Dk
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:12 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:43753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5A-0006s3-Nb
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:10 -0400
Received: by mail-lf1-x12f.google.com with SMTP id n12so30116337lft.10
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n9qgRrfzY+Rmwjm0+r7ctkec2j7NmFWBk64rftF+Ejk=;
 b=u7yxdxKOmFxiNG9ETcM/9VqPwj6JzXxUJYXOUuPtcni13S6n4gLaLZZEOjkoKZKh31
 5ncefg5+ONTT5aC+x9Ixc3nmVnVlG0fBprUQllJsAm9IAVcCqLY4GNGPk+U+iIhYz0Xt
 FFcGCsbFaXSfV2qU1YMFaQ4yzIJ0bpmMmrDYi5WXeq5I7lUnSKFv97rK+HH/N0Qx2GOf
 TZv+htwBYJFHW6ghMvNVeC1D9e4iN6YXWexVi0lMaULVRlvD7f5PTvUG7YSnKn6U2lWP
 Ns2pjVn4MTbE5KaDTn+QW7uathGc5D9Nnw+HUge5K0JiuD8XnTIyTf5kkOjhFpAiw1qS
 prdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n9qgRrfzY+Rmwjm0+r7ctkec2j7NmFWBk64rftF+Ejk=;
 b=mcnPJUzmVyBW16aR0u/168p+Zvku/Wfp7401V8aX3WHYQZIe4pxnyISlWhN/wOQhj5
 caLaJeQEfkGs0PfQSN97ERBeLdgYOnuZUzLdXLeFU7b4U6dhFmAQ6XvwPpcFkKJ0rCYJ
 v1Px7/ZK65Kq+sX2iZ9EOw5k020IF5O9Wh/8/SVlIjHZebncaaE6INNJFpoSZHlY13uk
 0ZDK4D2qQmKI2melC1h7VnVhpLf5/h6E2P+7tMH3FLVOia1NUKHGZQ4Rt1DJcpMlWuVJ
 N8piDnu2KMzB9DTUREmop4kieFkxMPpT1WprvzMSRYCFYUJTAV+uBN90yG0nL2d5vs7C
 Y9uw==
X-Gm-Message-State: AOAM532PLy5RPGfTz0L+jzeYhhQWpVhWdwPj7yFa9SKHnkvXTa6tpD+H
 WdW0gG/rnbU9F4oWLjBHjeC0aw==
X-Google-Smtp-Source: ABdhPJxaHGHZ+W6R1Kr8MBAhj9hAx6YG79blEQUIzF1fPWA5zyHtcY4bR5Pn2qbo1DQPZTQGzv34dg==
X-Received: by 2002:ac2:443b:: with SMTP id w27mr19768054lfl.295.1623233107143; 
 Wed, 09 Jun 2021 03:05:07 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id l12sm333590lfk.10.2021.06.09.03.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:05:06 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [RFC PATCH 1/5] ebpf: Added eBPF initialization by fds.
Date: Wed,  9 Jun 2021 13:04:53 +0300
Message-Id: <20210609100457.142570-2-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609100457.142570-1-andrew@daynix.com>
References: <20210609100457.142570-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12f;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eBPF RSS context may be initialized by program fd and map fds.
virtio-net may provide fds passed by libvirt.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 ebpf/ebpf_rss-stub.c |  6 ++++++
 ebpf/ebpf_rss.c      | 31 ++++++++++++++++++++++++++++---
 ebpf/ebpf_rss.h      |  5 +++++
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
index e71e229190..8d7fae2ad9 100644
--- a/ebpf/ebpf_rss-stub.c
+++ b/ebpf/ebpf_rss-stub.c
@@ -28,6 +28,12 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
     return false;
 }
 
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd)
+{
+    return false;
+}
+
 bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
                       uint16_t *indirections_table, uint8_t *toeplitz_key)
 {
diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
index 118c68da83..6e9b88efed 100644
--- a/ebpf/ebpf_rss.c
+++ b/ebpf/ebpf_rss.c
@@ -27,19 +27,20 @@ void ebpf_rss_init(struct EBPFRSSContext *ctx)
 {
     if (ctx != NULL) {
         ctx->obj = NULL;
+        ctx->program_fd = -1;
     }
 }
 
 bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
 {
-    return ctx != NULL && ctx->obj != NULL;
+    return ctx != NULL && (ctx->obj != NULL || ctx->program_fd != -1);
 }
 
 bool ebpf_rss_load(struct EBPFRSSContext *ctx)
 {
     struct rss_bpf *rss_bpf_ctx;
 
-    if (ctx == NULL) {
+    if (ctx == NULL || ebpf_rss_is_loaded(ctx)) {
         return false;
     }
 
@@ -70,10 +71,26 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
 error:
     rss_bpf__destroy(rss_bpf_ctx);
     ctx->obj = NULL;
+    ctx->program_fd = -1;
 
     return false;
 }
 
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd)
+{
+    if (ctx == NULL || ebpf_rss_is_loaded(ctx)) {
+        return false;
+    }
+
+    ctx->program_fd = program_fd;
+    ctx->map_configuration = config_fd;
+    ctx->map_toeplitz_key = toeplitz_fd;
+    ctx->map_indirections_table = table_fd;
+
+    return true;
+}
+
 static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
                                 struct EBPFRSSConfig *config)
 {
@@ -160,6 +177,14 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
         return;
     }
 
-    rss_bpf__destroy(ctx->obj);
+    if (ctx->obj != NULL) {
+        rss_bpf__destroy(ctx->obj);
+    } else {
+        close(ctx->program_fd);
+        close(ctx->map_configuration);
+        close(ctx->map_toeplitz_key);
+        close(ctx->map_indirections_table);
+    }
     ctx->obj = NULL;
+    ctx->program_fd = -1;
 }
diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
index bf3f2572c7..363859c8bb 100644
--- a/ebpf/ebpf_rss.h
+++ b/ebpf/ebpf_rss.h
@@ -14,6 +14,8 @@
 #ifndef QEMU_EBPF_RSS_H
 #define QEMU_EBPF_RSS_H
 
+#define EBPF_RSS_MAX_FDS 4
+
 struct EBPFRSSContext {
     void *obj;
     int program_fd;
@@ -36,6 +38,9 @@ bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx);
 
 bool ebpf_rss_load(struct EBPFRSSContext *ctx);
 
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd);
+
 bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
                       uint16_t *indirections_table, uint8_t *toeplitz_key);
 
-- 
2.31.1


