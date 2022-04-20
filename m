Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECE3508633
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:43:22 +0200 (CEST)
Received: from localhost ([::1]:43830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7nt-0001vN-CD
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eD-0001Mv-UY
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eB-0006pd-7T
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650450798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wRdj20Bc13WK3BD5iV+hv9YBdZjZXR5fbCs9fS/eDPg=;
 b=D4ZS6FMhjwltoefFmrfth0YYDenmNbOt4+BPdYgfLSaAs7+1RGiY3f/Ju9k+Hm7r1gBZ7t
 RtMVu8fPRdrSeVBuFshzcuCpWpii4rGJQddgW+0MKbOdBknps3QZD3lzjopL2wB1vqfJ57
 Zz9m2X3wkC5jzlJ6dgMbMyKLWyKidWA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-ddOuvKRtOf65wjlz_inOBA-1; Wed, 20 Apr 2022 06:33:15 -0400
X-MC-Unique: ddOuvKRtOf65wjlz_inOBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0C3518A6583;
 Wed, 20 Apr 2022 10:33:14 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78118C44AE3;
 Wed, 20 Apr 2022 10:33:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/7] Misc patches
Date: Wed, 20 Apr 2022 12:33:02 +0200
Message-Id: <20220420103309.264479-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 1be5a765c08cee3a9587c8a8d3fc2ea247b13f9c:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-04-19 18:22:16 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-04-20

for you to fetch changes up to 41663beda53c517fd442648e4b62c9dada8bff9b:

  tests/avocado: Allow overwrite smp and memory size command line options (2022-04-20 09:44:29 +0200)

----------------------------------------------------------------
* Drop perl-Test-Harness from the CI containers / VMs
* Some qtest fixes
* Convert ccid doc to restructuredText
* Add compat machines for 7.1
* Allow overwrite smp and memory size in avocado tests

----------------------------------------------------------------
Ahmed Abouzied (1):
      tests/avocado: Allow overwrite smp and memory size command line options

Alex Bennée (1):
      tests/qtest: properly initialise the vring used idx

Cornelia Huck (1):
      hw: Add compat machines for 7.1

Lucas Ramage (1):
      docs/ccid: convert to restructuredText

Thomas Huth (3):
      tests: Drop perl-Test-Harness from the CI containers / VMs
      tests/qtest: Enable more tests for the "mipsel" target
      tests/qtest: Move the fuzz tests to x86 only

 docs/ccid.txt                                      | 182 ---------------------
 docs/system/device-emulation.rst                   |   1 +
 docs/system/devices/ccid.rst                       | 171 +++++++++++++++++++
 include/hw/boards.h                                |   3 +
 include/hw/i386/pc.h                               |   3 +
 hw/arm/virt.c                                      |   9 +-
 hw/core/machine.c                                  |   3 +
 hw/i386/pc.c                                       |   3 +
 hw/i386/pc_piix.c                                  |  14 +-
 hw/i386/pc_q35.c                                   |  13 +-
 hw/m68k/virt.c                                     |   9 +-
 hw/ppc/spapr.c                                     |  15 +-
 hw/s390x/s390-virtio-ccw.c                         |  14 +-
 tests/qtest/endianness-test.c                      |   1 +
 tests/qtest/fuzz-lsi53c895a-test.c                 |   8 +-
 tests/qtest/fuzz-megasas-test.c                    |  12 +-
 tests/qtest/fuzz-sb16-test.c                       |  12 +-
 tests/qtest/fuzz-sdcard-test.c                     |  12 +-
 tests/qtest/fuzz-virtio-scsi-test.c                |   8 +-
 tests/qtest/libqos/virtio.c                        |   2 +
 .gitlab-ci.d/cirrus/freebsd-12.vars                |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                |   2 +-
 .gitlab-ci.d/cirrus/macos-11.vars                  |   4 +-
 tests/avocado/avocado_qemu/__init__.py             |   6 +-
 tests/docker/dockerfiles/alpine.docker             |   1 -
 tests/docker/dockerfiles/centos8.docker            |   1 -
 tests/docker/dockerfiles/debian-arm64-cross.docker |   1 -
 tests/docker/dockerfiles/debian-s390x-cross.docker |   1 -
 .../docker/dockerfiles/debian-tricore-cross.docker |   1 -
 tests/docker/dockerfiles/fedora-i386-cross.docker  |   1 -
 tests/docker/dockerfiles/fedora-win32-cross.docker |   1 -
 tests/docker/dockerfiles/fedora-win64-cross.docker |   1 -
 tests/docker/dockerfiles/fedora.docker             |   1 -
 tests/docker/dockerfiles/opensuse-leap.docker      |   1 -
 tests/docker/dockerfiles/ubuntu1804.docker         |   1 -
 tests/docker/dockerfiles/ubuntu2004.docker         |   1 -
 tests/lcitool/projects/qemu.yml                    |   1 -
 tests/qtest/meson.build                            |  27 +--
 tests/vm/centos.aarch64                            |   3 +-
 tests/vm/fedora                                    |   2 +-
 40 files changed, 289 insertions(+), 265 deletions(-)
 delete mode 100644 docs/ccid.txt
 create mode 100644 docs/system/devices/ccid.rst


