Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415C73320C9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 09:36:00 +0100 (CET)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJXqR-0002gH-0a
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 03:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a_lijiejun@163.com>)
 id 1lJXov-00026R-Sa
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:34:25 -0500
Received: from m12-14.163.com ([220.181.12.14]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <a_lijiejun@163.com>)
 id 1lJXop-0005AA-HO
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=dIXPeXl1mCnsjAHpxW
 oxDPqV3/Mu0rXTEU65FVsIcH4=; b=QuNm4ed6mw299JucFF23/X3sd9qsIh1dus
 XkjxguYdxaDcIqpnkTSyzC+SEArQruaB6GqqZJ2nKkuvIItaR8P6lymDZzqXbGWm
 iTRpreMRmKzj90K4Kctrc6hWUM4KQGO/bEAkDLl2dasdCZUlIVQ652H7NVnb5xO2
 j17D4e+Zc=
Received: from workpc.localdomain (unknown [121.201.121.142])
 by smtp10 (Coremail) with SMTP id DsCowAAnw3BpL0dgsffxoQ--.60398S2;
 Tue, 09 Mar 2021 16:18:50 +0800 (CST)
From: lijiejun <a_lijiejun@163.com>
To: kraxel@redhat.com
Subject: [PATCH] virtio-gpu: Add spaces around operator
Date: Mon,  8 Mar 2021 23:42:36 -0800
Message-Id: <1615275756-129881-1-git-send-email-a_lijiejun@163.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: DsCowAAnw3BpL0dgsffxoQ--.60398S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw1rKw4xur48JFyDGF15Jwb_yoWfZFb_Xa
 y3Ar4rtF43X3WkZFW5Cw4rGr1Ivw4ku3WxuFyftryvqa4fA3W0qryfXas7CFW8CrZxKF43
 Zw4rWrs8C3ZayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRETa0JUUUUU==
X-Originating-IP: [121.201.121.142]
X-CM-SenderInfo: pdboxyplhm30i6rwjhhfrp/xtbBogpQFFaD-GCK9AAAsb
Received-SPF: pass client-ip=220.181.12.14; envelope-from=a_lijiejun@163.com;
 helo=m12-14.163.com
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

Fix code style. Operator needs spaces forend sides, and delete line space.

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



