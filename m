Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC23417FFF
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 08:34:12 +0200 (CEST)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU1GC-0007pb-24
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 02:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU183-0007a9-H5
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 02:25:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU17t-0007A8-V6
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 02:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632551130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CScpBzbPxNXz+J5WjjW25Q+E+KWNEg/zzLUpVO8+6PI=;
 b=NmFAO6hiSmJ6oshBAqo7cBIJmmaENWLGoxrhmQx6QkPa71JpJ7brmwuPhbUxU4o4w6Po9d
 RjOf0pbn9XAhhE3svLQmzBiS82QH82bgy6yswiKqJ6Zb4tZVb1UqFieVB4kC++miWLYrnI
 dHp945h2IUXG6P+xXftssXj1dDu4Rl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-h_06YsEENbWteCoRDX-89A-1; Sat, 25 Sep 2021 02:25:28 -0400
X-MC-Unique: h_06YsEENbWteCoRDX-89A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AE2B36301;
 Sat, 25 Sep 2021 06:25:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83F5368D95;
 Sat, 25 Sep 2021 06:25:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1838A113865F; Sat, 25 Sep 2021 08:25:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/25] QAPI patches patches for 2021-09-25
Date: Sat, 25 Sep 2021 08:25:00 +0200
Message-Id: <20210925062525.988405-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 11a11998460ed84d9a127c025f50f7234e5a483f:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20210921' into staging (2021-09-24 13:21:18 -0400)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-09-25

for you to fetch changes up to 5757c0904e2e8a7f5d9ff359b30542cfcb70556b:

  tests/qapi-schema: Make test-qapi.py -u work when files are absent (2021-09-25 07:00:50 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-09-25

----------------------------------------------------------------
Markus Armbruster (25):
      qapi: Tidy up unusual line breaks
      qapi: Stop enforcing "type name should not end in 'Kind'
      qapi: Convert simple union KeyValue to flat one
      qapi: Convert simple union InputEvent to flat one
      qapi: Convert simple union TpmTypeOptions to flat one
      qapi: Convert simple union MemoryDeviceInfo to flat one
      qapi: Convert simple union ChardevBackend to flat one
      qapi: Convert simple union SocketAddressLegacy to flat one
      qapi: Convert simple union ImageInfoSpecific to flat one
      qapi: Convert simple union TransactionAction to flat one
      tests/qapi-schema: Prepare for simple union UserDefListUnion removal
      test-qobject-input-visitor: Wean off UserDefListUnion
      test-qobject-output-visitor: Wean off UserDefListUnion
      test-clone-visitor: Wean off UserDefListUnion
      tests/qapi-schema: Wean off UserDefListUnion
      tests/qapi-schema: Simple union UserDefListUnion is now unused, drop
      tests/qapi-schema: Rewrite simple union TestIfUnion to be flat
      test-clone-visitor: Wean off __org.qemu_x-Union1
      tests/qapi-schema: Drop simple union __org.qemu_x-Union1
      tests/qapi-schema: Purge simple unions from tests
      qapi: Drop simple unions
      tests/qapi-schema: Rename flat-union-* test cases to union-*
      test-clone-visitor: Correct an accidental rename
      tests/qapi-schema: Use Python OSError instead of outmoded IOError
      tests/qapi-schema: Make test-qapi.py -u work when files are absent

 docs/devel/qapi-code-gen.rst                       | 137 ++----
 qapi/block-core.json                               |  59 ++-
 qapi/char.json                                     | 187 ++++++++-
 qapi/machine.json                                  |  42 +-
 qapi/sockets.json                                  |  46 ++-
 qapi/tpm.json                                      |  24 +-
 qapi/transaction.json                              | 139 +++++--
 qapi/ui.json                                       |  72 +++-
 backends/tpm/tpm_emulator.c                        |   2 +-
 backends/tpm/tpm_passthrough.c                     |   2 +-
 chardev/char-socket.c                              |   6 +-
 chardev/char-udp.c                                 |   4 +-
 monitor/hmp-cmds.c                                 |   8 +-
 tests/unit/test-clone-visitor.c                    |  98 +++--
 tests/unit/test-qmp-cmds.c                         |  18 +-
 tests/unit/test-qobject-input-visitor.c            | 460 +++++++--------------
 tests/unit/test-qobject-output-visitor.c           | 391 +++++-------------
 tests/unit/test-yank.c                             |   6 +-
 util/qemu-sockets.c                                |   8 +-
 scripts/qapi/expr.py                               |  27 +-
 scripts/qapi/schema.py                             | 101 +----
 tests/qapi-schema/args-union.err                   |   2 +-
 tests/qapi-schema/args-union.json                  |   8 +-
 tests/qapi-schema/bad-base.err                     |   2 +-
 tests/qapi-schema/bad-base.json                    |   8 +-
 tests/qapi-schema/doc-good.json                    |  13 +-
 tests/qapi-schema/doc-good.out                     |  22 -
 tests/qapi-schema/doc-good.txt                     |  20 -
 tests/qapi-schema/enum-if-invalid.json             |   4 +-
 tests/qapi-schema/flat-union-array-branch.err      |   2 -
 tests/qapi-schema/flat-union-bad-base.err          |   2 -
 tests/qapi-schema/flat-union-bad-discriminator.err |   2 -
 tests/qapi-schema/flat-union-base-any.err          |   2 -
 tests/qapi-schema/flat-union-base-union.err        |   2 -
 tests/qapi-schema/flat-union-clash-member.err      |   2 -
 .../flat-union-discriminator-bad-name.err          |   2 -
 tests/qapi-schema/flat-union-empty.err             |   2 -
 tests/qapi-schema/flat-union-empty.json            |   4 -
 .../qapi-schema/flat-union-inline-invalid-dict.err |   2 -
 tests/qapi-schema/flat-union-int-branch.err        |   2 -
 .../qapi-schema/flat-union-invalid-branch-key.err  |   2 -
 .../flat-union-invalid-discriminator.err           |   2 -
 .../flat-union-invalid-if-discriminator.err        |   2 -
 tests/qapi-schema/flat-union-no-base.err           |   2 -
 .../flat-union-optional-discriminator.err          |   2 -
 .../flat-union-string-discriminator.err            |   2 -
 .../flat-union-string-discriminator.out            |   0
 tests/qapi-schema/meson.build                      |  35 +-
 tests/qapi-schema/qapi-schema-test.json            |  51 ++-
 tests/qapi-schema/qapi-schema-test.out             | 116 ++----
 tests/qapi-schema/reserved-member-u.json           |   2 +-
 tests/qapi-schema/reserved-type-kind.err           |   2 -
 tests/qapi-schema/reserved-type-kind.json          |   2 -
 tests/qapi-schema/reserved-type-kind.out           |   0
 tests/qapi-schema/test-qapi.py                     |  20 +-
 tests/qapi-schema/union-array-branch.err           |   2 +
 ...n-array-branch.json => union-array-branch.json} |   2 +-
 ...ion-array-branch.out => union-array-branch.out} |   0
 tests/qapi-schema/union-bad-base.err               |   2 +
 ...lat-union-bad-base.json => union-bad-base.json} |   0
 ...{flat-union-bad-base.out => union-bad-base.out} |   0
 tests/qapi-schema/union-bad-discriminator.err      |   2 +
 ...riminator.json => union-bad-discriminator.json} |   0
 ...scriminator.out => union-bad-discriminator.out} |   0
 tests/qapi-schema/union-base-any.err               |   2 +
 ...lat-union-base-any.json => union-base-any.json} |   0
 ...{flat-union-base-any.out => union-base-any.out} |   0
 tests/qapi-schema/union-base-empty.json            |   2 +-
 tests/qapi-schema/union-base-no-discriminator.err  |   2 +-
 tests/qapi-schema/union-base-no-discriminator.json |   2 +-
 tests/qapi-schema/union-base-union.err             |   2 +
 ...union-base-union.json => union-base-union.json} |   3 +
 ...t-union-base-union.out => union-base-union.out} |   0
 tests/qapi-schema/union-branch-case.err            |   2 -
 tests/qapi-schema/union-branch-case.json           |   2 -
 tests/qapi-schema/union-branch-case.out            |   0
 tests/qapi-schema/union-branch-invalid-dict.err    |   2 +-
 tests/qapi-schema/union-branch-invalid-dict.json   |   4 +
 tests/qapi-schema/union-clash-branches.err         |   2 -
 tests/qapi-schema/union-clash-branches.json        |   7 -
 tests/qapi-schema/union-clash-branches.out         |   0
 tests/qapi-schema/union-clash-member.err           |   2 +
 ...n-clash-member.json => union-clash-member.json} |   0
 ...ion-clash-member.out => union-clash-member.out} |   0
 tests/qapi-schema/union-discriminator-bad-name.err |   2 +
 ...name.json => union-discriminator-bad-name.json} |   0
 ...d-name.out => union-discriminator-bad-name.out} |   0
 tests/qapi-schema/union-empty.err                  |   2 +-
 tests/qapi-schema/union-empty.json                 |   6 +-
 tests/qapi-schema/union-inline-invalid-dict.err    |   2 +
 ...id-dict.json => union-inline-invalid-dict.json} |   0
 ...ion-empty.out => union-inline-invalid-dict.out} |   0
 tests/qapi-schema/union-int-branch.err             |   2 +
 ...union-int-branch.json => union-int-branch.json} |   2 +-
 ...nline-invalid-dict.out => union-int-branch.out} |   0
 tests/qapi-schema/union-invalid-branch-key.err     |   2 +
 ...anch-key.json => union-invalid-branch-key.json} |   0
 ...int-branch.out => union-invalid-branch-key.out} |   0
 tests/qapi-schema/union-invalid-discriminator.err  |   2 +
 ...nator.json => union-invalid-discriminator.json} |   0
 ...nch-key.out => union-invalid-discriminator.out} |   0
 .../qapi-schema/union-invalid-if-discriminator.err |   2 +
 ...or.json => union-invalid-if-discriminator.json} |   0
 ...ator.out => union-invalid-if-discriminator.out} |   0
 tests/qapi-schema/union-no-base.err                |   2 +
 ...{flat-union-no-base.json => union-no-base.json} |   2 +-
 ...alid-if-discriminator.out => union-no-base.out} |   0
 tests/qapi-schema/union-optional-branch.err        |   2 -
 tests/qapi-schema/union-optional-branch.json       |   2 -
 tests/qapi-schema/union-optional-branch.out        |   0
 tests/qapi-schema/union-optional-discriminator.err |   2 +
 ...ator.json => union-optional-discriminator.json} |   0
 ...o-base.out => union-optional-discriminator.out} |   0
 tests/qapi-schema/union-string-discriminator.err   |   2 +
 ...inator.json => union-string-discriminator.json} |   0
 ...iminator.out => union-string-discriminator.out} |   0
 tests/qapi-schema/union-unknown.err                |   2 +-
 tests/qapi-schema/union-unknown.json               |   5 +-
 118 files changed, 1035 insertions(+), 1228 deletions(-)
 delete mode 100644 tests/qapi-schema/flat-union-array-branch.err
 delete mode 100644 tests/qapi-schema/flat-union-bad-base.err
 delete mode 100644 tests/qapi-schema/flat-union-bad-discriminator.err
 delete mode 100644 tests/qapi-schema/flat-union-base-any.err
 delete mode 100644 tests/qapi-schema/flat-union-base-union.err
 delete mode 100644 tests/qapi-schema/flat-union-clash-member.err
 delete mode 100644 tests/qapi-schema/flat-union-discriminator-bad-name.err
 delete mode 100644 tests/qapi-schema/flat-union-empty.err
 delete mode 100644 tests/qapi-schema/flat-union-empty.json
 delete mode 100644 tests/qapi-schema/flat-union-inline-invalid-dict.err
 delete mode 100644 tests/qapi-schema/flat-union-int-branch.err
 delete mode 100644 tests/qapi-schema/flat-union-invalid-branch-key.err
 delete mode 100644 tests/qapi-schema/flat-union-invalid-discriminator.err
 delete mode 100644 tests/qapi-schema/flat-union-invalid-if-discriminator.err
 delete mode 100644 tests/qapi-schema/flat-union-no-base.err
 delete mode 100644 tests/qapi-schema/flat-union-optional-discriminator.err
 delete mode 100644 tests/qapi-schema/flat-union-string-discriminator.err
 delete mode 100644 tests/qapi-schema/flat-union-string-discriminator.out
 delete mode 100644 tests/qapi-schema/reserved-type-kind.err
 delete mode 100644 tests/qapi-schema/reserved-type-kind.json
 delete mode 100644 tests/qapi-schema/reserved-type-kind.out
 create mode 100644 tests/qapi-schema/union-array-branch.err
 rename tests/qapi-schema/{flat-union-array-branch.json => union-array-branch.json} (86%)
 rename tests/qapi-schema/{flat-union-array-branch.out => union-array-branch.out} (100%)
 create mode 100644 tests/qapi-schema/union-bad-base.err
 rename tests/qapi-schema/{flat-union-bad-base.json => union-bad-base.json} (100%)
 rename tests/qapi-schema/{flat-union-bad-base.out => union-bad-base.out} (100%)
 create mode 100644 tests/qapi-schema/union-bad-discriminator.err
 rename tests/qapi-schema/{flat-union-bad-discriminator.json => union-bad-discriminator.json} (100%)
 rename tests/qapi-schema/{flat-union-bad-discriminator.out => union-bad-discriminator.out} (100%)
 create mode 100644 tests/qapi-schema/union-base-any.err
 rename tests/qapi-schema/{flat-union-base-any.json => union-base-any.json} (100%)
 rename tests/qapi-schema/{flat-union-base-any.out => union-base-any.out} (100%)
 create mode 100644 tests/qapi-schema/union-base-union.err
 rename tests/qapi-schema/{flat-union-base-union.json => union-base-union.json} (86%)
 rename tests/qapi-schema/{flat-union-base-union.out => union-base-union.out} (100%)
 delete mode 100644 tests/qapi-schema/union-branch-case.err
 delete mode 100644 tests/qapi-schema/union-branch-case.json
 delete mode 100644 tests/qapi-schema/union-branch-case.out
 delete mode 100644 tests/qapi-schema/union-clash-branches.err
 delete mode 100644 tests/qapi-schema/union-clash-branches.json
 delete mode 100644 tests/qapi-schema/union-clash-branches.out
 create mode 100644 tests/qapi-schema/union-clash-member.err
 rename tests/qapi-schema/{flat-union-clash-member.json => union-clash-member.json} (100%)
 rename tests/qapi-schema/{flat-union-clash-member.out => union-clash-member.out} (100%)
 create mode 100644 tests/qapi-schema/union-discriminator-bad-name.err
 rename tests/qapi-schema/{flat-union-discriminator-bad-name.json => union-discriminator-bad-name.json} (100%)
 rename tests/qapi-schema/{flat-union-discriminator-bad-name.out => union-discriminator-bad-name.out} (100%)
 create mode 100644 tests/qapi-schema/union-inline-invalid-dict.err
 rename tests/qapi-schema/{flat-union-inline-invalid-dict.json => union-inline-invalid-dict.json} (100%)
 rename tests/qapi-schema/{flat-union-empty.out => union-inline-invalid-dict.out} (100%)
 create mode 100644 tests/qapi-schema/union-int-branch.err
 rename tests/qapi-schema/{flat-union-int-branch.json => union-int-branch.json} (86%)
 rename tests/qapi-schema/{flat-union-inline-invalid-dict.out => union-int-branch.out} (100%)
 create mode 100644 tests/qapi-schema/union-invalid-branch-key.err
 rename tests/qapi-schema/{flat-union-invalid-branch-key.json => union-invalid-branch-key.json} (100%)
 rename tests/qapi-schema/{flat-union-int-branch.out => union-invalid-branch-key.out} (100%)
 create mode 100644 tests/qapi-schema/union-invalid-discriminator.err
 rename tests/qapi-schema/{flat-union-invalid-discriminator.json => union-invalid-discriminator.json} (100%)
 rename tests/qapi-schema/{flat-union-invalid-branch-key.out => union-invalid-discriminator.out} (100%)
 create mode 100644 tests/qapi-schema/union-invalid-if-discriminator.err
 rename tests/qapi-schema/{flat-union-invalid-if-discriminator.json => union-invalid-if-discriminator.json} (100%)
 rename tests/qapi-schema/{flat-union-invalid-discriminator.out => union-invalid-if-discriminator.out} (100%)
 create mode 100644 tests/qapi-schema/union-no-base.err
 rename tests/qapi-schema/{flat-union-no-base.json => union-no-base.json} (90%)
 rename tests/qapi-schema/{flat-union-invalid-if-discriminator.out => union-no-base.out} (100%)
 delete mode 100644 tests/qapi-schema/union-optional-branch.err
 delete mode 100644 tests/qapi-schema/union-optional-branch.json
 delete mode 100644 tests/qapi-schema/union-optional-branch.out
 create mode 100644 tests/qapi-schema/union-optional-discriminator.err
 rename tests/qapi-schema/{flat-union-optional-discriminator.json => union-optional-discriminator.json} (100%)
 rename tests/qapi-schema/{flat-union-no-base.out => union-optional-discriminator.out} (100%)
 create mode 100644 tests/qapi-schema/union-string-discriminator.err
 rename tests/qapi-schema/{flat-union-string-discriminator.json => union-string-discriminator.json} (100%)
 rename tests/qapi-schema/{flat-union-optional-discriminator.out => union-string-discriminator.out} (100%)

-- 
2.31.1


