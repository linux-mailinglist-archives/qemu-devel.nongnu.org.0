Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792E0423BEB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:04:10 +0200 (CEST)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4iX-0002fZ-84
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eA-00081s-Td
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4e8-0005ub-B5
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633517974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OP2xKJ5Kcm9fQa8hbcHzPrsz/5NUIiAcnci/fwnOnD0=;
 b=CLYjKKOtvdZMFz5k36W9Agq9iDAYuZA++o1PPgahHcqf4NhVEJLI0siC1QzPsgyWFivlSH
 KTuff/53XYn2Jl61b3umY9Ny6RngByES+Cd+B93z9suOcDit8IEGGErZeCKuBrrz/1oFQA
 pI9ey9U3ds0T0qGoFihi9IRnZeykZIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-ld2aEoAeN66Yhmy1gbkmPw-1; Wed, 06 Oct 2021 06:59:32 -0400
X-MC-Unique: ld2aEoAeN66Yhmy1gbkmPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD749362F8;
 Wed,  6 Oct 2021 10:59:30 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65BCE60C05;
 Wed,  6 Oct 2021 10:59:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/13] Block layer patches
Date: Wed,  6 Oct 2021 12:59:10 +0200
Message-Id: <20211006105923.223549-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit e3acc2c1961cbe22ca474cd5da4163b7bbf7cea3:

  tests/docker/dockerfiles: Bump fedora-i386-cross to fedora 34 (2021-10-05 16:40:39 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 3765315d4c84f9c0799744f43a314169baaccc05:

  iotests: Update for pylint 2.11.1 (2021-10-06 10:25:55 +0200)

----------------------------------------------------------------
Block layer patches

- Fix I/O errors because of incorrectly detected max_iov
- Fix not white-listed copy-before-write
- qemu-storage-daemon: Only display FUSE help when FUSE is built-in
- iotests: update environment and linting configuration

----------------------------------------------------------------
Emanuele Giuseppe Esposito (1):
      include/block.h: remove outdated comment

John Snow (5):
      iotests: add 'qemu' package location to PYTHONPATH in testenv
      iotests/linters: check mypy files all at once
      iotests/mirror-top-perms: Adjust imports
      iotests/migrate-bitmaps-test: delint
      iotests: Update for pylint 2.11.1

Paolo Bonzini (1):
      block: introduce max_hw_iov for use in scsi-generic

Philippe Mathieu-Daudé (1):
      qemu-storage-daemon: Only display FUSE help when FUSE is built-in

Vladimir Sementsov-Ogievskiy (5):
      block: implement bdrv_new_open_driver_opts()
      block: bdrv_insert_node(): fix and improve error handling
      block: bdrv_insert_node(): doc and style
      block: bdrv_insert_node(): don't use bdrv_open()
      iotests/image-fleecing: declare requirement of copy-before-write

 include/block/block.h                         |  8 ++-
 include/block/block_int.h                     |  7 +++
 include/sysemu/block-backend.h                |  1 +
 block.c                                       | 79 ++++++++++++++++++++++-----
 block/block-backend.c                         |  6 ++
 block/file-posix.c                            |  2 +-
 block/io.c                                    |  1 +
 hw/scsi/scsi-generic.c                        |  2 +-
 storage-daemon/qemu-storage-daemon.c          |  2 +
 tests/qemu-iotests/iotests.py                 |  2 -
 tests/qemu-iotests/testenv.py                 | 15 +++--
 tests/qemu-iotests/testrunner.py              |  7 ++-
 tests/qemu-iotests/235                        |  2 -
 tests/qemu-iotests/297                        | 52 +++++++-----------
 tests/qemu-iotests/300                        |  5 +-
 tests/qemu-iotests/pylintrc                   |  6 +-
 tests/qemu-iotests/tests/image-fleecing       |  1 +
 tests/qemu-iotests/tests/migrate-bitmaps-test | 50 +++++++++--------
 tests/qemu-iotests/tests/mirror-top-perms     | 12 ++--
 19 files changed, 164 insertions(+), 96 deletions(-)


