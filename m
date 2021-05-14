Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E433380E7D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:56:50 +0200 (CEST)
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhb7J-0000LO-Av
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawH-0005HL-3B
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawE-0005kS-65
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=79+d73P0Ovgem/LW8+stR5vTjqcPPLrmDByeSPmFY1o=;
 b=JXUZZWf4ouM9mWH7+6nyPyXWJtkgg4BcVkwqrWgBKDLmEMJP3fdyf5uP/oshQAgTQIZcqv
 tk0zyXJ/LDkSF3xDrj01jHavWbX1osGCMmC/Y2fgZuuaq3zB6ky3KAI5jRxDNx5J0ncD1t
 6aJ5ZpRxcUZTPEiNcBq11YZ30LWFBOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-sxhib7rVPOWhjfi6fvCFaw-1; Fri, 14 May 2021 12:45:17 -0400
X-MC-Unique: sxhib7rVPOWhjfi6fvCFaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82C401854E25;
 Fri, 14 May 2021 16:45:16 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 298B02BFE7;
 Fri, 14 May 2021 16:45:16 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/19] Block patches
Date: Fri, 14 May 2021 18:44:55 +0200
Message-Id: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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

The following changes since commit 96662996eda78c48aadddd4e76d8615c7eb72d80:

  Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20210513a' into staging (2021-05-14 12:03:47 +0100)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2021-05-14

for you to fetch changes up to c61ebf362d0abf288ce266845519d5a550a1d89f:

  write-threshold: deal with includes (2021-05-14 16:14:10 +0200)

----------------------------------------------------------------
Block patches:
- drop block/io write notifiers
- qemu-iotests enhancements to make debugging easier
- rbd parsing fix
- HMP qemu-io fix (for iothreads)
- mirror job cancel relaxation (do not cancel in-flight requests when a
  READY mirror job is canceled with force=false)
- document qcow2's data_file and data_file_raw features
- fix iotest 297 for pylint 2.8
- block/copy-on-read refactoring

----------------------------------------------------------------
Connor Kuehl (3):
  iotests/231: Update expected deprecation message
  block/rbd: Add an escape-aware strchr helper
  Document qemu-img options data_file and data_file_raw

Emanuele Giuseppe Esposito (1):
  qemu-iotests: fix pylint 2.8 consider-using-with error

Paolo Bonzini (5):
  qemu-iotests: do not buffer the test output
  qemu-iotests: allow passing unittest.main arguments to the test
    scripts
  qemu-iotests: move command line and environment handling from
    TestRunner to TestEnv
  qemu-iotests: let "check" spawn an arbitrary test command
  qemu-iotests: fix case of SOCK_DIR already in the environment

Vladimir Sementsov-Ogievskiy (10):
  monitor: hmp_qemu_io: acquire aio contex, fix crash
  mirror: stop cancelling in-flight requests on non-force cancel in
    READY
  block/copy-on-read: use bdrv_drop_filter() and drop s->active
  block/write-threshold: don't use write notifiers
  block: drop write notifiers
  test-write-threshold: rewrite test_threshold_(not_)trigger tests
  block/write-threshold: drop extra APIs
  test-write-threshold: drop extra tests
  test-write-threshold: drop extra TestStruct structure
  write-threshold: deal with includes

 docs/tools/qemu-img.rst           |  31 +++++++
 include/block/block_int.h         |  15 +---
 include/block/write-threshold.h   |  27 ++----
 include/qemu/job.h                |   2 +-
 block.c                           |   1 -
 block/backup.c                    |   2 +-
 block/copy-on-read.c              |  33 +------
 block/io.c                        |  11 +--
 block/mirror.c                    |   6 +-
 block/monitor/block-hmp-cmds.c    |  31 ++++---
 block/rbd.c                       |  32 ++++---
 block/write-threshold.c           |  91 ++++---------------
 job.c                             |   2 +-
 qemu-io-cmds.c                    |   8 +-
 qemu-io.c                         |  17 +++-
 tests/unit/test-write-threshold.c |  90 ++-----------------
 tests/qemu-iotests/231            |   4 +
 tests/qemu-iotests/231.out        |   7 +-
 tests/qemu-iotests/240.out        |   8 +-
 tests/qemu-iotests/245.out        |   8 +-
 tests/qemu-iotests/264            |   2 +-
 tests/qemu-iotests/295.out        |   6 +-
 tests/qemu-iotests/296.out        |   8 +-
 tests/qemu-iotests/check          |  19 +++-
 tests/qemu-iotests/iotests.py     | 145 +++++++++++++++++-------------
 tests/qemu-iotests/pylintrc       |   3 +
 tests/qemu-iotests/testenv.py     |  22 ++++-
 tests/qemu-iotests/testrunner.py  |  37 +++-----
 28 files changed, 289 insertions(+), 379 deletions(-)

-- 
2.31.1


