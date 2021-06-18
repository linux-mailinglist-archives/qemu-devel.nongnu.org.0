Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E83ACF3F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:36:43 +0200 (CEST)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGXy-0007hR-VH
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1luGWE-0005Hq-Sy
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1luGWC-0004H2-UO
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624030491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HTxsKAy7v1EcMYBP764fE5LQa/dQHTbQ9xAfj/Vy9UY=;
 b=K0y7uiVSEngbDiXDhU2OGg6+ZJJdHvjH4YGcgN3eyw/dReV9mGk0yUE8gQw66Pzwmxqkl1
 ylwXHjY+MnHZ2D63f/A5P97DCUBUOOos2cEbqstQHRD9e3uv6fjngrpViEabYBxJgRn3S+
 XMcf3T9oZCuvoxcuvCXzZrdfpxY0/iE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-DfETosqUPrudEmegPYy5xA-1; Fri, 18 Jun 2021 11:34:50 -0400
X-MC-Unique: DfETosqUPrudEmegPYy5xA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45CC619057AC;
 Fri, 18 Jun 2021 15:34:49 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-112-106.phx2.redhat.com [10.3.112.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B184C5F714;
 Fri, 18 Jun 2021 15:34:41 +0000 (UTC)
Subject: [PULL 0/3] VFIO update 2021-06-18
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jun 2021 09:34:41 -0600
Message-ID: <162403041204.1793226.16018359908572247606.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Cornelia Huck <cohuck@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 alex.williamson@redhat.com, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Qixin Gan <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:

  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20210618.0

for you to fetch changes up to d742d064c1f541ac8ad6541e248a97f2dc502721:

  vfio/migration: Correct device state from vmstate change for savevm case (2021-06-18 09:10:35 -0600)

----------------------------------------------------------------
VFIO update 2021-06-18

 * VFIO migration documentation (Tarun Gupta)

 * Fix SaveVMHandler de-registration (Kunkun Jiang)

 * Fix vmstate change transition (Kirti Wankhede)

----------------------------------------------------------------
Kirti Wankhede (1):
      vfio/migration: Correct device state from vmstate change for savevm case

Kunkun Jiang (1):
      vfio: Fix unregister SaveVMHandler in vfio_migration_finalize

Tarun Gupta (1):
      docs/devel: Add VFIO device migration documentation

 MAINTAINERS                   |   1 +
 docs/devel/index.rst          |   1 +
 docs/devel/vfio-migration.rst | 150 ++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/migration.c           |  12 +++-
 4 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 docs/devel/vfio-migration.rst


