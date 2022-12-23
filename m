Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B998E65548C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 21:45:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8otX-0008J1-Jq; Fri, 23 Dec 2022 15:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p8otV-0008HH-5n
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 15:43:53 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p8otS-0008OP-Uc
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 15:43:52 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id EF5065EDD7;
 Fri, 23 Dec 2022 23:43:39 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:1329::1:e])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 WhvK240QguQ1-vm05H7DJ; Fri, 23 Dec 2022 23:43:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1671828219; bh=m8yx6uOjyIzloc9O3RC1xJoRdwvd5w7lvucrCEWh3cg=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=q1TKBk8iBDseKekEA6ZX/O/27Yrn9b3I1YtpxyqmDUK3HNPY9xp/rA/1KpNgs5b+x
 4lD0SOrCxSodwqgvy6/92gxCakoCv7pnkbB4ttXp7ZmRfjqsK7ZuE/1QoNbVeO8Q+6
 1B0PYjNLHLYR62F3gqiXAq2EzDDdE+zDpIjCf4FU=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, armbru@redhat.com, pbonzini@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH] scripts/coverity-scan/model.c: update address_space_*_cached
Date: Fri, 23 Dec 2022 23:43:30 +0300
Message-Id: <20221223204330.260647-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Make prototypes correspond to their origins. Also drop
address_space_rw_cached() which doesn't exist anywhere in the code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 scripts/coverity-scan/model.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 686d1a3008..b40d0fcbf3 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -69,7 +69,6 @@ static void __bufread(uint8_t *buf, ssize_t len)
 }
 
 MemTxResult address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
-                                      MemTxAttrs attrs,
                                       void *buf, int len)
 {
     MemTxResult result;
@@ -80,25 +79,13 @@ MemTxResult address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
 }
 
 MemTxResult address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
-                                MemTxAttrs attrs,
-                                const void *buf, int len)
+                                       const void *buf, int len)
 {
     MemTxResult result;
     __bufread(buf, len);
     return result;
 }
 
-MemTxResult address_space_rw_cached(MemoryRegionCache *cache, hwaddr addr,
-                                    MemTxAttrs attrs,
-                                    void *buf, int len, bool is_write)
-{
-    if (is_write) {
-        return address_space_write_cached(cache, addr, attrs, buf, len);
-    } else {
-        return address_space_read_cached(cache, addr, attrs, buf, len);
-    }
-}
-
 MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
                                MemTxAttrs attrs,
                                void *buf, int len)
-- 
2.34.1


