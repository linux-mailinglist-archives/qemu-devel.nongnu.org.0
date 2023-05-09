Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A06FD200
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 00:01:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwVNn-0004LL-RY; Tue, 09 May 2023 18:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pwVNa-0004Kl-B2
 for qemu-devel@nongnu.org; Tue, 09 May 2023 18:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pwVNY-0003aV-Bo
 for qemu-devel@nongnu.org; Tue, 09 May 2023 18:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683669613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D+Dmt/BFE6hLhpYLKP0+slnUWlIGGKlSPshU8JyCxrM=;
 b=O14tQrtU7WYxFUo/8Q83RJvp1ML6dFBTXkLwoSXpu0D8YuFPSut8F94fOVqzZYDaVPxOu1
 j4AJEq/52G6uddmtwbkgfer+m5CEmlgBy6p8V9pCuVa8yeUNT0oJ3FwgJSNkY7n/ARnq5f
 94avK9wBmFDql2/hGSgUIfPmCTpvCh4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-oWAniFIGM_Ol1t0-Rfah0Q-1; Tue, 09 May 2023 18:00:12 -0400
X-MC-Unique: oWAniFIGM_Ol1t0-Rfah0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E676811E7C;
 Tue,  9 May 2023 22:00:11 +0000 (UTC)
Received: from omen.home.shazbot.org (unknown [10.22.18.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 296EA2166B26;
 Tue,  9 May 2023 22:00:11 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>, clg@redhat.com,
 avihaih@nvidia.com, minwoo.im@samsung.com, k.jensen@samsung.com
Subject: [PULL 0/3] VFIO updates 2023-05-09
Date: Tue,  9 May 2023 15:59:20 -0600
Message-Id: <20230509215923.3186420-1-alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 271477b59e723250f17a7e20f139262057921b6a:

  Merge tag 'compression-code-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-05-08 20:38:05 +0100)

are available in the Git repository at:

  https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20230509.0

for you to fetch changes up to b5048a4cbfa0362abc720b5198fe9a35441bf5fe:

  vfio/pci: Static Resizable BAR capability (2023-05-09 09:30:13 -0600)

----------------------------------------------------------------
VFIO updates 2023-05-09

 * Add vf-token device option allowing QEMU to assign VFs where the PF
   is managed by a userspace driver. (Minwoo Im)

 * Skip log_sync during migration setup as a potential source of failure
   and likely source of redundancy. (Avihai Horon)

 * Virtualize PCIe Resizable BAR capability rather than hiding it,
   exposing only the current size as available. (Alex Williamson)

----------------------------------------------------------------

Alex Williamson (1):
  vfio/pci: Static Resizable BAR capability

Avihai Horon (1):
  vfio/migration: Skip log_sync during migration SETUP state

Minwoo Im (1):
  vfio/pci: add support for VF token

 hw/vfio/common.c |  3 ++-
 hw/vfio/pci.c    | 67 ++++++++++++++++++++++++++++++++++++++++++++++--
 hw/vfio/pci.h    |  1 +
 3 files changed, 68 insertions(+), 3 deletions(-)

-- 
2.39.2


