Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7C02C1276
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 18:58:43 +0100 (CET)
Received: from localhost ([::1]:60958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khG6s-0006RI-Cj
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 12:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khG5C-0005Si-8o
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:56:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khG5A-00051h-2L
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606154213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EtEa6mVobKPzTOJJ6X6q7DyPgL8wAX9K8JrBfm2O5HI=;
 b=FXGaIDga9ap4wzekcXmDO1A0YVRuRKIAwCK2JIV+7AXRG9c0px1nWwflFNu2SAV8S0mbpz
 iqu02TIMLEErY66/RmXX47N2qFVBju88V8Z9b45nShXJVvqPrGODNlyHPhmIKGY5OV+QJV
 7drdw5DY13ztlU6GhhmIqkdQZe8grgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-k_6lTFU7NS-i9LH-nbUPAA-1; Mon, 23 Nov 2020 12:56:51 -0500
X-MC-Unique: k_6lTFU7NS-i9LH-nbUPAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1794802B42;
 Mon, 23 Nov 2020 17:56:50 +0000 (UTC)
Received: from gimli.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BB0410013BD;
 Mon, 23 Nov 2020 17:56:47 +0000 (UTC)
Subject: [PULL 0/2] VFIO updates for QEMU 5.2-rc3
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Nov 2020 10:56:46 -0700
Message-ID: <160615410107.26810.2586812803373008210.stgit@gimli.home>
User-Agent: StGit/0.21-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 683685e72dccaf8cb9fe8ffa20f5c5aacea72118:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2020-11-23 13:03:13 +0000)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20201123.0

for you to fetch changes up to bb0990d1740f6dced5b50a923677034c9399c213:

  vfio: Change default dirty pages tracking behavior during migration (2020-11-23 10:05:58 -0700)

----------------------------------------------------------------
VFIO update 2020-11-23

 * Enable pre-copy dirty page tracking by default (Kirti Wankhede)

 * Mark migration as experimental (Alex Williamson)

----------------------------------------------------------------
Alex Williamson (1):
      vfio: Make migration support experimental

Kirti Wankhede (1):
      vfio: Change default dirty pages tracking behavior during migration

 hw/vfio/common.c              | 11 +++++++----
 hw/vfio/migration.c           |  2 +-
 hw/vfio/pci.c                 |  5 +++++
 include/hw/vfio/vfio-common.h |  2 ++
 4 files changed, 15 insertions(+), 5 deletions(-)


