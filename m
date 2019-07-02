Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA205D81D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 00:37:43 +0200 (CEST)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiRPB-0001vN-MP
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 18:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.williamson@redhat.com>) id 1hiRKs-0000Cs-0S
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:33:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1hiRKm-0004Ik-6F
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:33:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60966)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1hiRKh-0004BC-En
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:33:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1FDE43082A6C;
 Tue,  2 Jul 2019 22:33:02 +0000 (UTC)
Received: from gimli.home (ovpn-116-83.phx2.redhat.com [10.3.116.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C27C19635;
 Tue,  2 Jul 2019 22:32:57 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 02 Jul 2019 16:32:57 -0600
Message-ID: <156210677697.19884.9077927453622553047.stgit@gimli.home>
In-Reply-To: <156210666074.19884.7711861336532593819.stgit@gimli.home>
References: <156210666074.19884.7711861336532593819.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 02 Jul 2019 22:33:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/2] vfio-common.h: Remove inaccurate comment
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
Cc: eric.auger@redhat.com, farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

This is a left-over from "f4ec5e26ed vfio: Add host side DMA window
capabilities", which added support to more than one DMA window.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 include/hw/vfio/vfio-common.h |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index a88b69b6750e..9107bd41c030 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -74,11 +74,6 @@ typedef struct VFIOContainer {
     int error;
     bool initialized;
     unsigned long pgsizes;
-    /*
-     * This assumes the host IOMMU can support only a single
-     * contiguous IOVA window.  We may need to generalize that in
-     * future
-     */
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;


