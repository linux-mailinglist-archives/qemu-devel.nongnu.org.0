Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30632BCF9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 03:49:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVRFN-0001si-6N
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 21:49:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVRDR-000108-8L
	for qemu-devel@nongnu.org; Mon, 27 May 2019 21:47:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVRDQ-0003c8-GO
	for qemu-devel@nongnu.org; Mon, 27 May 2019 21:47:49 -0400
Received: from mga11.intel.com ([192.55.52.93]:31236)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hVRDQ-0003YP-9X
	for qemu-devel@nongnu.org; Mon, 27 May 2019 21:47:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 May 2019 18:47:47 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga006.jf.intel.com with ESMTP; 27 May 2019 18:47:46 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 28 May 2019 09:47:01 +0800
Message-Id: <20190528014703.21030-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190528014703.21030-1-richardw.yang@linux.intel.com>
References: <20190528014703.21030-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH 2/4] migration/ram.c: use same type in
 MultiFDPages_t to define offsest
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
	quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MultiFDPacket_t.offset is allocated to store MultiFDPages_t.offset.

It would be better to use the same type.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 4c60869226..dcf4c54eb5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -607,7 +607,7 @@ typedef struct {
     uint64_t packet_num;
     uint64_t unused[4];    /* Reserved for future use */
     char ramblock[256];
-    uint64_t offset[];
+    ram_addr_t offset[];
 } __attribute__((packed)) MultiFDPacket_t;
 
 typedef struct {
-- 
2.19.1


