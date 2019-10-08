Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C88CF0A8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 03:51:18 +0200 (CEST)
Received: from localhost ([::1]:50560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHeei-0007dS-CY
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 21:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qi1.zhang@intel.com>) id 1iHecs-0006K4-HY
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 21:49:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qi1.zhang@intel.com>) id 1iHecq-0003j2-OF
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 21:49:21 -0400
Received: from mga03.intel.com ([134.134.136.65]:56076)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qi1.zhang@intel.com>) id 1iHecq-0003bZ-2A
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 21:49:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 18:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; d="scan'208";a="394529349"
Received: from a23004-02.sh.intel.com ([10.239.9.19])
 by fmsmga006.fm.intel.com with ESMTP; 07 Oct 2019 18:49:08 -0700
From: qi1.zhang@intel.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] TM field check failed
Date: Tue,  8 Oct 2019 09:39:02 +0800
Message-Id: <cover.1570498233.git.qi1.zhang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: qi1.zhang@intel.com, ehabkost@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Zhang, Qi" <qi1.zhang@intel.com>

*** BLURB HERE ***

Zhang, Qi (2):
  intel_iommu: split the resevred fields arrays into two ones
  intel_iommu: TM field should not be in reserved bits

 hw/i386/intel_iommu.c          | 35 ++++++++++++++++++++--------------
 hw/i386/intel_iommu_internal.h | 17 +++++++++++++----
 2 files changed, 34 insertions(+), 18 deletions(-)

-- 
2.20.1


