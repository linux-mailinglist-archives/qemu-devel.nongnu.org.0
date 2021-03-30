Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C97F34E7A6
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:43:10 +0200 (CEST)
Received: from localhost ([::1]:47210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDi9-0002S1-8f
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfQ-0000sm-4q
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfA-0003Ks-NH
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617108003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2TDWf80i6RCfMV4HjDLbl6J9O/Wswkhyyasa/wmpWJc=;
 b=EZa6U0R+ZDcmsRpgBPGNMA5pjNOMPO9ZyHxgQ/8qsjPFRT3+uBtfwKGPd5sCrtHrPS6GSV
 +OXPqsU1LXn2sxicSiGlcQejTP+wXVsmmAwTXizxYYFwk7di0qSuFcoERoJTQJZ0ZqSp99
 XzxsWPDo7qzE8nzNcJHhk3igaFggPtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-I3DaszvYOQWYGtQObAZtjA-1; Tue, 30 Mar 2021 08:40:00 -0400
X-MC-Unique: I3DaszvYOQWYGtQObAZtjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 989221B18BC1;
 Tue, 30 Mar 2021 12:39:59 +0000 (UTC)
Received: from localhost (ovpn-113-220.ams2.redhat.com [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35E631A266;
 Tue, 30 Mar 2021 12:39:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/9] Block patches for 6.0-rc1
Date: Tue, 30 Mar 2021 14:39:48 +0200
Message-Id: <20210330123957.826170-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ec2e6e016d24bd429792d08cf607e4c5350dcdaa:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-28 19:49:57 +0100)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2021-03-30

for you to fetch changes up to 2ec7e8a94668efccf7f45634584cfa19a83fc553:

  iotests/244: Test preallocation for data-file-raw (2021-03-30 13:02:11 +0200)

----------------------------------------------------------------
Block patches for 6.0-rc1:
- Mark the qcow2 cache clean timer as external to fix record/replay
- Fix the mirror filter node's permissions so that an external process
  cannot grab an image while it is used as the mirror source
- Add documentation about FUSE exports to the storage daemon
- When creating a qcow2 image with the data-file-raw option, all
  metadata structures should be preallocated
- iotest fixes

----------------------------------------------------------------
Connor Kuehl (1):
  iotests: fix 051.out expected output after error text touchups

Max Reitz (6):
  iotests/116: Fix reference output
  iotests/046: Filter request length
  block/mirror: Fix mirror_top's permissions
  qsd: Document FUSE exports
  qcow2: Force preallocation with data-file-raw
  iotests/244: Test preallocation for data-file-raw

Pavel Dovgalyuk (1):
  qcow2: use external virtual timers

Tao Xu (1):
  iotests: Fix typo in iotest 051

 docs/tools/qemu-storage-daemon.rst   |  19 +++++
 block/mirror.c                       |  32 +++++++--
 block/qcow2.c                        |  41 ++++++++++-
 storage-daemon/qemu-storage-daemon.c |   4 ++
 tests/qemu-iotests/046               |   3 +-
 tests/qemu-iotests/046.out           | 104 +++++++++++++--------------
 tests/qemu-iotests/051               |   2 +-
 tests/qemu-iotests/051.out           |   6 +-
 tests/qemu-iotests/051.pc.out        |   4 +-
 tests/qemu-iotests/116.out           |  12 ++--
 tests/qemu-iotests/244               | 104 +++++++++++++++++++++++++++
 tests/qemu-iotests/244.out           |  68 ++++++++++++++++--
 12 files changed, 319 insertions(+), 80 deletions(-)

-- 
2.29.2


