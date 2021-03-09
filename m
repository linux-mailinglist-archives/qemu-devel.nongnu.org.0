Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C93933262D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:10:18 +0100 (CET)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJc7t-0002ls-Mr
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a_lijiejun@163.com>)
 id 1lJbUi-0002rG-6m
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:29:48 -0500
Received: from m12-11.163.com ([220.181.12.11]:42030)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <a_lijiejun@163.com>)
 id 1lJbUd-0008AW-NY
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=6KOwxPlwWM0+EThOds
 +8pd2qwG8fAp0dN+CaaA2BBHk=; b=X/Q6sszG+CazNV4fgpZyUfzf84P2vltZPM
 UX3rs+0y73VvkR9fYkxkKteid+akM0Y7v/2vYtNMjZgZvZifWOPF7BN59egGRJ9W
 Jhr0vDbZ2XiS73gDY8jQkLzrTZcjKD5fOh/PjV3XeOUPcTYPjGt/FAsHeNiZT1Ur
 0iEwunghA=
Received: from workpc.localdomain (unknown [121.201.121.142])
 by smtp7 (Coremail) with SMTP id C8CowAAnLDgsakdgU7+BRQ--.34554S2;
 Tue, 09 Mar 2021 20:29:33 +0800 (CST)
From: lijiejun <a_lijiejun@163.com>
To: kraxel@redhat.com
Subject: [PATCH] virtio-gpu: Adjust code space style
Date: Tue,  9 Mar 2021 04:14:10 -0800
Message-Id: <1615292050-108748-1-git-send-email-a_lijiejun@163.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: C8CowAAnLDgsakdgU7+BRQ--.34554S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFW7ZF4xtryDJFWrXw15CFg_yoWfZFX_Xa
 yayr4rtF43W3WkZFW5Cw4rGr1Ivw48u3Z7uFyftryvqa4fA3W0qr1Sq3Z7CFW8CrZxKF43
 Zw4rXrs8C3ZakjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRE-txPUUUUU==
X-Originating-IP: [121.201.121.142]
X-CM-SenderInfo: pdboxyplhm30i6rwjhhfrp/xtbBXg1QFFaD6EYcqQAAsZ
Received-SPF: pass client-ip=220.181.12.11; envelope-from=a_lijiejun@163.com;
 helo=m12-11.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lijiejun <a_lijiejun@163.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix code style. Operator needs align with eight spaces, and delete line space.

Signed-off-by: lijiejun <a_lijiejun@163.com>
---
 hw/display/virtio-gpu-3d.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
index 9eb4890..d989648 100644
--- a/hw/display/virtio-gpu-3d.c
+++ b/hw/display/virtio-gpu-3d.c
@@ -438,7 +438,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
         break;
     case VIRTIO_GPU_CMD_RESOURCE_FLUSH:
         virgl_cmd_resource_flush(g, cmd);
-       break;
+        break;
     case VIRTIO_GPU_CMD_RESOURCE_UNREF:
         virgl_cmd_resource_unref(g, cmd);
         break;
@@ -456,7 +456,6 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_GET_CAPSET:
         virgl_cmd_get_capset(g, cmd);
         break;
-
     case VIRTIO_GPU_CMD_GET_DISPLAY_INFO:
         virtio_gpu_get_display_info(g, cmd);
         break;
-- 
1.8.3.1


