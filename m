Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBD85784E3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:11:33 +0200 (CEST)
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRTA-00037d-Ac
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOpn-0007Qf-Og
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:43 -0400
Received: from out199-9.us.a.mail.aliyun.com ([47.90.199.9]:33187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOpf-0000i2-Rs
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:40 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VJjIA6h_1658143035; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VJjIA6h_1658143035) by smtp.aliyun-inc.com;
 Mon, 18 Jul 2022 19:17:15 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
Subject: [PATCH 02/16] virtio: add VIRTIO_F_RING_RESET
Date: Mon, 18 Jul 2022 19:16:59 +0800
Message-Id: <1297b9d5bb9b238f711d944087790c769146ba87.1658141552.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=47.90.199.9;
 envelope-from=kangjie.xu@linux.alibaba.com; helo=out199-9.us.a.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:49:04 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Added VIRTIO_F_RING_RESET, it came from here
https://github.com/oasis-tcs/virtio-spec/issues/124

This feature indicates that the driver can reset a queue individually.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 include/standard-headers/linux/virtio_config.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/standard-headers/linux/virtio_config.h b/include/standard-headers/linux/virtio_config.h
index 7acd8d4abc..47a7eef5e4 100644
--- a/include/standard-headers/linux/virtio_config.h
+++ b/include/standard-headers/linux/virtio_config.h
@@ -96,4 +96,9 @@
  * Does the device support Single Root I/O Virtualization?
  */
 #define VIRTIO_F_SR_IOV			37
+
+/*
+ * This feature indicates that the driver can reset a queue individually.
+ */
+#define VIRTIO_F_RING_RESET		40
 #endif /* _LINUX_VIRTIO_CONFIG_H */
-- 
2.32.0


