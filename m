Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D14A33A51C
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 14:59:10 +0100 (CET)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLRGv-0004vj-GU
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 09:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRF3-0003B2-Ok
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:13 -0400
Received: from doohan.uni-paderborn.de ([2001:638:502:c003::16]:47814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRF2-000357-7W
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AS2ETiqdM7stz5NUuo8/gGVsH/130bF3ICMCajRUuxU=; b=K/zfANP7OzLILfEj0gzvJXTH8P
 YSbR8WRy+P8oBD0YEmryNvukkYaXMV9iTOkPbNf+B2+bvy1A7LI1zARcTff8fM4fPZB4shbsbGoDL
 EUgpFOPsyW0uM+qo8IQX6037UdIIbgkKvOG2b4sQ4KzMTKOBX+g7v8dM8ArXqRpU8fbE=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] target/tricore: Remove unused definitions
Date: Sun, 14 Mar 2021 14:55:10 +0100
Message-Id: <20210314135513.1369871-5-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
References: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.14.134815, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=31367613, da=103339294,
 mc=569, sc=4, hc=565, sp=0, fso=31367613, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::16;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=doohan.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kbastian@mail.uni-paderborn.de,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Remove these confusing and unused definitions.

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210127224255.3505711-4-f4bug@amsat.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/cpu.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index b82349d1b1..4b61a2c03f 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -375,18 +375,6 @@ typedef TriCoreCPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
-enum {
-    /* 1 bit to define user level / supervisor access */
-    ACCESS_USER  = 0x00,
-    ACCESS_SUPER = 0x01,
-    /* 1 bit to indicate direction */
-    ACCESS_STORE = 0x02,
-    /* Type of instruction that generated the access */
-    ACCESS_CODE  = 0x10, /* Code fetch access                */
-    ACCESS_INT   = 0x20, /* Integer load/store access        */
-    ACCESS_FLOAT = 0x30, /* floating point load/store access */
-};
-
 void cpu_state_reset(CPUTriCoreState *s);
 void tricore_tcg_init(void);
 int cpu_tricore_signal_handler(int host_signum, void *pinfo, void *puc);
-- 
2.30.1


