Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB183566835
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:40:41 +0200 (CEST)
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fyz-0000PM-0v
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwp-00069i-G2
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwk-0005xh-0S
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tbd9Hw46TcwLibLNYP3UEZz30PWNFrgNGLoqt9lqOuU=;
 b=T+u3GVYov3hjxmeyZABX0TI0UB/tB4sP9LfcGWI3+qGwYJXbuJojz61nIqWM+A+JJ6reoc
 hUOeNachL8mtqemfW1GrSKxkDm/cSiJnaqIKuLneRcISjDsILTnzpm8hqqb+kDuRusdBYZ
 wu2uyyjOUKCapQ1NS51DYR3EXWJDXhQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-NmGx7WJeO8artM1eB0LrYQ-1; Tue, 05 Jul 2022 06:38:19 -0400
X-MC-Unique: NmGx7WJeO8artM1eB0LrYQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 665C882A684;
 Tue,  5 Jul 2022 10:38:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45711492CA3;
 Tue,  5 Jul 2022 10:38:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 00/14] Testing and misc patches
Date: Tue,  5 Jul 2022 12:38:02 +0200
Message-Id: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

 Hi Richard!

The following changes since commit dfe2382f0641f537fdd33399d579215077c8f68c:

  Merge tag 'kraxel-20220704-pull-request' of https://gitlab.com/kraxel/qemu into staging (2022-07-04 14:57:21 +0530)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-07-05

for you to fetch changes up to 7a890b756620223f35f8056baddf0406526ae025:

  include/qemu/host-utils: Remove unused code in the *_overflow wrappers (2022-07-05 10:15:49 +0200)

----------------------------------------------------------------
* Fix memory leak in test-cutils
* Fix edk2/opensbi jobs to not run automatically by accident
* Improve timings in the migration qtest
* Remove libvixl disassembler
* Add ukrainian translation
* Require a recent version of libpng

----------------------------------------------------------------

Andrij Mizyk (1):
  po: add ukrainian translation

Daniel P. Berrangé (7):
  gitlab: normalize indentation in edk2/opensbi rules
  gitlab: tweak comments in edk2/opensbi jobs
  gitlab: honour QEMU_CI variable in edk2/opensbi jobs
  tests: wait max 120 seconds for migration test status changes
  tests: wait for migration completion before looking for STOP event
  tests: increase migration test converge downtime to 30 seconds
  tests: use consistent bandwidth/downtime limits in migration tests

Marc-André Lureau (1):
  tests: fix test-cutils leaks

Philippe Mathieu-Daudé (1):
  tests/fp: Do not build softfloat3 tests if TCG is disabled

Richard Henderson (1):
  gitlab-ci: Extend timeout for ubuntu-20.04-s390x-all to 75m

Thomas Huth (3):
  disas: Remove libvixl disassembler
  meson.build: Require a recent version of libpng
  include/qemu/host-utils: Remove unused code in the *_overflow wrappers

 meson.build                                   |    6 +-
 disas/libvixl/vixl/a64/assembler-a64.h        | 4624 -----------------
 disas/libvixl/vixl/a64/constants-a64.h        | 2116 --------
 disas/libvixl/vixl/a64/cpu-a64.h              |   83 -
 disas/libvixl/vixl/a64/decoder-a64.h          |  275 -
 disas/libvixl/vixl/a64/disasm-a64.h           |  177 -
 disas/libvixl/vixl/a64/instructions-a64.h     |  757 ---
 disas/libvixl/vixl/code-buffer.h              |  113 -
 disas/libvixl/vixl/compiler-intrinsics.h      |  155 -
 disas/libvixl/vixl/globals.h                  |  155 -
 disas/libvixl/vixl/invalset.h                 |  775 ---
 disas/libvixl/vixl/platform.h                 |   39 -
 disas/libvixl/vixl/utils.h                    |  286 -
 include/exec/poison.h                         |    2 -
 include/qemu/host-utils.h                     |   65 -
 disas.c                                       |    3 -
 target/arm/cpu.c                              |    7 -
 tests/qtest/migration-helpers.c               |   14 +
 tests/qtest/migration-test.c                  |   59 +-
 tests/unit/test-cutils.c                      |   42 +-
 .../custom-runners/ubuntu-20.04-s390x.yml     |    1 +
 .gitlab-ci.d/edk2.yml                         |  133 +-
 .gitlab-ci.d/opensbi.yml                      |  134 +-
 MAINTAINERS                                   |    4 -
 disas/arm-a64.cc                              |  101 -
 disas/libvixl/LICENCE                         |   30 -
 disas/libvixl/README                          |   11 -
 disas/libvixl/meson.build                     |    7 -
 disas/libvixl/vixl/a64/decoder-a64.cc         |  877 ----
 disas/libvixl/vixl/a64/disasm-a64.cc          | 3495 -------------
 disas/libvixl/vixl/a64/instructions-a64.cc    |  622 ---
 disas/libvixl/vixl/compiler-intrinsics.cc     |  144 -
 disas/libvixl/vixl/utils.cc                   |  142 -
 disas/meson.build                             |    5 -
 po/LINGUAS                                    |    1 +
 po/uk.po                                      |   75 +
 scripts/clean-header-guards.pl                |    4 +-
 scripts/clean-includes                        |    2 +-
 scripts/coverity-scan/COMPONENTS.md           |    3 -
 tests/fp/meson.build                          |    3 +
 40 files changed, 314 insertions(+), 15233 deletions(-)
 delete mode 100644 disas/libvixl/vixl/a64/assembler-a64.h
 delete mode 100644 disas/libvixl/vixl/a64/constants-a64.h
 delete mode 100644 disas/libvixl/vixl/a64/cpu-a64.h
 delete mode 100644 disas/libvixl/vixl/a64/decoder-a64.h
 delete mode 100644 disas/libvixl/vixl/a64/disasm-a64.h
 delete mode 100644 disas/libvixl/vixl/a64/instructions-a64.h
 delete mode 100644 disas/libvixl/vixl/code-buffer.h
 delete mode 100644 disas/libvixl/vixl/compiler-intrinsics.h
 delete mode 100644 disas/libvixl/vixl/globals.h
 delete mode 100644 disas/libvixl/vixl/invalset.h
 delete mode 100644 disas/libvixl/vixl/platform.h
 delete mode 100644 disas/libvixl/vixl/utils.h
 delete mode 100644 disas/arm-a64.cc
 delete mode 100644 disas/libvixl/LICENCE
 delete mode 100644 disas/libvixl/README
 delete mode 100644 disas/libvixl/meson.build
 delete mode 100644 disas/libvixl/vixl/a64/decoder-a64.cc
 delete mode 100644 disas/libvixl/vixl/a64/disasm-a64.cc
 delete mode 100644 disas/libvixl/vixl/a64/instructions-a64.cc
 delete mode 100644 disas/libvixl/vixl/compiler-intrinsics.cc
 delete mode 100644 disas/libvixl/vixl/utils.cc
 create mode 100644 po/uk.po

-- 
2.31.1


