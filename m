Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA52833D388
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:07:57 +0100 (CET)
Received: from localhost ([::1]:46248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8UP-0005Qk-13
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RN-0002qS-QV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:49 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RL-0003qg-Pd
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:49 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so1252740pjh.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svdZ6C5bAvGavGpnuoz2cwWAJZeGvVoFj9lKmaXb4lg=;
 b=YmK32doGj6Hghj/2bx7qiTnY1OIx4WeNmsEwX/ydnjxuGgPjWgdx2aa1ni/V/nrTlo
 MsIb1b9ZdPPDxxFt6xQrQArEeu1Fd9T+yQmNXCUAaBvUmZemrZdyFqHil/BcGg1mzBmz
 wSxXh0rJnS2A/Glkq50NNkX8Ff4Am4Sk4EWk8/5Q1owkVfgfG3zbMT9AEJHXT4kTAon8
 VZ7N2ndIj2s6G1f26IzN6uL4KMLr4yqfrFV31MA8g6BiqacYr9oXVloBuCFaDK2wQbPl
 cojfRoqjXZu7lcbFxBMkWdYNSF9p53Ozf9T+3cOpAgvZjG7vZ2go0+1Vo0ZZZOLZ3hNd
 fVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=svdZ6C5bAvGavGpnuoz2cwWAJZeGvVoFj9lKmaXb4lg=;
 b=ZF/NDuti6S8Shg1xR5dX84NJvovPsVcXYTdXIds4kX1BWA31teIyH9nLyGWtoBlh+i
 6+BXz3qeGrsdoWFhapxSyHr3kF2Yxc+jdlevGZeAJVTpPI/Eal2F3Oczlb6Q7/V2zcu6
 T202UXFjjYUOwlMdM/XqU6etm5OZbgn8h5OTyyaEwp3Y+G/RXizHLW9PRlKC9/KKlyBY
 Su+iZxJzZAVOlECf5tg6ez5/WFe0jue8ixrrtmxAtCWllc+xgDM+cZEFCKPsDujCL2kJ
 qXObtDbp9EN7NvjZWCy4ufHS6FSf3Tk8X9SJsx6wkb/xRb04Mecs7B2NywCO9dIZ2oUR
 7LVA==
X-Gm-Message-State: AOAM530/KG/jzhWaJBeGLkzJaI/Dv3WXU+3eIMG/CS1wgzhwKslR5z4o
 Bx7t6/7sqKv/mnYOwYZqKdo=
X-Google-Smtp-Source: ABdhPJx2m6EbRwfCm2aRFvHN9jwja3SBcFSouVIuGQ7r96re23icQ+szizM3W9x4xT3Kzmb5hpCQLQ==
X-Received: by 2002:a17:902:74cb:b029:e4:7a16:9925 with SMTP id
 f11-20020a17090274cbb02900e47a169925mr16799724plt.39.1615896286566; 
 Tue, 16 Mar 2021 05:04:46 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 07/12] hw/net: i82596: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 20:04:15 +0800
Message-Id: <20210316120420.19658-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/i82596.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index 055c3a1470..1eca2e2d81 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -73,10 +73,6 @@ enum commands {
 #define I596_EOF        0x8000
 #define SIZE_MASK       0x3fff
 
-#define ETHER_TYPE_LEN 2
-#define VLAN_TCI_LEN 2
-#define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN)
-
 /* various flags in the chip config registers */
 #define I596_PREFETCH   (s->config[0] & 0x80)
 #define I596_PROMISC    (s->config[8] & 0x01)
@@ -489,8 +485,6 @@ bool i82596_can_receive(NetClientState *nc)
     return true;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
 {
     I82596State *s = qemu_get_nic_opaque(nc);
@@ -501,7 +495,6 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
     size_t bufsz = sz; /* length of data in buf */
     uint32_t crc;
     uint8_t *crc_ptr;
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] = {
                 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -584,17 +577,6 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
         }
     }
 
-    /* if too small buffer, then expand it */
-    if (len < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, len);
-        memset(buf1 + len, 0, MIN_BUF_SIZE + VLAN_HLEN - len);
-        buf = buf1;
-        if (len < MIN_BUF_SIZE) {
-            len = MIN_BUF_SIZE;
-        }
-        bufsz = len;
-    }
-
     /* Calculate the ethernet checksum (4 bytes) */
     len += 4;
     crc = cpu_to_be32(crc32(~0, buf, sz));
-- 
2.25.1


