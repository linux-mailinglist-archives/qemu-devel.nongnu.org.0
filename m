Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63A36EA7C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:29:23 +0200 (CEST)
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5nG-0007Tx-BS
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5RL-0008RL-0O
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:43 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5RF-0000pF-LM
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:42 -0400
Received: by mail-pf1-x436.google.com with SMTP id v191so4144067pfc.8
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1G+LGXknb/TdU7+3Mv95UX8IeDXcyLYEDg/l/FHnmY=;
 b=Za0IbxbPgt3pyCWRbSeNoDRhWPBgNBxKK3rA5rCmQSdfsUSpjT1aBqqAvAybPNZA66
 a+M5oshKV+vS5pWJqw/jp/+aNGWNkBBr/QVmJmg00NyjHi3lFGQQS/9dI121am07Gw1S
 Xq3mpENENCeY/AtZ3Cy+ErCe+pE/nkHjGfqLscKRbss/NeMRXrS5pPJd3tw1E3FKY1tm
 LGBVbF4KLRvafAhM5iCrIWHy4yX+Xk3I774zRMQCl6Xhqp1JChhKl+Ev9iALA8iR3s/i
 wdq1xVHtqy3RX4AKYHDWO66+qtoZyIdOwy5kedVmyJ1irx3Gk4fD2s55gheV5MSMzY0K
 82sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1G+LGXknb/TdU7+3Mv95UX8IeDXcyLYEDg/l/FHnmY=;
 b=aEPT29E5uP2+OR/1TMfkBhF0OUy8qIaNLemLSv2eO3SGGLfHyDfLAjSsZ/W/EjkeDp
 0JXyMSL8JCFbmAILVtfVfnx4x5Ilc7aKIWJiY6wMXDWdFEcJ0vg5lrMRvLgvXBkdlvfE
 WRTwFqpyT5mS7eTOHD+CGUgqE4VKO+drzlyN8ELxVL6I2zU549YZYXdtOxVI67biHiLg
 7VBeROmy7YlOVks+aBAFsaqxX8Gidl6+C/ac1pBXfVv/I/0oakgo4qD0Dg8BiegOjyyJ
 tbM17HMtThi4wOJ09akH4LCEw27Zq4CU6aHvpBJ2rbp6bG4I1tBCyDXpU8lZ0CmN6Tc1
 497w==
X-Gm-Message-State: AOAM532kipm9VI/isN0wQjyDaWCx2MG0oFUBmVEctRSqpaEkTbg7JeoR
 796GwbIdc4qVjxkUhQJ4mWQ=
X-Google-Smtp-Source: ABdhPJxFMJ66RfHc1limM3jZwJkmP991j6/y+z4MdLH+XU6DQZCphuu37wtAvjxxFEoY0t+WfIaX7A==
X-Received: by 2002:aa7:91d1:0:b029:1fe:2a02:73b9 with SMTP id
 z17-20020aa791d10000b02901fe2a0273b9mr32933855pfa.2.1619697996305; 
 Thu, 29 Apr 2021 05:06:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:35 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 26/27] virtio-snd: Add event vq and a handler stub
Date: Thu, 29 Apr 2021 17:34:44 +0530
Message-Id: <20210429120445.694420-27-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x436.google.com
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
 hw/audio/virtio-snd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index be9ea05e3f..2d7b7ce39a 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -985,6 +985,18 @@ static void virtio_snd_handle_tx(VirtIODevice *vdev, VirtQueue *vq)
     }
 }
 
+/*
+ * The event virtqueue handler.
+ * Not implemented yet.
+ *
+ * @vdev: VirtIOSound card
+ * @vq: event vq
+ */
+static void virtio_snd_handle_event(VirtIODevice *vdev, VirtQueue *vq)
+{
+    virtio_snd_log("event queue callback called\n");
+}
+
 /*
  * Initializes the VirtIOSound card device. Validates the configuration
  * passed by the command line. Initializes the virtqueues. Allocates resources
@@ -1029,6 +1041,7 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
     default_params.rate = VIRTIO_SND_PCM_RATE_44100;
 
     s->ctrl_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_ctrl);
+    s->event_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_event);
     s->tx_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_tx);
 
     s->streams = g_new0(virtio_snd_pcm_stream *, s->snd_conf.streams);
@@ -1096,6 +1109,7 @@ static void virtio_snd_device_unrealize(DeviceState *dev)
 
     virtio_delete_queue(s->ctrl_vq);
     virtio_delete_queue(s->tx_vq);
+    virtio_delete_queue(s->event_vq);
 }
 
 static void virtio_snd_reset(VirtIODevice *vdev)
-- 
2.25.1


