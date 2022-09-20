Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F4D5BEE44
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:12:04 +0200 (CEST)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajb9-000436-2t
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHS-0007TF-BP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHL-0001He-Lb
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663688118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I9ZBd3ujkUZc/9CVtPDn/7G1J+STaucyW8HnmJKn08A=;
 b=eB4uXfv8X+ODh9iQvDCqEclda83bh5wpYGP9lV6kJnOgyfQS54cD27TYLFJabWwPYXuZOl
 QmO6P6IkJclo4TbguwgHYA5CbmzSN5HHY1rAyjgAKz4BhOXyzLLmyKiVziha7LWqTZvA0C
 OcstkVFRirw2tbumFtcczMMNvlJtfdQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-hKObyAjnPXKxIQlTQ5nelA-1; Tue, 20 Sep 2022 11:35:16 -0400
X-MC-Unique: hKObyAjnPXKxIQlTQ5nelA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11CCD87A381
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:35:16 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 327FB492B04;
 Tue, 20 Sep 2022 15:35:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 00/15] Testing, qga and misc patches
Date: Tue, 20 Sep 2022 17:34:57 +0200
Message-Id: <20220920153512.187283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit d29201ff34a135cdfc197f4413c1c5047e4f58bb:

  Merge tag 'pull-hmp-20220915a' of https://gitlab.com/dagrh/qemu into staging (2022-09-17 10:31:11 -0400)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-09-20

for you to fetch changes up to 0e4ef702e82baf1797ea02e40f39acabe46923aa:

  qga: Replace 'blacklist' and 'whitelist' in the guest agent sources (2022-09-20 12:37:00 +0200)

----------------------------------------------------------------
* Skip tests if the corresponding feature is missing
* Update NetBSD VM test to version 9.3
* Update the FreeBSD CI to version 13.1
* Some small fixes for the qtests
* Update wordings in the QEMU guest-agent

----------------------------------------------------------------
Bin Meng (1):
      .gitlab-ci.d/windows.yml: Drop the sed processing in the 64-bit build

Brad Smith (1):
      tests/vm: update NetBSD to 9.3

Juan Quintela (7):
      tests: Fix error strings
      meson-build: Enable CONFIG_REPLICATION only when replication is set
      bios-tables-test: Make oem-fields tests be consistent
      bios-tables-test: Sort all x86_64 tests by machine type
      bios-tables-test: Only run test for machine types compiled in
      tests: Only run intel-hda-tests if machine type is compiled in
      tests: sb16 has both pc and q35 tests

Marc-André Lureau (1):
      tests: mark io-command test as skipped if socat is missing

Mauro Matteo Cascella (1):
      qtest/fuzz-lsi53c895a-test: set guest RAM to 2G

Patrick Venture (1):
      tests/qtest: npcm7xx-emc-test: Skip checking MAC

Thomas Huth (3):
      gitlab-ci: Update the FreeBSD 13 job from 13.0 to 13.1
      qga: Replace 'blacklist' command line and config file options by 'block-rpcs'
      qga: Replace 'blacklist' and 'whitelist' in the guest agent sources

 docs/about/deprecated.rst            |  19 +++++
 docs/interop/qemu-ga.rst             |   8 +-
 meson.build                          |   2 +-
 qga/qapi-schema.json                 |   4 +-
 qga/guest-agent-core.h               |   2 +-
 qga/commands-posix.c                 |  16 ++--
 qga/commands-win32.c                 |  10 +--
 qga/main.c                           |  77 +++++++++--------
 tests/qtest/bios-tables-test.c       | 155 +++++++++++++++++++----------------
 tests/qtest/e1000-test.c             |   2 +-
 tests/qtest/es1370-test.c            |   2 +-
 tests/qtest/fuzz-lsi53c895a-test.c   |   2 +-
 tests/qtest/fuzz-sb16-test.c         |  10 ++-
 tests/qtest/intel-hda-test.c         |  13 +--
 tests/qtest/npcm7xx_emc-test.c       |   3 +-
 tests/unit/test-io-channel-command.c |   3 +-
 tests/unit/test-qga.c                |   2 +-
 .gitlab-ci.d/cirrus.yml              |   2 +-
 .gitlab-ci.d/windows.yml             |   1 -
 tests/data/test-qga-config           |   2 +-
 tests/vm/netbsd                      |   4 +-
 21 files changed, 196 insertions(+), 143 deletions(-)


