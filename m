Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1716A4B3075
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:31:36 +0100 (CET)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeRz-0003fh-7W
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:31:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCw-0007IX-2I
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:05 -0500
Received: from [2607:f8b0:4864:20::102b] (port=56225
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCq-0003L6-St
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:01 -0500
Received: by mail-pj1-x102b.google.com with SMTP id om7so9249759pjb.5
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KE39jHISQAB6cFkovEdp7pF20zS0czcpSv+GYIJ8aWA=;
 b=AVwdh87bVvX5ZlCREaWTbEnzG3eiAApMjUbTqm/mf74Cyd8PAb5w7FPcPHLQPE6zbt
 +js0jg2OxCr21ZB6IVIOf1jpcYYU8mPgA5eBcu8JtJ+qGDoDNYx97jo2TURmqjCM90tO
 uydV0n3Bx+AFEPtMO+vCsessXKVnjJWDudG68k88LRBNckdoAilUwVy+8++ovA2j/7+Y
 ZUqWHoQB6vvWKYlKl7KYEKKQx+WWis/SZhPRjUlTsVkduPjsnnw6uMgTUep1D+evNjs+
 SD2bO9klDnvrRa8e0KK3vQ8SxPnXan2WNNzdVKqEixfHgDD/cVXWBV4a09UewbvL8hPQ
 NijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KE39jHISQAB6cFkovEdp7pF20zS0czcpSv+GYIJ8aWA=;
 b=gbp+3DPvDQGq2QXifK+I6/7AySFJ+GwA3Mr+R2bFqGYozW34Wq/X8LUuS/rYBnqgt3
 4mxy6wMpS0q7IEbstJz/IgGuztAK2ZysgRx/pDGjWdCR3KymO2sG+RD3S78qzGxDQzxO
 JiuVe7zCS3Ae+WFQkEsKk1yKWP0B6f29segRs3ZlUGl/O6QtYSQwj/2NXuH5B/e3TjFk
 Xg0EXGHgTMmiq11Gs5zHrYtd/Wjn8KiOmme+XW0kBAEXblh4GZHEIbRbuy0NR3nI4mDS
 bQTDbobfHx3Qhk+kD2ArM0BlT38FEJgiphVU2R7sxXjqhhcBli6zb2I5yutUmg6l0ZXY
 /JJg==
X-Gm-Message-State: AOAM532LAlZD1+Jxyj8c1CTPwyMVaqqMVlcreyIJMICMRhJhuZ3Bnswv
 wO1zaCKXTGKDqJ6aEBrqzic=
X-Google-Smtp-Source: ABdhPJxQfLvF9oHYolDBeA0q9Q/68pzHOqLKjDgImw7YyBUF1xYcLfsJVGkSLfzDMtbdEbMTJdneCA==
X-Received: by 2002:a17:90b:4c91:: with SMTP id
 my17mr2508032pjb.221.1644617755653; 
 Fri, 11 Feb 2022 14:15:55 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:15:55 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 13/25] virtio-snd: Add stub for VIRTIO_SND_R_JACK_REMAP
 handler
Date: Sat, 12 Feb 2022 03:43:07 +0530
Message-Id: <20220211221319.193404-14-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index c2af26f3cb..aec3e86db2 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -167,6 +167,27 @@ done:
     return sizeof(virtio_snd_hdr) + sz;
 }
 
+/*
+ * Handles VIRTIO_SND_R_JACK_REMAP.
+ * Not implemented yet.
+ *
+ * @s: VirtIOSound card
+ * @elem: The request element from control queue
+ */
+static uint32_t virtio_snd_handle_jack_remap(VirtIOSound *s,
+                                             VirtQueueElement *elem)
+{
+    virtio_snd_hdr resp;
+    resp.code = VIRTIO_SND_S_OK;
+
+    /* TODO: implement remap */
+
+    size_t sz;
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+    return sz;
+}
+
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
  * element as used.
@@ -209,7 +230,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             sz = virtio_snd_handle_jack_info(s, elem);
             goto done;
         } else if (ctrl.code == VIRTIO_SND_R_JACK_REMAP) {
-            virtio_snd_log("VIRTIO_SND_R_JACK_REMAP");
+            sz = virtio_snd_handle_jack_remap(s, elem);
+            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_INFO) {
             virtio_snd_log("VIRTIO_SND_R_PCM_INFO");
         } else if (ctrl.code == VIRTIO_SND_R_PCM_SET_PARAMS) {
-- 
2.31.1


