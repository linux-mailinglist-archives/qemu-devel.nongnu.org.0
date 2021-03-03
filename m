Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF92232B61E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:23:24 +0100 (CET)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNj1-0005ue-VO
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhk-0004du-QL
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:04 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhj-0001AQ-5t
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:04 -0500
Received: by mail-ej1-x62a.google.com with SMTP id gt32so29231964ejc.6
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0+CZ8WOKhev/ZPPlzfY1zFK9B6RBx6AffPAAbYJrUAU=;
 b=mTIVxTAubhk4ZC4pZfZU+jC0QuBrFxE0VmtTIWVyoZVLA2ORuFcQsdw8VAbFF5Ir7P
 4QrFvPiM8exiYF5qs9DvrTLU5vwG9q9Fe1QSzCCHDzTqJX9l5mu1Ta0o244AVo9mibd3
 tP189TyDqRh9DRy14LZGSLLaA4VAIs8i/ZD2oKm+OawG47OkNzObVcs67JnUYYnw0DMi
 FH1gwytAwma7HW/iZJ3Gmvzio8KuSY214/RT6RELtqhXgPzWZLTdW6hK/BwTPkJDFYNs
 aARrKOKV7maKsiPlmUFmC6+lkXBQClxQ59HVrM+IZMVsUWKz73Tg/G8+6ZV/pL/xeEms
 y+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0+CZ8WOKhev/ZPPlzfY1zFK9B6RBx6AffPAAbYJrUAU=;
 b=FWRnAtGc2DVf4UtGHRLXVZWIXJzxtsbbjKBbbGvT+IAlqZy5E4N9cTGt7Jwd+Jjq42
 owcdLRb0MumjF5Oonmm2+BJcZsMUuohmFxv9TKez/SHYlU58FeSGnIooquTVswCVXImg
 1n0Uf2T3Xb7NXjqMC+lSW7zyNvVl4+rFtO4pPgusowKXrk4OCG19uEomIro7YVxAjyxe
 ZKzQ8oUheaF6VpMFwQER9im8DhUIavh5LLpJAXYh+WrZFkMwvn/K0c8EersLwWdudI+r
 YdgyX48Owea2qaQAgDOYETcgovxcA2aUrvy+03bjcHF9nnMGvQNN+BFq4tPOm1c8XEMk
 fLLA==
X-Gm-Message-State: AOAM530ieCtbtSJfnrXkGJ2OIl0K5Kh+xm+8gcq09ajcFQy8Adkf9OAm
 PMFdZx8agVycYWlovtLzg3k=
X-Google-Smtp-Source: ABdhPJzCPANAzkKA+TMonr4AAR8qKdsErcV9to2Ysy8B6LFjTUccbwWAGhc0dBKT48ShxMf9wXiDtw==
X-Received: by 2002:a17:906:5453:: with SMTP id
 d19mr24232370ejp.150.1614763321199; 
 Wed, 03 Mar 2021 01:22:01 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i6sm16614865ejz.95.2021.03.03.01.21.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:22:00 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/9] net: Pad short frames to minimum size before send
 from SLiRP/TAP
Date: Wed,  3 Mar 2021 17:21:38 +0800
Message-Id: <1614763306-18026-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The minimum Ethernet frame length is 60 bytes. For short frames with
smaller length like ARP packets (only 42 bytes), on a real world NIC
it can choose either padding its length to the minimum required 60
bytes, or sending it out directly to the wire. Such behavior can be
hardcoded or controled by a register bit. Similarly on the receive
path, NICs can choose either dropping such short frames directly or
handing them over to software to handle.

On the other hand, for the network backends SLiRP/TAP, they don't
expose a way to control the short frame behavior. As of today they
just send/receive data from/to the other end connected to them,
which means any sized packet is acceptable. So they can send and
receive short frames without any problem. It is observed that ARP
packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
these ARP packets to the other end which might be a NIC model that
does not allow short frames to pass through.

To provide better compatibility, for packets sent from SLiRP/TAP, we
change to pad short frames before sending it out to the other end.
This ensures SLiRP/TAP as an Ethernet sender do not violate the spec.
But with this change, the behavior of dropping short frames in the
NIC model cannot be emulated because it always receives a packet that
is spec complaint. The capability of sending short frames from NIC
models are still supported and short frames can still pass through
SLiRP/TAP interfaces.

This commit should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

The following 2 commits seem to be the one to workaround this issue
in e1000 and vmxenet3 before, and should probably be reverted.

  commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
  commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- only pad short frames for SLiRP/TAP interfaces

 include/net/eth.h |  1 +
 net/net.c         | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/net/eth.h b/include/net/eth.h
index 0671be6..7c825ec 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -31,6 +31,7 @@
 
 #define ETH_ALEN 6
 #define ETH_HLEN 14
+#define ETH_ZLEN 60     /* Min. octets in frame sans FCS */
 
 struct eth_header {
     uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
diff --git a/net/net.c b/net/net.c
index 32d71c1..27c3b25 100644
--- a/net/net.c
+++ b/net/net.c
@@ -638,6 +638,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
                                                  NetPacketSent *sent_cb)
 {
     NetQueue *queue;
+    uint8_t min_buf[ETH_ZLEN];
     int ret;
 
 #ifdef DEBUG_NET
@@ -649,6 +650,17 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
         return size;
     }
 
+    /* Pad to minimum Ethernet frame length for SLiRP and TAP */
+    if (sender->info->type == NET_CLIENT_DRIVER_USER ||
+        sender->info->type == NET_CLIENT_DRIVER_TAP) {
+        if (size < ETH_ZLEN) {
+            memcpy(min_buf, buf, size);
+            memset(&min_buf[size], 0, ETH_ZLEN - size);
+            buf = min_buf;
+            size = ETH_ZLEN;
+        }
+    }
+
     /* Let filters handle the packet first */
     ret = filter_receive(sender, NET_FILTER_DIRECTION_TX,
                          sender, flags, buf, size, sent_cb);
-- 
2.7.4


