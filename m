Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7E82AD47C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:13:28 +0100 (CET)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRaY-000066-RJ
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRYy-0006sY-8N
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRYv-0004V1-CE
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y1trrvDIGl7omxt/J5O7mgcWu9U7QumLTKUvjEp1ohc=;
 b=H69sawv3wUstWj9K2BimgmAzJ55O+keaKZt4m17lDDY0NtNWbmLo+GLHqP8iyjUSPFQ57l
 KvxytMtEKghOAoETJgzDP+QaT3ck4BoLk+aTOkfGCjD2PU+5UY1NLn8y9p2hhmwAX2IRK+
 Qq/GhpgIc0DuPAof8SBnVavetekCeXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-Z5wEkniBPIGvMNEcZ8uzww-1; Tue, 10 Nov 2020 06:11:39 -0500
X-MC-Unique: Z5wEkniBPIGvMNEcZ8uzww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3C5F5700C;
 Tue, 10 Nov 2020 11:11:37 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5223510013D9;
 Tue, 10 Nov 2020 11:11:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/19] qtests, gitlab, s390x and misc patches
Date: Tue, 10 Nov 2020 12:11:13 +0100
Message-Id: <20201110111132.559399-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter,

the following changes since commit a2547c1ba911a0c53a10fe02d94a0f539dc064cc:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2020-11-09' into staging (2020-11-09 13:55:15 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2020-11-10

for you to fetch changes up to a58cabd0e355fc51f18db359ba260da268df26ef:

  s390x: Avoid variable size warning in ipl.h (2020-11-10 08:51:30 +0100)

----------------------------------------------------------------
* Some small qtest fixes
* Oss-fuzz updates
* Publish the docs built during gitlab CI to the user's gitlab.io page
* Update the OpenBSD VM test to v6.8
* Fix the device-crash-test script to run with the meson build system
* Some small s390x fixes
----------------------------------------------------------------

Alex Bennée (1):
      configure: surface deprecated targets in the help output

AlexChen (2):
      qtest: Fix bad printf format specifiers
      tests/qtest/tpm: Remove redundant check in the tpm_test_swtpm_test()

Alexander Bulekov (3):
      docs/fuzz: rST-ify the fuzzing documentation
      docs/fuzz: update fuzzing documentation post-meson
      scripts/oss-fuzz: give all fuzzers -target names

Brad Smith (1):
      tests/vm: update openbsd to release 6.8

Daniel P. Berrangé (3):
      gitlab: publish the docs built during CI
      gitlab: force enable docs build in Fedora, Ubuntu, Debian
      docs: add "page source" link to sphinx documentation

Daniele Buono (3):
      fuzz: Make fork_fuzz.ld compatible with LLVM's LLD
      s390x: fix clang 11 warnings in cpu_models.c
      s390x: Avoid variable size warning in ipl.h

Dima Stepanov (1):
      fuzz: add virtio-blk fuzz target

Eduardo Habkost (1):
      device-crash-test: Check if path is actually an executable file

Peter Maydell (1):
      qtest: Update references to parse_escape() in comments

Philippe Mathieu-Daudé (2):
      gitlab-ci: Drop generic cache rule
      MAINTAINERS: Add gitlab-pipeline-status script to GitLab CI section

Stefan Hajnoczi (1):
      meson: always include contrib/libvhost-user

 .gitlab-ci.yml                        |  24 +++-
 MAINTAINERS                           |   3 +-
 configure                             |   4 +-
 docs/_templates/editpage.html         |   5 +
 docs/conf.py                          |   1 +
 docs/devel/_templates/editpage.html   |   5 +
 docs/devel/fuzzing.rst                | 236 ++++++++++++++++++++++++++++++++++
 docs/devel/fuzzing.txt                | 214 ------------------------------
 docs/devel/index.rst                  |   1 +
 docs/interop/_templates/editpage.html |   5 +
 docs/specs/_templates/editpage.html   |   5 +
 docs/system/_templates/editpage.html  |   5 +
 docs/tools/_templates/editpage.html   |   5 +
 docs/user/_templates/editpage.html    |   5 +
 hw/s390x/ipl.h                        |   4 +-
 meson.build                           |   6 +-
 scripts/device-crash-test             |   4 +-
 scripts/oss-fuzz/build.sh             |  12 +-
 target/s390x/cpu_models.c             |   8 +-
 tests/qtest/arm-cpu-features.c        |   8 +-
 tests/qtest/fuzz/fork_fuzz.ld         |  12 +-
 tests/qtest/fuzz/meson.build          |   1 +
 tests/qtest/fuzz/virtio_blk_fuzz.c    | 234 +++++++++++++++++++++++++++++++++
 tests/qtest/libqos/libqtest.h         |  18 +--
 tests/qtest/libqtest-single.h         |   2 +-
 tests/qtest/tpm-tests.c               |   6 +-
 tests/vm/openbsd                      |   8 +-
 27 files changed, 577 insertions(+), 264 deletions(-)
 create mode 100644 docs/_templates/editpage.html
 create mode 100644 docs/devel/_templates/editpage.html
 create mode 100644 docs/devel/fuzzing.rst
 delete mode 100644 docs/devel/fuzzing.txt
 create mode 100644 docs/interop/_templates/editpage.html
 create mode 100644 docs/specs/_templates/editpage.html
 create mode 100644 docs/system/_templates/editpage.html
 create mode 100644 docs/tools/_templates/editpage.html
 create mode 100644 docs/user/_templates/editpage.html
 create mode 100644 tests/qtest/fuzz/virtio_blk_fuzz.c


