Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09FD3F8798
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:36:35 +0200 (CEST)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJEcU-0006yH-TP
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYb-0004A6-Iu
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYZ-00088E-2j
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629981149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ku4KFzVcrUO4hJvdmlBRhoznR4GyXD0fX/1mii4sQhs=;
 b=K6u2Wc5kE48k/fmYpxHIl3/2UJqKdU7UeXTWHzc8he+bIq3XtbyLjaDE2sIGmJcQp4YsRd
 r8y/UoeahWlcGewQ+1caofzhxvNz8nqB+n7pFzjQE38nqrgBlBsp9aTT2ARbW90nXIRjAp
 xYoNldjDAZhIbzJJ/4o1szXJicH2mMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-B8Ql3C07Pn-v9LAibp4Tpw-1; Thu, 26 Aug 2021 08:32:28 -0400
X-MC-Unique: B8Ql3C07Pn-v9LAibp4Tpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69A5F1008064;
 Thu, 26 Aug 2021 12:32:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0402B1002F12;
 Thu, 26 Aug 2021 12:32:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9248811380A9; Thu, 26 Aug 2021 14:32:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] QAPI patches patches for 2021-08-26
Date: Thu, 26 Aug 2021 14:32:14 +0200
Message-Id: <20210826123225.157891-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.742, DKIM_SIGNED=0.1,
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

The following changes since commit d8ae530ec00368d4adfb996b5ef6c74cb4460504:

  Merge remote-tracking branch 'remotes/philmd/tags/mips-20210825' into staging (2021-08-25 21:09:48 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-08-26

for you to fetch changes up to 8a9f1e1d9cc55f5eb0946cbf8fd1ef9a0e7d3dac:

  qapi: make 'if' condition strings simple identifiers (2021-08-26 13:53:56 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-08-26

----------------------------------------------------------------
Marc-André Lureau (10):
      docs: update the documentation upfront about schema configuration
      qapi: wrap Sequence[str] in an object
      qapi: add QAPISchemaIfCond.is_present()
      qapi: introduce QAPISchemaIfCond.cgen()
      qapidoc: introduce QAPISchemaIfCond.docgen()
      qapi: replace if condition list with dict {'all': [...]}
      qapi: add 'any' condition
      qapi: Use 'if': { 'any': ... } where appropriate
      qapi: add 'not' condition operation
      qapi: make 'if' condition strings simple identifiers

Markus Armbruster (1):
      qapi: Fix crash on redefinition with a different condition

 docs/devel/qapi-code-gen.rst                      | 30 ++++---
 docs/sphinx/qapidoc.py                            | 22 ++---
 qapi/block-core.json                              | 34 ++++----
 qapi/block-export.json                            |  6 +-
 qapi/char.json                                    | 12 +--
 qapi/machine-target.json                          | 28 +++++--
 qapi/migration.json                               | 10 +--
 qapi/misc-target.json                             | 40 +++++----
 qapi/qom.json                                     | 10 +--
 qapi/sockets.json                                 |  6 +-
 qapi/tpm.json                                     | 18 ++---
 qapi/ui.json                                      | 66 +++++++--------
 qga/qapi-schema.json                              |  8 +-
 tests/unit/test-qmp-cmds.c                        |  1 +
 scripts/qapi/commands.py                          |  4 +-
 scripts/qapi/common.py                            | 59 +++++++++++---
 scripts/qapi/events.py                            |  5 +-
 scripts/qapi/expr.py                              | 67 +++++++++-------
 scripts/qapi/gen.py                               | 14 ++--
 scripts/qapi/introspect.py                        | 30 +++----
 scripts/qapi/schema.py                            | 98 +++++++++++++++--------
 scripts/qapi/types.py                             | 33 ++++----
 scripts/qapi/visit.py                             | 23 +++---
 tests/qapi-schema/alternate-branch-if-invalid.err |  2 +-
 tests/qapi-schema/bad-if-all.err                  |  2 +
 tests/qapi-schema/bad-if-all.json                 |  3 +
 tests/qapi-schema/bad-if-all.out                  |  0
 tests/qapi-schema/bad-if-empty-list.json          |  2 +-
 tests/qapi-schema/bad-if-empty.err                |  2 +-
 tests/qapi-schema/bad-if-key.err                  |  3 +
 tests/qapi-schema/bad-if-key.json                 |  3 +
 tests/qapi-schema/bad-if-key.out                  |  0
 tests/qapi-schema/bad-if-keys.err                 |  2 +
 tests/qapi-schema/bad-if-keys.json                |  3 +
 tests/qapi-schema/bad-if-keys.out                 |  0
 tests/qapi-schema/bad-if-list.err                 |  2 +-
 tests/qapi-schema/bad-if-list.json                |  2 +-
 tests/qapi-schema/bad-if.err                      |  2 +-
 tests/qapi-schema/bad-if.json                     |  2 +-
 tests/qapi-schema/doc-good.json                   | 16 ++--
 tests/qapi-schema/doc-good.out                    | 14 ++--
 tests/qapi-schema/doc-good.txt                    | 21 ++++-
 tests/qapi-schema/enum-if-invalid.err             |  3 +-
 tests/qapi-schema/features-if-invalid.err         |  2 +-
 tests/qapi-schema/features-missing-name.json      |  2 +-
 tests/qapi-schema/meson.build                     |  3 +
 tests/qapi-schema/qapi-schema-test.json           | 59 ++++++++------
 tests/qapi-schema/qapi-schema-test.out            | 63 ++++++++-------
 tests/qapi-schema/redefined-event.json            |  2 +-
 tests/qapi-schema/struct-member-if-invalid.err    |  2 +-
 tests/qapi-schema/test-qapi.py                    |  4 +-
 tests/qapi-schema/union-branch-if-invalid.err     |  2 +-
 tests/qapi-schema/union-branch-if-invalid.json    |  2 +-
 53 files changed, 505 insertions(+), 344 deletions(-)
 create mode 100644 tests/qapi-schema/bad-if-all.err
 create mode 100644 tests/qapi-schema/bad-if-all.json
 create mode 100644 tests/qapi-schema/bad-if-all.out
 create mode 100644 tests/qapi-schema/bad-if-key.err
 create mode 100644 tests/qapi-schema/bad-if-key.json
 create mode 100644 tests/qapi-schema/bad-if-key.out
 create mode 100644 tests/qapi-schema/bad-if-keys.err
 create mode 100644 tests/qapi-schema/bad-if-keys.json
 create mode 100644 tests/qapi-schema/bad-if-keys.out

-- 
2.31.1


