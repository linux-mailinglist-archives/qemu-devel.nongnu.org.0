Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368874753D5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:40:17 +0100 (CET)
Received: from localhost ([::1]:48178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxOtb-0005nF-Q9
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:40:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnm-0002lf-SL
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnk-0004Gq-CB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2WhIPKaQUpIOd/sgZxtI9VP2y4nEtpxaYAil6cZOZP0=;
 b=FSB1NFS/+f2eQ7LFPWLS3Tg/VpNShdsuiO6+Zgc2Z4JG++yxkdkwTWW0Dsk32oAYO/uE4L
 tRDV+vyAfkb1zMSLTXTBrrYUu1dfo6r9IX+To4UtPajkik2VsLkOARQmuH6reY+ijGkDkz
 i1N49Xq4VDu0JTg6Q0isBNDP7Q/ePAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-LCN4Y4AVPP6e2sVntZZBYA-1; Wed, 15 Dec 2021 02:34:05 -0500
X-MC-Unique: LCN4Y4AVPP6e2sVntZZBYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57A192F25;
 Wed, 15 Dec 2021 07:34:04 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B023B1092790;
 Wed, 15 Dec 2021 07:34:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/16] qtest and gitlab-CI improvements
Date: Wed, 15 Dec 2021 08:33:46 +0100
Message-Id: <20211215073402.144286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-14 12:46:18 -0800)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-12-15

for you to fetch changes up to 7876cba8fc0cab9a4c803a30f427d4b20b95a868:

  gitlab-ci: Test compilation on Windows with MSYS2 (2021-12-15 08:08:59 +0100)

----------------------------------------------------------------
* Add virtio-net failover test
* Make qtests a little bit more flexible with regards to reduced configs
* Move libssh setup from configure to meson.build
* Run device-crash-test in CI
* Add jobs for NetBSD and OpenBSD to the CI
* Test compilation with MSYS2 in the gitlab-ci, too
* Add new virtio-iommu test

----------------------------------------------------------------
Eric Auger (4):
      virtio-iommu: Remove set_config callback
      virtio-iommu: Fix endianness in get_config
      virtio-iommu: Fix the domain_range end
      tests: qtest: Add virtio-iommu test

Laurent Vivier (4):
      qtest/libqos: add a function to initialize secondary PCI buses
      tests/qtest: add some tests for virtio-net failover
      tests/libqtest: add some virtio-net failover migration cancelling tests
      tests/libqtest: add a migration test with two couples of failover devices

Thomas Huth (8):
      tests/qtest: Run the PPC 32-bit tests with the 64-bit target binary, too
      tests/qtest: Fence the tests that need xlnx-zcu102 with CONFIG_XLNX_ZYNQMP_ARM
      tests/qtest: Add a function that gets a list with available machine types
      tests/qtest: Add a function to check whether a machine is available
      Move the libssh setup from configure to meson.build
      gitlab-ci.d/buildtest: Add jobs that run the device-crash-test
      gitlab-ci: Add cirrus-ci based tests for NetBSD and OpenBSD
      gitlab-ci: Test compilation on Windows with MSYS2

 .gitlab-ci.d/buildtest.yml        |   23 +
 .gitlab-ci.d/cirrus.yml           |   35 +
 .gitlab-ci.d/cirrus/kvm-build.yml |   31 +
 .gitlab-ci.d/qemu-project.yml     |    1 +
 .gitlab-ci.d/windows.yml          |   98 +++
 configure                         |   27 -
 hw/virtio/trace-events            |    3 +-
 hw/virtio/virtio-iommu.c          |   42 +-
 include/hw/pci/pci_bridge.h       |    8 +
 meson.build                       |   13 +-
 meson_options.txt                 |    2 +
 scripts/meson-buildoptions.sh     |    3 +
 tests/qtest/boot-serial-test.c    |    3 +-
 tests/qtest/cdrom-test.c          |    8 +-
 tests/qtest/libqos/libqtest.h     |    8 +
 tests/qtest/libqos/meson.build    |    1 +
 tests/qtest/libqos/pci.c          |  119 ++++
 tests/qtest/libqos/pci.h          |    1 +
 tests/qtest/libqos/virtio-iommu.c |  126 ++++
 tests/qtest/libqos/virtio-iommu.h |   40 ++
 tests/qtest/libqtest.c            |   79 ++-
 tests/qtest/meson.build           |    9 +-
 tests/qtest/prom-env-test.c       |    8 +-
 tests/qtest/virtio-iommu-test.c   |  326 +++++++++
 tests/qtest/virtio-net-failover.c | 1352 +++++++++++++++++++++++++++++++++++++
 25 files changed, 2290 insertions(+), 76 deletions(-)
 create mode 100644 .gitlab-ci.d/cirrus/kvm-build.yml
 create mode 100644 .gitlab-ci.d/windows.yml
 create mode 100644 tests/qtest/libqos/virtio-iommu.c
 create mode 100644 tests/qtest/libqos/virtio-iommu.h
 create mode 100644 tests/qtest/virtio-iommu-test.c
 create mode 100644 tests/qtest/virtio-net-failover.c


