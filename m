Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAE161D9BE
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 12:49:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orHfr-0005j2-G3; Sat, 05 Nov 2022 07:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1orHfo-0005hu-2I; Sat, 05 Nov 2022 07:49:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1orHfm-0006Sw-FS; Sat, 05 Nov 2022 07:49:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1169140650;
 Sat,  5 Nov 2022 14:48:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 9E2203FD;
 Sat,  5 Nov 2022 14:48:59 +0300 (MSK)
Received: (nullmailer pid 306260 invoked by uid 1000);
 Sat, 05 Nov 2022 11:48:53 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH trivial for 7.2 2/2] hw/virtio/virtio.c: spelling: suppoted
Date: Sat,  5 Nov 2022 14:48:51 +0300
Message-Id: <20221105114851.306206-2-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221105114851.306206-1-mjt@tls.msk.ru>
References: <20221105114851.306206-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fixes: f3034ad71fcd0a6a58bc37830f182b307f089159
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 808446b4c9..e76218bdd5 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -340,7 +340,7 @@ qmp_virtio_feature_map_t virtio_net_feature_map[] = {
 qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
             "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
-            "buffers suppoted"),
+            "buffers supported"),
     FEATURE_ENTRY(VIRTIO_SCSI_F_HOTPLUG, \
             "VIRTIO_SCSI_F_HOTPLUG: Reporting and handling hot-plug events "
             "supported"),
-- 
2.30.2


