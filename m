Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E1516F67D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 05:33:05 +0100 (CET)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6oNb-0008RP-Mb
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 23:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <colin.xu@intel.com>) id 1j6oMt-0007zB-FV
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 23:32:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <colin.xu@intel.com>) id 1j6oMr-0000Hk-R9
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 23:32:18 -0500
Received: from mga02.intel.com ([134.134.136.20]:49514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <colin.xu@intel.com>) id 1j6oMr-0008Kx-Jm
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 23:32:17 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 20:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,486,1574150400"; d="scan'208";a="231267679"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.142])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2020 20:32:07 -0800
From: Colin Xu <colin.xu@intel.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH] MAINTAINERS: Add entry for Guest X86 HAXM CPUs
Date: Wed, 26 Feb 2020 12:32:04 +0800
Message-Id: <20200226043204.67961-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
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
Cc: hang.yuan@intel.com, colin.xu@intel.com, wenchao.wang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HAXM covers below files:
include/sysemu/hax.h
target/i386/hax-*

Cc: Wenchao Wang <wenchao.wang@intel.com>
Cc: Hang Yuan <hang.yuan@intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36d94c17a654..27727e2fac13 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -435,6 +435,16 @@ F: include/hw/block/dataplane/xen*
 F: include/hw/xen/
 F: include/sysemu/xen-mapcache.h
 
+Guest CPU Cores (HAXM)
+---------------------
+X86 HAXM CPUs
+M: Wenchao Wang <wenchao.wang@intel.com>
+M: Colin Xu <colin.xu@intel.com>
+L: haxm-team@intel.com
+S: Maintained
+F: include/sysemu/hax.h
+F: target/i386/hax-*
+
 Hosts
 -----
 LINUX
-- 
2.25.1


