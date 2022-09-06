Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF45AEB5C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:14:57 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZLr-0000qI-V2
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVY8F-0001Z1-H9; Tue, 06 Sep 2022 08:56:47 -0400
Received: from [200.168.210.66] (port=14617 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVY8D-0002Pq-QX; Tue, 06 Sep 2022 08:56:47 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 6 Sep 2022 09:55:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B9E318002BE;
 Tue,  6 Sep 2022 09:55:35 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH v2 1/8] target/ppc: Remove extra space from s128 field in
 ppc_vsr_t
Date: Tue,  6 Sep 2022 09:55:16 -0300
Message-Id: <20220906125523.38765-2-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906125523.38765-1-victor.colombo@eldorado.org.br>
References: <20220906125523.38765-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Sep 2022 12:55:36.0210 (UTC)
 FILETIME=[F52C5F20:01D8C1EF]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Very trivial rogue space removal. There are two spaces between Int128
and s128 in ppc_vsr_t struct, where it should be only one.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index a4c893cfad..985ff86f55 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -246,7 +246,7 @@ typedef union _ppc_vsr_t {
 #ifdef CONFIG_INT128
     __uint128_t u128;
 #endif
-    Int128  s128;
+    Int128 s128;
 } ppc_vsr_t;
 
 typedef ppc_vsr_t ppc_avr_t;
-- 
2.25.1


