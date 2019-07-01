Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33DD43419
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 10:27:03 +0200 (CEST)
Received: from localhost ([::1]:37728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbL4Y-0005Ds-BN
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 04:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36097)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <colin.xu@intel.com>) id 1hbL2o-0004at-7T
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 04:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <colin.xu@intel.com>) id 1hbL2n-0007lr-18
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 04:25:14 -0400
Received: from mga06.intel.com ([134.134.136.31]:26170)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <colin.xu@intel.com>) id 1hbL2m-0005Ti-N4
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 04:25:12 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 01:25:03 -0700
X-ExtLoop1: 1
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.21])
 by orsmga008.jf.intel.com with ESMTP; 13 Jun 2019 01:25:02 -0700
From: Colin Xu <colin.xu@intel.com>
To: qemu-devel@nongnu.org,
	stefanha@gmail.com
Date: Thu, 13 Jun 2019 16:24:57 +0800
Message-Id: <20190613082457.18246-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH] MAINTAINERS: Add entry for Guest X86 HAXM CPUs
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
Cc: hang.yuan@intel.com, haxm-team@intel.com, wenchao.wang@intel.com,
 colin.xu@intel.com
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
index 588c8d947a08..fccae4e7de48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -423,6 +423,16 @@ F: include/hw/block/dataplane/xen*
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
2.22.0


