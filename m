Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B04AEF46
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 05:49:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLJlx-00072S-An
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 23:49:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hLJj7-0005Wx-5Q
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 23:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hLJj3-00033V-L8
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 23:46:39 -0400
Received: from mga11.intel.com ([192.55.52.93]:47399)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hLJj3-00030g-CZ
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 23:46:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Apr 2019 20:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,412,1549958400"; d="scan'208";a="169160274"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 29 Apr 2019 20:46:27 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 11:44:09 +0800
Message-Id: <20190430034412.12935-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH 0/3] Cleanup migration/ram.c
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
Cc: pbonzini@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
	dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The *start* of migration_bitmap_sync_range is always 0, we can remove this
parameter.

Since RAMBlock->offset is always *word* aligned, we can remove the check on
offset and simplify the logic a little.

Wei Yang (3):
  migration/ram.c: start of migration_bitmap_sync_range is always 0
  migration/ram.c: start of cpu_physical_memory_sync_dirty_bitmap is
    always 0
  ram: RAMBlock->offset is always aligned to a word

 include/exec/ram_addr.h | 24 ++++++++++++------------
 migration/ram.c         |  8 ++++----
 2 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.19.1


