Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0FB4B30F6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:44:53 +0100 (CET)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeeq-00011X-8P
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:44:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeE8-0008HG-EH
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:16 -0500
Received: from [2607:f8b0:4864:20::102e] (port=44953
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeE4-0003SE-Nk
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:16 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so10080823pjh.3
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7vHXtAc+iw+jjcDwBXJJJW3A1uzOHSjoNooFC1mbnHw=;
 b=Iqro1EhKXClYPMWP8gf3iDpayA9/YZWRjr7Fmf9rvAgzi3q1jLgUfNhA1CAeVgkSuC
 SI+ff6HRuGF+E1x8rOqivhv39JhTnsgBAv3GF5HhszxUYAkytcory9uHHljCpZvAyCN/
 DQEkXL0NJe1qmqED862M81LjW5hyqL5umBuAHJOZTi9echp/rlXQxE8LHfLzbzQk+DaF
 a77hEKr4ZS9lJkrKV15Jx5D5ujiEC7pR24V/XPFf5unw5HL4IeZ+TiqtMtqYhF8ct9iJ
 T/l/KHzgSiVQ1yTD65YKl4rHF8EPnccXzUNIIwGzT33ez8h49BjHp2/ecpaPtT0JZhel
 C6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7vHXtAc+iw+jjcDwBXJJJW3A1uzOHSjoNooFC1mbnHw=;
 b=eTSKErHGKpnxbawyv2lIiUvnOqzcmnYw+1sJMwlY3ksQkd8RChf6K1C24c7n1m/sps
 ol87mwSwa3bNYZhR/Oze1c5BRCyTZ+Y2RbMh6z0cYqm+lJuASDzuPVZBDV0VRli1KLVB
 LgmU3z4t4tv04ii9L794SGvlU5yJ0/T7jso5gkLLwX7pm/Li+HZjO55J7+o2OAaBpruw
 Une9KAYbVpsNLYwNJRheKIj5dQP5GZ/tbo3gwEqwxKUfaQp6R77PSY31gi+wSHhpfJIb
 eVqOf/TydYDOBnZbTppmk+qpLByFV9mf+XwtjRoo++55iL7OSaRjihF3B5mG5aH7DAm4
 01Og==
X-Gm-Message-State: AOAM531XQ6W+bMsqxBp2fAJuvUIPeEE9iIERjujGaek2iDOUAVbGq/6C
 A5/xxJYBv+1wkKJluryilao=
X-Google-Smtp-Source: ABdhPJyf6px/CEaVFEBeZTwMAuR+22l5PmqTvO1IgTWqvcM5S6cJa7cADlVT7od2+vd0X9ZfMIJnZA==
X-Received: by 2002:a17:90a:de10:: with SMTP id
 m16mr2447299pjv.157.1644617813587; 
 Fri, 11 Feb 2022 14:16:53 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:16:53 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 21/25] virtio-snd: Replaced goto with if else
Date: Sat, 12 Feb 2022 03:43:15 +0530
Message-Id: <20220211221319.193404-22-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x102e.google.com
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

Removed goto from the ctrl vq handler and added an if else
branch for error handling.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 7b80a92737..cb83db0e89 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -947,7 +947,7 @@ static uint32_t virtio_snd_handle_pcm_release(VirtIOSound *s,
 static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOSound *s = VIRTIO_SOUND(vdev);
-    virtio_snd_hdr ctrl;
+    virtio_snd_hdr ctrl, resp;
 
     VirtQueueElement *elem = NULL;
     size_t sz;
@@ -959,7 +959,7 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         if (!elem) {
             break;
         }
-        if (iov_size(elem->in_sg, elem->in_num) < sizeof(ctrl) ||
+        if (iov_size(elem->in_sg, elem->in_num) < sizeof(resp) ||
                 iov_size(elem->out_sg, elem->out_num) < sizeof(ctrl)) {
             virtio_snd_err("virtio-snd ctrl missing headers\n");
             virtqueue_detach_element(vq, elem, 0);
@@ -975,41 +975,36 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         if (sz != sizeof(ctrl)) {
             /* error */
             virtio_snd_err("virtio snd ctrl could not read header\n");
+            resp.code = VIRTIO_SND_S_BAD_MSG;
         } else if (ctrl.code == VIRTIO_SND_R_JACK_INFO) {
             sz = virtio_snd_handle_jack_info(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_JACK_REMAP) {
             sz = virtio_snd_handle_jack_remap(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_INFO) {
             sz = virtio_snd_handle_pcm_info(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_SET_PARAMS) {
             sz = virtio_snd_handle_pcm_set_params(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_PREPARE) {
             sz = virtio_snd_handle_pcm_prepare(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_START) {
             sz = virtio_snd_handle_pcm_start_stop(s, elem, true);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_STOP) {
             sz = virtio_snd_handle_pcm_start_stop(s, elem, false);
         } else if (ctrl.code == VIRTIO_SND_R_PCM_RELEASE) {
             sz = virtio_snd_handle_pcm_release(s, elem);
         } else if (ctrl.code == VIRTIO_SND_R_CHMAP_INFO) {
             virtio_snd_log("VIRTIO_SND_R_CHMAP_INFO");
-            goto done;
         } else {
             /* error */
             virtio_snd_err("virtio snd header not recognized: %d\n", ctrl.code);
+            resp.code = VIRTIO_SND_S_BAD_MSG;
         }
 
-        virtio_snd_hdr resp;
-        resp.code = VIRTIO_SND_S_OK;
-        sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+        if (resp.code == VIRTIO_SND_S_BAD_MSG) {
+            sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp,
+                              sizeof(resp));
+        }
 
-done:
         virtqueue_push(vq, elem, sz);
         virtio_notify(vdev, vq);
         g_free(iov2);
-- 
2.31.1


