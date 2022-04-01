Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C718F4EF015
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:32:07 +0200 (CEST)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIJq-0003MC-TJ
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:32:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coypu@sdf.org>) id 1naFDg-0002y5-4C
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:13:32 -0400
Received: from mx.sdf.org ([205.166.94.24]:52885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coypu@sdf.org>) id 1naFDe-0000xH-9g
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:13:31 -0400
Received: from sdf.org (IDENT:coypu@sdf.org [205.166.94.16])
 by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id 231BCNhd021487
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits) verified NO)
 for <qemu-devel@nongnu.org>; Fri, 1 Apr 2022 11:12:24 GMT
Received: (from coypu@localhost)
 by sdf.org (8.15.2/8.12.8/Submit) id 231BCNaD015448
 for qemu-devel@nongnu.org; Fri, 1 Apr 2022 11:12:23 GMT
Date: Fri, 1 Apr 2022 11:12:23 +0000
From: Maya Rashish <coypu@sdf.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] bsd-user: Add missing semicolon
Message-ID: <YkbeF7U1/zb+8xE1@SDF.ORG>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.166.94.24; envelope-from=coypu@sdf.org;
 helo=mx.sdf.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 01 Apr 2022 10:17:06 -0400
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

Signed-off-by: Maya Rashish <coypu@sdf.org>
---
 bsd-user/netbsd/target_os_siginfo.h  | 2 +-
 bsd-user/openbsd/target_os_siginfo.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/netbsd/target_os_siginfo.h b/bsd-user/netbsd/target_os_siginfo.h
index 667c19cc7c..36c2323cbe 100644
--- a/bsd-user/netbsd/target_os_siginfo.h
+++ b/bsd-user/netbsd/target_os_siginfo.h
@@ -14,7 +14,7 @@ typedef struct target_sigaltstack {
 
 typedef struct {
     uint32_t __bits[TARGET_NSIG_WORDS];
-} target_sigset_t
+} target_sigset_t;
 
 struct target_sigaction {
     abi_ulong   _sa_handler;
diff --git a/bsd-user/openbsd/target_os_siginfo.h b/bsd-user/openbsd/target_os_siginfo.h
index baf646a5ab..b5332a83f9 100644
--- a/bsd-user/openbsd/target_os_siginfo.h
+++ b/bsd-user/openbsd/target_os_siginfo.h
@@ -14,7 +14,7 @@ typedef struct target_sigaltstack {
 
 typedef struct {
     uint32_t __bits[TARGET_NSIG_WORDS];
-} target_sigset_t
+} target_sigset_t;
 
 struct target_sigaction {
     abi_ulong   _sa_handler;
-- 
2.35.1


