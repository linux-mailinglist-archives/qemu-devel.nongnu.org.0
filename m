Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10964B3055
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:23:06 +0100 (CET)
Received: from localhost ([::1]:48726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeJl-0005yb-O4
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:23:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeD3-0007Kh-4j
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:11 -0500
Received: from [2607:f8b0:4864:20::102d] (port=45915
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeD0-0003MJ-3c
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:07 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso5571844pjl.4
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5TxdZfLtr0hZzhian8fAyxP70Y+8r0ytCkNVdMsflFY=;
 b=cuHWCZFRWGyGohHTS0LXA6RdLI0fUlHgKLneVdhyvZBEY0TBdgWv0zPZDsz6khhVOc
 Pm8tdSHerNaRQIDswzErqNE92mB1Nn/5+r3Pgd+jtQs3+fSlKZMwHeC2aCbt1v9xI2+d
 2uPWoMe1ikqmk9KyfXfcpWnW+Psyfylcw4IkK6CTv1SWtG1HfUOBrDjv3sUpNiZh30Ou
 JD/F0TJQj/Zc6BOaZxoseT+N6X2gp/FzIwHznw0wZFcDq0ahJ9W3U+fW1ibV9qCl70XB
 rliIBmAFYUvI6aT1BwFuXrnJGiPMwOpT/zI4pM3/rhsAmeeqgmK32T/Dti0Rp0bu2ogi
 WLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5TxdZfLtr0hZzhian8fAyxP70Y+8r0ytCkNVdMsflFY=;
 b=zKH/XoLhBjdvqD1DimhY4aqS5+12SMaBhMtjcQ5trjxEdmKvW4M/zRMqz8Ly3WlC0X
 FO+iy/3h5ll4j+tQ9axFfFy4JYy7Pfe2P5p9ThQEHcpFX8wbr4zA7WYqmk+RSHUbAZ0t
 cbDnlKHorPlFeADoV6mzWXc64GJRXwkqG+uI6uJLHHy21VMGrdu+NQyiGvh0e0BNJnPl
 cf9rEy3aTSRGOQns9Z1gsP3+F+eLDw5IV/VAg25RQUPeWGxJNW21u7+2xyx+iJ09Q1JV
 Cu1geHJwM6S1IVEFihvZ/9etX0fIRiM2puz2d+lGpzWn0+fuoZhBmFnhUPSshBzu9YAw
 NzPw==
X-Gm-Message-State: AOAM5300Fx9puAm0MX644KFc/6VQ9TSztyyYAGPr7lBqN39rB6wVPb6h
 SMB22Ge7EI0V8tUHPT4F0jQTagXBmCs=
X-Google-Smtp-Source: ABdhPJx53zf+0hkC7TyD4LePS5nCtHT3680scmhLvGMld5fpINb9N7BEADmNwyRglR06YR58Koe1Qw==
X-Received: by 2002:a17:90b:1c06:: with SMTP id
 oc6mr2528956pjb.213.1644617764891; 
 Fri, 11 Feb 2022 14:16:04 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:16:04 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 15/25] virtio-snd: Add VIRITO_SND_R_PCM_SET_PARAMS handle
Date: Sat, 12 Feb 2022 03:43:09 +0530
Message-Id: <20220211221319.193404-16-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x102d.google.com
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

Added handler for the VIRTIO_SND_R_PCM_SET_PARAMS control request.
The handler was split up into two functions in so that the code
could be reused in the realize function.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 116 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index a53a6be168..acb126f392 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -208,6 +208,22 @@ static virtio_snd_pcm_stream *virtio_snd_pcm_get_stream(VirtIOSound *s,
     return s->streams[stream];
 }
 
+/*
+ * Get params for a sepific stream.
+ *
+ * @s: VirtIOSound card device
+ * @stream: Stream id
+ */
+static virtio_snd_pcm_params *virtio_snd_pcm_get_params(VirtIOSound *s,
+                                                        uint32_t stream)
+{
+    if (stream >= s->snd_conf.streams) {
+        virtio_snd_err("Invalid stream request %d\n", stream);
+        return NULL;
+    }
+    return s->pcm_params[stream];
+}
+
 /*
  * Handle the VIRTIO_SND_R_PCM_INFO request.
  * The function writes the info structs to the request element.
@@ -273,6 +289,103 @@ done:
     return sizeof(virtio_snd_hdr) + sz;
 }
 
+/*
+ * Set the given stream params.
+ * Called by both virtio_snd_handle_pcm_set_params and during device
+ * initialization.
+ * Returns a virtio sound status VIRTIO_SND_S_*
+ *
+ * @s: VirtIOSound card device
+ * @params: The PCM params as defined in the virtio specification
+ */
+static uint32_t virtio_snd_pcm_set_params_impl(VirtIOSound *s,
+                                               virtio_snd_pcm_set_params *params)
+{
+    uint32_t st = params->hdr.stream_id;
+    if (st > s->snd_conf.streams || !(s->pcm_params)) {
+        virtio_error(VIRTIO_DEVICE(s), "Streams not initalized\n");
+        return VIRTIO_SND_S_BAD_MSG;
+    }
+
+    if (!s->pcm_params[st]) {
+        s->pcm_params[st] = g_new0(virtio_snd_pcm_params, 1);
+    }
+    virtio_snd_pcm_params *st_params = virtio_snd_pcm_get_params(s, st);
+
+    st_params->features = params->features;
+    st_params->buffer_bytes = params->buffer_bytes;
+    st_params->period_bytes = params->period_bytes;
+
+    if (params->channel < 1 || params->channel > AUDIO_MAX_CHANNELS) {
+        virtio_snd_err("Number of channels not supported\n");
+        return VIRTIO_SND_S_NOT_SUPP;
+    }
+    st_params->channel = params->channel;
+
+    uint32_t supported_formats = 1 << VIRTIO_SND_PCM_FMT_S8 |
+                                 1 << VIRTIO_SND_PCM_FMT_U8 |
+                                 1 << VIRTIO_SND_PCM_FMT_S16 |
+                                 1 << VIRTIO_SND_PCM_FMT_U16 |
+                                 1 << VIRTIO_SND_PCM_FMT_S32 |
+                                 1 << VIRTIO_SND_PCM_FMT_U32 |
+                                 1 << VIRTIO_SND_PCM_FMT_FLOAT;
+
+    uint32_t supported_rates = 1 << VIRTIO_SND_PCM_RATE_5512 |
+                               1 << VIRTIO_SND_PCM_RATE_8000 |
+                               1 << VIRTIO_SND_PCM_RATE_11025 |
+                               1 << VIRTIO_SND_PCM_RATE_16000 |
+                               1 << VIRTIO_SND_PCM_RATE_22050 |
+                               1 << VIRTIO_SND_PCM_RATE_32000 |
+                               1 << VIRTIO_SND_PCM_RATE_44100 |
+                               1 << VIRTIO_SND_PCM_RATE_48000 |
+                               1 << VIRTIO_SND_PCM_RATE_64000 |
+                               1 << VIRTIO_SND_PCM_RATE_88200 |
+                               1 << VIRTIO_SND_PCM_RATE_96000 |
+                               1 << VIRTIO_SND_PCM_RATE_176399 |
+                               1 << VIRTIO_SND_PCM_RATE_192000 |
+                               1 << VIRTIO_SND_PCM_RATE_384000;
+
+    if (!(supported_formats & (1 << params->format))) {
+        virtio_snd_err("Stream format not supported\n");
+        return VIRTIO_SND_S_NOT_SUPP;
+    }
+    st_params->format = params->format;
+
+    if (!(supported_rates & (1 << params->rate))) {
+        virtio_snd_err("Stream rate not supported\n");
+        return VIRTIO_SND_S_NOT_SUPP;
+    }
+    st_params->rate = params->rate;
+
+    st_params->period_bytes = params->period_bytes;
+    st_params->buffer_bytes = params->buffer_bytes;
+    return VIRTIO_SND_S_OK;
+}
+
+/*
+ * Handles the VIRTIO_SND_R_PCM_SET_PARAMS request.
+ * The function writes the response to the virtqueue element.
+ * Returns the used size in bytes.
+ *
+ * @s: VirtIOSound card device
+ * @elem: The request element from control queue
+ */
+static uint32_t virtio_snd_handle_pcm_set_params(VirtIOSound *s,
+                                                 VirtQueueElement *elem)
+{
+    virtio_snd_pcm_set_params req;
+    uint32_t sz;
+    sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
+    assert(sz == sizeof(virtio_snd_pcm_set_params));
+
+    virtio_snd_hdr resp;
+    resp.code = virtio_snd_pcm_set_params_impl(s, &req);
+
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+    return sz;
+}
+
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
  * element as used.
@@ -321,7 +434,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             sz = virtio_snd_handle_pcm_info(s, elem);
             goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_SET_PARAMS) {
-            virtio_snd_log("VIRTIO_SND_R_PCM_SET_PARAMS");
+            sz = virtio_snd_handle_pcm_set_params(s, elem);
+            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_PREPARE) {
             virtio_snd_log("VIRTIO_SND_R_PCM_PREPARE");
         } else if (ctrl.code == VIRTIO_SND_R_PCM_START) {
-- 
2.31.1


