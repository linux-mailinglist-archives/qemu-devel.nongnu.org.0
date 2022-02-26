Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184E94C55C1
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 13:00:30 +0100 (CET)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNvkS-0007Dt-Rx
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 07:00:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNvft-000235-TQ
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:55:46 -0500
Received: from [2607:f8b0:4864:20::532] (port=36849
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNvfs-00043b-7m
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:55:45 -0500
Received: by mail-pg1-x532.google.com with SMTP id t14so4193515pgr.3
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 03:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PA+WCteHQO0lrRBLqQfQaqZn8q0hOOjrSckhEBEspgs=;
 b=a1g9gVxd2qro29ukrrigoEDwnnpi9zUsQ6NGUQw0EWmx88h1QRpnLxAQq8v9q+5LyL
 nrasmCejv4KpqaD93Mn2pF9UQuOIakgjqtPS3bjQzBwcSiV7GcEcl2FU1UTI25HtBdh3
 ceReknBXMSr3qWzYK4yqmC9jtJT9oaEigIojPRzsQYFIQ4pMhq5b2cGJAc4WUKZlPYnB
 h+6Da2fxzrk6+ssM3tQR+EW74qlJE7nwq+GykYolK3YiAH1/HIq95LjdoHI5zGlRTXdJ
 EDyDfFvKGToc8C7aeT8I9+1AUS9Lw3F3glHr5Ac701NZamZ34L72GpnW7VI/3b6WU+NN
 SOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PA+WCteHQO0lrRBLqQfQaqZn8q0hOOjrSckhEBEspgs=;
 b=nJ3J/i5WOn0B8aYCAl5cLck6SW9EaLRueKK1hb46bsS+xMs96igml04HGiRbup2XmF
 Ty4G6f8NH5KbKOarH6aSDMVh8J6blDPIPVbDhHMe4ffFBHqaSkPriEq4DCtNMhxvgyje
 3q7IR+nG08f4XX0MTPXsdZRBbf1gEy6gHMAV3I8siIZXQt7qOjtXq7tjvqiCE/yV7cdt
 anfuezaal6wb8kQfJt7maohjgGNaqFM2uAzOmDuF+oCvyiVA3XlVuLL9IU2q93WDf1DD
 5CIFr+7FyaEIZo03XAa4aDcS7GavEkCvO7KKR9l7NUumNpKB0ebw3n7K60nlqnWpT7dj
 cEgQ==
X-Gm-Message-State: AOAM530f6Bq1eRtd+YP1qIizAL1jXUs3uAg0GcOcQw43G0br7wQMVDuW
 AuysjEr9P6IZZlJo46tbdVvF/dQrzQs=
X-Google-Smtp-Source: ABdhPJyhtEwvZRT3/rGv5Q5kdFQg3/iO52gQvR2WGuc3llR8Ktgjshhnz8w9A2PJPg5VEwIxDnpkhw==
X-Received: by 2002:a05:6a00:1a56:b0:4c6:fe0c:2e27 with SMTP id
 h22-20020a056a001a5600b004c6fe0c2e27mr12200504pfv.65.1645876542871; 
 Sat, 26 Feb 2022 03:55:42 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm1323761pjb.0.2022.02.26.03.55.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 03:55:42 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 3/3] virtio-gpu: Respect UI refresh rate for EDID
Date: Sat, 26 Feb 2022 20:55:16 +0900
Message-Id: <20220226115516.59830-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220226115516.59830-1-akihiko.odaki@gmail.com>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/virtio-gpu-base.c   | 1 +
 hw/display/virtio-gpu.c        | 1 +
 include/hw/virtio/virtio-gpu.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index c73b3aa06b8..ee2587a8c36 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -79,6 +79,7 @@ static void virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 
     g->req_state[idx].x = info->xoff;
     g->req_state[idx].y = info->yoff;
+    g->req_state[idx].refresh_rate = info->refresh_rate;
     g->req_state[idx].width = info->width;
     g->req_state[idx].height = info->height;
     g->req_state[idx].width_mm = info->width_mm;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index c6dc818988c..04fbbd1f8f3 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -217,6 +217,7 @@ virtio_gpu_generate_edid(VirtIOGPU *g, int scanout,
         .height_mm = b->req_state[scanout].height_mm,
         .prefx = b->req_state[scanout].width,
         .prefy = b->req_state[scanout].height,
+        .refresh_rate = b->req_state[scanout].refresh_rate,
     };
 
     edid->size = cpu_to_le32(sizeof(edid->edid));
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2179b757037..09a317e1a7a 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -81,6 +81,7 @@ struct virtio_gpu_scanout {
 struct virtio_gpu_requested_state {
     uint16_t width_mm, height_mm;
     uint32_t width, height;
+    uint32_t refresh_rate;
     int x, y;
 };
 
-- 
2.32.0 (Apple Git-132)


