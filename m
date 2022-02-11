Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D398A4B3072
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:29:14 +0100 (CET)
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIePh-0000BL-Vw
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeE7-0008FQ-S5
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:15 -0500
Received: from [2607:f8b0:4864:20::1035] (port=37515
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeE4-0003Sc-J0
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:15 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so13204440pjl.2
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kC/UzqFRz5NAEDQF8d/94cxeWUB9KRrUESXiQLrGgJ4=;
 b=fpc5gx1NaZF6ia2ROO3y1tdNNFXedP7SYrv/tg4SWdzrV8OLmj7di0ri1jiZZ6Bo4u
 DXRoDViEEgmTAsatY4BTG1tCqlv8z2CAyZNErIqXnR5IScjzrdgtpl+6syMeto4N9yRd
 D2XY+3gZySS7d6KSa4JyFusDx3Q0NEFd4QwJknDuYfT3h0G2cIZhSfxNtxuoVR9XVutl
 QDDTG4Jzzsx8BMKL1i7kuJu8Uf2d4pZoPElE+5aGz/dMNqPzhuDLK2eJ4d9sOAxaNVd0
 LfJUUWWOBLX+GwKlh16FSRc6Z0iWMcQK8uJhWvm+y4q0RXAnx6J3OhYeWG5Y/SxVHObp
 DVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kC/UzqFRz5NAEDQF8d/94cxeWUB9KRrUESXiQLrGgJ4=;
 b=4iuF/K/DHGy8boVrucXrRyi9uBm+K/HCUshB/ZeXTrobEIa+2b6GU7OMLzOMCoGIXQ
 Mgvj3UrUQMPc1UKkaza6Eg+SzHln5oY4NEnpVvUWS1hjs6VN/qVhNsHihrFsbsUL/cCK
 rxtnHtshM5OFfiqoE/jJW7QxpO/2VE/XIOeTCqvL2nGYFfdWMKnFlx6B+Qz63v8Kw6IG
 UUTomdDY/PHaZtgMzB16ZKoyD79HE+gRVx94QQxHOXuCeSJvVaJ+8z2VAO3yrWkfCGjX
 F1yHlMlNGA2aUHhe6GjCtloi0yEE1vr1wG3MlCG/FHv2JSPhn8AqM8mgpglPf2/nOvjV
 UHDA==
X-Gm-Message-State: AOAM531SXz5kHXxChRhGVp5NTmxm+CeOnEPUFivCLICeFskMIF4NRwEC
 jeivbL2dQcSeaE1TuZvMcXQ=
X-Google-Smtp-Source: ABdhPJyhUP2NTzmYvgQyS+a1XREpjwGxItA4b7yvx1VZxXHJJjRw/3l2+zEtf8U03luEKaIbeZQn4w==
X-Received: by 2002:a17:902:7109:: with SMTP id
 a9mr3700115pll.170.1644617820142; 
 Fri, 11 Feb 2022 14:17:00 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:16:59 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 22/25] virtio-snd: Add code to device unrealize function
Date: Sat, 12 Feb 2022 03:43:16 +0530
Message-Id: <20220211221319.193404-23-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1035.google.com
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
 hw/audio/virtio-snd.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index cb83db0e89..7dd89c444b 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -1093,8 +1093,38 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
     }
 }
 
+/*
+ * Frees the resources allocated to the device and then frees the device
+ * itself.
+ *
+ * @dev: VirtIOSound card device
+ */
 static void virtio_snd_device_unrealize(DeviceState *dev)
 {
+    VirtIOSound *s = VIRTIO_SOUND(dev);
+
+    for (int i = 0; i < s->snd_conf.streams; i++) {
+        virtio_snd_pcm_stream *st = virtio_snd_pcm_get_stream(s, i);
+        virtio_snd_pcm_release_impl(st, i);
+        g_free(s->pcm_params[i]);
+        s->pcm_params[i] = NULL;
+    }
+    g_free(s->streams);
+    s->streams = NULL;
+    g_free(s->pcm_params);
+    s->pcm_params = NULL;
+
+    for (int i = 0; i < s->snd_conf.jacks; i++) {
+        g_free(s->jacks[i]);
+        s->jacks[i] = NULL;
+    }
+    g_free(s->jacks);
+    s->jacks = NULL;
+
+    virtio_delete_queue(s->ctrl_vq);
+    virtio_delete_queue(s->tx_vq);
+    virtio_delete_queue(s->event_vq);
+    virtio_delete_queue(s->rx_vq);
 }
 
 static void virtio_snd_reset(VirtIODevice *vdev)
-- 
2.31.1


