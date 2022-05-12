Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E6525160
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:37:16 +0200 (CEST)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAsN-0001ES-7x
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApX-00068l-OP
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApU-0003PK-Pc
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652369654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vFWQxf5TiqFI3qw8fFcwXaAs9SQyFUMlh+7DA4ByS+M=;
 b=UPOHd92ZUv75oRz/f3uKHMThFdQilvyfklws518iYtl5iLp0fj3Goj0bZ3ozqGPyBA78Wp
 iYWDim7e2P5uSWaa66HJBPsfl4/fRK5e0cBh51BlYktgrkmZnUDpavJP8SVyrWMyoWGoGH
 +RF6LNEc0HAhdAtXHCkJyz60j1KH7rE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-wnA6ZA7OPaiBy1dR8jh_YQ-1; Thu, 12 May 2022 11:34:13 -0400
X-MC-Unique: wnA6ZA7OPaiBy1dR8jh_YQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD262811E81;
 Thu, 12 May 2022 15:34:12 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33A17401E9D;
 Thu, 12 May 2022 15:34:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 00/10] Block layer patches
Date: Thu, 12 May 2022 17:33:51 +0200
Message-Id: <20220512153401.202863-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

The following changes since commit ec11dc41eec5142b4776db1296972c6323ba5847:

  Merge tag 'pull-misc-2022-05-11' of git://repo.or.cz/qemu/armbru into staging (2022-05-11 09:00:26 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to f70625299ecc9ba577c87f3d1d75012c747c7d88:

  qemu-iotests: inline common.config into common.rc (2022-05-12 15:42:49 +0200)

----------------------------------------------------------------
Block layer patches

- coroutine: Fix crashes due to too large pool batch size
- fdc: Prevent end-of-track overrun
- nbd: MULTI_CONN for shared writable exports
- iotests test runner improvements

----------------------------------------------------------------
Daniel P. Berrangé (2):
      tests/qemu-iotests: print intent to run a test in TAP mode
      .gitlab-ci.d: export meson testlog.txt as an artifact

Eric Blake (2):
      qemu-nbd: Pass max connections to blockdev layer
      nbd/server: Allow MULTI_CONN for shared writable exports

Hanna Reitz (1):
      iotests/testrunner: Flush after run_test()

Kevin Wolf (2):
      coroutine: Rename qemu_coroutine_inc/dec_pool_size()
      coroutine: Revert to constant batch size

Paolo Bonzini (1):
      qemu-iotests: inline common.config into common.rc

Philippe Mathieu-Daudé (2):
      hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
      tests/qtest/fdc-test: Add a regression test for CVE-2021-3507

 qapi/block-export.json                           |   8 +-
 docs/interop/nbd.txt                             |   1 +
 docs/tools/qemu-nbd.rst                          |   3 +-
 include/block/nbd.h                              |   5 +-
 include/qemu/coroutine.h                         |   6 +-
 blockdev-nbd.c                                   |  13 +-
 hw/block/fdc.c                                   |   8 ++
 hw/block/virtio-blk.c                            |   6 +-
 nbd/server.c                                     |  10 +-
 qemu-nbd.c                                       |   2 +-
 tests/qtest/fdc-test.c                           |  21 ++++
 util/qemu-coroutine.c                            |  26 ++--
 tests/qemu-iotests/testrunner.py                 |   4 +
 .gitlab-ci.d/buildtest-template.yml              |  12 +-
 MAINTAINERS                                      |   1 +
 tests/qemu-iotests/common.config                 |  41 -------
 tests/qemu-iotests/common.rc                     |  31 +++--
 tests/qemu-iotests/tests/nbd-multiconn           | 145 +++++++++++++++++++++++
 tests/qemu-iotests/tests/nbd-multiconn.out       |   5 +
 tests/qemu-iotests/tests/nbd-qemu-allocation.out |   2 +-
 20 files changed, 261 insertions(+), 89 deletions(-)
 delete mode 100644 tests/qemu-iotests/common.config
 create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
 create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out


