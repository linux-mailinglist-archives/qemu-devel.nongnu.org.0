Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8E74B3047
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:21:56 +0100 (CET)
Received: from localhost ([::1]:46464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeId-0004NY-NC
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeBe-0004wo-5j
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:14:42 -0500
Received: from [2607:f8b0:4864:20::434] (port=42733
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeBW-0002iR-61
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:14:41 -0500
Received: by mail-pf1-x434.google.com with SMTP id i6so16696330pfc.9
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zKW6Zedd4cbPxMoQGRaMoZs5xJeqa5Cb1JCrYUFLu5g=;
 b=qn+PowPxnsTHVg/WDUfJQQvBd5zFR4sRKqkXCjW6Eg1sZxK+FgXp4Xh5wLPw/4apj+
 fPamCqdvoj8GJ7bqwVAV/sD7apT8j5yzJ/x/WHhZ9L5KTOOyYrsfLRajM7MtH9k2H3QG
 9jww/Fbh4hPKqEDVEbjOK09OEJRCha/TQFMHAVJNVywEuHXxV1mieTV702P6aVagYDwL
 8npVYOlEVdsqoXXDLLhBdsDQgudRJDjmiz3CJW4cBGC3icQNPOvXw4KgLn1csq07O2Ar
 rHU28LKdN6VItEvtPren4EFChpy/4PBSlE7oJXlmP6bk09O+aYNPUc8coG4gB5XyIghA
 NaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKW6Zedd4cbPxMoQGRaMoZs5xJeqa5Cb1JCrYUFLu5g=;
 b=n9J/EmuGkBHxKeGvW3f9kBHGhK3Op4bSHRUov0md+SMBMCLbOeobEouS8C+7K0ux7L
 7+gEXjzu0pWAkfIB8BOSq+lE+jM3gM4BDAfb9bygTkD4Qe9ar+g/k2A/gNT4XOAdUUJT
 0MLTPULb+r63LMyZsc9X7vYgSdj/m6TMlt5anpVJtRr4f/65/4qDg8hjwyZBXd7nlp1U
 CH26ZLlt3cKtrYXA12RA5NqBdDHPT6nwRi8IoVL3yDsfNlsUbG/bTeQjMht3Gu9zE5HK
 Yl/YTUMctR/jpeSWMJeo4o8sYU/EEZzFVJdzLs1RYY0uiHE7Lhd44IFwb6ZCZLZgcyrP
 M0hQ==
X-Gm-Message-State: AOAM5325+ujOb2Qfir9+6iB/eVq0VTi25vTcnL3idxbwitTomrIHw4H7
 cGOpI8kgiZk2a0kpkq41MOY=
X-Google-Smtp-Source: ABdhPJyIlYb/Q6PL9pGBgcsnDbL86djsKJfnnNKcYFlPAaNBvPCMZM9tR55nOEmxkuASrYig/15dYQ==
X-Received: by 2002:a63:287:: with SMTP id 129mr3071693pgc.158.1644617665916; 
 Fri, 11 Feb 2022 14:14:25 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:14:25 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 01/25] virtio-snd: Add virtio sound header file
Date: Sat, 12 Feb 2022 03:42:55 +0530
Message-Id: <20220211221319.193404-2-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
2.31.1


