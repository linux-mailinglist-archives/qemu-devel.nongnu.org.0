Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D1CCD0C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Oct 2019 00:17:56 +0200 (CEST)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGsN8-0004MB-Nl
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 18:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48541)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGsBg-0001zh-Cp
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGsBf-0007Al-F2
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:04 -0400
Received: from mga03.intel.com ([134.134.136.65]:4371)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iGsBf-0007AF-7F
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Oct 2019 15:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,261,1566889200"; d="scan'208";a="195906820"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 05 Oct 2019 15:06:02 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 2/4] migration/postcopy: fix typo in
 mark_postcopy_blocktime_begin's comment
Date: Sun,  6 Oct 2019 06:05:15 +0800
Message-Id: <20191005220517.24029-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191005220517.24029-1-richardw.yang@linux.intel.com>
References: <20191005220517.24029-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/postcopy-ram.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index d2bdd21ae3..a394c7c3a6 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -768,9 +768,11 @@ static void mark_postcopy_blocktime_begin(uintptr_t addr, uint32_t ptid,
     atomic_xchg(&dc->page_fault_vcpu_time[cpu], low_time_offset);
     atomic_xchg(&dc->vcpu_addr[cpu], addr);
 
-    /* check it here, not at the begining of the function,
-     * due to, check could accur early than bitmap_set in
-     * qemu_ufd_copy_ioctl */
+    /*
+     * check it here, not at the beginning of the function,
+     * due to, check could occur early than bitmap_set in
+     * qemu_ufd_copy_ioctl
+     */
     already_received = ramblock_recv_bitmap_test(rb, (void *)addr);
     if (already_received) {
         atomic_xchg(&dc->vcpu_addr[cpu], 0);
-- 
2.17.1


