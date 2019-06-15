Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB146E73
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jun 2019 07:21:06 +0200 (CEST)
Received: from localhost ([::1]:58752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hc17h-00086o-9k
	for lists+qemu-devel@lfdr.de; Sat, 15 Jun 2019 01:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50409)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hc15v-0006IY-Ts
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 01:19:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hc14K-0005OC-LY
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 01:17:38 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38617)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hc14F-0005HF-KA; Sat, 15 Jun 2019 01:17:33 -0400
Received: by mail-wr1-x442.google.com with SMTP id d18so4534668wrs.5;
 Fri, 14 Jun 2019 22:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TJupJq2iLSzo+lmcW8D4WexhuYgKK3OJLzmJTPFePsY=;
 b=mkf2VbESPMbaFlF23TzHGse6wRUBY5LI2IuAfxQaYVUccx/SkG5Pj4LsRenNPRXvSy
 qI8ypM6Q0CeOo91Wsu7WlVamENOyxcSKHSm9hw8Y3sXMN9vxUMvrW92EOz8nU9kzRE7T
 h65VM/Ax1d8fLokI64GuILX5I/l5Fe9tdxm1Cf+ENzjlr+kAkrEZe+6wY1ucOPePo7jN
 /ypTu8/5SkLuHrBEAh0V/zJw2w9AONXrd4VTaho1yH44wGSGksRc6FqdZiRUUtKxg+9w
 ktLq5A8ARkS2Sct7jh+8WlPfuejsLBUu8iajy66EY29oMQwStFheZVh+KQv4AijWqYxv
 Dhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TJupJq2iLSzo+lmcW8D4WexhuYgKK3OJLzmJTPFePsY=;
 b=OyCQzGMTIPRvqZK/HVbvuVJJfY7iQQ3xicQxUYxdBt8dqw6j5ysdZFq4F4vNGd/LS5
 qLmIhXwFQE6iiyoSawN0tk5Yt0D1ZMFwT19a+Eb3DZRsyIpwfRg4Shc4D0I4jZOUbzdM
 X6k2z3ZU0leD35I6M2n6lRI+EtzoxLq2UO7PaHIYOHx1b/BIK2EIdzplKOWqHH0EEFLZ
 dYysfF57cbgmQNBQJO1vbKYW5cEW8aAYQe4J2Wjatq49MRUELRSUCZk4VCr+xYt3bczs
 hu4Qb/jT2+Tyh6IOrwo6U3ICm9kw3FxjCSM6I3ydl+QgznvT9BHx3M7CEdKxRA3TrRjw
 lAQg==
X-Gm-Message-State: APjAAAXUV+ABIZ3wcwv+tci0KGn5WXK7+sOVkuDfaJVf6jHW8eYIg4PH
 38XWuorLek3upD9EEuOBZGG/JdCrBYQ=
X-Google-Smtp-Source: APXvYqwGa8Qst0ZHpONqAf5nvUuB9K6zZ7CEcP8mwnLovtERMCIdnghTTMBI8Aevgp9uuUUvkoGlJQ==
X-Received: by 2002:adf:9003:: with SMTP id h3mr46157819wrh.172.1560575847700; 
 Fri, 14 Jun 2019 22:17:27 -0700 (PDT)
Received: from localhost.localdomain ([141.226.31.91])
 by smtp.gmail.com with ESMTPSA id t15sm4316846wrx.84.2019.06.14.22.17.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 22:17:27 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sat, 15 Jun 2019 08:17:22 +0300
Message-Id: <20190615051722.13994-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH] net: cadence_gem: clear RX control descriptor
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Ramon Fried <rfried.dev@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The RX ring descriptors control field is used for setting
SOF and EOF (start of frame and end of frame).
The SOF and EOF weren't cleared from the previous descriptors,
causing inconsistencies in ring buffer.
Fix that by clearing the control field of every descriptors we're
processing.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 hw/net/cadence_gem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index ecee22525c..d83a82bdb0 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -406,6 +406,11 @@ static inline void rx_desc_set_sof(uint32_t *desc)
     desc[1] |= DESC_1_RX_SOF;
 }
 
+static inline void rx_desc_clear(uint32_t *desc)
+{
+    desc[1]  = 0;
+}
+
 static inline void rx_desc_set_eof(uint32_t *desc)
 {
     desc[1] |= DESC_1_RX_EOF;
@@ -994,6 +999,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
 
         /* Update the descriptor.  */
+        rx_desc_clear(s->rx_desc[q]);
+
         if (first_desc) {
             rx_desc_set_sof(s->rx_desc[q]);
             first_desc = false;
-- 
2.21.0


