Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3F85D81C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 00:37:43 +0200 (CEST)
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiRPA-0001r3-Qs
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 18:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57162)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.williamson@redhat.com>) id 1hiRKg-0000Bk-Bf
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:33:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1hiRKd-00043Y-Vm
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:33:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1hiRKd-0003yE-H9
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:32:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DF02D81F01;
 Tue,  2 Jul 2019 22:32:51 +0000 (UTC)
Received: from gimli.home (ovpn-116-83.phx2.redhat.com [10.3.116.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7060A5D9DE;
 Tue,  2 Jul 2019 22:32:47 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 02 Jul 2019 16:32:47 -0600
Message-ID: <156210666074.19884.7711861336532593819.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 02 Jul 2019 22:32:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] vfio fixes 2019-07-02
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

The following changes since commit 506179e42112be77bfd071f050b15762d3b2cd43:

  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.1-20190702' into staging (2019-07-02 18:56:44 +0100)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20190702.0

for you to fetch changes up to 5053bd781143c354dfe3c8747d6c013dc22851b6:

  vfio/pci: Trace vfio_set_irq_signaling() failure in vfio_msix_vector_release() (2019-07-02 13:16:29 -0600)

----------------------------------------------------------------
VFIO fixes 2019-07-02

 - Remove outdated comment (Fabiano Rosas)

 - Log MSI-X eventfd switch failure, fix Coverity issue (Eric Auger)

----------------------------------------------------------------
Eric Auger (1):
      vfio/pci: Trace vfio_set_irq_signaling() failure in vfio_msix_vector_release()

Fabiano Rosas (1):
      vfio-common.h: Remove inaccurate comment

 hw/vfio/pci.c                 | 7 +++++--
 include/hw/vfio/vfio-common.h | 5 -----
 2 files changed, 5 insertions(+), 7 deletions(-)

