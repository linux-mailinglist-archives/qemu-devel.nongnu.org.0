Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED986E9CC1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 21:57:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppaNo-0007wy-1J; Thu, 20 Apr 2023 15:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1ppaNl-0007wi-Lp; Thu, 20 Apr 2023 15:55:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1ppaNj-00054l-W1; Thu, 20 Apr 2023 15:55:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6A37540146;
 Thu, 20 Apr 2023 22:55:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id EE97B215;
 Thu, 20 Apr 2023 22:55:46 +0300 (MSK)
Received: (nullmailer pid 2237132 invoked by uid 1000);
 Thu, 20 Apr 2023 19:55:46 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH trivial] spelling: information
Date: Thu, 20 Apr 2023 22:55:41 +0300
Message-Id: <20230420195541.2237081-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

3 trivial fixes: 2 .json comments which goes to
executables, and 1 .h file comment.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -173 +173 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
- * Return the current clipboard data & owner informations.
+ * Return the current clipboard data & owner information.

diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -71 +71 @@
-# @client: the additional infomation of the crypto device
+# @client: the additional information of the crypto device

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -894 +894 @@
-# NVMe smart informations, based on NVMe specification,
+# NVMe smart information, based on NVMe specification,

