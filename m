Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C9404DC8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:10:17 +0200 (CEST)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOIsi-0007Dr-R8
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1mOIo8-0000xB-Be
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:05:33 -0400
Received: from mail05.asahi-net.or.jp ([202.224.55.45]:47236)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1mOIny-0006mh-VT
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:05:32 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail05.asahi-net.or.jp (Postfix) with ESMTPA id 73A4C24FDA;
 Thu,  9 Sep 2021 21:05:14 +0900 (JST)
Received: from SIOS1075.flets-east.jp (y243185.dynamic.ppp.asahi-net.or.jp
 [118.243.243.185])
 by sakura.ysato.name (Postfix) with ESMTPSA id E77021C05A9;
 Thu,  9 Sep 2021 21:05:13 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/rx: Fix helper definiton.
Date: Thu,  9 Sep 2021 21:04:58 +0900
Message-Id: <20210909120459.2199223-2-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909120459.2199223-1-ysato@users.sourceforge.jp>
References: <20210909120459.2199223-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.45;
 envelope-from=ysato@users.sourceforge.jp; helo=mail05.asahi-net.or.jp
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to an incorrect definition of helper,
TCG optimization could sometimes behave unexpectedly.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 target/rx/helper.h | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/rx/helper.h b/target/rx/helper.h
index f0b7ebbbf7..efbca7a1b8 100644
--- a/target/rx/helper.h
+++ b/target/rx/helper.h
@@ -5,27 +5,27 @@ DEF_HELPER_1(wait, noreturn, env)
 DEF_HELPER_1(debug, noreturn, env)
 DEF_HELPER_2(rxint, noreturn, env, i32)
 DEF_HELPER_1(rxbrk, noreturn, env)
-DEF_HELPER_FLAGS_3(fadd, TCG_CALL_NO_WG, f32, env, f32, f32)
-DEF_HELPER_FLAGS_3(fsub, TCG_CALL_NO_WG, f32, env, f32, f32)
-DEF_HELPER_FLAGS_3(fmul, TCG_CALL_NO_WG, f32, env, f32, f32)
-DEF_HELPER_FLAGS_3(fdiv, TCG_CALL_NO_WG, f32, env, f32, f32)
-DEF_HELPER_FLAGS_3(fcmp, TCG_CALL_NO_WG, void, env, f32, f32)
-DEF_HELPER_FLAGS_2(ftoi, TCG_CALL_NO_WG, i32, env, f32)
-DEF_HELPER_FLAGS_2(round, TCG_CALL_NO_WG, i32, env, f32)
-DEF_HELPER_FLAGS_2(itof, TCG_CALL_NO_WG, f32, env, i32)
+DEF_HELPER_3(fadd, f32, env, f32, f32)
+DEF_HELPER_3(fsub, f32, env, f32, f32)
+DEF_HELPER_3(fmul, f32, env, f32, f32)
+DEF_HELPER_3(fdiv, f32, env, f32, f32)
+DEF_HELPER_3(fcmp, void, env, f32, f32)
+DEF_HELPER_2(ftoi, i32, env, f32)
+DEF_HELPER_2(round, i32, env, f32)
+DEF_HELPER_2(itof, f32, env, i32)
 DEF_HELPER_2(set_fpsw, void, env, i32)
-DEF_HELPER_FLAGS_2(racw, TCG_CALL_NO_WG, void, env, i32)
-DEF_HELPER_FLAGS_2(set_psw_rte, TCG_CALL_NO_WG, void, env, i32)
-DEF_HELPER_FLAGS_2(set_psw, TCG_CALL_NO_WG, void, env, i32)
-DEF_HELPER_1(pack_psw, i32, env)
-DEF_HELPER_FLAGS_3(div, TCG_CALL_NO_WG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(divu, TCG_CALL_NO_WG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_1(scmpu, TCG_CALL_NO_WG, void, env)
+DEF_HELPER_2(racw, void, env, i32)
+DEF_HELPER_2(set_psw_rte, void, env, i32)
+DEF_HELPER_2(set_psw, void, env, i32)
+DEF_HELPER_FLAGS_1(pack_psw, TCG_CALL_NO_WG, i32, env)
+DEF_HELPER_3(div,  i32, env, i32, i32)
+DEF_HELPER_3(divu, i32, env, i32, i32)
+DEF_HELPER_1(scmpu, void, env)
 DEF_HELPER_1(smovu, void, env)
 DEF_HELPER_1(smovf, void, env)
 DEF_HELPER_1(smovb, void, env)
 DEF_HELPER_2(sstr, void, env, i32)
-DEF_HELPER_FLAGS_2(swhile, TCG_CALL_NO_WG, void, env, i32)
-DEF_HELPER_FLAGS_2(suntil, TCG_CALL_NO_WG, void, env, i32)
-DEF_HELPER_FLAGS_2(rmpa, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_2(swhile, void, env, i32)
+DEF_HELPER_2(suntil, void, env, i32)
+DEF_HELPER_2(rmpa, void, env, i32)
 DEF_HELPER_1(satr, void, env)
-- 
2.30.2


