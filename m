Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A62FD3DD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:24:54 +0100 (CET)
Received: from localhost ([::1]:54986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FLp-00078u-3s
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFB-0000EX-N6
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FF8-0007fS-Sg
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=99tpW6AMUMgrMzZR6DTSH4VqbnDT6IlW+h/m5Jfpjeo=;
 b=dVrC1fCmxbxGG0lsON64Rxi/ZJNDDlP0M8d66tpJfpsNcalwvcrc9MC+yQiS8wfcy2B/HB
 +mICwH0/IknQ5whJO+npHCRvUZgSlUYfpxhSIC0C3Tf7Bi85c+f+i9zKdu2XOqQkYJYEcY
 V9QASEzrU+5CkXat2CCXDy25zrPS3UQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-jl7jBn4ZPZ-dX1Gi4GOkqA-1; Wed, 20 Jan 2021 10:17:55 -0500
X-MC-Unique: jl7jBn4ZPZ-dX1Gi4GOkqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64DA5190A7A1;
 Wed, 20 Jan 2021 15:17:54 +0000 (UTC)
Received: from thuth.com (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ABFC60C6A;
 Wed, 20 Jan 2021 15:17:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/14] gitlab-CI, qtests and misc patches
Date: Wed, 20 Jan 2021 16:17:37 +0100
Message-Id: <20210120151751.520597-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter,

the following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210119-1' into staging (2021-01-19 15:47:23 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-20

for you to fetch changes up to 4251dfb082f6b81c382e69ccd2700fcfa7d7aa82:

  MAINTAINERS: Make status spellings consistent (2021-01-20 10:46:54 +0100)

----------------------------------------------------------------
* Fixes for compiling QEMU on Alpine Linux
* Add Alpine Linux to the gitlab-CI
* Some small fixes for qtests
* Updates to the MAINTAINERS file
----------------------------------------------------------------

Gan Qixin (1):
      qtest/npcm7xx_pwm-test: Fix memleak in pwm_qom_get

Jiaxun Yang (8):
      configure: Add sys/timex.h to probe clock_adjtime
      libvhost-user: Include poll.h instead of sys/poll.h
      hw/block/nand: Rename PAGE_SIZE to NAND_PAGE_SIZE
      elf2dmp: Rename PAGE_SIZE to ELF2DMP_PAGE_SIZE
      tests: Rename PAGE_SIZE definitions
      accel/kvm: avoid using predefined PAGE_SIZE
      tests/docker: Add dockerfile for Alpine Linux
      gitlab-ci: Add alpine to pipeline

John Snow (2):
      MAINTAINERS: Remove Ben Warren
      MAINTAINERS: Make status spellings consistent

Michael Forney (1):
      osdep.h: Remove <sys/signal.h> include

Stefan Berger (1):
      tests: Fix memory leak in tpm-util.c

Thomas Huth (1):
      tests/check-block.sh: Refuse to run the iotests with BusyBox' sed

 .gitlab-ci.d/containers.yml               |  5 +++
 .gitlab-ci.yml                            | 33 +++++++++++++++
 MAINTAINERS                               | 13 +++---
 accel/kvm/kvm-all.c                       |  3 ++
 configure                                 |  1 +
 contrib/elf2dmp/addrspace.c               |  4 +-
 contrib/elf2dmp/addrspace.h               |  6 +--
 contrib/elf2dmp/main.c                    | 18 ++++----
 hw/block/nand.c                           | 40 +++++++++---------
 include/qemu/osdep.h                      |  4 --
 meson.build                               |  1 -
 subprojects/libvhost-user/libvhost-user.h |  2 +-
 tests/check-block.sh                      |  7 ++++
 tests/docker/dockerfiles/alpine.docker    | 55 ++++++++++++++++++++++++
 tests/migration/stress.c                  | 10 ++---
 tests/qtest/libqos/malloc-pc.c            |  4 +-
 tests/qtest/libqos/malloc-spapr.c         |  4 +-
 tests/qtest/m25p80-test.c                 | 54 ++++++++++++------------
 tests/qtest/npcm7xx_pwm-test.c            |  5 ++-
 tests/qtest/tpm-util.c                    |  2 +-
 tests/tcg/multiarch/system/memory.c       |  6 +--
 tests/test-xbzrle.c                       | 70 +++++++++++++++----------------
 22 files changed, 224 insertions(+), 123 deletions(-)
 create mode 100644 tests/docker/dockerfiles/alpine.docker


