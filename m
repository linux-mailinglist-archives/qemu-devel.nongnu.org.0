Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD2D5ED614
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 09:29:21 +0200 (CEST)
Received: from localhost ([::1]:46156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odRVP-000764-Qz
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 03:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLO-0000p8-74
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLG-0008Q8-9z
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=azC5/9xYxOlRXhwYiYffkedxUie8L3KrK3xy7HunurQ=;
 b=OXRcrCfsQRa8MBV0qkB21K7F5yha4a79CXY8SYJOMTNKMsde/iQkRygJBttot5RunvEx8L
 puYgjgtjvopMoogJIIb0wNaAX3876j5Z42tkeJgGNNFni7uFhglcQnOkb+C/Gphb+oVYMO
 9mo37J9bGEMbk32Oq+cUatM2RH1qCO4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-EShbxC_BOwKN5SxZfujvrw-1; Wed, 28 Sep 2022 03:18:47 -0400
X-MC-Unique: EShbxC_BOwKN5SxZfujvrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADA00800186
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 07:18:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8AA840C83BB;
 Wed, 28 Sep 2022 07:18:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 00/37] qtests fixes
Date: Wed, 28 Sep 2022 09:18:06 +0200
Message-Id: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-09-28

for you to fetch changes up to 0b49bc1b713d6e3896179f9700c8c35e511075f6:

  docs/devel: testing: Document writing portable test cases (2022-09-27 20:51:21 +0200)

----------------------------------------------------------------
* Fixes for qtests and unit tests to be more portable to non-POSIX platforms

----------------------------------------------------------------
Bin Meng (33):
      tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable
      tests/qtest: ahci-test: Avoid using hardcoded /tmp
      tests/qtest: aspeed_smc-test: Avoid using hardcoded /tmp
      tests/qtest: boot-serial-test: Avoid using hardcoded /tmp
      tests/qtest: cxl-test: Avoid using hardcoded /tmp
      tests/qtest: fdc-test: Avoid using hardcoded /tmp
      tests/qtest: generic_fuzz: Avoid using hardcoded /tmp
      tests/qtest: virtio_blk_fuzz: Avoid using hardcoded /tmp
      tests/qtest: ide-test: Avoid using hardcoded /tmp
      tests/qtest: vhost-user-blk-test: Avoid using hardcoded /tmp
      tests/qtest: virtio-blk-test: Avoid using hardcoded /tmp
      tests/qtest: virtio-scsi-test: Avoid using hardcoded /tmp
      tests/qtest: libqtest: Avoid using hardcoded /tmp
      tests/unit: test-image-locking: Avoid using hardcoded /tmp
      tests/unit: test-qga: Avoid using hardcoded /tmp
      tests: vhost-user-bridge: Avoid using hardcoded /tmp
      tests/qtest: Skip running virtio-net-test cases that require socketpair() for win32
      tests/qtest: Build test-filter-{mirror, redirector} cases for posix only
      tests/qtest: qmp-test: Skip running test_qmp_oob for win32
      tests/qtest: libqtest: Exclude the *_fds APIs for win32
      tests/qtest: {ahci, ide}-test: Use relative path for temporary files for win32
      tests/qtest: bios-tables-test: Adapt the case for win32
      tests/qtest: migration-test: Disable IO redirection for win32
      tests/qtest: microbit-test: Fix socket access for win32
      tests/qtest: libqtest: Replace the call to close a socket with closesocket()
      tests/qtest: migration-test: Skip running some TLS cases for win32
      .gitlab-ci.d/windows.yml: Display meson test logs
      tests/qtest: hd-geo-test: Avoid using hardcoded /tmp
      tests/qtest: pflash-cfi02-test: Avoid using hardcoded /tmp
      tests/qtest: qmp-test: Avoid using hardcoded /tmp
      tests/qtest: vhost-user-test: Avoid using hardcoded /tmp
      tests/qtest: boot-serial-test: Close the serial file before starting QEMU
      docs/devel: testing: Document writing portable test cases

Michael Labiuk (1):
      tests/x86: Move common code to function in device-plug-test

Xuzhou Cheng (3):
      tests/qtest: libqtest: Adapt global_qtest declaration for win32
      tests/qtest: ide-test: Open file in binary mode
      tests/qtest: virtio-net-failover: Disable migration tests for win32

 docs/devel/testing.rst                  | 30 ++++++++++++++++++
 tests/qtest/fuzz/generic_fuzz_configs.h |  4 +--
 tests/qtest/libqtest-single.h           |  4 +++
 tests/qtest/libqtest.h                  |  8 +++++
 tests/qtest/ahci-test.c                 | 36 ++++++++++++++++------
 tests/qtest/aspeed_smc-test.c           |  5 ++-
 tests/qtest/bios-tables-test.c          | 12 ++++++--
 tests/qtest/boot-serial-test.c          | 11 ++++---
 tests/qtest/cxl-test.c                  | 15 ++++-----
 tests/qtest/device-plug-test.c          | 42 +++++++++++--------------
 tests/qtest/fdc-test.c                  |  5 +--
 tests/qtest/fuzz/virtio_blk_fuzz.c      |  4 +--
 tests/qtest/hd-geo-test.c               | 24 +++++++--------
 tests/qtest/i440fx-test.c               | 54 +++++++++------------------------
 tests/qtest/ide-test.c                  | 30 ++++++++++++++----
 tests/qtest/libqtest.c                  | 30 ++++++++++++------
 tests/qtest/microbit-test.c             | 10 +++---
 tests/qtest/migration-test.c            | 23 ++++++++++++++
 tests/qtest/pflash-cfi02-test.c         | 15 +++++----
 tests/qtest/qmp-test.c                  | 17 ++++++++---
 tests/qtest/vhost-user-blk-test.c       |  3 +-
 tests/qtest/vhost-user-test.c           | 10 +++---
 tests/qtest/virtio-blk-test.c           |  4 +--
 tests/qtest/virtio-net-failover.c       |  9 +++++-
 tests/qtest/virtio-net-test.c           | 13 ++++----
 tests/qtest/virtio-scsi-test.c          |  4 +--
 tests/unit/test-image-locking.c         |  8 ++---
 tests/unit/test-qga.c                   |  2 +-
 tests/vhost-user-bridge.c               |  3 +-
 .gitlab-ci.d/windows.yml                |  4 +--
 tests/qtest/meson.build                 | 36 ++++++++++------------
 31 files changed, 285 insertions(+), 190 deletions(-)


