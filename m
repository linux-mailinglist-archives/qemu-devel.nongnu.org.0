Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AEA3EC0D5
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:12:44 +0200 (CEST)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEmuQ-00016J-WA
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms4-0006mZ-DS
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms0-0004Fd-Ea
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628921409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=osDdLWSAW9KYdLD5nzmSC/NpY84Q1QJCLsYE9yTB0+4=;
 b=B2ZSkFq9dN+kDqmuCFDXW9HqE2nJjRWgrCesfg8gYcJQLgcS62+Ol1K1D2YFS7IlIkafc0
 1a588Hhs42TCvzM+8CzmGl41inu2TJRCHdRfZ9IGpFXXURtoymT1iw0WhN9j11jP5bjwK5
 uj6WOZRR5vDrfxvXy1qr1ADTHkKvMi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-5sVkaG9bNpOjuJcX-dXbng-1; Sat, 14 Aug 2021 02:10:07 -0400
X-MC-Unique: 5sVkaG9bNpOjuJcX-dXbng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8152987D542;
 Sat, 14 Aug 2021 06:10:06 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A46C65D9D5;
 Sat, 14 Aug 2021 06:10:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 00/11] Optional gitlab-CI and doc fixes for -rc4
Date: Sat, 14 Aug 2021 08:09:45 +0200
Message-Id: <20210814060956.12852-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter,

in case we're going to have an -rc4, here's a pull request that contains
the fixes for getting the gitlab-CI green again. I also added some doc
updates since they should be completely riskless. But if we won't have an
rc4 due to other reasons, this pull request here certainly also does not
justify another RC, so please ignore this PR in that case.

The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:

  Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-08-11

for you to fetch changes up to 36b508993c4dcc6b3ef4b5c00e293ee9560926ee:

  docs/about/removed-features: Document removed machines from older QEMU versions (2021-08-11 15:39:09 +0200)

CI run can be seen here:

 https://gitlab.com/thuth/qemu/-/pipelines/351602605

----------------------------------------------------------------
* Fixes for the gitlab-CI (fix the hanging  build-oss-fuzz pipeline)
* Add documentation about features that have been removed in older versions

----------------------------------------------------------------
Alexander Bulekov (1):
      fuzz: avoid building twice, when running on gitlab

Daniel P. Berrangé (2):
      gitlab: exclude sparc-softmmu and riscv32-softmmu from cross builds
      gitlab: skip many more targets in windows cross builds

Thomas Huth (8):
      storage-daemon: Add missing build dependency to the vhost-user-blk-test
      tests/qtest/vhost-user-blk-test: Check whether qemu-storage-daemon is available
      docs/about/removed-features: Document removed CLI options from QEMU v2.12
      docs/about/removed-features: Document removed CLI options from QEMU v3.0
      docs/about/removed-features: Document removed CLI options from QEMU v3.1
      docs/about/removed-features: Document removed HMP commands from QEMU v2.12
      docs/about/removed-features: Document removed devices from older QEMU versions
      docs/about/removed-features: Document removed machines from older QEMU versions

 .gitlab-ci.d/crossbuild-template.yml |   3 +-
 .gitlab-ci.d/crossbuilds.yml         |   4 +
 docs/about/removed-features.rst      | 183 ++++++++++++++++++++++++++++++++++-
 scripts/oss-fuzz/build.sh            |  24 ++---
 storage-daemon/meson.build           |   8 +-
 tests/qtest/meson.build              |   7 +-
 tests/qtest/vhost-user-blk-test.c    |   8 ++
 7 files changed, 215 insertions(+), 22 deletions(-)


