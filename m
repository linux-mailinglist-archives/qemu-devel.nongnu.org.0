Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C26833CF72
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:15:11 +0100 (CET)
Received: from localhost ([::1]:41922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4r8-0004DZ-1k
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pL-0001yP-Q9
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:19 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pJ-0007kA-6P
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:19 -0400
Received: by mail-ej1-x62e.google.com with SMTP id ci14so70454104ejc.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=EvxFf3WBo9tH1ZnVpWzayiw+8oX0XTNgDqvwoPFMymg=;
 b=udz+Ve9i2RI41/tO+ibxQc94qD33cboNhKOHJq2WGRnWuunUq0sGr7d1wsQHN7lz8N
 nWgUAn5/Fg1C56QwR6ILTRQ0ooqfcdcHSL+YqzxWu/2BXzUH9zd5dsLuPGhwqxg8+s23
 KYz7xnI7CW+5cIIRkuxTr+GR+iumLilegcq9CtXb8wR0zLJ5mi1ObhkH/HVG7tIum9KS
 uFuk/XEkMXBq1zc1kxp1Tvuct3GjbcGa2WnTCAJYYFfSVZmoTFEYo4PTRubfnRKidiJD
 8Yt48d3wdqHdeAWglY+qndE4KP498uoP4PS5U8YQQrGt3nrBiPpO2qUKd3wgfa9EGBVc
 ceow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=EvxFf3WBo9tH1ZnVpWzayiw+8oX0XTNgDqvwoPFMymg=;
 b=mQxeLr784fjAhigbWXrNHGuN3JaEd6CciHRwogSRMAJslV685hWvVqluymmQpAUOF0
 v+ku6WB+XuBcfzOJo4FAVlxjFgrkTOCX/4YfTHnbbx6JnB9HwzgbjTOp2vTBPxtRXc+k
 yVNFDlj3WviwykUoMzDORYpkxsLtggweiCz/kNQoJTAvkqiNBUJz0T0lwK6RhHh5z99T
 lGififti+0Ua9ku/UykWRe7VdUOoPw02W6GRs59+852MUwsT/KOw378SYAgGZ/YNrEm0
 CuVpIklkDRCyDcR6NjF49YVGVaStXMpwM9PSiHb0PKwXjstQC27WU7jhFaRoit/EHjxa
 KaFQ==
X-Gm-Message-State: AOAM531PnMiURC8HRZJbq1TqK8bTAB7J/c/OpWDY7AUSKeGfiwTfR4CF
 G3uMnAVV3CFH2cotqOVTNaE=
X-Google-Smtp-Source: ABdhPJwfB2zFa6p6GaWW/OOTBsCMIkoGuE4S9YjLs5G+zNGm+jEpFkk6/FjqlBtl3Zt03QjGBdClxw==
X-Received: by 2002:a17:907:76b3:: with SMTP id
 jw19mr27888212ejc.202.1615882395567; 
 Tue, 16 Mar 2021 01:13:15 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:15 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 03/13] net: slirp: Pad short frames to minimum size before
 send
Date: Tue, 16 Mar 2021 16:12:44 +0800
Message-Id: <20210316081254.72684-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
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
backends like SLiRP/TAP, we change to pad short frames before sending
it out to the other end, if the other end does not forbid it via the
nc->do_not_pad flag. This ensures a backend as an Ethernet sender
does not violate the spec. But with this change, the behavior of
dropping short frames from SLiRP/TAP interfaces in the NIC model
cannot be emulated because it always receives a packet that is spec
complaint. The capability of sending short frames from NIC models is
still supported and short frames can still pass through SLiRP/TAP.

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

---

Changes in v3:
- use the pad_short_frame() helper for slirp

 net/slirp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/slirp.c b/net/slirp.c
index be914c0be0..62a54d45dc 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -31,6 +31,7 @@
 #include <pwd.h>
 #include <sys/wait.h>
 #endif
+#include "net/eth.h"
 #include "net/net.h"
 #include "clients.h"
 #include "hub.h"
@@ -115,6 +116,14 @@ static ssize_t net_slirp_send_packet(const void *pkt, size_t pkt_len,
                                      void *opaque)
 {
     SlirpState *s = opaque;
+    uint8_t min_pkt[ETH_ZLEN];
+
+    if (!s->nc.peer->do_not_pad) {
+        if (pad_short_frame(min_pkt, pkt, pkt_len)) {
+            pkt = min_pkt;
+            pkt_len = ETH_ZLEN;
+        }
+    }
 
     return qemu_send_packet(&s->nc, pkt, pkt_len);
 }
-- 
2.17.1


