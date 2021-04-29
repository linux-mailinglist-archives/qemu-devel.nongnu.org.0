Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7327036EA0E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:09:20 +0200 (CEST)
Received: from localhost ([::1]:33804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5Tr-0000bf-I4
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QH-0007Ti-2a
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:37 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QF-0000CK-CY
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:36 -0400
Received: by mail-pf1-x432.google.com with SMTP id j6so6552886pfh.5
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Za8sRghFjDzzxeX3eHzOdIRG0vujpkNJzbRMPY5/TEc=;
 b=FTnzF63FxrfnYd2xX0GpI+Q0kYUCnprxObjI5iONAK+E+lOkXHS8H0cgJ3M/zJoDu3
 yYpGQ7SWRS5/9iS2lB2cRYE3h+Aityq5gbR0nUfbWgMY7ve914xuafVlIHdTUAwgA8c2
 N124aVJ0YcHfURjB3wC7GpyXQxz/qO4XiDOs9dOZZUBMoHz4HhutniRNGkmrlAgbHp8b
 dxoawv3ynR5gsIgSmnAKdvdOelP5i0W03WdFb/+v0OwNmN1sYmDGRxjrKt9vTRj8s5wh
 ZeCQwTUa9qYjeSJb+/WSZEHCtfHS/w/0/HVWknYGKPB8dVWLWKGQRDRvG4QdNfiTJ9RP
 us2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Za8sRghFjDzzxeX3eHzOdIRG0vujpkNJzbRMPY5/TEc=;
 b=Rd4s4NWXzDSPdMlKe7mLbS5HSWJfcfJzW2wIyfPVFUYyxBNzqNyoNkmA+qGdnU7XnQ
 xpvLXXXQPUv98CWByrQj7hvC8Xnfp9eizABXYKkijy04E+N9R484JN1m2uLxqHKN5ric
 2pZsMKfH05BQ5B+UGkiYw019MPvZKcq7TD3cha+cJcGd6xvr3cMKo6keGUtZnXJKfTO4
 MSYhfwansuJb2iA7jSm5zv3FCY8YvSrj0wqAt3bX5JnqRCZr2FTolg5gRpDBvYQJKuB1
 RLm009PaSMx8RGXLqv4AUnXy5zT3IbtrPYcN0MC31X69s3U1/qtyLyyn2/hiQnP1fXPg
 dRBg==
X-Gm-Message-State: AOAM532BP88qlQSZ0aXZ7lj/QLi1wzh7gz5cCEqETCw3J8lApiZY6009
 /GK01Wn+e1ukXScL7d9ORic=
X-Google-Smtp-Source: ABdhPJy1hecTGumO5YKDH4T+Ws0r0GecHXQoj74UhWuSMfJjFd0pSByULzoxOvi6KAb3cWn+AwRJkw==
X-Received: by 2002:a05:6a00:1a02:b029:27f:f7ce:49d8 with SMTP id
 g2-20020a056a001a02b029027ff7ce49d8mr1823454pfv.24.1619697934013; 
 Thu, 29 Apr 2021 05:05:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:33 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 01/27] virtio-snd: Add virtio sound header file
Date: Thu, 29 Apr 2021 17:34:19 +0530
Message-Id: <20210429120445.694420-2-chouhan.shreyansh2702@gmail.com>
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

Added device configuration and common definitions to the header
file.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 include/hw/virtio/virtio-snd.h | 97 ++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 include/hw/virtio/virtio-snd.h

diff --git a/include/hw/virtio/virtio-snd.h b/include/hw/virtio/virtio-snd.h
new file mode 100644
index 0000000000..bbbf174c51
--- /dev/null
+++ b/include/hw/virtio/virtio-snd.h
@@ -0,0 +1,97 @@
+/*
+ * Virtio Sound Device
+ */
+
+#ifndef QEMU_VIRTIO_SOUND_H
+#define QEMU_VIRTIO_SOUND_H
+
+#include "qemu/units.h"
+#include "hw/virtio/virtio.h"
+#include "qemu/queue.h"
+#include "audio/audio.h"
+#include "audio/audio_int.h"
+
+#define VIRTIO_ID_SOUND 25
+
+/* CONFIGURATION SPACE */
+
+typedef struct virtio_snd_config {
+    /* # of jacks available */
+    uint32_t jacks;
+    /* # of streams avalable */
+    uint32_t streams;
+    /* # chmaps available */
+    uint32_t chmaps;
+} virtio_snd_config;
+
+/* COMMON DEFINITIONS */
+
+/* supported sample data directions. */
+enum {
+    VIRTIO_SND_D_OUTPUT = 0,
+    VIRTIO_SND_D_INPUT
+};
+
+enum {
+    /* jack control request types */
+    VIRTIO_SND_R_JACK_INFO = 1,
+    VIRTIO_SND_R_JACK_REMAP,
+
+    /* PCM control request types */
+    VIRTIO_SND_R_PCM_INFO = 0x0100,
+    VIRTIO_SND_R_PCM_SET_PARAMS,
+    VIRTIO_SND_R_PCM_PREPARE,
+    VIRTIO_SND_R_PCM_RELEASE,
+    VIRTIO_SND_R_PCM_START,
+    VIRTIO_SND_R_PCM_STOP,
+
+    /* channel map control request type */
+    VIRTIO_SND_R_CHMAP_INFO = 0x200,
+
+    /* jack event types */
+    VIRTIO_SND_EVT_JACK_CONNECTED = 0x1000,
+    VIRTIO_SND_EVT_JACK_DISCONNECTED,
+
+    /* PCM event types */
+    VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED = 0x1100,
+    VIRTIO_SND_EVT_PCM_XRUN,
+
+    /* common status codes */
+    VIRTIO_SND_S_OK = 0x8000,
+    VIRTIO_SND_S_BAD_MSG,
+    VIRTIO_SND_S_NOT_SUPP,
+    VIRTIO_SND_S_IO_ERR
+};
+
+/* common header for request/response*/
+typedef struct virtio_snd_hdr {
+    uint32_t code;
+} virtio_snd_hdr;
+
+/* event notification */
+typedef struct virtio_snd_event {
+    /* VIRTIO_SND_EVT_* */
+    virtio_snd_hdr hdr;
+    /* Optional event data */
+    uint32_t data;
+} virtio_snd_event;
+
+/* common control request to query an item information */
+typedef struct virtio_snd_query_info {
+    /* VIRTIO_SND_R_*_INFO */
+    struct virtio_snd_hdr hdr;
+    /* item start identifier */
+    uint32_t start_id;
+    /* # of items to query */
+    uint32_t count;
+    /* size of a single item information in bytes */
+    uint32_t size;
+} virtio_snd_query_info;
+
+/* common item information header */
+typedef struct virtio_snd_info {
+    /* functional group node id (HDA Spec 7.1.2) */
+    uint32_t hda_fn_nid;
+} virtio_snd_info;
+
+#endif
-- 
2.25.1


