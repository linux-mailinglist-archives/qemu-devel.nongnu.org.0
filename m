Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D691CF6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 08:20:49 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzb28-000312-3w
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 02:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzb0y-0002Dn-4e
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 02:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzb0x-0003CV-2P
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 02:19:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:56636)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hzb0w-0003B6-RS
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 02:19:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 23:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="177784511"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2019 23:19:31 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:18:40 +0800
Message-Id: <20190819061843.28642-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH 0/3] migration/postcopy: unsentmap is not
 necessary
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
Cc: pbonzini@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Three patches to cleanup postcopy:

[1]: split canonicalize bitmap and discard page
[2]: remove unsentmap since it is not necessary
[3]: cleanup the get_queued_page_not_dirty

Wei Yang (3):
  migration/postcopy: not necessary to do discard when canonicalizing
    bitmap
  migration/postcopy: unsentmap is not necessary for postcopy
  migration: remove sent parameter in get_queued_page_not_dirty

 include/exec/ram_addr.h |  6 ---
 migration/ram.c         | 94 +++++++----------------------------------
 migration/trace-events  |  2 +-
 3 files changed, 16 insertions(+), 86 deletions(-)

-- 
2.17.1


