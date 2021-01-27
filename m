Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AA6305782
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 10:56:52 +0100 (CET)
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hZC-0000Xv-E0
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 04:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4hXN-0007Te-I9
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:54:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4hXK-00005G-Fk
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611741292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t8ss1172/SjPtW8BxHVibtivgxKDWJBhhkufLcBclAY=;
 b=H08TWjlFBzBFlkcUQxtl1XI+aGo9nqurg4wiMN7s1qI12vw5Ied1IhTl5vO1pKmL427u7d
 rezpZxnqypdI4/lF45vfj4X5wPCtpkXmK0ioS/t6lkoPcOXC9J6WP9LbrcydsUauVvnTZa
 miJeKXcCxIJ1UvXcD1vf3bZp6s/ghJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-pJ5vxkJUMZKE_nmwYRdG9A-1; Wed, 27 Jan 2021 04:54:49 -0500
X-MC-Unique: pJ5vxkJUMZKE_nmwYRdG9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31A47CE647;
 Wed, 27 Jan 2021 09:54:48 +0000 (UTC)
Received: from thuth.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4232F5D9C6;
 Wed, 27 Jan 2021 09:54:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/9] Gitlab-CI and testing improvements
Date: Wed, 27 Jan 2021 10:54:35 +0100
Message-Id: <20210127095444.114495-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter,

the following changes since commit 9cd69f1a270235b652766f00b94114f48a2d603f:

  Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-25-1' into staging (2021-01-26 09:51:02 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-27

for you to fetch changes up to f8a9b4c66569cbc1640722369a91c635102b5264:

  libqtest: Rework qtest_rsp() (2021-01-27 07:18:13 +0100)

----------------------------------------------------------------
* Patches to speed up and improve the gitlab-CI
* Documentation for the decorators in the "acceptance" tests
* One small rework of a libqtest function
----------------------------------------------------------------

Markus Armbruster (1):
      libqtest: Rework qtest_rsp()

Philippe Mathieu-Daudé (4):
      tests/docker: Install static libc package in CentOS 7
      gitlab-ci: Test building linux-user targets on CentOS 7
      configure: Only check for audio drivers if system-mode is selected
      meson: Do not build optional libraries by default

Thomas Huth (3):
      gitlab-ci.yml: Avoid some submodules to speed up the CI a little bit
      gitlab-ci.yml: Exclude some redundant targets in build-without-default-features
      gitlab-ci.yml: Avoid recompiling the sources in the test jobs

Wainer dos Santos Moschetta (1):
      docs/devel: Explain how acceptance tests can be skipped

 .gitlab-ci.yml                               | 19 ++++++++-
 configure                                    |  6 +++
 docs/devel/testing.rst                       | 62 ++++++++++++++++++++++++++++
 meson.build                                  |  3 ++
 tests/docker/dockerfiles/centos7.docker      |  1 +
 tests/docker/dockerfiles/centos8.docker      |  1 +
 tests/docker/dockerfiles/debian-amd64.docker |  1 +
 tests/docker/dockerfiles/fedora.docker       |  3 ++
 tests/docker/dockerfiles/ubuntu2004.docker   |  1 +
 tests/qtest/libqtest.c                       | 50 +++++++++++-----------
 10 files changed, 121 insertions(+), 26 deletions(-)


