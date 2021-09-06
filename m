Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9AF401A9C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 13:32:10 +0200 (CEST)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNCrA-0005YW-Jk
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 07:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNCp8-0004Wi-VC
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 07:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNCp5-00047T-RD
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 07:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630927797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oRjS9Wsdfw6FjTo0UlU1+G2zAUpjNT0aIt2fIx7cloE=;
 b=fOO+rfKyo4Hg9yGc9L/KNSCQw8bIOZs9Mi+C/tzEcOvxClIQ8y1o9ObsRqhRFT3OTNFObe
 HzJJaOns/Sv/UgtkybJJTgXDUnPfTRcC+3K6lFLy2FPPRpuDnx+eLLHK9mGwlE9Oy3TqOA
 rmY7bs8kGSOqA+8BGcJFcLb39ncEj/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-eqtD-nnjPDSWP7Z7CnRZkw-1; Mon, 06 Sep 2021 07:29:53 -0400
X-MC-Unique: eqtD-nnjPDSWP7Z7CnRZkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F41080196C;
 Mon,  6 Sep 2021 11:29:52 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3D6B5C23A;
 Mon,  6 Sep 2021 11:29:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 00/10] Testing, build system and misc patches
Date: Mon,  6 Sep 2021 13:29:44 +0200
Message-Id: <20210906112945.88042-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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

 Hi Peter!

The following changes since commit 31ebff513fad11f315377f6b07447169be8d9f86:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-03' into staging (2021-09-04 19:21:19 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-09-06

for you to fetch changes up to 6695e4c0fd9ef05bf6ab8e3402d5bc95b39c4cf3:

  softmmu/vl: Deprecate the -sdl and -curses option (2021-09-06 10:00:14 +0200)

v2:
 - Dropped patches that were already merged through Alex' pull request
 - Fixed the GBM patch to not cause a warning with --static use builds anymore

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

Thomas Huth (8):
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

 .gitlab-ci.d/buildtest.yml         |   1 -
 configure                          |  14 -----
 contrib/vhost-user-gpu/meson.build |   5 +-
 docs/about/deprecated.rst          |  20 ++++++
 docs/devel/ci-definitions.rst      | 121 +++++++++++++++++++++++++++++++++++++
 docs/devel/ci.rst                  |   1 +
 meson.build                        |  17 ++++--
 qemu-options.hx                    |  18 ++++--
 scripts/show-fixed-bugs.sh         |  91 ----------------------------
 softmmu/vl.c                       |  24 +++++++-
 tests/qtest/libqtest.c             |   4 +-
 11 files changed, 192 insertions(+), 124 deletions(-)
 create mode 100644 docs/devel/ci-definitions.rst
 delete mode 100755 scripts/show-fixed-bugs.sh


