Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01082517FC8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:35:28 +0200 (CEST)
Received: from localhost ([::1]:60788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlo0E-0005Px-Vf
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlnsx-0002QT-9N
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlnsv-0002Ka-Pi
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651566472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yJCQcRaUpgh9mppoKb1us07lAFaHS+F9MBMDUsD2qf4=;
 b=DTEOBJKkc9gT7zywmnrCH5TCP/bbcX6swSzlPSI8PYNAh6cA+zAHLbNRcYHcMj/WFwmVN3
 Lxq0yRNvunX5154OU+mNm27V15MCnJKN5k+oV/CEd4swJ4z82JQO77L/zKeqpD49B2HPub
 88Els8t4rk0rz4k1DCQA+KWqiIFETts=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-BLufCJbfPDWD4N11qn927g-1; Tue, 03 May 2022 04:27:51 -0400
X-MC-Unique: BLufCJbfPDWD4N11qn927g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FEB81C08545
 for <qemu-devel@nongnu.org>; Tue,  3 May 2022 08:27:51 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CD10C28100;
 Tue,  3 May 2022 08:27:50 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] qapi: Fix incorrect Since tags
Date: Tue,  3 May 2022 10:27:48 +0200
Message-Id: <20220503082748.89847-1-abologna@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The missing colon causes them to be interpreted as regular
text.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 qapi/crypto.json | 2 +-
 qapi/misc.json   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 1ec54c15ca..529aa730d4 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -358,7 +358,7 @@
 #                 Defaults to the same secret that was used to open the image
 #
 #
-# Since 5.1
+# Since: 5.1
 ##
 { 'struct': 'QCryptoBlockAmendOptionsLUKS',
   'data': { 'state': 'QCryptoBlockLUKSKeyslotState',
diff --git a/qapi/misc.json b/qapi/misc.json
index b83cc39029..f8a9feda30 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -188,7 +188,7 @@
 # Features:
 # @unstable: This command is experimental.
 #
-# Since 3.0
+# Since: 3.0
 #
 # Returns: nothing
 #
-- 
2.35.1


