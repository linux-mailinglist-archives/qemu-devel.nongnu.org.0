Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F48D58C2B2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 07:08:04 +0200 (CEST)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKuzj-0007ON-2P
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 01:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKuxD-0003Zh-Ep
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKuxA-0001KD-Cs
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659935122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RQZk1fKT15O2h4K5+qofFLIH7yBEhwFHM9bsimhIxxI=;
 b=gHVnhopUqYLkMVrl82oJ+gxYpF3Xrnz2oS0xf/yRbFxxgWE5lbWG85stsxYYlgCMzqs+PI
 UZQssvKd8oKHS/zbUZEmkv23u6Odoj6JAzd+njuamsQyoUqlb9nRj9triU6GDgKDixN4wX
 7K2Vw5aE9mBelBnVTKEgXxV4QuzUpWM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-NPpmHxLeP5qER2mPP2ZaiA-1; Mon, 08 Aug 2022 01:05:18 -0400
X-MC-Unique: NPpmHxLeP5qER2mPP2ZaiA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FAEE85A58D;
 Mon,  8 Aug 2022 05:05:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FB46492C3B;
 Mon,  8 Aug 2022 05:05:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: [PULL 0/4] Fixes for QEMU 7.1
Date: Mon,  8 Aug 2022 07:05:11 +0200
Message-Id: <20220808050515.1283174-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

 Hi!

The following changes since commit c669f22f1a47897e8d1d595d6b8a59a572f9158c:

  Merge tag 'pull-la-20220805' of https://gitlab.com/rth7680/qemu into staging (2022-08-05 12:55:53 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-08-08

for you to fetch changes up to 407634970dc5dba9330c360cfdc4e69e7aea3b37:

  tests/qemu-iotests/264: Allow up to 5s for the BLOCK_JOB_CANCEL event to arrive (2022-08-07 18:51:35 +0200)

----------------------------------------------------------------
* Fix booting in the s390-ccw bios when physical and logical block sizes differ
* Fix the replay-linux avocado test
* Relax a time constraint in iotest 264

----------------------------------------------------------------
Pavel Dovgalyuk (1):
      tests/avocado: fix replay-linux test

Thomas Huth (3):
      pc-bios/s390-ccw: Fix booting with logical block size < physical block size
      pc-bios/s390-ccw: Update the s390-ccw.img with the block size fix
      tests/qemu-iotests/264: Allow up to 5s for the BLOCK_JOB_CANCEL event to arrive

 pc-bios/s390-ccw/virtio-blkdev.c |   2 +-
 pc-bios/s390-ccw.img             | Bin 42608 -> 42608 bytes
 tests/avocado/replay_linux.py    |   1 +
 tests/qemu-iotests/264           |   2 +-
 4 files changed, 3 insertions(+), 2 deletions(-)


