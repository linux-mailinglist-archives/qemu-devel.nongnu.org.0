Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D533ACEA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:01:38 +0100 (CET)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiAT-0003un-Dq
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6k-00086D-Ig
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:47 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6e-0004J9-AR
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:46 -0400
Received: by mail-pg1-x532.google.com with SMTP id n10so19977847pgl.10
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GoYz0zg2OAHB4zaizuLLFR6HQ9SymmyDjJ2jkSEyIQU=;
 b=mNBzb5/loB1pZZTKPlrYxSIUVCVhD6heoAMJRYceAUXCiLmDc7SpLRk3fy0ukDOscv
 /J78fSWUoU2MlgMbxk0DQgBnybewMefL1cEg45zBkcVBOrpxNCqKb6FM4GM5SkvE9leE
 rKJwL02v3Qxy9gQi+3+d2KgDAY06fY+ScJnhfQKDIfB0snnlExIW/r4dmFSamL5vGPoA
 rlM2tRnujOB8kM0YZUSBqr9iTDjVSedhngk1W0SkJ1rs/ZiI12wqef3c+gvkgNRus8O1
 NK8Irhk3QrUv5Nnn9Pr3myy/+yH5bLhyWMxqxZBDJrI8b0UErCFk3JhP1tg8qEKMXIs4
 PPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GoYz0zg2OAHB4zaizuLLFR6HQ9SymmyDjJ2jkSEyIQU=;
 b=JgO8C7h6IXOYNazAY3fq9aSNVBehwDBgy5m7XhSGQAAfmWF+V3XGF9n21qwJ3V+a0G
 4RKQymQdChyRlE0wOVFRgAlyh9OxiF3+83+d9UzkjIaKUQMKhwRk6BXFHiV1u3Z1OdXu
 +yMpCWT4YGm3HxxrMI+YBvwSqxj4n4AjVdDjNQvGgSPJZaLoGfW3IBVsESawcNKxPKvc
 5lT6Bo2vMycXkQsQXYuxuS1wHmtjB3ozfXLTfzwhsX+6osKoQ5wbYgNsuPMZTffXouno
 apgVO4B8AmXa6uKgqKdoioFIndLOYiKUaSNmLVT29q9REgne/ExFnBI+A1t+8spclgy2
 mhLQ==
X-Gm-Message-State: AOAM5335hydwnQULzquWg/vwg/MwQN4ZrWPIXIaXv4npDiMNu82MnZ4O
 NM9ODN+XVlxS7YbBGUsSBivUaN/Yp2g=
X-Google-Smtp-Source: ABdhPJyIpyEGDyU/Zn9eqZB0xZF+zLXzhX41riGDwcDGX0K1IBpG0j0vB84JpSgPeFpkdZa/FnHNTQ==
X-Received: by 2002:a62:e708:0:b029:1f8:c092:ff93 with SMTP id
 s8-20020a62e7080000b02901f8c092ff93mr9096491pfh.21.1615795059044; 
 Mon, 15 Mar 2021 00:57:39 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:38 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 04/13] net: tap: Pad short frames to minimum size before
 send
Date: Mon, 15 Mar 2021 15:57:09 +0800
Message-Id: <20210315075718.5402-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do the same for tap backend as what we did for slirp.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 net/tap-win32.c | 12 ++++++++++++
 net/tap.c       | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/net/tap-win32.c b/net/tap-win32.c
index 2b5dcda36e..ec35ab8ce7 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -31,6 +31,7 @@
 
 #include "qemu-common.h"
 #include "clients.h"            /* net_init_tap */
+#include "net/eth.h"
 #include "net/net.h"
 #include "net/tap.h"            /* tap_has_ufo, ... */
 #include "qemu/error-report.h"
@@ -688,9 +689,20 @@ static void tap_win32_send(void *opaque)
     uint8_t *buf;
     int max_size = 4096;
     int size;
+    uint8_t min_buf[ETH_ZLEN];
 
     size = tap_win32_read(s->handle, &buf, max_size);
     if (size > 0) {
+        if (!s->nc.peer->do_not_pad) {
+            /* Pad to minimum Ethernet frame length */
+            if (size < ETH_ZLEN) {
+                memcpy(min_buf, buf, size);
+                memset(&min_buf[size], 0, ETH_ZLEN - size);
+                buf = min_buf;
+                size = ETH_ZLEN;
+            }
+        }
+
         qemu_send_packet(&s->nc, buf, size);
         tap_win32_free_buffer(s->handle, buf);
     }
diff --git a/net/tap.c b/net/tap.c
index b7512853f4..f96b1ccfc0 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -32,6 +32,7 @@
 #include <sys/socket.h>
 #include <net/if.h>
 
+#include "net/eth.h"
 #include "net/net.h"
 #include "clients.h"
 #include "monitor/monitor.h"
@@ -189,6 +190,7 @@ static void tap_send(void *opaque)
 
     while (true) {
         uint8_t *buf = s->buf;
+        uint8_t min_buf[ETH_ZLEN];
 
         size = tap_read_packet(s->fd, s->buf, sizeof(s->buf));
         if (size <= 0) {
@@ -200,6 +202,16 @@ static void tap_send(void *opaque)
             size -= s->host_vnet_hdr_len;
         }
 
+        if (!s->nc.peer->do_not_pad) {
+            /* Pad to minimum Ethernet frame length */
+            if (size < ETH_ZLEN) {
+                memcpy(min_buf, buf, size);
+                memset(&min_buf[size], 0, ETH_ZLEN - size);
+                buf = min_buf;
+                size = ETH_ZLEN;
+            }
+        }
+
         size = qemu_send_packet_async(&s->nc, buf, size, tap_send_completed);
         if (size == 0) {
             tap_read_poll(s, false);
-- 
2.25.1


