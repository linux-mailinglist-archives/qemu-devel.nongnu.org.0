Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781EA52B5B8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:25:06 +0200 (CEST)
Received: from localhost ([::1]:59476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFvV-0000c6-Id
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbz-0008FW-21
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbu-0004My-3T
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c5kJxIKt6DmlrSbVAJcbplWHcf/z61yUCxnWrDMups0=;
 b=E0pUYQobOt8GmzpZgzynFLg7Nz0S/8Ay7CMAyQuMGNcB/MNLCs039H4ibm36EUcLhc2KlZ
 8MML/ZcRdlrlAu5Rw4+I7rg+VrzIPe6cDaz57w3rGiVZ+ayEgArzVO3f7SPu0fUyIfWvPk
 k5PZPenyO++Mu3PxlTiTH/brI5P9VAM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-tilSGkq_OhWa3P6uQ9vf9Q-1; Wed, 18 May 2022 05:04:42 -0400
X-MC-Unique: tilSGkq_OhWa3P6uQ9vf9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC75F811E75;
 Wed, 18 May 2022 09:04:40 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 538C51410F37;
 Wed, 18 May 2022 09:04:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 0/8] Misc patches (Gitlab-CI, qtest, Capstone, ...)
Date: Wed, 18 May 2022 11:04:30 +0200
Message-Id: <20220518090438.158475-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

 Hi Richard!

The following changes since commit eec398119fc6911d99412c37af06a6bc27871f85:

  Merge tag 'for_upstream' of git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-05-16 16:31:01 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-18

for you to fetch changes up to 83602083b4ada6ceb86bfb327e83556ebab120fc:

  capstone: Remove the capstone submodule (2022-05-18 08:54:22 +0200)

----------------------------------------------------------------
* Remove Ubuntu 18.04 containers (not supported anymore)
* Improve the cleanup of the QEMU binary in case of failing qtests
* Update the Windows support statement
* Remove the capstone submodule (and rely on Capstone of the distros instead)

----------------------------------------------------------------
Daniel P. Berrangé (2):
      tests/qtest: fix registration of ABRT handler for QEMU cleanup
      tests/qtest: use prctl(PR_SET_PDEATHSIG) as fallback to kill QEMU

Thomas Huth (6):
      gitlab-ci: Switch the container of the 'check-patch' & 'check-dco' jobs
      Remove Ubuntu 18.04 container support from the repository
      docs/about: Update the support statement for Windows
      tests/vm: Add capstone to the NetBSD and OpenBSD VMs
      capstone: Allow version 3.0.5 again
      capstone: Remove the capstone submodule

 docs/about/build-platforms.rst                     |  14 +-
 configure                                          |  23 +---
 meson.build                                        | 115 +---------------
 include/qemu/osdep.h                               |   2 +-
 tests/qtest/libqtest.c                             |  21 ++-
 .gitlab-ci.d/buildtest.yml                         |   3 +-
 .gitlab-ci.d/containers.yml                        |   5 -
 .../custom-runners/ubuntu-20.04-aarch32.yml        |   2 +-
 .../custom-runners/ubuntu-20.04-aarch64.yml        |   2 +-
 .gitlab-ci.d/static_checks.yml                     |  14 +-
 .gitlab-ci.d/windows.yml                           |   5 +-
 .gitmodules                                        |   3 -
 capstone                                           |   1 -
 meson_options.txt                                  |   3 +-
 scripts/ci/setup/build-environment.yml             |  14 +-
 scripts/meson-buildoptions.sh                      |   5 +-
 tests/docker/dockerfiles/ubuntu1804.docker         | 144 ---------------------
 tests/lcitool/refresh                              |   7 -
 tests/vm/netbsd                                    |   3 +-
 tests/vm/openbsd                                   |   3 +-
 20 files changed, 59 insertions(+), 330 deletions(-)
 delete mode 160000 capstone
 delete mode 100644 tests/docker/dockerfiles/ubuntu1804.docker


