Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D862712F8F4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 14:49:27 +0100 (CET)
Received: from localhost ([::1]:52496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inNKQ-0008CJ-P3
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 08:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.l.liu@intel.com>) id 1inNIW-0007Ja-Ue
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 08:47:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1inNIV-0001VW-5M
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 08:47:28 -0500
Received: from mga03.intel.com ([134.134.136.65]:21924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>) id 1inNIT-0001Gi-Jy
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 08:47:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2020 05:47:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,390,1571727600"; d="scan'208";a="221640108"
Received: from iov2.bj.intel.com ([10.238.145.72])
 by orsmga006.jf.intel.com with ESMTP; 03 Jan 2020 05:47:11 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com
Subject: [PATCH v1 0/2] intel_iommu: two fixes to intel scalable vIOMMU
Date: Fri,  3 Jan 2020 21:28:04 +0800
Message-Id: <1578058086-4288-1-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, jun.j.tian@intel.com,
 yi.y.sun@intel.co
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two fixes are found in vSVA implementation, and could be
upstreamed separately. Please feel free give your comments.

Thanks,
Yi Liu

Liu Yi L (2):
  intel_iommu: a fix to vtd_find_as_from_bus_num()
  intel_iommu: add present bit check for pasid table entries

 hw/i386/intel_iommu.c          | 93 +++++++++++++++++++++++++++++++++---------
 hw/i386/intel_iommu_internal.h |  1 +
 2 files changed, 75 insertions(+), 19 deletions(-)

-- 
2.7.4


