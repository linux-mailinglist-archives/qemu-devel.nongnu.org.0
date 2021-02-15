Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BB731BBCD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:04:33 +0100 (CET)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfQM-0006qy-FI
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNB-0005Jq-5X
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfN8-0000bx-Iq
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613401269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jj0H/rRpJfdBDzHVX1mZYB+U9ONpr0b24UIQz4d+Yf8=;
 b=Pz2zfvmZtb/HoAa8lXY4CjKKw9nfBdfV4khjyb39lltlGY8xMxqkmbLXFVE43/SPJvqddP
 mY13v94zW5pbcY7A9HqdVovXq0xe+zpiQmkd2omXLDQ7Kt34b8b0In9+H66IylKxQmZxkS
 zdsjFXclKVeHWCo9piiiNOO9t4knPdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-PIctkVvmOuaAYE3mqzbzug-1; Mon, 15 Feb 2021 10:01:06 -0500
X-MC-Unique: PIctkVvmOuaAYE3mqzbzug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F33838710E0;
 Mon, 15 Feb 2021 15:01:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E71635C233;
 Mon, 15 Feb 2021 15:01:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/11] Block layer patches
Date: Mon, 15 Feb 2021 16:00:49 +0100
Message-Id: <20210215150100.436555-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0280396a33c7210c4df5306afeab63411a41535a:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-gdbstub-150221-1' into staging (2021-02-15 10:13:13 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to b248e61652e20c3353af4b0ccb90f17d76f4db21:

  monitor/qmp: Stop processing requests when shutdown is requested (2021-02-15 15:10:14 +0100)

----------------------------------------------------------------
Block layer patches:

- qemu-storage-daemon: Enable object-add
- blockjob: Fix crash with IOthread when block commit after snapshot
- monitor: Shutdown fixes
- xen-block: fix reporting of discard feature
- qcow2: Remove half-initialised image file after failed image creation
- ahci: Fix DMA direction
- iotests fixes

----------------------------------------------------------------
Alexander Bulekov (1):
      hw/ide/ahci: map cmd_fis as DMA_DIRECTION_TO_DEVICE

Kevin Wolf (3):
      qemu-storage-daemon: Enable object-add
      monitor: Fix assertion failure on shutdown
      monitor/qmp: Stop processing requests when shutdown is requested

Max Reitz (1):
      iotests: Consistent $IMGOPTS boundary matching

Maxim Levitsky (3):
      crypto: luks: Fix tiny memory leak
      block: add bdrv_co_delete_file_noerr
      block: qcow2: remove the created file on initialization error

Michael Qiu (1):
      blockjob: Fix crash with IOthread when block commit after snapshot

Roger Pau Monné (1):
      xen-block: fix reporting of discard feature

Thomas Huth (1):
      tests/qemu-iotests: Remove test 259 from the "auto" group

 include/block/block.h                |  1 +
 block.c                              | 22 ++++++++++++++++++++++
 block/crypto.c                       | 13 ++-----------
 block/qcow2.c                        |  8 +++++---
 blockjob.c                           |  8 ++++++--
 hw/block/xen-block.c                 |  1 +
 hw/ide/ahci.c                        | 12 ++++++------
 monitor/monitor.c                    | 25 +++++++++++++++----------
 monitor/qmp.c                        |  5 +++++
 storage-daemon/qemu-storage-daemon.c |  2 ++
 tests/qemu-iotests/259               |  2 +-
 tests/qemu-iotests/common.rc         |  4 +++-
 12 files changed, 69 insertions(+), 34 deletions(-)


