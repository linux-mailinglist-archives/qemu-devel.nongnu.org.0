Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE8636EAA4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:39:32 +0200 (CEST)
Received: from localhost ([::1]:38084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5x5-0000mt-P9
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5R4-0008Ac-Iy
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:26 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qz-0000e4-6E
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:26 -0400
Received: by mail-pg1-x52b.google.com with SMTP id m37so4410468pgb.8
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gY0DJMXr25pXU50e9QUg65FHn7O8LBtxhxA/IB3ZzW8=;
 b=FyOvJJ2EQeIAXyLOM2sacKRFL5QENdHTpGJMPoDLmP5ukwD0cPTAh1I2o+CEXzCq4p
 JIz+uvvjFfMfEQF3eMtPJzfbYiiTD/7LHAbgbm5wgi8bfqYCe/fP8zuMtWh32cupDIJU
 BYgVcykdra0/c5zkw6DUbnJj6DjWNEtCCKZ5Zpgg6g2WvR7to0Ss79UpxO/Zc4mI3ktT
 ljAwfSTZbzk6is8a2XVrqng7V/XVpcSQNF8Tt7twL7UPdfCLruqjm04PP6+0FtwDn1co
 s2thgdODIef50m8bYncjoJtPvIZ4J3nl14H2//wGAxKKz6Hsws4UO8U6kWaP+1TPMzlr
 +wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gY0DJMXr25pXU50e9QUg65FHn7O8LBtxhxA/IB3ZzW8=;
 b=YCMH33+5dUtxDuC+fB8/Hq316vlwuKgZ4v6OSFSzN+q3ax5+2o7RkzxYoITAoiwfH6
 wfwZ0DpCYGc/ns6WcKNz3zQKlRWqYIxLOe9hUDYZprDjnaVDyhC1GKN5fuWWnpmq1FaW
 FMW9hk1G0CB3JNIMGRtrtCaQAP4lT1Ml0uw0gOlT8JLP/v+OwfGzMwKQpIiCgZRG6jDT
 zfgVo1lnnFJxOgX0sWA2OJ0U9SqIBEY46vyz3wMlgh9cf1LzCaQM2jo4sHadiJ1B2YwU
 uKh5ABWOqMJ9jyogyL/CMGldZkdVcD74dr4K5FRN0AjPZezRF6jFWw2o4dVs6yE5ayiV
 7EUQ==
X-Gm-Message-State: AOAM532JguzjXUgByhT/TbLWZlMqYPulcfkEHY+83llHNVa5SrMCH+nh
 f/o2mIHxf0FuKzayP/7KAq4=
X-Google-Smtp-Source: ABdhPJwBacFH/boTyqcziHJIXO504VN5weX44MmshA6mczgf12acGE2QEmbRS8n54uMXUb5/0MLOsA==
X-Received: by 2002:a62:ed0b:0:b029:25c:9ea2:abea with SMTP id
 u11-20020a62ed0b0000b029025c9ea2abeamr33473564pfh.46.1619697979488; 
 Thu, 29 Apr 2021 05:06:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:19 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 19/27] virtio-snd: Add callback for SWVoiceOut
Date: Thu, 29 Apr 2021 17:34:37 +0530
Message-Id: <20210429120445.694420-20-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pg1-x52b.google.com
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

Added the callback for writing audio using AUD_write. The callback uses
two helper functions for reading the buffers from the streams and
handling the buffers that were written. initialized the
SWVoiceOut using this callback.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 171 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 165 insertions(+), 6 deletions(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index d0ab19a04a..e5042caf9c 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -468,6 +468,165 @@ static int virtio_snd_pcm_get_nelems(virtio_snd_pcm_stream *st)
            + !!(st->buffer_bytes % st->period_bytes);
 }
 
+/*
+ * Get the size in bytes of the buffer that still has to be written.
+ *
+ * @st: virtio sound pcm stream
+ */
+static int virtio_snd_pcm_get_pending_bytes(virtio_snd_pcm_stream *st)
+{
+    int pending = st->r_pos - st->w_pos;
+    return pending < 0 ? pending + st->buffer_bytes : pending;
+}
+
+/*
+ * Get data from a stream of the virtio sound device.
+ *
+ * @st: VirtIOSound card stream
+ * @offset: Start reading from this offseta in the stream (in bytes)
+ * @buffer: Write to this buffer
+ * @size: The number of bytes to read
+ */
+static void virtio_snd_pcm_get_buf(virtio_snd_pcm_stream *st, uint32_t offset,
+                                      void *buffer, uint32_t size)
+{
+    int nelems = virtio_snd_pcm_get_nelems(st);
+    int i = 0;
+    while (offset > st->period_bytes) {
+        offset -= st->period_bytes;
+        i++;
+        i %= nelems;
+    }
+
+
+    /*
+     * If the size spans beyond the current virtqueue element, read everything
+     * from the current virtqueue element and move to the next element. Repeat
+     * until we have read the required size.
+     */
+    while (size) {
+        int remaining = iov_size(st->elems[i]->out_sg, st->elems[i]->out_num)
+                        - sizeof(virtio_snd_pcm_xfer) - offset;
+        int to_read = MIN(remaining, size), wpos = 0;
+        size_t sz;
+        sz = iov_to_buf(st->elems[i]->out_sg, st->elems[i]->out_num,
+                        sizeof(virtio_snd_pcm_xfer) + offset, buffer + wpos,
+                        to_read);
+
+        assert(sz == to_read);
+
+        offset = 0;
+        size -= to_read;
+        wpos += to_read;
+        i++;
+        i %= nelems;
+    }
+}
+
+/*
+ * Handle a buffer after it has been written by AUD_write.
+ * It writes the status for the I/O messages that have been completed and
+ * marks the tx virtqueue elmenets as used. It notifies the device
+ * about I/O completion.
+ *
+ * @st: VirtIOSound card stream
+ * @size: Size that was written by AUD_write
+ *        If size = 0, write for the last element failed
+ */
+static void virtio_snd_pcm_handle_buf_written(virtio_snd_pcm_stream *st,
+                                              uint32_t size)
+{
+    int offset = st->w_pos, i = 0;
+    int nelems = virtio_snd_pcm_get_nelems(st);
+
+    while (offset >= st->period_bytes) {
+        offset -= st->period_bytes;
+        i++;
+        i %= nelems;
+    }
+
+    virtio_snd_pcm_status status;
+    size_t sz;
+    if (!size) {
+        status.status = VIRTIO_SND_S_IO_ERR;
+        status.latency_bytes = 0;
+
+        sz = iov_from_buf(st->elems[i]->in_sg, st->elems[i]->in_num, 0,
+                          &status, sizeof(status));
+        assert(sz == sizeof(virtio_snd_pcm_status));
+
+        int push_size = iov_size(st->elems[i]->out_sg, st->elems[i]->out_num)
+                        + sizeof(virtio_snd_pcm_status);
+
+        virtqueue_push(st->s->tx_vq, st->elems[i], push_size);
+        return;
+    }
+
+    status.status = VIRTIO_SND_S_OK;
+    status.latency_bytes = 0;
+
+    /*
+     * If the written size spans beyond current element, update the status for
+     * the current element, mark it as used and push it back on the tx
+     * virtqueue. Notify the device about the I/O completion. Repeat until
+     * the required bytes are handled.
+     */
+    while (size) {
+        int curr_elem_size = iov_size(st->elems[i]->out_sg, st->elems[i]->out_num)
+                             - sizeof(virtio_snd_pcm_xfer) - offset;
+        if (size >= curr_elem_size) {
+            sz = iov_from_buf(st->elems[i]->in_sg, st->elems[i]->in_num, 0,
+                              &status, sizeof(status));
+            assert(sz == sizeof(virtio_snd_pcm_status));
+
+            int push_size = sizeof(virtio_snd_pcm_xfer) + curr_elem_size
+                            + offset + sizeof(virtio_snd_pcm_status);
+
+            virtqueue_push(st->s->tx_vq, st->elems[i], push_size);
+            virtio_notify(VIRTIO_DEVICE(st->s), st->s->tx_vq);
+            g_free(st->elems[i]);
+            st->elems[i] = NULL;
+            size -= curr_elem_size;
+            virtio_snd_log("remains: %d\n", size);
+            st->w_pos += curr_elem_size;
+            st->w_pos %= st->buffer_bytes + 1;
+            i++;
+            i %= nelems;
+            offset = 0;
+        } else {
+            st->w_pos += size;
+            st->w_pos %= st->buffer_bytes + 1;
+            break;
+        }
+    }
+}
+
+/*
+ * Callback for AUD_open_out.
+ * Reads a buffer from the VirtIOSound card stream and writes it
+ * using AUD_write.
+ *
+ * @opaque: VirtIOSound card stream
+ * @free: Size in bytes that can be written via AUD_write
+ */
+static void virtio_snd_output_cb(void *opaque, int free)
+{
+    int to_play, pending;
+    virtio_snd_pcm_stream *st = opaque;
+
+    pending = virtio_snd_pcm_get_pending_bytes(st);
+    to_play = MIN(free, pending);
+
+    while (to_play) {
+        uint8_t *mixbuf = g_malloc0(to_play);
+        virtio_snd_pcm_get_buf(st, st->w_pos, mixbuf, to_play);
+        int wbytes = AUD_write(st->voice.out, mixbuf, to_play);
+        to_play -= wbytes;
+        virtio_snd_pcm_handle_buf_written(st, wbytes);
+        g_free(mixbuf);
+    }
+}
+
 /*
  * Prepares a VirtIOSound card stream.
  * Returns a virtio sound status (VIRTIO_SND_S_*).
@@ -523,12 +682,12 @@ static uint32_t virtio_snd_pcm_prepare_impl(VirtIOSound *s, uint32_t stream)
     virtio_snd_get_qemu_audsettings(&as, s->pcm_params[stream]);
 
     if (st->direction == VIRTIO_SND_D_OUTPUT) {
-        /* st->voice.out = AUD_open_out(&s->card,
-         *                              st->voice.out,
-         *                              "virtio_snd_card",
-         *                              st,
-         *                              virtio_snd_output_cb, &as);
-         */
+        st->voice.out = AUD_open_out(&s->card,
+                                     st->voice.out,
+                                     "virtio_snd_card",
+                                     st,
+                                     virtio_snd_output_cb, &as);
+
     } else {
         /* st->voice.in = AUD_open_in(&s->card,
          *                            st->voice.in,
-- 
2.25.1


