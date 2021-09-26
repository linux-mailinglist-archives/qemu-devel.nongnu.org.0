Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60432418753
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 10:17:55 +0200 (CEST)
Received: from localhost ([::1]:34274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUPMA-0001iy-7v
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 04:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nia@netbsd.org>) id 1mUOUP-0003Io-0o
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 03:22:25 -0400
Received: from mail.netbsd.org ([2001:470:a085:999::25]:56272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nia@netbsd.org>) id 1mUOUM-0008Jv-M9
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 03:22:20 -0400
Received: by mail.netbsd.org (Postfix, from userid 1524)
 id 0E76184EA4; Sun, 26 Sep 2021 07:22:14 +0000 (UTC)
Date: Sun, 26 Sep 2021 07:22:14 +0000
From: nia <nia@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Loosen GCC requirement from 7.5.0 to 7.4.0
Message-ID: <YVAfpt8k8BHsN2Ln@homeworld.netbsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2001:470:a085:999::25;
 envelope-from=nia@netbsd.org; helo=mail.netbsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 26 Sep 2021 04:11:49 -0400
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

As discussed in issue 614, we're shipping GCC 7.4.0 as the
system compiler in NetBSD 9, the most recent stable branch,
and are still actively interested in QEMU on this platform.

The differences between GCC 7.5.0 and 7.4.0 are trivial.

Signed-off-by: Nia Alarie <nia@NetBSD.org>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 1043ccce4f..f918ad67a1 100755
--- a/configure
+++ b/configure
@@ -2094,8 +2094,8 @@ cat > $TMPC << EOF
 #  endif
 # endif
 #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
-# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 5)
-#  error You need at least GCC v7.5.0 to compile QEMU
+# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
+#  error You need at least GCC v7.4.0 to compile QEMU
 # endif
 #else
 # error You either need GCC or Clang to compiler QEMU
-- 
2.33.0


