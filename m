Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299BD36EA40
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:24:06 +0200 (CEST)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5i9-000367-6o
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5R2-00089i-Sa
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:25 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qx-0000dG-Kd
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:23 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so2353160pjd.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/IrQuvhJHoDdxN4Y1Muq8OrIFJtcFOEdWziqdTZsq64=;
 b=euqLSRy6qZpkzLfI3cS56dbvJy5BmOdVb64+CfJ/Yhz7a+iOEiy/kAqzSYnmLDmf0f
 XCCx04Dd/50LfWcg5Slp8QLLcUZwldYCfClB9KCKqUroArCiEruEKbzGoyw6W5sTdlDK
 Oyzpr3LUpoLvq/b2QmL6TtlcMMn524NytOLZW7oDPjLrkj9XRg1VUSO5q+jl9znMXzhV
 zBVgDLsOzGPRX+mHBnvab9ymzAZf9raYYywEqnLG06XF7nTevYvZSdLjyX90pc1Oanga
 83A8g0Y3CdnBZIyPs3YWcxLheNuFTx+0G7YJ2tph2roHfAx8ojSaGzOxfmWYPUoDqDtj
 Rq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/IrQuvhJHoDdxN4Y1Muq8OrIFJtcFOEdWziqdTZsq64=;
 b=HcfgkV7HN3h2nhCK2dP/oRleLWSAtXb10u0H64KhMHBUUdn4zytII9zhQbfWPe65lG
 /nfkO36rnv6qhpBdjqtu0D4pVnZvg76C9CZFv/uoWEI+PBqI3UJiavh8lzkH7t3mNL3S
 thmxUjWnB7g7CW+tE3TAuK3VfrjSw9gW1glySBqM5FkIs/oYTBnmS4Tt4+uNQ0lBA6P8
 v7y/SjOVBChYkof9UQKI9jmlgRbUm+EszzfaXMZoi249L4i6CAY0Z0uawZgvFM2N8g6l
 44XROHs34HH3vWcRSsD8RGrOKJd1PROEVL35OWbbhonGByyt1pm1SRBMY6FbBTlTRhZZ
 wK6g==
X-Gm-Message-State: AOAM533MCtTXz6MpXYHVdaiRkK8k5CkIyJNTsJhC1xhfQnD4AGJEMmqh
 F+SbrxvF5uqqU/xTCZg8z1g=
X-Google-Smtp-Source: ABdhPJz/tU0K2PXXiWiM/I1eSKp+m4c+CS95KQxG/DKaG6rp0sF7S5uFrcfxNncIzmQDbcVL0Z6Zvg==
X-Received: by 2002:a17:902:7c94:b029:e6:e1d7:62b7 with SMTP id
 y20-20020a1709027c94b02900e6e1d762b7mr35037902pll.29.1619697976908; 
 Thu, 29 Apr 2021 05:06:16 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:16 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 18/27] virtio-snd: Add default configs to realize fn
Date: Thu, 29 Apr 2021 17:34:36 +0530
Message-Id: <20210429120445.694420-19-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1033.google.com
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

Added default configurations for streams and jacks in the
realize function.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index dba90cc4a7..d0ab19a04a 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -683,11 +683,51 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
     /* set up QEMUSoundCard and audiodev */
     AUD_register_card ("virtio_snd_card", &s->card);
 
+    // set default params for all streams
+    virtio_snd_pcm_set_params default_params;
+    default_params.features = 0;
+    default_params.buffer_bytes = 8192;
+    default_params.period_bytes = 4096;
+    default_params.channel = 2;
+    default_params.format = VIRTIO_SND_PCM_FMT_S16;
+    default_params.rate = VIRTIO_SND_PCM_RATE_44100;
+
     s->ctrl_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_ctrl);
 
     s->streams = g_new0(virtio_snd_pcm_stream *, s->snd_conf.streams);
     s->pcm_params = g_new0(virtio_snd_pcm_params *, s->snd_conf.streams);
     s->jacks = g_new0(virtio_snd_jack *, s->snd_conf.jacks);
+
+    uint32_t status;
+    for (int i = 0; i < s->snd_conf.streams; i++) {
+        default_params.hdr.stream_id = i;
+        status = virtio_snd_pcm_set_params_impl(s, &default_params);
+        if (status != VIRTIO_SND_S_OK) {
+            error_setg(errp, "Can't initalize stream params.\n");
+            return;
+        }
+        status = virtio_snd_pcm_prepare_impl(s, i);
+        if (status != VIRTIO_SND_S_OK) {
+            error_setg(errp, "Can't prepare streams.\n");
+            return;
+        }
+    }
+
+    for (int i = 0; i < s->snd_conf.jacks; i++) {
+        // TODO: For now the hda_fn_nid connects the starting streams to these
+        // jacks. This isn't working for now since the directions will be wrong
+        // for a few jacks. Similarly the capabilities are just placeholders.
+        s->jacks[i] = (virtio_snd_jack *)g_malloc0(sizeof(virtio_snd_jack));
+        s->jacks[i]->features = 0;
+        s->jacks[i]->hda_fn_nid = i;
+        s->jacks[i]->hda_reg_defconf = ((AC_JACK_PORT_COMPLEX << AC_DEFCFG_PORT_CONN_SHIFT) |
+                                       (AC_JACK_LINE_OUT     << AC_DEFCFG_DEVICE_SHIFT)    |
+                                       (AC_JACK_CONN_1_8     << AC_DEFCFG_CONN_TYPE_SHIFT) |
+                                       (AC_JACK_COLOR_GREEN  << AC_DEFCFG_COLOR_SHIFT)     |
+                                       0x10);
+        s->jacks[i]->hda_reg_caps = AC_PINCAP_OUT;
+        s->jacks[i]->connected = false;
+    }
 }
 
 static void virtio_snd_device_unrealize(DeviceState *dev)
-- 
2.25.1


