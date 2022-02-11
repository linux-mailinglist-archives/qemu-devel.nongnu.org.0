Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BBD4B30F2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:42:48 +0100 (CET)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIecp-0007YD-62
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeDO-0007nR-4G
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:30 -0500
Received: from [2607:f8b0:4864:20::633] (port=36428
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeDL-0003O5-22
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:29 -0500
Received: by mail-pl1-x633.google.com with SMTP id x3so5756982pll.3
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E83Brsv/ZX7EJNa/yMq06fa7RFTe6RXLvK84/G6qotg=;
 b=nq7R5vDFsYAQI75tfx2BSN/Ydg33wVSPR2y0qLhOvFHr9nKDwx60G/rb2oVKqyvFRJ
 bu0x9HvldmuKQJNJlJo80kPktFDxSckn/5IwjxbRcKcTaBatbmkKO9oakq/gjBTDYr1P
 miNQiy1d5j9mKEf1PIlWWia1IXJpzf1Nc+UQMYeesHZUc/rzAC2lGIvVmAODRPgBr/6m
 S/dj1xbbfjfetp4N6p/C5Gk31UjxkrDyJwex223ue5Afeyj3aPmnH5hyIAZtyNv6QVHq
 dE/lmwq6n1X1OhmHPFk1OzrZcX2egTTUn43RzpEoB3a36IbGMrCuuz6/jHgdD0IjqwR1
 p5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E83Brsv/ZX7EJNa/yMq06fa7RFTe6RXLvK84/G6qotg=;
 b=ApTc9zbeaM5xk9pnZlrt4Hq5qVDr00cAbEy1HBmjVbsCcxfiI/8evC9vrM+dyH5apg
 wY1f81qtku4ICc9YI6h4OzhdjzRvRB3N24BrSRA5LtqTgWRuYDo+T0M1Amh5imbYiENZ
 OYFtm99IJDQyQ7xbl12UtPYxOHFQwHjYE+Kk8aoEh/SYq9KGPLjL/uUVwxN506py2M2R
 NSet0wTtrZuV/J9wwU1YXxDgbk7tif2bbDSPQIYsCDGQzCf3HL7DrG/L2lxKM9t2JyWn
 vNuf+auXd1+NNzFUcpoglkO5sF0/uMz90UYoJxHVzk15Fon7+HMhsuh3ao5ANY4ZGjlz
 hB/g==
X-Gm-Message-State: AOAM531TWrvq9aNubk5MkSVaSvaaqGtJwnzLzFu1r1UpnsxKLzRsigbf
 8IEpliIBiWCI38dk+QGCky8=
X-Google-Smtp-Source: ABdhPJwdEx9Q/Lu0szWNFDPXDDhoOUKkQXUMu4SXenjS8T9QqzWsntzNKuHafguuBX/MSzjaWVwoEg==
X-Received: by 2002:a17:902:c944:: with SMTP id i4mr3594830pla.1.1644617785634; 
 Fri, 11 Feb 2022 14:16:25 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:16:25 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 17/25] virtio-snd: Add default configs to realize fn
Date: Sat, 12 Feb 2022 03:43:11 +0530
Message-Id: <20220211221319.193404-18-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x633.google.com
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

Added default configurations for streams and jacks in the
realize function.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index b7c4dc691d..5ed8e524a6 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -698,11 +698,51 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
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
2.31.1


