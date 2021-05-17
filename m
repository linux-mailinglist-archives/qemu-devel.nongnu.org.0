Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEDF386BD8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 23:00:47 +0200 (CEST)
Received: from localhost ([::1]:41524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likM2-0005JF-Br
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 17:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likFE-0005kP-6X; Mon, 17 May 2021 16:53:44 -0400
Received: from [201.28.113.2] (port=46491 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likF9-0001mN-Jj; Mon, 17 May 2021 16:53:40 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 17 May 2021 17:50:34 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id A1F0B80139F;
 Mon, 17 May 2021 17:50:33 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 14/23] TCG: add tcg_constant_tl
Date: Mon, 17 May 2021 17:50:16 -0300
Message-Id: <20210517205025.3777947-15-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2021 20:50:34.0129 (UTC)
 FILETIME=[4836F810:01D74B5E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Used in D/DS/X-form load/store implementation.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 include/tcg/tcg-op.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 2cd1faf9c4..ef8a008ea7 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1096,6 +1096,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_sextract_tl tcg_gen_sextract_i64
 #define tcg_gen_extract2_tl tcg_gen_extract2_i64
 #define tcg_const_tl tcg_const_i64
+#define tcg_constant_tl tcg_constant_i64
 #define tcg_const_local_tl tcg_const_local_i64
 #define tcg_gen_movcond_tl tcg_gen_movcond_i64
 #define tcg_gen_add2_tl tcg_gen_add2_i64
@@ -1209,6 +1210,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_sextract_tl tcg_gen_sextract_i32
 #define tcg_gen_extract2_tl tcg_gen_extract2_i32
 #define tcg_const_tl tcg_const_i32
+#define tcg_constant_tl tcg_constant_i32
 #define tcg_const_local_tl tcg_const_local_i32
 #define tcg_gen_movcond_tl tcg_gen_movcond_i32
 #define tcg_gen_add2_tl tcg_gen_add2_i32
-- 
2.25.1


