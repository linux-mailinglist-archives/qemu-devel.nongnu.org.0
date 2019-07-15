Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78D768224
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 04:06:39 +0200 (CEST)
Received: from localhost ([::1]:34808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmqNy-0003Bc-9z
	for lists+qemu-devel@lfdr.de; Sun, 14 Jul 2019 22:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55455)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hmqNi-0002eg-KS
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 22:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hmqNh-0000U5-Kn
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 22:06:22 -0400
Received: from mga06.intel.com ([134.134.136.31]:4283)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hmqNh-0000Kv-D6
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 22:06:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jul 2019 19:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,492,1557212400"; d="scan'208";a="190417452"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2019 19:06:16 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 10:05:49 +0800
Message-Id: <20190715020549.15018-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH v2] migration/postcopy: fix document of
 postcopy_send_discard_bm_ram()
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 6b6712efccd3 ('ram: Split dirty bitmap by RAMBlock') changes the
parameter of postcopy_send_discard_bm_ram(), while left the document
part untouched.

This patch correct the document and fix two typo by hand.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
v2: fix typo in function name, pointed by Dave
---
 migration/ram.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 246efe6939..e019c925b2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2763,8 +2763,7 @@ void ram_postcopy_migrated_memory_release(MigrationState *ms)
  *
  * @ms: current migration state
  * @pds: state for postcopy
- * @start: RAMBlock starting page
- * @length: RAMBlock size
+ * @block: RAMBlock to discard
  */
 static int postcopy_send_discard_bm_ram(MigrationState *ms,
                                         PostcopyDiscardState *pds,
@@ -2961,7 +2960,7 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
 }
 
 /**
- * postcopy_chuck_hostpages: discrad any partially sent host page
+ * postcopy_chunk_hostpages: discard any partially sent host page
  *
  * Utility for the outgoing postcopy code.
  *
-- 
2.17.1


