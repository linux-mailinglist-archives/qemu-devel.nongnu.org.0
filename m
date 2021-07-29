Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE86A3D9F80
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:25:46 +0200 (CEST)
Received: from localhost ([::1]:36374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m91MP-0002ac-Nv
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91J8-0005Gz-3o
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91J6-0007AO-LN
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dyJy4VlhitkB1/v06r27IFxQ1cRvH9rcQNwWlqmlufo=;
 b=GPzJNiOqaW9p2C2NvkQa06tfcCqjckbSJPRhZOa5JGATcnDYbsJhKi3DeOcKNZ5+UEUtJ7
 sd0g81S+83FKFXjBSfcr2Lc32ApDhLHAr02gUU9Mhm6PvTcTFOxJOY8Wy7rcjF1azSTs63
 6W/hDw8bfXVPBsyXea4KyXSrHZ/WSDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-7l_ri1vUOku4z2uvjNniWw-1; Thu, 29 Jul 2021 04:22:18 -0400
X-MC-Unique: 7l_ri1vUOku4z2uvjNniWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 420338799EC;
 Thu, 29 Jul 2021 08:22:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D2AE5D9DC;
 Thu, 29 Jul 2021 08:22:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/9] Gitlab-CI improvements and some other fixes
Date: Thu, 29 Jul 2021 10:22:02 +0200
Message-Id: <20210729082211.532572-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

 Hi Peter!

The following changes since commit 69ea12b19a15ae006521cd5cc0f627f27f738746:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-07-27' into staging (2021-07-28 13:32:12 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-07-29

for you to fetch changes up to b8ee198d21c4bab41b8cb8d1729a956d9f648997:

  configure script fix for Haiku (2021-07-29 08:09:32 +0200)

----------------------------------------------------------------
* Document GitLab custom CI/CD variables
* Fix 'when:' condition in gitlab-CI jobs
* Disable tests in the gitlab-CI that fail due to out-of-memory conditions
* Allow pushing to "staging" again for maintainers without s390x access
* Fix migration-test build failure on SPARC
* Compile without "pie" on Haiku

----------------------------------------------------------------
Peter Xu (1):
      tests: Fix migration-test build failure for sparc

Philippe Mathieu-Daudé (4):
      docs: Document GitLab custom CI/CD variables
      gitlab-ci: Fix 'when:' condition in acceptance_test_job_template
      gitlab-ci: Fix 'when:' condition in EDK2 jobs
      gitlab-ci: Fix 'when:' condition in OpenSBI jobs

Richard Zak (1):
      configure script fix for Haiku

Thomas Huth (3):
      gitlab-ci.d/buildtest: Disable iotests 197 and 215
      gitlab-ci.d/buildtest: Mark the aarch64 and ppc64-s390x CFI jobs as manual
      gitlab-ci.d/custom-runners: Improve rules for the staging branch

 .gitlab-ci.d/buildtest-template.yml |  4 ++--
 .gitlab-ci.d/buildtest.yml          | 18 ++++++++++++++---
 .gitlab-ci.d/custom-runners.yml     | 40 ++++++++++++++++++++++++++-----------
 .gitlab-ci.d/edk2.yml               |  6 +++---
 .gitlab-ci.d/opensbi.yml            |  8 ++++----
 .gitlab-ci.yml                      | 19 ++----------------
 configure                           |  3 ++-
 docs/devel/ci.rst                   | 40 +++++++++++++++++++++++++++++++++++++
 tests/qtest/migration-test.c        |  5 +++--
 9 files changed, 99 insertions(+), 44 deletions(-)


