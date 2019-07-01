Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84835F7C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 16:44:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYX98-00053V-Ka
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 10:44:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYX1o-0007aG-QU
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYX1n-00024U-Lk
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:36 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:55864 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hYX1n-0007nI-AZ
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 42B221A223E;
	Wed,  5 Jun 2019 16:35:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 187BB1A21BE;
	Wed,  5 Jun 2019 16:35:32 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 16:35:12 +0200
Message-Id: <1559745316-1454-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559745316-1454-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1559745316-1454-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 2/6] target/mips: Fix block-comment-related
 issues im msa_helper.c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Fix block-comment-related issues reported by checkpatch for file
msa_helper.c.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/msa_helper.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index eacb5a4..851450c 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -1975,8 +1975,10 @@ static inline int update_msacsr(CPUMIPSState *env, int action, int denormal)
         c &= ~FP_UNDERFLOW;
     }
 
-    /* Reciprocal operations set only Inexact when valid and not
-       divide by zero */
+    /*
+     * Reciprocal operations set only Inexact when valid and not
+     * divide by zero
+     */
     if ((action & RECIPROCAL_INEXACT) &&
             (c & (FP_INVALID | FP_DIV0)) == 0) {
         c = FP_INEXACT;
@@ -1985,15 +1987,19 @@ static inline int update_msacsr(CPUMIPSState *env, int action, int denormal)
     cause = c & enable;    /* all current enabled exceptions */
 
     if (cause == 0) {
-        /* No enabled exception, update the MSACSR Cause
-         with all current exceptions */
+        /*
+         * No enabled exception, update the MSACSR Cause
+         * with all current exceptions
+         */
         SET_FP_CAUSE(env->active_tc.msacsr,
                 (GET_FP_CAUSE(env->active_tc.msacsr) | c));
     } else {
         /* Current exceptions are enabled */
         if ((env->active_tc.msacsr & MSACSR_NX_MASK) == 0) {
-            /* Exception(s) will trap, update MSACSR Cause
-           with all enabled exceptions */
+            /*
+             * Exception(s) will trap, update MSACSR Cause
+             * with all enabled exceptions
+             */
             SET_FP_CAUSE(env->active_tc.msacsr,
                     (GET_FP_CAUSE(env->active_tc.msacsr) | c));
         }
@@ -3059,9 +3065,11 @@ void helper_msa_fexdo_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            /* Half precision floats come in two formats: standard
-               IEEE and "ARM" format.  The latter gains extra exponent
-               range by omitting the NaN/Inf encodings.  */
+            /*
+             * Half precision floats come in two formats: standard
+             * IEEE and "ARM" format.  The latter gains extra exponent
+             * range by omitting the NaN/Inf encodings.
+             */
             flag ieee = 1;
 
             MSA_FLOAT_BINOP(Lh(pwx, i), from_float32, pws->w[i], ieee, 16);
@@ -3617,9 +3625,11 @@ void helper_msa_fexupl_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            /* Half precision floats come in two formats: standard
-               IEEE and "ARM" format.  The latter gains extra exponent
-               range by omitting the NaN/Inf encodings.  */
+            /*
+             * Half precision floats come in two formats: standard
+             * IEEE and "ARM" format.  The latter gains extra exponent
+             * range by omitting the NaN/Inf encodings.
+             */
             flag ieee = 1;
 
             MSA_FLOAT_BINOP(pwx->w[i], from_float16, Lh(pws, i), ieee, 32);
@@ -3651,9 +3661,11 @@ void helper_msa_fexupr_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            /* Half precision floats come in two formats: standard
-               IEEE and "ARM" format.  The latter gains extra exponent
-               range by omitting the NaN/Inf encodings.  */
+            /*
+             * Half precision floats come in two formats: standard
+             * IEEE and "ARM" format.  The latter gains extra exponent
+             * range by omitting the NaN/Inf encodings.
+             */
             flag ieee = 1;
 
             MSA_FLOAT_BINOP(pwx->w[i], from_float16, Rh(pws, i), ieee, 32);
-- 
2.7.4


