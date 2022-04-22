Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9381850B61E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:25:02 +0200 (CEST)
Received: from localhost ([::1]:46688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrPI-0005Sg-W3
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nhqDc-0000uF-6S
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:08:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nhqDX-0003SJ-1y
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:08:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 81135406BD
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 13:08:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 0144735C;
 Fri, 22 Apr 2022 13:03:18 +0300 (MSK)
Received: (nullmailer pid 3692054 invoked by uid 1000);
 Fri, 22 Apr 2022 10:08:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: make fortify_source=yes by default
Date: Fri, 22 Apr 2022 13:08:25 +0300
Message-Id: <20220422100825.3692002-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit c87ea1163111917 "configure: add --without-default-feature"
changed fortify_source from "yes" to "$default_feature". But there's
no option to turn it on, we only turn it off for debug build.  I think
this should always be initialized to "yes" in the first place.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 7c08c18358..5d79c9eee0 100755
--- a/configure
+++ b/configure
@@ -308,7 +308,7 @@ debug_tcg="no"
 debug="no"
 sanitizers="no"
 tsan="no"
-fortify_source="$default_feature"
+fortify_source="yes"
 gcov="no"
 EXESUF=""
 modules="no"
-- 
2.30.2


