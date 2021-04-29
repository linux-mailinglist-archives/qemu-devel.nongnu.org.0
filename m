Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE02236EA96
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:36:00 +0200 (CEST)
Received: from localhost ([::1]:56206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5tf-00051t-Vd
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qy-00088X-4j
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:20 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qm-0000Zp-6G
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:19 -0400
Received: by mail-pf1-x432.google.com with SMTP id 10so3396833pfl.1
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tg/U2oK8rUw630cKi7xvIBA7fZI+pAobioAzHX/Tt4E=;
 b=tLS9efXMRVcao+CvXfV1rjNKK+RNfkeutNHIfJidUW41WgH56RcFrpCLQs/xJYKrW6
 yG5uXXTIJHg0k9DjeL7fze+XdnPfw4gXAK9iw5mIfmuY5tja5HsIDJAdK9mnhdLplQKW
 dU7IGzUYQdjovZ5AaZPrjy3xqIEJlwwb7WU7hTtOBSIF2OxJPPDWXi0t9erCKksgBqlQ
 sXocQPPqG/kw1ggmgUVjZvyVXOYeX8P/+z0cvfBgLaFyL+xidwXyTvefQXBjvGKjn6Ff
 qjg8O3I44f2a6bQtKFxViyif26qQCg4yTqyhrPy65NIfq1tHYh/M4ohV3h0NeSNRYh+Z
 S8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tg/U2oK8rUw630cKi7xvIBA7fZI+pAobioAzHX/Tt4E=;
 b=QFaMm/RGF5vplvxgOZetR8QginkPf6LzKILvfv1ThE1F+FqJxQWt78m8vqcx6z+NdD
 0mSQtoBfIxzT6SDqvHGQo8zDxZjLnmVCbGXqDpFqy63hsVLuwgW0ILD3Ii82k11DE/jw
 Oa3FNUVY13qOnWFfl3AyvFy4a1WDg+8PD2CkJ9sWo7paKfb04GduzfSqcWCDzbe1C6oY
 SrEYkzIkiK+8voY8sc+lviFfiwVvnpUfQL51oECiL6eAk6/9iHAmVzcnDQeTQH3fRSVv
 9J/rt72gP4aBrT5V2kSoPjJFM9kaoLLGHHS3fm8YPesSetA0kLOX2xk4uyd6xTxIa6LJ
 Zrqw==
X-Gm-Message-State: AOAM5339wDX26yFWWheGzqNrcGj6Zrnod/pBATg9SpY/FJ8Lywe/ubeX
 17kgN9tokOYir/gkyV+j21R3r2++r2X8sOqWwDc=
X-Google-Smtp-Source: ABdhPJxVkaqbIfeqVsXM2TDt9ZjrgL9DmWH0JihpnHh0aTQXWGXWaa6pJVmbiy9IjTCiAXmdSdXWxQ==
X-Received: by 2002:a65:624e:: with SMTP id q14mr15734121pgv.90.1619697966880; 
 Thu, 29 Apr 2021 05:06:06 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:06 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 14/27] virtio-snd: Add stub for VIRTIO_SND_R_JACK_REMAP
 handler
Date: Thu, 29 Apr 2021 17:34:32 +0530
Message-Id: <20210429120445.694420-15-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index d50234f9a8..527eed6132 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -175,6 +175,27 @@ done:
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
@@ -217,7 +238,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
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
2.25.1


