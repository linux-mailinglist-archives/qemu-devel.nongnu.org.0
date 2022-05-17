Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C65D52A376
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:33:11 +0200 (CEST)
Received: from localhost ([::1]:46148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxK2-0002Jp-5d
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwUM-0003Nu-Oi; Tue, 17 May 2022 08:39:47 -0400
Received: from [187.72.171.209] (port=50866 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwUJ-0003z4-Fy; Tue, 17 May 2022 08:39:45 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 09:39:30 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 9CF02800C32;
 Tue, 17 May 2022 09:39:30 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 01/12] target/ppc: declare darn32/darn64 helpers with
 TCG_CALL_NO_RWG
Date: Tue, 17 May 2022 09:39:18 -0300
Message-Id: <20220517123929.284511-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 12:39:30.0907 (UTC)
 FILETIME=[278AD2B0:01D869EB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index aa6773c4a5..44eb6b7b7c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -59,8 +59,8 @@ DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
 DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(bpermd, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_3(srad, tl, env, tl, tl)
-DEF_HELPER_0(darn32, tl)
-DEF_HELPER_0(darn64, tl)
+DEF_HELPER_FLAGS_0(darn32, TCG_CALL_NO_RWG, tl)
+DEF_HELPER_FLAGS_0(darn64, TCG_CALL_NO_RWG, tl)
 #endif
 
 DEF_HELPER_FLAGS_1(cntlsw32, TCG_CALL_NO_RWG_SE, i32, i32)
-- 
2.25.1


