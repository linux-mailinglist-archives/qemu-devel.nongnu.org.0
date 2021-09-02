Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263A33FEE71
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:12:13 +0200 (CEST)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmVn-0008Lu-Ro
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9u-00057u-HA
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9o-00072Z-50
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630586967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5lgUxtmvUXqVr+vIG+ybpu64Kte9CBlUAZg/r/dByTw=;
 b=N80mo7aWhquZSThrVQYoiphC2bYy5v50Ug+LP3wgK3o0iB118KQlwIZf544kMNNv/qFViE
 jR40KAWTwTWKrG2bFWl5vVzjwaiIDNqtntJqHMG746zslnIjwDLGh2gxrh5czsrENsIPr5
 INeE/GGxWzwkDEHZ5Gb1kyR7oRG78C0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-Vk84-vvXPgaURp8H6Jz6Jw-1; Thu, 02 Sep 2021 08:49:20 -0400
X-MC-Unique: Vk84-vvXPgaURp8H6Jz6Jw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7602B835DE2;
 Thu,  2 Sep 2021 12:49:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 864A510016F2;
 Thu,  2 Sep 2021 12:49:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/13] Testing, build system and misc patches
Date: Thu,  2 Sep 2021 14:48:58 +0200
Message-Id: <20210902124911.822423-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

the following changes since commit 59a89510b62ec23dbeab8b02fa4e3526e353d8b6:

  Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-09-01-1' into staging (2021-09-02 08:51:31 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-09-02

for you to fetch changes up to c72dc94b74fb1686decc0ca4c2b05e5bf2e5b74b:

  softmmu/vl: Deprecate the -sdl and -curses option (2021-09-02 14:43:58 +0200)

----------------------------------------------------------------
* Add definitions of terms for CI/testing
* Fix g_setenv problem discovered by Coverity
* Gitlab CI improvements
* Build system improvements (configure script + meson.build)
* Removal of the show-fixed-bugs.sh script
* Clean up of the sdl and curses options

----------------------------------------------------------------
Peter Maydell (1):
      libqtest: check for g_setenv() failure

Thomas Huth (11):
      gitlab-ci: Merge "build-disabled" with "build-without-default-features"
      gitlab-ci: Remove superfluous "dnf install" statement
      gitlab-ci: Fix ..._RUNNER_AVAILABLE variables and document them
      gitlab-ci: Don't try to use the system libfdt in the debian job
      meson.build: Fix the check for a usable libfdt
      meson.build: Don't use internal libfdt if the user requested the system libfdt
      configure / meson: Move the GBM handling to meson.build
      scripts: Remove the "show-fixed-bugs.sh" file
      softmmu/vl: Add a "grab-mod" parameter to the -display sdl option
      softmmu/vl: Deprecate the old grab options
      softmmu/vl: Deprecate the -sdl and -curses option

Willian Rampazzo (1):
      docs: add definitions of terms for CI/testing

 .gitlab-ci.d/buildtest.yml         | 100 ++++--------------------------
 .gitlab-ci.d/custom-runners.yml    |  12 ++--
 configure                          |  14 -----
 contrib/vhost-user-gpu/meson.build |   5 +-
 docs/about/deprecated.rst          |  20 ++++++
 docs/devel/ci-definitions.rst      | 121 +++++++++++++++++++++++++++++++++++++
 docs/devel/ci-jobs.rst             |  11 ++++
 docs/devel/ci.rst                  |   1 +
 meson.build                        |  17 ++++--
 qemu-options.hx                    |  18 ++++--
 scripts/show-fixed-bugs.sh         |  91 ----------------------------
 softmmu/vl.c                       |  24 +++++++-
 tests/qtest/libqtest.c             |   4 +-
 13 files changed, 222 insertions(+), 216 deletions(-)
 create mode 100644 docs/devel/ci-definitions.rst
 delete mode 100755 scripts/show-fixed-bugs.sh


