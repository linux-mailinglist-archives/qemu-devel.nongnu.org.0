Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31BF38094E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:19:31 +0200 (CEST)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWmw-00034i-Vp
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjB-0000My-IH
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWj7-0004uR-Jt
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dfd3zQCREHrrH2mW4IQwAftdId6YPRQY18jst9zQZ8E=;
 b=TmDf/L2LZnmryrN6mqCWTNg3pDnYykPE6GW/StkIJWi+Wki3BnUsCKY3fjqxScs9obmgYO
 /UZCtt3GeSG5Nrs+rY62sJv6i7h3BZiOHxnk/wmAmrB8JsKl6nOy2EUb5B8tKxrp2mCo0O
 9OuyxtYOTTgW48yIzBLHLOgET/V0Y6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-C5EyipD1NvSH6HBerTYq8Q-1; Fri, 14 May 2021 08:15:31 -0400
X-MC-Unique: C5EyipD1NvSH6HBerTYq8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 135F81922961;
 Fri, 14 May 2021 12:15:30 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B1F760C5D;
 Fri, 14 May 2021 12:15:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/20] CI, qtest, and misc patches
Date: Fri, 14 May 2021 14:14:58 +0200
Message-Id: <20210514121518.832729-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter!

The following changes since commit 2d3fc4e2b069494b1e9e2e4a1e3de24cbc036426:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-05-12' into staging (2021-05-13 20:13:24 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-14

for you to fetch changes up to 568740bedf22cc8d0ec9ab1ce522a97baab5961c:

  cirrus.yml: Fix the MSYS2 task (2021-05-14 13:11:48 +0200)

----------------------------------------------------------------
* Replace YAML anchors by extends in the gitlab-CI yaml files
* Many small qtest fixes (e.g. to fix issues discovered by Coverity)
* Poison more config switches in common code
* Fix the failing Travis-CI and Cirrus-CI tasks
----------------------------------------------------------------

Note: This PR replaces my PR from May 3rd - the moxie removal has
      already been merged via Markus' tree, and I addes some other
      CI- and qtest related patches instead.

Dr. David Alan Gilbert (1):
  tests/migration-test: Fix "true" vs true

Mahmoud Mandour (1):
  util/compatfd.c: Replaced a malloc call with g_malloc.

Peter Maydell (6):
  tests/qtest/ahci-test.c: Calculate iso_size with 64-bit arithmetic
  tests/qtest/npcm7xx_pwm-test.c: Avoid g_assert_true() for non-test
    assertions
  tests/qtest/tpm-util.c: Free memory with correct free function
  tests/qtest/rtc-test: Remove pointless NULL check
  tests: Avoid side effects inside g_assert() arguments
  tests/qtest/migration-test: Use g_autofree to avoid leaks on error
    paths

Philippe Mathieu-Daudé (3):
  gitlab-ci: Replace YAML anchors by extends (container_job)
  gitlab-ci: Replace YAML anchors by extends (native_build_job)
  gitlab-ci: Replace YAML anchors by extends (native_test_job)

Stefan Hajnoczi (3):
  libqos/qgraph: fix "UNAVAILBLE" typo
  docs/devel/qgraph: add troubleshooting information
  libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm

Thomas Huth (6):
  tests/docker/dockerfiles: Add ccache to containers where it was
    missing
  include/sysemu: Poison all accelerator CONFIG switches in common code
  migration: Move populate_vfio_info() into a separate file
  configure: Poison all current target-specific #defines
  pc-bios/s390-ccw: Fix inline assembly for older versions of Clang
  cirrus.yml: Fix the MSYS2 task

 .cirrus.yml                                   |   4 +-
 .gitlab-ci.d/containers.yml                   |  76 ++++++-------
 .gitlab-ci.yml                                | 104 +++++++++---------
 Makefile                                      |   2 +-
 configure                                     |   7 ++
 docs/devel/qgraph.rst                         |  58 ++++++++++
 include/exec/poison.h                         |   6 +
 include/sysemu/hax.h                          |   4 +
 include/sysemu/hvf.h                          |   4 +
 include/sysemu/whpx.h                         |   4 +
 migration/meson.build                         |   3 +-
 migration/migration.c                         |  15 ---
 migration/migration.h                         |   2 +
 migration/target.c                            |  25 +++++
 pc-bios/s390-ccw/helper.h                     |   2 +-
 pc-bios/s390-ccw/jump2ipl.c                   |   4 +-
 pc-bios/s390-ccw/menu.c                       |   8 +-
 pc-bios/s390-ccw/virtio.c                     |   2 +-
 tests/docker/dockerfiles/alpine.docker        |   1 +
 .../dockerfiles/fedora-i386-cross.docker      |   1 +
 .../dockerfiles/fedora-win32-cross.docker     |   1 +
 .../dockerfiles/fedora-win64-cross.docker     |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker |   1 +
 tests/qtest/ahci-test.c                       |   4 +-
 tests/qtest/ipmi-bt-test.c                    |   6 +-
 tests/qtest/ipmi-kcs-test.c                   |   3 +-
 tests/qtest/libqos/qgraph.c                   |   2 +-
 tests/qtest/libqtest.c                        |   9 +-
 tests/qtest/migration-test.c                  |  75 +++++--------
 tests/qtest/npcm7xx_pwm-test.c                |   4 +-
 tests/qtest/rtc-test.c                        |   6 +-
 tests/qtest/tpm-util.c                        |   4 +-
 util/compatfd.c                               |   8 +-
 33 files changed, 270 insertions(+), 186 deletions(-)
 create mode 100644 migration/target.c


