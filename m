Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8415A5ED048
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 00:31:21 +0200 (CEST)
Received: from localhost ([::1]:59492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odJ6m-0008Rs-1v
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 18:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1odJ4T-0004cN-Av
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 18:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1odJ4N-0006N2-Jo
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 18:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664317729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kJPUy+E6s7hDc+pjiC7pOB9HlZbKnK9rw5KgBMZ6B34=;
 b=HtxTV1to+ZVqBjZXvCWkI8iClu5TD4AX04GYLh8uAF9m4w7fLoRJDL/ZistPAaIhlnr1tv
 XkJvDnG4p+BmdpPP+vte1dwvmlBfM2cC6hmLBR01mbcnH1AbON+pYOb96JzrzgoIyq5IgH
 SsgXJEa1urgblDIBKncF8z4zbFqTEuk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-OYyWsVFuPOm5fM3rWL-njA-1; Tue, 27 Sep 2022 18:28:47 -0400
X-MC-Unique: OYyWsVFuPOm5fM3rWL-njA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 671F2185A79C
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 22:28:47 +0000 (UTC)
Received: from [172.30.42.193] (unknown [10.22.8.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34ED0140EBF3;
 Tue, 27 Sep 2022 22:28:47 +0000 (UTC)
Subject: [PULL 0/2] VFIO updates 2022-09-27
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com
Date: Tue, 27 Sep 2022 16:28:46 -0600
Message-ID: <166431760265.2571033.4930197108505513269.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit dbc4f48b5ab3e6d85f78aa4df6bd6ad561c3d152:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-09-27 11:08:36 -0400)

are available in the Git repository at:

  https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20220927.1

for you to fetch changes up to 85b6d2b5fc25c9c0d10d493b3728183ab8f8e68a:

  vfio/common: Fix vfio_iommu_type1_info use after free (2022-09-27 14:26:42 -0600)

----------------------------------------------------------------
VFIO updates 2022-09-27

 * Fix initial values for migration state (Kunkun Jiang)

 * Fix a use-after-free error path (Alex Williamson)

----------------------------------------------------------------
Alex Williamson (1):
      vfio/common: Fix vfio_iommu_type1_info use after free

Kunkun Jiang (1):
      vfio/migration: Fix incorrect initialization value for parameters in VFIOMigration

 hw/vfio/common.c    | 36 +++++++++++++++++++-----------------
 hw/vfio/migration.c |  2 ++
 2 files changed, 21 insertions(+), 17 deletions(-)


