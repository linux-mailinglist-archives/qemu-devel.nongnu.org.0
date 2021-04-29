Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4366136EA7B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:28:48 +0200 (CEST)
Received: from localhost ([::1]:40704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5mh-0006zu-9n
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qg-0007sV-3C
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:02 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qb-0000VU-EL
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:01 -0400
Received: by mail-pg1-x531.google.com with SMTP id t22so11732264pgu.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gwpABH7Q/RCzO/0p2BVP3Xs7gCzcoNuIVG636eSZ3cI=;
 b=Z4Rmk0l6rdo5x/MMoWHpsFjRGt90PnqygQCyOVyy+aSMkVWA6Pm9HqzV8df1DhoQTi
 TykVPgZBDhB5RG1O3aJR3z3N4tXY5hFIANOH2rm5vsvBKNJdhjydD8jKoEq3zVSQrrZL
 Qjk5Kj1h6inNcVyPDI3kfsUT/gVKcKHm7s36EyrNnPv63BK5RAIv0L5C38D2mjM1CdZZ
 IXX0Iwe8r3Usu3l9kSY+En0zfq+H6qTSE62wRIYGUOLvZLw2GcL7ZbH7fpR0htJvICIx
 1wkCBaeVltaZtybp+gPcZvMRX1FjRzy1gPplVwdXvR19HRuAwvwPMoDzYmKqo+uPd5Ao
 Jk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gwpABH7Q/RCzO/0p2BVP3Xs7gCzcoNuIVG636eSZ3cI=;
 b=tXnqCrji8iCMogRD4k/KHN+uPlVBOgXm9flEtM1EfbSPq4TnqxIxo4IOCfOVOlGkjI
 TbK8MxQKylyXrFk4buT065mYwjqGwPwXDoqxGHqi3y3LtolMaiQK/CNe9ezq9tQvPmNV
 i9c4kwNwiuUKp7yn9tu4w/QzKTQ+hvz3MZLHXmJ3fuCijfid+IQAWxakLjDid2YwS47B
 QZqYZp/eLNz/OOrFWISRkL+B7mgwic2cTtbOwG8aDhD4FfSvegCCXdbNY75rPUxoIYiz
 riIAZ+vQcuLtAIOX+vL/6zxLDB1kT+Sa/LF51N2+VheoAzrKx4qYWPZcnhTaMwf9pOji
 /WZw==
X-Gm-Message-State: AOAM530eTgbWa5805L04BG68gS2YMzOH8215v+BYbOmFi4d/R5H4vTw4
 CrIedpJTKXyL7vvtGQDfH2k=
X-Google-Smtp-Source: ABdhPJyQK4qpHMFLWwEtlzgR6qX95Gvf/0LY+xXs+qiUjHLf23olUEq6WZwMaet5ewfEF30I2nMvcQ==
X-Received: by 2002:a62:5ec7:0:b029:227:3253:3f62 with SMTP id
 s190-20020a625ec70000b029022732533f62mr32664234pfb.54.1619697956009; 
 Thu, 29 Apr 2021 05:05:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:55 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 10/27] virtio-snd: Add code for the realize function
Date: Thu, 29 Apr 2021 17:34:28 +0530
Message-Id: <20210429120445.694420-11-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pg1-x531.google.com
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
 hw/audio/virtio-snd.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index edaeffd6b7..caad157705 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -97,8 +97,43 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
     return vdev->host_features;
 }
 
+/*
+ * Initializes the VirtIOSound card device. Validates the configuration
+ * passed by the command line. Initializes the virtqueues. Allocates resources
+ * for and initializes streams, jacks and chmaps.
+ *
+ * @dev: VirtIOSound card device
+ * @errp: Set if there is an error
+ */
 static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
 {
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOSound *s = VIRTIO_SOUND(dev);
+
+    virtio_init(vdev, "virtio-snd", VIRTIO_ID_SOUND, sizeof(virtio_snd_config));
+
+    /* set number of jacks and streams */
+    if (s->snd_conf.jacks > 8) {
+        error_setg(errp, "Invalid number of jacks: %d", s->snd_conf.jacks);
+        return;
+    }
+    if (s->snd_conf.streams < 1 || s->snd_conf.streams > 10) {
+        error_setg(errp, "Invalid number of streams: %d", s->snd_conf.streams);
+        return;
+    }
+
+    if (s->snd_conf.chmaps > VIRTIO_SND_CHMAP_MAX_SIZE) {
+        error_setg(errp, "Invalid number of channel maps: %d",
+                   s->snd_conf.chmaps);
+        return;
+    }
+
+    /* set up QEMUSoundCard and audiodev */
+    AUD_register_card ("virtio_snd_card", &s->card);
+
+    s->streams = g_new0(virtio_snd_pcm_stream *, s->snd_conf.streams);
+    s->pcm_params = g_new0(virtio_snd_pcm_params *, s->snd_conf.streams);
+    s->jacks = g_new0(virtio_snd_jack *, s->snd_conf.jacks);
 }
 
 static void virtio_snd_device_unrealize(DeviceState *dev)
-- 
2.25.1


