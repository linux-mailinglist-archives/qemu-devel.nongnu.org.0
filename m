Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E88E03CE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 14:26:04 +0200 (CEST)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMtEh-0006xl-Ey
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 08:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iMtAh-0004Ho-3d
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:21:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iMtAd-0007Lv-0a
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:21:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30061
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iMtAc-0007Lc-PH
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571746909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Uvb/AWDvZzFHhq4Ps9RGmsQO2HjDWdi/N05Cxs/6sOI=;
 b=dnwvfgD1ZCfqwZ1HbIJm638rY8hRcTEMLnsA7Ed3S2EBLJfv+ndCHkuf9DHK+mB/KWPvfs
 yvGmgeGHKh7WC5ulbw3SoZRHHf+E2/70Av4GAz4n8qyElIJ43F4YN3vjk7LveaZPvhxHoZ
 5HUrbXLirelf8J8Xfp/jztW8xfzGoow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-EUqdPt22PaG-3U1bfUflWw-1; Tue, 22 Oct 2019 08:21:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56B8A800D4E
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 12:21:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E38E60C57
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 12:21:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 05D391138619; Tue, 22 Oct 2019 14:21:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/12] QAPI patches for 2019-10-22
Date: Tue, 22 Oct 2019 14:21:43 +0200
Message-Id: <20191022122145.27792-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: EUqdPt22PaG-3U1bfUflWw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

The following changes since commit e9d42461920f6f40f4d847a5ba18e90d095ed0b9=
:

  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20191018-pull-req=
uest' into staging (2019-10-18 14:13:11 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2019-10-22

for you to fetch changes up to 0582bce69e8688fd7dd5501d352695e5c675b89b:

  qapi: Allow introspecting fix for savevm's cooperation with blockdev (201=
9-10-22 09:28:11 +0200)

----------------------------------------------------------------
QAPI patches for 2019-10-22

v2:
* PATCH 6: Add "# -*- coding: utf-8 -*-" lines

----------------------------------------------------------------
Markus Armbruster (9):
      qapi: Don't suppress doc generation without pragma doc-required
      qapi: Store pragma state in QAPISourceInfo, not global state
      qapi: Eliminate accidental global frontend state
      qapi: Speed up frontend tests
      qapi: Move gen_enum(), gen_enum_lookup() back to qapi/types.py
      qapi: Split up scripts/qapi/common.py
      qapi: Clear scripts/qapi/doc.py executable bits again
      tests/qapi-schema: Tidy up test output indentation
      tests/qapi-schema: Cover feature documentation comments

Peter Krempa (3):
      qapi: Add feature flags to commands
      tests: qapi: Test 'features' of commands
      qapi: Allow introspecting fix for savevm's cooperation with blockdev

 docs/devel/qapi-code-gen.txt                       |   10 +-
 tests/qapi-schema/doc-good.texi                    |   22 +
 Makefile                                           |   13 +-
 qapi/introspect.json                               |    6 +-
 qapi/misc.json                                     |    9 +-
 tests/test-qmp-cmds.c                              |   24 +
 scripts/qapi-gen.py                                |   10 +-
 scripts/qapi/commands.py                           |    4 +-
 scripts/qapi/common.py                             | 2377 ----------------=
----
 scripts/qapi/doc.py                                |   14 +-
 scripts/qapi/error.py                              |   42 +
 scripts/qapi/events.py                             |    3 +
 scripts/qapi/expr.py                               |  382 ++++
 scripts/qapi/gen.py                                |  290 +++
 scripts/qapi/introspect.py                         |   12 +-
 scripts/qapi/parser.py                             |  569 +++++
 scripts/qapi/schema.py                             | 1056 +++++++++
 scripts/qapi/source.py                             |   67 +
 scripts/qapi/types.py                              |   61 +
 scripts/qapi/visit.py                              |    2 +
 tests/Makefile.include                             |   30 +-
 tests/qapi-schema/allow-preconfig-test.err         |    4 +-
 tests/qapi-schema/allow-preconfig-test.exit        |    1 -
 tests/qapi-schema/alternate-any.err                |    4 +-
 tests/qapi-schema/alternate-any.exit               |    1 -
 tests/qapi-schema/alternate-array.err              |    4 +-
 tests/qapi-schema/alternate-array.exit             |    1 -
 tests/qapi-schema/alternate-base.err               |    4 +-
 tests/qapi-schema/alternate-base.exit              |    1 -
 tests/qapi-schema/alternate-branch-if-invalid.err  |    4 +-
 tests/qapi-schema/alternate-branch-if-invalid.exit |    1 -
 tests/qapi-schema/alternate-clash.err              |    4 +-
 tests/qapi-schema/alternate-clash.exit             |    1 -
 .../qapi-schema/alternate-conflict-bool-string.err |    4 +-
 .../alternate-conflict-bool-string.exit            |    1 -
 tests/qapi-schema/alternate-conflict-dict.err      |    4 +-
 tests/qapi-schema/alternate-conflict-dict.exit     |    1 -
 tests/qapi-schema/alternate-conflict-enum-bool.err |    4 +-
 .../qapi-schema/alternate-conflict-enum-bool.exit  |    1 -
 tests/qapi-schema/alternate-conflict-enum-int.err  |    4 +-
 tests/qapi-schema/alternate-conflict-enum-int.exit |    1 -
 .../qapi-schema/alternate-conflict-num-string.err  |    4 +-
 .../qapi-schema/alternate-conflict-num-string.exit |    1 -
 tests/qapi-schema/alternate-conflict-string.err    |    4 +-
 tests/qapi-schema/alternate-conflict-string.exit   |    1 -
 tests/qapi-schema/alternate-empty.err              |    4 +-
 tests/qapi-schema/alternate-empty.exit             |    1 -
 tests/qapi-schema/alternate-invalid-dict.err       |    4 +-
 tests/qapi-schema/alternate-invalid-dict.exit      |    1 -
 tests/qapi-schema/alternate-nested.err             |    4 +-
 tests/qapi-schema/alternate-nested.exit            |    1 -
 tests/qapi-schema/alternate-unknown.err            |    4 +-
 tests/qapi-schema/alternate-unknown.exit           |    1 -
 tests/qapi-schema/args-alternate.err               |    4 +-
 tests/qapi-schema/args-alternate.exit              |    1 -
 tests/qapi-schema/args-any.err                     |    4 +-
 tests/qapi-schema/args-any.exit                    |    1 -
 tests/qapi-schema/args-array-empty.err             |    4 +-
 tests/qapi-schema/args-array-empty.exit            |    1 -
 tests/qapi-schema/args-array-unknown.err           |    4 +-
 tests/qapi-schema/args-array-unknown.exit          |    1 -
 tests/qapi-schema/args-bad-boxed.err               |    4 +-
 tests/qapi-schema/args-bad-boxed.exit              |    1 -
 tests/qapi-schema/args-boxed-anon.err              |    4 +-
 tests/qapi-schema/args-boxed-anon.exit             |    1 -
 tests/qapi-schema/args-boxed-string.err            |    4 +-
 tests/qapi-schema/args-boxed-string.exit           |    1 -
 tests/qapi-schema/args-int.err                     |    4 +-
 tests/qapi-schema/args-int.exit                    |    1 -
 tests/qapi-schema/args-invalid.err                 |    4 +-
 tests/qapi-schema/args-invalid.exit                |    1 -
 tests/qapi-schema/args-member-array-bad.err        |    4 +-
 tests/qapi-schema/args-member-array-bad.exit       |    1 -
 tests/qapi-schema/args-member-case.err             |    4 +-
 tests/qapi-schema/args-member-case.exit            |    1 -
 tests/qapi-schema/args-member-unknown.err          |    4 +-
 tests/qapi-schema/args-member-unknown.exit         |    1 -
 tests/qapi-schema/args-name-clash.err              |    4 +-
 tests/qapi-schema/args-name-clash.exit             |    1 -
 tests/qapi-schema/args-union.err                   |    4 +-
 tests/qapi-schema/args-union.exit                  |    1 -
 tests/qapi-schema/args-unknown.err                 |    4 +-
 tests/qapi-schema/args-unknown.exit                |    1 -
 tests/qapi-schema/bad-base.err                     |    4 +-
 tests/qapi-schema/bad-base.exit                    |    1 -
 tests/qapi-schema/bad-data.err                     |    4 +-
 tests/qapi-schema/bad-data.exit                    |    1 -
 tests/qapi-schema/bad-ident.err                    |    4 +-
 tests/qapi-schema/bad-ident.exit                   |    1 -
 tests/qapi-schema/bad-if-empty-list.err            |    4 +-
 tests/qapi-schema/bad-if-empty-list.exit           |    1 -
 tests/qapi-schema/bad-if-empty.err                 |    4 +-
 tests/qapi-schema/bad-if-empty.exit                |    1 -
 tests/qapi-schema/bad-if-list.err                  |    4 +-
 tests/qapi-schema/bad-if-list.exit                 |    1 -
 tests/qapi-schema/bad-if.err                       |    4 +-
 tests/qapi-schema/bad-if.exit                      |    1 -
 tests/qapi-schema/bad-type-bool.err                |    2 +-
 tests/qapi-schema/bad-type-bool.exit               |    1 -
 tests/qapi-schema/bad-type-dict.err                |    2 +-
 tests/qapi-schema/bad-type-dict.exit               |    1 -
 tests/qapi-schema/bad-type-int.err                 |    2 +-
 tests/qapi-schema/bad-type-int.exit                |    1 -
 tests/qapi-schema/base-cycle-direct.err            |    4 +-
 tests/qapi-schema/base-cycle-direct.exit           |    1 -
 tests/qapi-schema/base-cycle-indirect.err          |    4 +-
 tests/qapi-schema/base-cycle-indirect.exit         |    1 -
 tests/qapi-schema/command-int.err                  |    4 +-
 tests/qapi-schema/command-int.exit                 |    1 -
 tests/qapi-schema/comments.exit                    |    1 -
 tests/qapi-schema/doc-bad-alternate-member.err     |    2 +-
 tests/qapi-schema/doc-bad-alternate-member.exit    |    1 -
 tests/qapi-schema/doc-bad-command-arg.err          |    2 +-
 tests/qapi-schema/doc-bad-command-arg.exit         |    1 -
 tests/qapi-schema/doc-bad-section.exit             |    1 -
 tests/qapi-schema/doc-bad-symbol.err               |    4 +-
 tests/qapi-schema/doc-bad-symbol.exit              |    1 -
 tests/qapi-schema/doc-bad-union-member.err         |    2 +-
 tests/qapi-schema/doc-bad-union-member.exit        |    1 -
 tests/qapi-schema/doc-before-include.err           |    2 +-
 tests/qapi-schema/doc-before-include.exit          |    1 -
 tests/qapi-schema/doc-before-pragma.err            |    2 +-
 tests/qapi-schema/doc-before-pragma.exit           |    1 -
 tests/qapi-schema/doc-duplicated-arg.err           |    2 +-
 tests/qapi-schema/doc-duplicated-arg.exit          |    1 -
 tests/qapi-schema/doc-duplicated-return.err        |    2 +-
 tests/qapi-schema/doc-duplicated-return.exit       |    1 -
 tests/qapi-schema/doc-duplicated-since.err         |    2 +-
 tests/qapi-schema/doc-duplicated-since.exit        |    1 -
 tests/qapi-schema/doc-empty-arg.err                |    2 +-
 tests/qapi-schema/doc-empty-arg.exit               |    1 -
 tests/qapi-schema/doc-empty-section.err            |    2 +-
 tests/qapi-schema/doc-empty-section.exit           |    1 -
 tests/qapi-schema/doc-empty-symbol.err             |    2 +-
 tests/qapi-schema/doc-empty-symbol.exit            |    1 -
 tests/qapi-schema/doc-good.exit                    |    1 -
 tests/qapi-schema/doc-good.json                    |   17 +-
 tests/qapi-schema/doc-good.out                     |    9 +-
 tests/qapi-schema/doc-interleaved-section.err      |    2 +-
 tests/qapi-schema/doc-interleaved-section.exit     |    1 -
 tests/qapi-schema/doc-invalid-end.err              |    2 +-
 tests/qapi-schema/doc-invalid-end.exit             |    1 -
 tests/qapi-schema/doc-invalid-end2.err             |    2 +-
 tests/qapi-schema/doc-invalid-end2.exit            |    1 -
 tests/qapi-schema/doc-invalid-return.err           |    2 +-
 tests/qapi-schema/doc-invalid-return.exit          |    1 -
 tests/qapi-schema/doc-invalid-section.err          |    2 +-
 tests/qapi-schema/doc-invalid-section.exit         |    1 -
 tests/qapi-schema/doc-invalid-start.err            |    2 +-
 tests/qapi-schema/doc-invalid-start.exit           |    1 -
 tests/qapi-schema/doc-missing-colon.err            |    2 +-
 tests/qapi-schema/doc-missing-colon.exit           |    1 -
 tests/qapi-schema/doc-missing-expr.err             |    2 +-
 tests/qapi-schema/doc-missing-expr.exit            |    1 -
 tests/qapi-schema/doc-missing-space.err            |    2 +-
 tests/qapi-schema/doc-missing-space.exit           |    1 -
 tests/qapi-schema/doc-missing.err                  |    4 +-
 tests/qapi-schema/doc-missing.exit                 |    1 -
 tests/qapi-schema/doc-no-symbol.err                |    2 +-
 tests/qapi-schema/doc-no-symbol.exit               |    1 -
 tests/qapi-schema/double-type.err                  |    4 +-
 tests/qapi-schema/double-type.exit                 |    1 -
 tests/qapi-schema/duplicate-key.err                |    2 +-
 tests/qapi-schema/duplicate-key.exit               |    1 -
 tests/qapi-schema/empty.exit                       |    1 -
 tests/qapi-schema/enum-bad-member.err              |    4 +-
 tests/qapi-schema/enum-bad-member.exit             |    1 -
 tests/qapi-schema/enum-bad-name.err                |    4 +-
 tests/qapi-schema/enum-bad-name.exit               |    1 -
 tests/qapi-schema/enum-bad-prefix.err              |    4 +-
 tests/qapi-schema/enum-bad-prefix.exit             |    1 -
 tests/qapi-schema/enum-clash-member.err            |    4 +-
 tests/qapi-schema/enum-clash-member.exit           |    1 -
 tests/qapi-schema/enum-dict-member-unknown.err     |    4 +-
 tests/qapi-schema/enum-dict-member-unknown.exit    |    1 -
 tests/qapi-schema/enum-if-invalid.err              |    4 +-
 tests/qapi-schema/enum-if-invalid.exit             |    1 -
 tests/qapi-schema/enum-int-member.err              |    2 +-
 tests/qapi-schema/enum-int-member.exit             |    1 -
 tests/qapi-schema/enum-member-case.err             |    4 +-
 tests/qapi-schema/enum-member-case.exit            |    1 -
 tests/qapi-schema/enum-missing-data.err            |    4 +-
 tests/qapi-schema/enum-missing-data.exit           |    1 -
 tests/qapi-schema/enum-wrong-data.err              |    4 +-
 tests/qapi-schema/enum-wrong-data.exit             |    1 -
 tests/qapi-schema/escape-outside-string.err        |    2 +-
 tests/qapi-schema/event-boxed-empty.err            |    4 +-
 tests/qapi-schema/event-boxed-empty.exit           |    1 -
 tests/qapi-schema/event-case.exit                  |    1 -
 tests/qapi-schema/event-case.out                   |    2 +-
 tests/qapi-schema/event-member-invalid-dict.err    |    4 +-
 tests/qapi-schema/event-member-invalid-dict.exit   |    1 -
 tests/qapi-schema/event-nest-struct.err            |    4 +-
 tests/qapi-schema/event-nest-struct.exit           |    1 -
 tests/qapi-schema/features-bad-type.err            |    4 +-
 tests/qapi-schema/features-bad-type.exit           |    1 -
 tests/qapi-schema/features-duplicate-name.err      |    4 +-
 tests/qapi-schema/features-duplicate-name.exit     |    1 -
 tests/qapi-schema/features-if-invalid.err          |    4 +-
 tests/qapi-schema/features-if-invalid.exit         |    1 -
 tests/qapi-schema/features-missing-name.err        |    4 +-
 tests/qapi-schema/features-missing-name.exit       |    1 -
 tests/qapi-schema/features-name-bad-type.err       |    4 +-
 tests/qapi-schema/features-name-bad-type.exit      |    1 -
 tests/qapi-schema/features-no-list.err             |    4 +-
 tests/qapi-schema/features-no-list.exit            |    1 -
 tests/qapi-schema/features-unknown-key.err         |    4 +-
 tests/qapi-schema/features-unknown-key.exit        |    1 -
 tests/qapi-schema/flat-union-array-branch.err      |    4 +-
 tests/qapi-schema/flat-union-array-branch.exit     |    1 -
 tests/qapi-schema/flat-union-bad-base.err          |    4 +-
 tests/qapi-schema/flat-union-bad-base.exit         |    1 -
 tests/qapi-schema/flat-union-bad-discriminator.err |    4 +-
 .../qapi-schema/flat-union-bad-discriminator.exit  |    1 -
 tests/qapi-schema/flat-union-base-any.err          |    4 +-
 tests/qapi-schema/flat-union-base-any.exit         |    1 -
 tests/qapi-schema/flat-union-base-union.err        |    4 +-
 tests/qapi-schema/flat-union-base-union.exit       |    1 -
 tests/qapi-schema/flat-union-clash-member.err      |    4 +-
 tests/qapi-schema/flat-union-clash-member.exit     |    1 -
 .../flat-union-discriminator-bad-name.err          |    4 +-
 .../flat-union-discriminator-bad-name.exit         |    1 -
 tests/qapi-schema/flat-union-empty.err             |    4 +-
 tests/qapi-schema/flat-union-empty.exit            |    1 -
 .../qapi-schema/flat-union-inline-invalid-dict.err |    4 +-
 .../flat-union-inline-invalid-dict.exit            |    1 -
 tests/qapi-schema/flat-union-inline.err            |    4 +-
 tests/qapi-schema/flat-union-inline.exit           |    1 -
 tests/qapi-schema/flat-union-int-branch.err        |    4 +-
 tests/qapi-schema/flat-union-int-branch.exit       |    1 -
 .../qapi-schema/flat-union-invalid-branch-key.err  |    4 +-
 .../qapi-schema/flat-union-invalid-branch-key.exit |    1 -
 .../flat-union-invalid-discriminator.err           |    4 +-
 .../flat-union-invalid-discriminator.exit          |    1 -
 .../flat-union-invalid-if-discriminator.err        |    4 +-
 .../flat-union-invalid-if-discriminator.exit       |    1 -
 tests/qapi-schema/flat-union-no-base.err           |    4 +-
 tests/qapi-schema/flat-union-no-base.exit          |    1 -
 .../flat-union-optional-discriminator.err          |    4 +-
 .../flat-union-optional-discriminator.exit         |    1 -
 .../flat-union-string-discriminator.err            |    4 +-
 .../flat-union-string-discriminator.exit           |    1 -
 tests/qapi-schema/funny-char.err                   |    2 +-
 tests/qapi-schema/funny-char.exit                  |    1 -
 tests/qapi-schema/funny-word.err                   |    2 +-
 tests/qapi-schema/funny-word.exit                  |    1 -
 tests/qapi-schema/ident-with-escape.err            |    2 +-
 tests/qapi-schema/ident-with-escape.exit           |    1 -
 tests/qapi-schema/include-before-err.err           |    2 +-
 tests/qapi-schema/include-before-err.exit          |    1 -
 tests/qapi-schema/include-cycle.err                |    6 +-
 tests/qapi-schema/include-cycle.exit               |    1 -
 tests/qapi-schema/include-extra-junk.err           |    2 +-
 tests/qapi-schema/include-extra-junk.exit          |    1 -
 tests/qapi-schema/include-nested-err.err           |    4 +-
 tests/qapi-schema/include-nested-err.exit          |    1 -
 tests/qapi-schema/include-no-file.err              |    2 +-
 tests/qapi-schema/include-no-file.exit             |    1 -
 tests/qapi-schema/include-non-file.err             |    2 +-
 tests/qapi-schema/include-non-file.exit            |    1 -
 tests/qapi-schema/include-repetition.exit          |    1 -
 tests/qapi-schema/include-self-cycle.err           |    2 +-
 tests/qapi-schema/include-self-cycle.exit          |    1 -
 tests/qapi-schema/include-simple.exit              |    1 -
 tests/qapi-schema/indented-expr.exit               |    1 -
 tests/qapi-schema/indented-expr.out                |    4 +-
 tests/qapi-schema/leading-comma-list.err           |    2 +-
 tests/qapi-schema/leading-comma-list.exit          |    1 -
 tests/qapi-schema/leading-comma-object.err         |    2 +-
 tests/qapi-schema/leading-comma-object.exit        |    1 -
 tests/qapi-schema/missing-colon.err                |    2 +-
 tests/qapi-schema/missing-colon.exit               |    1 -
 tests/qapi-schema/missing-comma-list.err           |    2 +-
 tests/qapi-schema/missing-comma-list.exit          |    1 -
 tests/qapi-schema/missing-comma-object.err         |    2 +-
 tests/qapi-schema/missing-comma-object.exit        |    1 -
 tests/qapi-schema/missing-type.err                 |    2 +-
 tests/qapi-schema/missing-type.exit                |    1 -
 .../nested-struct-data-invalid-dict.err            |    4 +-
 .../nested-struct-data-invalid-dict.exit           |    1 -
 tests/qapi-schema/nested-struct-data.err           |    4 +-
 tests/qapi-schema/nested-struct-data.exit          |    1 -
 tests/qapi-schema/non-objects.err                  |    2 +-
 tests/qapi-schema/non-objects.exit                 |    1 -
 tests/qapi-schema/oob-test.err                     |    4 +-
 tests/qapi-schema/oob-test.exit                    |    1 -
 tests/qapi-schema/pragma-doc-required-crap.err     |    2 +-
 tests/qapi-schema/pragma-doc-required-crap.exit    |    1 -
 tests/qapi-schema/pragma-extra-junk.err            |    2 +-
 tests/qapi-schema/pragma-extra-junk.exit           |    1 -
 .../pragma-name-case-whitelist-crap.err            |    2 +-
 .../pragma-name-case-whitelist-crap.exit           |    1 -
 tests/qapi-schema/pragma-non-dict.err              |    2 +-
 tests/qapi-schema/pragma-non-dict.exit             |    1 -
 .../qapi-schema/pragma-returns-whitelist-crap.err  |    2 +-
 .../qapi-schema/pragma-returns-whitelist-crap.exit |    1 -
 tests/qapi-schema/pragma-unknown.err               |    2 +-
 tests/qapi-schema/pragma-unknown.exit              |    1 -
 tests/qapi-schema/qapi-schema-test.exit            |    1 -
 tests/qapi-schema/qapi-schema-test.json            |   18 +
 tests/qapi-schema/qapi-schema-test.out             |   75 +-
 tests/qapi-schema/quoted-structural-chars.err      |    2 +-
 tests/qapi-schema/quoted-structural-chars.exit     |    1 -
 tests/qapi-schema/redefined-builtin.err            |    4 +-
 tests/qapi-schema/redefined-builtin.exit           |    1 -
 tests/qapi-schema/redefined-command.err            |    8 +-
 tests/qapi-schema/redefined-command.exit           |    1 -
 tests/qapi-schema/redefined-event.err              |    8 +-
 tests/qapi-schema/redefined-event.exit             |    1 -
 tests/qapi-schema/redefined-type.err               |    8 +-
 tests/qapi-schema/redefined-type.exit              |    1 -
 tests/qapi-schema/reserved-command-q.err           |    4 +-
 tests/qapi-schema/reserved-command-q.exit          |    1 -
 tests/qapi-schema/reserved-enum-q.err              |    4 +-
 tests/qapi-schema/reserved-enum-q.exit             |    1 -
 tests/qapi-schema/reserved-member-has.err          |    4 +-
 tests/qapi-schema/reserved-member-has.exit         |    1 -
 tests/qapi-schema/reserved-member-q.err            |    4 +-
 tests/qapi-schema/reserved-member-q.exit           |    1 -
 tests/qapi-schema/reserved-member-u.err            |    4 +-
 tests/qapi-schema/reserved-member-u.exit           |    1 -
 tests/qapi-schema/reserved-member-underscore.err   |    4 +-
 tests/qapi-schema/reserved-member-underscore.exit  |    1 -
 tests/qapi-schema/reserved-type-kind.err           |    4 +-
 tests/qapi-schema/reserved-type-kind.exit          |    1 -
 tests/qapi-schema/reserved-type-list.err           |    4 +-
 tests/qapi-schema/reserved-type-list.exit          |    1 -
 tests/qapi-schema/returns-alternate.err            |    4 +-
 tests/qapi-schema/returns-alternate.exit           |    1 -
 tests/qapi-schema/returns-array-bad.err            |    4 +-
 tests/qapi-schema/returns-array-bad.exit           |    1 -
 tests/qapi-schema/returns-dict.err                 |    4 +-
 tests/qapi-schema/returns-dict.exit                |    1 -
 tests/qapi-schema/returns-unknown.err              |    4 +-
 tests/qapi-schema/returns-unknown.exit             |    1 -
 tests/qapi-schema/returns-whitelist.err            |    4 +-
 tests/qapi-schema/returns-whitelist.exit           |    1 -
 tests/qapi-schema/string-code-point-127.err        |    2 +-
 tests/qapi-schema/string-code-point-127.exit       |    1 -
 tests/qapi-schema/string-code-point-31.err         |    2 +-
 tests/qapi-schema/string-code-point-31.exit        |    1 -
 tests/qapi-schema/struct-base-clash-deep.err       |    4 +-
 tests/qapi-schema/struct-base-clash-deep.exit      |    1 -
 tests/qapi-schema/struct-base-clash.err            |    4 +-
 tests/qapi-schema/struct-base-clash.exit           |    1 -
 tests/qapi-schema/struct-data-invalid.err          |    4 +-
 tests/qapi-schema/struct-data-invalid.exit         |    1 -
 tests/qapi-schema/struct-member-if-invalid.err     |    4 +-
 tests/qapi-schema/struct-member-if-invalid.exit    |    1 -
 tests/qapi-schema/struct-member-invalid-dict.err   |    4 +-
 tests/qapi-schema/struct-member-invalid-dict.exit  |    1 -
 tests/qapi-schema/struct-member-invalid.err        |    4 +-
 tests/qapi-schema/struct-member-invalid.exit       |    1 -
 tests/qapi-schema/test-qapi.py                     |  145 +-
 tests/qapi-schema/trailing-comma-list.err          |    2 +-
 tests/qapi-schema/trailing-comma-list.exit         |    1 -
 tests/qapi-schema/trailing-comma-object.err        |    2 +-
 tests/qapi-schema/trailing-comma-object.exit       |    1 -
 tests/qapi-schema/type-bypass-bad-gen.err          |    4 +-
 tests/qapi-schema/type-bypass-bad-gen.exit         |    1 -
 tests/qapi-schema/unclosed-list.err                |    2 +-
 tests/qapi-schema/unclosed-list.exit               |    1 -
 tests/qapi-schema/unclosed-object.err              |    2 +-
 tests/qapi-schema/unclosed-object.exit             |    1 -
 tests/qapi-schema/unclosed-string.err              |    2 +-
 tests/qapi-schema/unclosed-string.exit             |    1 -
 tests/qapi-schema/union-base-empty.err             |    4 +-
 tests/qapi-schema/union-base-empty.exit            |    1 -
 tests/qapi-schema/union-base-no-discriminator.err  |    4 +-
 tests/qapi-schema/union-base-no-discriminator.exit |    1 -
 tests/qapi-schema/union-branch-case.err            |    4 +-
 tests/qapi-schema/union-branch-case.exit           |    1 -
 tests/qapi-schema/union-branch-if-invalid.err      |    4 +-
 tests/qapi-schema/union-branch-if-invalid.exit     |    1 -
 tests/qapi-schema/union-branch-invalid-dict.err    |    4 +-
 tests/qapi-schema/union-branch-invalid-dict.exit   |    1 -
 tests/qapi-schema/union-clash-branches.err         |    4 +-
 tests/qapi-schema/union-clash-branches.exit        |    1 -
 tests/qapi-schema/union-empty.err                  |    4 +-
 tests/qapi-schema/union-empty.exit                 |    1 -
 tests/qapi-schema/union-invalid-base.err           |    4 +-
 tests/qapi-schema/union-invalid-base.exit          |    1 -
 tests/qapi-schema/union-optional-branch.err        |    4 +-
 tests/qapi-schema/union-optional-branch.exit       |    1 -
 tests/qapi-schema/union-unknown.err                |    4 +-
 tests/qapi-schema/union-unknown.exit               |    1 -
 tests/qapi-schema/unknown-escape.err               |    2 +-
 tests/qapi-schema/unknown-escape.exit              |    1 -
 tests/qapi-schema/unknown-expr-key.err             |    4 +-
 tests/qapi-schema/unknown-expr-key.exit            |    1 -
 390 files changed, 3108 insertions(+), 2958 deletions(-)
 mode change 100755 =3D> 100644 scripts/qapi/doc.py
 create mode 100644 scripts/qapi/error.py
 create mode 100644 scripts/qapi/expr.py
 create mode 100644 scripts/qapi/gen.py
 create mode 100644 scripts/qapi/parser.py
 create mode 100644 scripts/qapi/schema.py
 create mode 100644 scripts/qapi/source.py
 delete mode 100644 tests/qapi-schema/allow-preconfig-test.exit
 delete mode 100644 tests/qapi-schema/alternate-any.exit
 delete mode 100644 tests/qapi-schema/alternate-array.exit
 delete mode 100644 tests/qapi-schema/alternate-base.exit
 delete mode 100644 tests/qapi-schema/alternate-branch-if-invalid.exit
 delete mode 100644 tests/qapi-schema/alternate-clash.exit
 delete mode 100644 tests/qapi-schema/alternate-conflict-bool-string.exit
 delete mode 100644 tests/qapi-schema/alternate-conflict-dict.exit
 delete mode 100644 tests/qapi-schema/alternate-conflict-enum-bool.exit
 delete mode 100644 tests/qapi-schema/alternate-conflict-enum-int.exit
 delete mode 100644 tests/qapi-schema/alternate-conflict-num-string.exit
 delete mode 100644 tests/qapi-schema/alternate-conflict-string.exit
 delete mode 100644 tests/qapi-schema/alternate-empty.exit
 delete mode 100644 tests/qapi-schema/alternate-invalid-dict.exit
 delete mode 100644 tests/qapi-schema/alternate-nested.exit
 delete mode 100644 tests/qapi-schema/alternate-unknown.exit
 delete mode 100644 tests/qapi-schema/args-alternate.exit
 delete mode 100644 tests/qapi-schema/args-any.exit
 delete mode 100644 tests/qapi-schema/args-array-empty.exit
 delete mode 100644 tests/qapi-schema/args-array-unknown.exit
 delete mode 100644 tests/qapi-schema/args-bad-boxed.exit
 delete mode 100644 tests/qapi-schema/args-boxed-anon.exit
 delete mode 100644 tests/qapi-schema/args-boxed-string.exit
 delete mode 100644 tests/qapi-schema/args-int.exit
 delete mode 100644 tests/qapi-schema/args-invalid.exit
 delete mode 100644 tests/qapi-schema/args-member-array-bad.exit
 delete mode 100644 tests/qapi-schema/args-member-case.exit
 delete mode 100644 tests/qapi-schema/args-member-unknown.exit
 delete mode 100644 tests/qapi-schema/args-name-clash.exit
 delete mode 100644 tests/qapi-schema/args-union.exit
 delete mode 100644 tests/qapi-schema/args-unknown.exit
 delete mode 100644 tests/qapi-schema/bad-base.exit
 delete mode 100644 tests/qapi-schema/bad-data.exit
 delete mode 100644 tests/qapi-schema/bad-ident.exit
 delete mode 100644 tests/qapi-schema/bad-if-empty-list.exit
 delete mode 100644 tests/qapi-schema/bad-if-empty.exit
 delete mode 100644 tests/qapi-schema/bad-if-list.exit
 delete mode 100644 tests/qapi-schema/bad-if.exit
 delete mode 100644 tests/qapi-schema/bad-type-bool.exit
 delete mode 100644 tests/qapi-schema/bad-type-dict.exit
 delete mode 100644 tests/qapi-schema/bad-type-int.exit
 delete mode 100644 tests/qapi-schema/base-cycle-direct.exit
 delete mode 100644 tests/qapi-schema/base-cycle-indirect.exit
 delete mode 100644 tests/qapi-schema/command-int.exit
 delete mode 100644 tests/qapi-schema/comments.exit
 delete mode 100644 tests/qapi-schema/doc-bad-alternate-member.exit
 delete mode 100644 tests/qapi-schema/doc-bad-command-arg.exit
 delete mode 100644 tests/qapi-schema/doc-bad-section.exit
 delete mode 100644 tests/qapi-schema/doc-bad-symbol.exit
 delete mode 100644 tests/qapi-schema/doc-bad-union-member.exit
 delete mode 100644 tests/qapi-schema/doc-before-include.exit
 delete mode 100644 tests/qapi-schema/doc-before-pragma.exit
 delete mode 100644 tests/qapi-schema/doc-duplicated-arg.exit
 delete mode 100644 tests/qapi-schema/doc-duplicated-return.exit
 delete mode 100644 tests/qapi-schema/doc-duplicated-since.exit
 delete mode 100644 tests/qapi-schema/doc-empty-arg.exit
 delete mode 100644 tests/qapi-schema/doc-empty-section.exit
 delete mode 100644 tests/qapi-schema/doc-empty-symbol.exit
 delete mode 100644 tests/qapi-schema/doc-good.exit
 delete mode 100644 tests/qapi-schema/doc-interleaved-section.exit
 delete mode 100644 tests/qapi-schema/doc-invalid-end.exit
 delete mode 100644 tests/qapi-schema/doc-invalid-end2.exit
 delete mode 100644 tests/qapi-schema/doc-invalid-return.exit
 delete mode 100644 tests/qapi-schema/doc-invalid-section.exit
 delete mode 100644 tests/qapi-schema/doc-invalid-start.exit
 delete mode 100644 tests/qapi-schema/doc-missing-colon.exit
 delete mode 100644 tests/qapi-schema/doc-missing-expr.exit
 delete mode 100644 tests/qapi-schema/doc-missing-space.exit
 delete mode 100644 tests/qapi-schema/doc-missing.exit
 delete mode 100644 tests/qapi-schema/doc-no-symbol.exit
 delete mode 100644 tests/qapi-schema/double-type.exit
 delete mode 100644 tests/qapi-schema/duplicate-key.exit
 delete mode 100644 tests/qapi-schema/empty.exit
 delete mode 100644 tests/qapi-schema/enum-bad-member.exit
 delete mode 100644 tests/qapi-schema/enum-bad-name.exit
 delete mode 100644 tests/qapi-schema/enum-bad-prefix.exit
 delete mode 100644 tests/qapi-schema/enum-clash-member.exit
 delete mode 100644 tests/qapi-schema/enum-dict-member-unknown.exit
 delete mode 100644 tests/qapi-schema/enum-if-invalid.exit
 delete mode 100644 tests/qapi-schema/enum-int-member.exit
 delete mode 100644 tests/qapi-schema/enum-member-case.exit
 delete mode 100644 tests/qapi-schema/enum-missing-data.exit
 delete mode 100644 tests/qapi-schema/enum-wrong-data.exit
 delete mode 100644 tests/qapi-schema/event-boxed-empty.exit
 delete mode 100644 tests/qapi-schema/event-case.exit
 delete mode 100644 tests/qapi-schema/event-member-invalid-dict.exit
 delete mode 100644 tests/qapi-schema/event-nest-struct.exit
 delete mode 100644 tests/qapi-schema/features-bad-type.exit
 delete mode 100644 tests/qapi-schema/features-duplicate-name.exit
 delete mode 100644 tests/qapi-schema/features-if-invalid.exit
 delete mode 100644 tests/qapi-schema/features-missing-name.exit
 delete mode 100644 tests/qapi-schema/features-name-bad-type.exit
 delete mode 100644 tests/qapi-schema/features-no-list.exit
 delete mode 100644 tests/qapi-schema/features-unknown-key.exit
 delete mode 100644 tests/qapi-schema/flat-union-array-branch.exit
 delete mode 100644 tests/qapi-schema/flat-union-bad-base.exit
 delete mode 100644 tests/qapi-schema/flat-union-bad-discriminator.exit
 delete mode 100644 tests/qapi-schema/flat-union-base-any.exit
 delete mode 100644 tests/qapi-schema/flat-union-base-union.exit
 delete mode 100644 tests/qapi-schema/flat-union-clash-member.exit
 delete mode 100644 tests/qapi-schema/flat-union-discriminator-bad-name.exi=
t
 delete mode 100644 tests/qapi-schema/flat-union-empty.exit
 delete mode 100644 tests/qapi-schema/flat-union-inline-invalid-dict.exit
 delete mode 100644 tests/qapi-schema/flat-union-inline.exit
 delete mode 100644 tests/qapi-schema/flat-union-int-branch.exit
 delete mode 100644 tests/qapi-schema/flat-union-invalid-branch-key.exit
 delete mode 100644 tests/qapi-schema/flat-union-invalid-discriminator.exit
 delete mode 100644 tests/qapi-schema/flat-union-invalid-if-discriminator.e=
xit
 delete mode 100644 tests/qapi-schema/flat-union-no-base.exit
 delete mode 100644 tests/qapi-schema/flat-union-optional-discriminator.exi=
t
 delete mode 100644 tests/qapi-schema/flat-union-string-discriminator.exit
 delete mode 100644 tests/qapi-schema/funny-char.exit
 delete mode 100644 tests/qapi-schema/funny-word.exit
 delete mode 100644 tests/qapi-schema/ident-with-escape.exit
 delete mode 100644 tests/qapi-schema/include-before-err.exit
 delete mode 100644 tests/qapi-schema/include-cycle.exit
 delete mode 100644 tests/qapi-schema/include-extra-junk.exit
 delete mode 100644 tests/qapi-schema/include-nested-err.exit
 delete mode 100644 tests/qapi-schema/include-no-file.exit
 delete mode 100644 tests/qapi-schema/include-non-file.exit
 delete mode 100644 tests/qapi-schema/include-repetition.exit
 delete mode 100644 tests/qapi-schema/include-self-cycle.exit
 delete mode 100644 tests/qapi-schema/include-simple.exit
 delete mode 100644 tests/qapi-schema/indented-expr.exit
 delete mode 100644 tests/qapi-schema/leading-comma-list.exit
 delete mode 100644 tests/qapi-schema/leading-comma-object.exit
 delete mode 100644 tests/qapi-schema/missing-colon.exit
 delete mode 100644 tests/qapi-schema/missing-comma-list.exit
 delete mode 100644 tests/qapi-schema/missing-comma-object.exit
 delete mode 100644 tests/qapi-schema/missing-type.exit
 delete mode 100644 tests/qapi-schema/nested-struct-data-invalid-dict.exit
 delete mode 100644 tests/qapi-schema/nested-struct-data.exit
 delete mode 100644 tests/qapi-schema/non-objects.exit
 delete mode 100644 tests/qapi-schema/oob-test.exit
 delete mode 100644 tests/qapi-schema/pragma-doc-required-crap.exit
 delete mode 100644 tests/qapi-schema/pragma-extra-junk.exit
 delete mode 100644 tests/qapi-schema/pragma-name-case-whitelist-crap.exit
 delete mode 100644 tests/qapi-schema/pragma-non-dict.exit
 delete mode 100644 tests/qapi-schema/pragma-returns-whitelist-crap.exit
 delete mode 100644 tests/qapi-schema/pragma-unknown.exit
 delete mode 100644 tests/qapi-schema/qapi-schema-test.exit
 delete mode 100644 tests/qapi-schema/quoted-structural-chars.exit
 delete mode 100644 tests/qapi-schema/redefined-builtin.exit
 delete mode 100644 tests/qapi-schema/redefined-command.exit
 delete mode 100644 tests/qapi-schema/redefined-event.exit
 delete mode 100644 tests/qapi-schema/redefined-type.exit
 delete mode 100644 tests/qapi-schema/reserved-command-q.exit
 delete mode 100644 tests/qapi-schema/reserved-enum-q.exit
 delete mode 100644 tests/qapi-schema/reserved-member-has.exit
 delete mode 100644 tests/qapi-schema/reserved-member-q.exit
 delete mode 100644 tests/qapi-schema/reserved-member-u.exit
 delete mode 100644 tests/qapi-schema/reserved-member-underscore.exit
 delete mode 100644 tests/qapi-schema/reserved-type-kind.exit
 delete mode 100644 tests/qapi-schema/reserved-type-list.exit
 delete mode 100644 tests/qapi-schema/returns-alternate.exit
 delete mode 100644 tests/qapi-schema/returns-array-bad.exit
 delete mode 100644 tests/qapi-schema/returns-dict.exit
 delete mode 100644 tests/qapi-schema/returns-unknown.exit
 delete mode 100644 tests/qapi-schema/returns-whitelist.exit
 delete mode 100644 tests/qapi-schema/string-code-point-127.exit
 delete mode 100644 tests/qapi-schema/string-code-point-31.exit
 delete mode 100644 tests/qapi-schema/struct-base-clash-deep.exit
 delete mode 100644 tests/qapi-schema/struct-base-clash.exit
 delete mode 100644 tests/qapi-schema/struct-data-invalid.exit
 delete mode 100644 tests/qapi-schema/struct-member-if-invalid.exit
 delete mode 100644 tests/qapi-schema/struct-member-invalid-dict.exit
 delete mode 100644 tests/qapi-schema/struct-member-invalid.exit
 mode change 100644 =3D> 100755 tests/qapi-schema/test-qapi.py
 delete mode 100644 tests/qapi-schema/trailing-comma-list.exit
 delete mode 100644 tests/qapi-schema/trailing-comma-object.exit
 delete mode 100644 tests/qapi-schema/type-bypass-bad-gen.exit
 delete mode 100644 tests/qapi-schema/unclosed-list.exit
 delete mode 100644 tests/qapi-schema/unclosed-object.exit
 delete mode 100644 tests/qapi-schema/unclosed-string.exit
 delete mode 100644 tests/qapi-schema/union-base-empty.exit
 delete mode 100644 tests/qapi-schema/union-base-no-discriminator.exit
 delete mode 100644 tests/qapi-schema/union-branch-case.exit
 delete mode 100644 tests/qapi-schema/union-branch-if-invalid.exit
 delete mode 100644 tests/qapi-schema/union-branch-invalid-dict.exit
 delete mode 100644 tests/qapi-schema/union-clash-branches.exit
 delete mode 100644 tests/qapi-schema/union-empty.exit
 delete mode 100644 tests/qapi-schema/union-invalid-base.exit
 delete mode 100644 tests/qapi-schema/union-optional-branch.exit
 delete mode 100644 tests/qapi-schema/union-unknown.exit
 delete mode 100644 tests/qapi-schema/unknown-escape.exit
 delete mode 100644 tests/qapi-schema/unknown-expr-key.exit

--=20
2.21.0


