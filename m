Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059B459FE0E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:14:57 +0200 (CEST)
Received: from localhost ([::1]:50880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQs5n-0005u2-Qx
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQs2Z-0000Ok-Fz
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:11:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQs2W-0003mi-Qp
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661353891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FjPIFbf2dZLC+VVqEtl6A391OP/vfiuywsq3NloXBCM=;
 b=jKLY3AYW/MECI2iVNV67k7KVVoUx1bUAwsFojSmJi6K8LKd8x1xFMS8N4hK8PFxReIeFai
 6D8PMDGD4fpcSJMq6c013axx+9EfSI8x2ybCHn+Mw4mGcoc3y47zd07YP+F9l54Mbirlxn
 X6SRGjN0lveGg6whrPoDnbVZZJOXlBk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-MmkpDHOJPbWXMs8tGrX7ng-1; Wed, 24 Aug 2022 11:11:30 -0400
X-MC-Unique: MmkpDHOJPbWXMs8tGrX7ng-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71683811E87;
 Wed, 24 Aug 2022 15:11:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB98A492C3B;
 Wed, 24 Aug 2022 15:11:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v2 for-7.2 0/6] Drop libslirp submodule
Date: Wed, 24 Aug 2022 17:11:16 +0200
Message-Id: <20220824151122.704946-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

At the point in time we're going to release QEMU 7.2, all supported
host OS distributions will have a libslirp package available, so
there is no need anymore for us to ship the slirp submodule. Thus
let's clean up the related tests and finally remove the submodule now.

v2:
- Added patches to clean up and adapt the tests
- Rebased the removal patch to the latest version of the master branch

Thomas Huth (6):
  tests/docker: Update the debian-all-test-cross container to Debian 11
  tests/vm: Add libslirp to the VM tests
  tests/lcitool/libvirt-ci: Update the lcitool module to the latest
    version
  tests: Refresh dockerfiles and FreeBSD vars with lcitool
  tests/avocado: Do not run tests that require libslirp if it is not
    available
  Remove the slirp submodule (i.e. compile only with an external
    libslirp)

 configure                                     |  24 ----
 meson.build                                   | 121 ++++--------------
 .gitlab-ci.d/buildtest.yml                    |  20 ++-
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/container-cross.yml              |   1 -
 .gitmodules                                   |   3 -
 MAINTAINERS                                   |   1 -
 meson_options.txt                             |   5 +-
 scripts/archive-source.sh                     |   2 +-
 scripts/meson-buildoptions.sh                 |   4 +-
 slirp                                         |   1 -
 tests/avocado/avocado_qemu/__init__.py        |   7 +
 tests/avocado/info_usernet.py                 |   1 +
 tests/avocado/replay_linux.py                 |   1 +
 tests/docker/Makefile.include                 |   1 -
 .../dockerfiles/debian-all-test-cross.docker  |   9 +-
 tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/vm/freebsd                              |   3 +
 tests/vm/haiku.x86_64                         |   3 +-
 tests/vm/netbsd                               |   3 +
 23 files changed, 64 insertions(+), 156 deletions(-)
 delete mode 160000 slirp

-- 
2.31.1


