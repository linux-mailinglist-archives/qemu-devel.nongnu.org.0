Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296242908F6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 17:55:53 +0200 (CEST)
Received: from localhost ([::1]:55538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTS59-0007GG-CH
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 11:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTS32-0005tQ-TU
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 11:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTS30-0004id-8X
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 11:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602863616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F0snC4GMXXIY+B6h8pg1DVXpAiiaRqIGQn7UHubmmzQ=;
 b=iV+Td1ds7H1J5I3vULk8R5fzDe07uKDv35OF7mIqzhNp52NKz42WAqc56O5NV5U6YTBHlD
 STgBSDccL2hhpSEl9DCKiW4NZvzKE6IQEn3mqCQG5MXAXNdyE2C2hfu4/XBc1T+t4fVXqM
 //Acbgox8p10FwCYqoGcxfDHucct4F0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-b3gPz4MePROSdFPobni58A-1; Fri, 16 Oct 2020 11:53:33 -0400
X-MC-Unique: b3gPz4MePROSdFPobni58A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A78884BA66
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 15:53:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16A4155775
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 15:53:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/22] Build system + misc changes for 2020-10-16
Date: Fri, 16 Oct 2020 11:53:30 -0400
Message-Id: <20201016155331.1613089-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:29:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 3e40748834923798aa57e3751db13a069e2c617b:

  Merge remote-tracking branch 'remotes/rth/tags/pull-mb-20201014' into staging (2020-10-15 20:30:24 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 61f6bb4b9b3b33d0371e5f76d756838df372f2ec:

  ci: include configure and meson logs in all jobs if configure fails (2020-10-16 10:01:43 -0400)

----------------------------------------------------------------
* Drop ninjatool and just require ninja (Paolo)
* Fix docs build under msys2 (Yonggang)
* HAX snafu fix (Claudio)
* Disable signal handlers during fuzzing (Alex)
* Miscellaneous fixes (Bruce, Greg)

----------------------------------------------------------------
Alexander Bulekov (1):
      fuzz: Disable QEMU's SIG{INT,HUP,TERM} handlers

Bruce Rogers (3):
      meson.build: don't condition iconv detection on library detection
      configure: fix handling of --docdir parameter
      meson: Only install icons and qemu.desktop if have_system

Claudio Fontana (1):
      hax: unbreak accelerator cpu code after cpus.c split

Greg Kurz (1):
      Makefile: Ensure cscope.out/tags/TAGS are generated in the source tree

Paolo Bonzini (13):
      submodules: bump meson to 0.55.3
      tests/Makefile.include: unbreak non-tcg builds
      make: run shell with pipefail
      tests: add missing generated sources to testqapi
      configure: move QEMU_INCLUDES to meson
      dockerfiles: enable Centos 8 PowerTools
      add ninja to dockerfiles, CI configurations and test VMs
      build: cleanups to Makefile
      build: replace ninjatool with ninja
      build: add --enable/--disable-libudev
      meson: cleanup curses/iconv test
      meson: move SPHINX_ARGS references within "if build_docs"
      ci: include configure and meson logs in all jobs if configure fails

Yonggang Luo (3):
      docs: Fix Sphinx configuration for msys2/mingw
      meson: Move the detection logic for sphinx to meson
      cirrus: Enable doc build on msys2/mingw

 .cirrus.yml                                |   21 +-
 .gitlab-ci.yml                             |    6 +-
 .travis.yml                                |   21 +-
 Makefile                                   |  134 ++--
 configure                                  |   99 +--
 docs/conf.py                               |    2 +-
 docs/devel/build-system.rst                |    6 +-
 docs/meson.build                           |   46 ++
 docs/sphinx/kerneldoc.py                   |    2 +-
 meson                                      |    2 +-
 meson.build                                |  185 ++---
 meson_options.txt                          |    6 +
 scripts/mtest2make.py                      |    3 +-
 scripts/ninjatool.py                       | 1008 ----------------------------
 target/i386/hax-cpus.c                     |    1 +
 tests/Makefile.include                     |    2 +-
 tests/docker/dockerfiles/centos7.docker    |    1 +
 tests/docker/dockerfiles/centos8.docker    |    5 +-
 tests/docker/dockerfiles/debian10.docker   |    1 +
 tests/docker/dockerfiles/fedora.docker     |    1 +
 tests/docker/dockerfiles/travis.docker     |    2 +-
 tests/docker/dockerfiles/ubuntu.docker     |    1 +
 tests/docker/dockerfiles/ubuntu1804.docker |    1 +
 tests/docker/dockerfiles/ubuntu2004.docker |    1 +
 tests/include/meson.build                  |    8 +-
 tests/meson.build                          |   14 +-
 tests/qapi-schema/meson.build              |   88 +--
 tests/qtest/fuzz/fuzz.c                    |    8 +
 tests/vm/centos                            |    2 +-
 tests/vm/centos.aarch64                    |    2 +-
 tests/vm/fedora                            |    2 +-
 tests/vm/freebsd                           |    1 +
 tests/vm/netbsd                            |    1 +
 tests/vm/openbsd                           |    1 +
 tests/vm/ubuntu.aarch64                    |    2 +-
 tests/vm/ubuntu.i386                       |    2 +-
 ui/meson.build                             |    7 +-
 37 files changed, 387 insertions(+), 1308 deletions(-)
 delete mode 100755 scripts/ninjatool.py
-- 
2.26.2


