Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22934365F19
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 20:17:00 +0200 (CEST)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYuvi-0000aM-KA
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 14:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serge.guelton@telecom-bretagne.eu>)
 id 1lYsct-0003AQ-1r
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:49:23 -0400
Received: from smtp3-g21.free.fr ([212.27.42.3]:5781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serge.guelton@telecom-bretagne.eu>)
 id 1lYscp-00041q-QP
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:49:22 -0400
Received: from localhost (unknown [77.198.99.164])
 (Authenticated sender: sergesanspaille@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6C96D13F89A;
 Tue, 20 Apr 2021 17:49:05 +0200 (CEST)
From: serge-sans-paille <sguelton@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Fix typo in CFI build documentation
Date: Tue, 20 Apr 2021 17:48:42 +0200
Message-Id: <1618933722-18022-1-git-send-email-sguelton@redhat.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: neutral client-ip=212.27.42.3;
 envelope-from=serge.guelton@telecom-bretagne.eu; helo=smtp3-g21.free.fr
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 20 Apr 2021 14:15:01 -0400
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
Cc: serge-sans-paille <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: serge-sans-paille <sguelton@redhat.com>
---
 docs/devel/control-flow-integrity.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
index d89d707..e6b73a4 100644
--- a/docs/devel/control-flow-integrity.rst
+++ b/docs/devel/control-flow-integrity.rst
@@ -39,7 +39,7 @@ later).
 Given the use of LTO, a version of AR that supports LLVM IR is required.
 The easies way of doing this is by selecting the AR provided by LLVM::
 
- AR=llvm-ar-9 CC=clang-9 CXX=lang++-9 /path/to/configure --enable-cfi
+ AR=llvm-ar-9 CC=clang-9 CXX=clang++-9 /path/to/configure --enable-cfi
 
 CFI is enabled on every binary produced.
 
@@ -131,7 +131,7 @@ lld with version 11+.
 In other words, to compile with fuzzing and CFI, clang 11+ is required, and
 lld needs to be used as a linker::
 
- AR=llvm-ar-11 CC=clang-11 CXX=lang++-11 /path/to/configure --enable-cfi \
+ AR=llvm-ar-11 CC=clang-11 CXX=clang++-11 /path/to/configure --enable-cfi \
                            -enable-fuzzing --extra-ldflags="-fuse-ld=lld"
 
 and then, compile the fuzzers as usual.
-- 
1.8.3.1


