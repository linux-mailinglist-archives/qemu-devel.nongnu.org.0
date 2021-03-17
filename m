Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A8933E9C2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:34:52 +0100 (CET)
Received: from localhost ([::1]:38738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPlb-0000L8-Sw
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeU-0003y3-Fk
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:30 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeL-0000Cj-Ie
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:30 -0400
Received: by mail-ej1-x62e.google.com with SMTP id c10so719638ejx.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=6g2fqKS4zXXBGv4/b0aMoziWaN2OpwusnZLdMFaob9Y=;
 b=WZ5d4RZnhj/I+wE6HFgD0GoX9myoCnPGqSBF7xXwAAL8VOFeCd/Rn2ZE7WWAA8EiBj
 3RqbZcp9Xb33WykZ0ENfjLVBfLi8so33J9FmpgvzWdwL97UhGvBT4RRLHOJv8OnXG95m
 u7Ah/NDyCZ2/wwtgRatYaFs3AbPtYRSj7us3M/fYyG//uGzh96cnI+OtPm4f6NPpGYSV
 RPhLkR6paPn7Ol0/A0QZsrdYrcjmj5cUhS3yXMZDhVXwAJmHsPfB6ZmFxoWIeABuhLO/
 GR1X6mOG529xkFxUIkXKpDi2wKtZxD4tQ45LekhLxOwHM/mOzW0oHX6aw7wHnjxGOl6T
 VO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=6g2fqKS4zXXBGv4/b0aMoziWaN2OpwusnZLdMFaob9Y=;
 b=rJ4ZEYGCvB//cIop9QOkyWuan9+lXkgVPv+Cts5TuWh6ww+v1yeOfB25H+x5vlg0AP
 uHjxTFmNR+2a1r6uQjgLIf/RLDzVkGbVRAUB/fjngCZFgn1650cDkB1JfyE/l79W1Y7p
 cW5Ke7+YQyWWE20GY4lDcUyD4RnX9VMHJv4dFAEoH1W0psGuaxGFYmt5eQ6Axzf3GuZj
 6V2xX8JUAMIxLCw/RBpvlmqJGX/abKiDbbXKtACKUv0BtxKJAGtbTALPX/QnpyWSjV5e
 tnjy0vfOQ3GxqdjuBR9vG0vd2o+ATA0tRr3b7IhjrscEC8igDpdlRn88FudJw5oAW2bk
 DecA==
X-Gm-Message-State: AOAM5335lD04ALlUQd6yWha98v9ZALrT9W4M1oM1mqS53s46dpNnMi+I
 8MCe1u4Cw27g03Ws/wKFfk8=
X-Google-Smtp-Source: ABdhPJzN08UjEbB07QRi38GGBJczNjZX0joiYMKgpx8mkAVnl51CTWUIwwJiHfYll+9XE1ffJEz4KQ==
X-Received: by 2002:a17:906:9be1:: with SMTP id
 de33mr34946540ejc.320.1615962437901; 
 Tue, 16 Mar 2021 23:27:17 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:27:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 07/12] hw/net: i82596: Remove the logic of padding short
 frames in the receive path
Date: Wed, 17 Mar 2021 14:26:33 +0800
Message-Id: <20210317062638.72626-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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
2.17.1


