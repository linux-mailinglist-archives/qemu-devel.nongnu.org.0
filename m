Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87512D3BAE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 10:54:22 +0200 (CEST)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqgn-0007sm-G2
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 04:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iIqdl-0004MW-3R
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:51:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iIqdk-000655-1X
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:51:12 -0400
Received: from mga01.intel.com ([192.55.52.88]:57819)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iIqdj-00064J-QV
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:51:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 01:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; d="scan'208";a="224271724"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2019 01:51:10 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 1/4] migration/multifd: fix a typo in comment of
 multifd_recv_unfill_packet()
Date: Fri, 11 Oct 2019 16:50:47 +0800
Message-Id: <20191011085050.17622-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011085050.17622-1-richardw.yang@linux.intel.com>
References: <20191011085050.17622-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
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
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 22423f08cd..cf30171f44 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -838,7 +838,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
 
     packet->pages_alloc = be32_to_cpu(packet->pages_alloc);
     /*
-     * If we recevied a packet that is 100 times bigger than expected
+     * If we received a packet that is 100 times bigger than expected
      * just stop migration.  It is a magic number.
      */
     if (packet->pages_alloc > pages_max * 100) {
-- 
2.17.1


