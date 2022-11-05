Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CEC61D9C4
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 12:54:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orHk3-0007kE-VO; Sat, 05 Nov 2022 07:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1orHk0-0007jj-Ue; Sat, 05 Nov 2022 07:53:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1orHjz-0007Gc-C9; Sat, 05 Nov 2022 07:53:36 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 06FB940653;
 Sat,  5 Nov 2022 14:53:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 94C3F3D3;
 Sat,  5 Nov 2022 14:53:38 +0300 (MSK)
Received: (nullmailer pid 306579 invoked by uid 1000);
 Sat, 05 Nov 2022 11:53:33 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH trivial for 7.2] hw/ssi/sifive_spi.c: spelling: reigster
Date: Sat,  5 Nov 2022 14:53:29 +0300
Message-Id: <20221105115329.306527-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
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

Fixes: 0694dabe9763847f3010b54ab3ec7d367d2f0ff0
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ssi/sifive_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/sifive_spi.c b/hw/ssi/sifive_spi.c
index 03540cf5ca..1b4a401ca1 100644
--- a/hw/ssi/sifive_spi.c
+++ b/hw/ssi/sifive_spi.c
@@ -267,7 +267,7 @@ static void sifive_spi_write(void *opaque, hwaddr addr,
     case R_RXDATA:
     case R_IP:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid write to read-only reigster 0x%"
+                      "%s: invalid write to read-only register 0x%"
                       HWADDR_PRIx " with 0x%x\n", __func__, addr << 2, value);
         break;
 
-- 
2.30.2


