Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708BC3339BA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:14:13 +0100 (CET)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvr2-0002fJ-H5
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpD-0000r1-2p
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:19 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpB-0006os-07
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:18 -0500
Received: by mail-ed1-x529.google.com with SMTP id b7so27200376edz.8
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HxFFXAbZcWSQYuiy3ELtMKaSRJK0/t+aYYLt3NELl6I=;
 b=ZpNRBJ1VrVBG31idwVgJKuFl9JhtzyEv1AvAdknhbGunrYW715ursxwhCL1NF/NZwB
 YrQM2exkcp0AbtLDYVlRf63YJIqYBC6NL3KzB9ScG2J5HlS2isrqRhgpzwqwy4XXASww
 LmoRxnyU8BR+QNqpFKpXkwjTiX/GBAPQkK1Tt0ERjGLMdsG7TnR0ylGGo0vXv2Sd59Lc
 JaW9FF+OlU02K+EhM06YdIcAR8xC78GWzk1LqdmDK1CYEDdL9yjFE1njri7Q7itw42Jm
 MisGxtrqcP7F3u0MmhzKlLoouybm2lV0vjgMKHZnuvjfeI/fhfnfsP6ijmBBhvBvpJmF
 TpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HxFFXAbZcWSQYuiy3ELtMKaSRJK0/t+aYYLt3NELl6I=;
 b=oIyqmBZCOX25227o8+dIoN8LOTLAi1Dd0+G8NLaGoi/u1+9e3KVQ8vXLCmzBBo8k7z
 5quN01TtnqkAXCSvzwcAD4rKozgXKeEt7k+bzXvw0Sn9lKq7w4QKFWNIgnxVjhdKXO0x
 9H7Y7M1Ep+K1EsksDgsoFDdsPhvGo5U1vCoiAuGpFno6whTv3/K+CaXovyYjsUm5zwdA
 04CFg4Krih3fBpGJrKEU/YYe8405r55ByMuzxqtCViUiCv7SYyYgMt8Hw1i5fv9q83uB
 gWJ7fJGRfGZa2xmv9SLzNGeWaNbzDwFv+zvRhYXYcvmGd4hmjAO6MXXQ5sbKqdPvLR7g
 a9OQ==
X-Gm-Message-State: AOAM532G1nLXLkpNL5r7PMp38C5MAyO020P8Xqy3MUOz9VvneDZD9zr+
 wZlekw/nnM+SyIZAYFr8EtY=
X-Google-Smtp-Source: ABdhPJwvgvPEQo5Thrg8S340Cwp2ItEYNUgBT9IbyrtoBJ8UYCajYhGRMuM7ppazxf2hlHSWtpjegQ==
X-Received: by 2002:a05:6402:13ca:: with SMTP id
 a10mr2393163edx.320.1615371135509; 
 Wed, 10 Mar 2021 02:12:15 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:15 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 02/10] net: Pad short frames to minimum size before send
Date: Wed, 10 Mar 2021 18:11:49 +0800
Message-Id: <20210310101157.15136-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310101157.15136-1-bmeng.cn@gmail.com>
References: <20210310101157.15136-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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

The minimum Ethernet frame length is 60 bytes. For short frames with
smaller length like ARP packets (only 42 bytes), on a real world NIC
it can choose either padding its length to the minimum required 60
bytes, or sending it out directly to the wire. Such behavior can be
hardcoded or controled by a register bit. Similarly on the receive
path, NICs can choose either dropping such short frames directly or
handing them over to software to handle.

On the other hand, for the network backends like SLiRP/TAP, they
don't expose a way to control the short frame behavior. As of today
they just send/receive data from/to the other end connected to them,
which means any sized packet is acceptable. So they can send and
receive short frames without any problem. It is observed that ARP
packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
these ARP packets to the other end which might be a NIC model that
does not allow short frames to pass through.

To provide better compatibility, for packets sent from QEMU network
backends, we change to pad short frames before sending it out to the
other end. This ensures a backend as an Ethernet sender does not
violate the spec. But with this change, the behavior of dropping
short frames in the NIC model cannot be emulated because it always
receives a packet that is spec complaint. The capability of sending
short frames from NIC models cannot be supported as well.

This commit should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

The following 2 commits seem to be the one to workaround this issue
in e1000 and vmxenet3 before, and should probably be reverted.

  commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
  commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
[PMD: Use struct iovec for zero-copy]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

 include/net/eth.h |  1 +
 net/net.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/net/eth.h b/include/net/eth.h
index 0671be6916..7c825ecb2f 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -31,6 +31,7 @@
 
 #define ETH_ALEN 6
 #define ETH_HLEN 14
+#define ETH_ZLEN 60     /* Min. octets in frame sans FCS */
 
 struct eth_header {
     uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
diff --git a/net/net.c b/net/net.c
index bb1d455005..96a6d30474 100644
--- a/net/net.c
+++ b/net/net.c
@@ -621,6 +621,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
                                                  const uint8_t *buf, int size,
                                                  NetPacketSent *sent_cb)
 {
+    static const uint8_t null_buf[ETH_ZLEN] = { };
     NetQueue *queue;
     int ret;
     int iovcnt = 1;
@@ -629,6 +630,10 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
             .iov_base = (void *)buf,
             .iov_len = size,
         },
+        [1] = {
+            .iov_base = (void *)null_buf,
+            .iov_len = ETH_ZLEN,
+        },
     };
 
 #ifdef DEBUG_NET
@@ -640,6 +645,12 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
         return size;
     }
 
+    /* Pad to minimum Ethernet frame length */
+    if (size < ETH_ZLEN) {
+        iov[1].iov_len = ETH_ZLEN - size;
+        iovcnt = 2;
+    }
+
     /* Let filters handle the packet first */
     ret = filter_receive_iov(sender, NET_FILTER_DIRECTION_TX,
                              sender, flags, iov, iovcnt, sent_cb);
-- 
2.17.1


