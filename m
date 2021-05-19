Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AFE388F4C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:40:11 +0200 (CEST)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMQk-0003fh-N3
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alishir@routerhosting.com>)
 id 1ljGN9-0002Ub-9R
 for qemu-devel@nongnu.org; Wed, 19 May 2021 03:12:03 -0400
Received: from box.routerhosting.com ([37.10.113.220]:52635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alishir@routerhosting.com>)
 id 1ljGN7-0001He-OT
 for qemu-devel@nongnu.org; Wed, 19 May 2021 03:12:03 -0400
Received: from authenticated-user (box.routerhosting.com [37.10.113.220])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.routerhosting.com (Postfix) with ESMTPSA id C42DE4DB9A
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:41:59 +0430 (+0430)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=routerhosting.com;
 s=mail; t=1621408320;
 bh=OcAM4gQf3GQM8j3nHLIqeMJf+/r+97+HCT6LGWV5oH8=;
 h=From:To:Subject:Date:From;
 b=1jPfCZmL/0958Ley9mfgsJ2JPJ+kBlCbKVFPNrJJ1vDUASAbX7X/3xxK94Ac9MqJN
 aw5uXbkqDOQcPzxtcNMD0C6UBgjpgQjN8spPa1FHFVLgpBquA/x21FOciFf68CPX5j
 tETWavJ1PLZfxS5Upjc/R+2pEhQyW0FbbpNe08me8TM90Puqh4QdxTwx3IonmwoQzT
 E0mz+Bxvrsv499056bC0UJNAFNTT2ykbx7yCs3M+/vO2efvqSCju7DQEKhus4+pPO5
 sA9+oKP2qnuQDzgWuJL7ayS1AW06/Qb/AfVXfpBHjtioLpfmOc67ZU55FpnGc/C3uq
 lOPxnRufTG2xw==
To: qemu-devel@nongnu.org
Subject: [PATCH] doc: Add notes about -mon option mode=control argument.
Date: Wed, 19 May 2021 11:41:45 +0430
Message-Id: <0799f0de89ad2482672b5d61d0de61e6eba782da.1621407918.git.alishir@routerhosting.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.10.113.220;
 envelope-from=alishir@routerhosting.com; helo=box.routerhosting.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 May 2021 09:34:45 -0400
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
Reply-to:  Ali Shirvani <alishir@routerhosting.com>
From:  Ali Shirvani via <qemu-devel@nongnu.org>

The mode=control argument configures a QMP monitor.

Signed-off-by: Ali Shirvani <alishir@routerhosting.com>
---
 qemu-options.hx | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index e22fb94d99..292c6f6bdc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3787,8 +3787,11 @@ DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
     "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
 SRST
 ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
-    Setup monitor on chardev name. ``pretty`` is only valid when
-    ``mode=control``, turning on JSON pretty printing to ease
+    Setup monitor on chardev name. ``mode=control`` configures 
+    a QMP monitor (a JSON RPC-style protocol) and it is not the
+    same as HMP, the human monitor that has a "(qemu)" prompt.
+    ``pretty`` is only valid when ``mode=control``, 
+    turning on JSON pretty printing to ease
     human reading and debugging.
 ERST
 
-- 
2.30.2


