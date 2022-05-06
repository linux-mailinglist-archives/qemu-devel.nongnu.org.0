Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9A51E041
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 22:47:48 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn4rb-0007x1-8i
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 16:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4qV-0006lg-Jv
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4qS-0005VD-Bo
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651869994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q56/VxtQZCCqcEX0KkrQMBM99VCQoCqfjhB6CKjQiyo=;
 b=AcHvUosIHey8NqqpVuQnnG9CQgV74kc+1Rhgz/gUh/bvtTCH6KdG9hzdLvjjV1QaR61TLS
 PgISIGJ2tTbDeQST1kz3zQOAG6qmQMUSVcX4Wnj51G1HBrWd12E/EAtuTvlvw8qst9Fb6H
 TzAqpRNNlDZtdO7cjmENEH+CISJyHU4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-q2YALPguMT2_h8LeajCmEw-1; Fri, 06 May 2022 16:46:31 -0400
X-MC-Unique: q2YALPguMT2_h8LeajCmEw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 822F385A5A8;
 Fri,  6 May 2022 20:46:30 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 385AA14E2EC4;
 Fri,  6 May 2022 20:46:29 +0000 (UTC)
Subject: [PULL 00/11] Series short description
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Longpeng (Mike)" <longpeng2@huawei.com>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 Stefan Berger <stefanb@linnux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yi Liu <yi.l.liu@intel.com>, Stefan Berger <stefanb@linux.ibm.com>
Date: Fri, 06 May 2022 14:46:28 -0600
Message-ID: <165186988363.4166595.3147442303200167674.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switching to gitlab for pull requests to take advantage of the CI.
Sorry for the delay in some of these.  Thanks,

Alex

The following changes since commit 31abf61c4929a91275fe32f1fafe6e6b3e840b2a:

  Merge tag 'pull-ppc-20220505' of https://gitlab.com/danielhb/qemu into staging (2022-05-05 13:52:22 -0500)

are available in the Git repository at:

  https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20220506.1

for you to fetch changes up to 44ee6aaae0c937abb631e57a9853c2cdef2bc9bb:

  vfio/common: Rename VFIOGuestIOMMU::iommu into ::iommu_mr (2022-05-06 09:06:51 -0600)

----------------------------------------------------------------
VFIO updates 2022-05-06

 * Defer IRQ routing commits to improve setup and resume latency (Longpeng)

 * Fix trace sparse mmap boundary condition (Xiang Chen)

 * Quiet misalignment warning from TPM device mapping (Eric Auger)

 * Misc cleanups (Yi Liu, Eric Auger)

----------------------------------------------------------------
Eric Auger (4):
      sysemu: tpm: Add a stub function for TPM_IS_CRB
      vfio/common: remove spurious tpm-crb-cmd misalignment warning
      hw/vfio/pci: fix vfio_pci_hot_reset_result trace point
      vfio/pci: Use vbasedev local variable in vfio_realize()

Longpeng (Mike) (5):
      vfio: simplify the conditional statements in vfio_msi_enable
      vfio: move re-enabling INTX out of the common helper
      vfio: simplify the failure path in vfio_msi_enable
      Revert "vfio: Avoid disabling and enabling vectors repeatedly in VFIO migration"
      vfio: defer to commit kvm irq routing when enable msi/msix

Xiang Chen (1):
      vfio/common: Fix a small boundary issue of a trace

Yi Liu (1):
      vfio/common: Rename VFIOGuestIOMMU::iommu into ::iommu_mr

 hw/vfio/common.c              |  50 ++++++---
 hw/vfio/pci.c                 | 234 +++++++++++++++++++++++++-----------------
 hw/vfio/pci.h                 |   2 +
 hw/vfio/trace-events          |   1 +
 include/hw/vfio/vfio-common.h |   2 +-
 include/sysemu/tpm.h          |   6 ++
 6 files changed, 186 insertions(+), 109 deletions(-)


