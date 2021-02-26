Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D804F3260EE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 11:09:24 +0100 (CET)
Received: from localhost ([::1]:35764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFa3n-0001bH-Du
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 05:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFZy1-0004Tm-SF
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:03:26 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFZxy-0003BG-HO
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:03:25 -0500
Received: by mail-ej1-x62d.google.com with SMTP id u20so13824003ejb.7
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 02:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fKWkZpnZlOvCHwv8KGNYUKjSBi5KyPkqc2rbkP5sR8g=;
 b=r6Haf+yDxXW+1+DL5guoOT69saBAsvowJ+++0fgG4BdwRQAuliI+mF4AGad4BWnBIO
 nku5kqBP9rJX2qeJqpUNQjUua3MZZsozIBmEyQKJnwphm68AJk3Nd7m1Bgldufhomuqa
 ysW5RUfjmEZUwjiE55RCp3Y2kz+9OoKulPHTxHfazmCJZh+5aikPEqT+FJPDt84rk/yy
 zGPe8ivRuA9/RUegvGjRAt+KcKBWOs0QCVYM00toob34sVagPLQQ+B0yk3adaUQSirkw
 Jv1W7+1/Spugx3BJ4QhV4lP1rsG7cvPjNPo9hiQ5PJ5KpKPLwOqBJREMGOE9Hsd6EvuZ
 CEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fKWkZpnZlOvCHwv8KGNYUKjSBi5KyPkqc2rbkP5sR8g=;
 b=NY9diLbva1vW1KwcNg5sRi1GmZwiP9z+Dj2LUM8jGlsKEfWrpwWrAsvhzqScuxaJWu
 6S38n4dCdhuSA/XOq6VHWlygtZ+TyK9PpmzFXiI+CxxliZX0CCtD4ewHbQfl55tZ/CSN
 hRMiCMgm2fI47vZrZYzgrmsecEwIuqvzqJbnNzU8JjxZYOtK51M4BhMBXsIa7M7XeAcA
 Tcf+afTyLV/S3m8YYBqeTKT/4Q4uCtqTkPRRlT0iEm+J66kRocmuB/6RsfqXUWufms9C
 9ZsJyoLM1lBdQN+60rhYXIgppj6oCf6/8Xm1hqsRfhXsV/GPXTNyW3OaDCpxi3C82saI
 iO5A==
X-Gm-Message-State: AOAM532Dcxc1FEpg1uwonhLXchUrwJmY3WJN/ofYYg+EUlOerIXxunMH
 jb28V2m367uADRUyz0vBeq0=
X-Google-Smtp-Source: ABdhPJxyiYzd7eLzsleMsikM4+4N947n5ow3/QQrAtn7thxcnfn3pVdYdODnDF56edyA3o6ThSrBQA==
X-Received: by 2002:a17:906:b6cc:: with SMTP id
 ec12mr2437288ejb.520.1614333797560; 
 Fri, 26 Feb 2021 02:03:17 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a26sm5667554edm.15.2021.02.26.02.03.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Feb 2021 02:03:17 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH 1/3] net: Pad short frames to minimum size (60 bytes)
Date: Fri, 26 Feb 2021 18:03:04 +0800
Message-Id: <1614333786-74258-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
References: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
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

The minimum Ethernet frame length is 60 bytes, and we should pad
frames whose length is smaller to the minimum size.

This commit fixes the issue as seen with various ethernet models,
that ARP requests get dropped, preventing the guest from becoming
visible on the network.

The following 2 commits that attempted to workaround this issue
in e1000 and vmxenet3 before, should be reverted.

  commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
  commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 net/net.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/net.c b/net/net.c
index b038370..34004da 100644
--- a/net/net.c
+++ b/net/net.c
@@ -638,6 +638,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
                                                  NetPacketSent *sent_cb)
 {
     NetQueue *queue;
+    uint8_t min_buf[60];
     int ret;
 
 #ifdef DEBUG_NET
@@ -649,6 +650,14 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
         return size;
     }
 
+    /* Pad to minimum Ethernet frame length */
+    if (size < sizeof(min_buf)) {
+        memcpy(min_buf, buf, size);
+        memset(&min_buf[size], 0, sizeof(min_buf) - size);
+        buf = min_buf;
+        size = sizeof(min_buf);
+    }
+
     /* Let filters handle the packet first */
     ret = filter_receive(sender, NET_FILTER_DIRECTION_TX,
                          sender, flags, buf, size, sent_cb);
-- 
2.7.4


