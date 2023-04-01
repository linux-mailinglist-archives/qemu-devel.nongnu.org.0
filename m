Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701856D2F1C
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 10:52:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piWxj-0004T8-6y; Sat, 01 Apr 2023 04:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1piWxf-0004Sw-FZ; Sat, 01 Apr 2023 04:51:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1piWxc-0002Dp-C0; Sat, 01 Apr 2023 04:51:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 821054000E;
 Sat,  1 Apr 2023 11:51:41 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id EB56192;
 Sat,  1 Apr 2023 11:51:40 +0300 (MSK)
Received: (nullmailer pid 2692015 invoked by uid 1000);
 Sat, 01 Apr 2023 08:51:40 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH trivial for-8.0] hw/virtio/virtio-qmp.c: spelling: suppoted
Date: Sat,  1 Apr 2023 11:51:40 +0300
Message-Id: <20230401085140.2691965-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fixes: f3034ad71fcd0a6a58bc37830f182b307f089159
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
---
 hw/virtio/virtio-qmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

This patch were previously sent at 5 Nov 2022, now the
code moved to another file, and the patch is still applies
(with changed filename).

diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
index 808446b4c9..e76218bdd5 100644
--- a/hw/virtio/virtio-qmp.c
+++ b/hw/virtio/virtio-qmp.c
@@ -343 +343 @@ qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
-            "buffers suppoted"),
+            "buffers supported"),
-- 
2.30.2

