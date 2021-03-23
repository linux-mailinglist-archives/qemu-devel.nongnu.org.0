Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C490346B7A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:59:03 +0100 (CET)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOp3G-000148-BK
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1O-0006uX-Sc
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1M-0002kD-8W
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EKpELVK1TpB7YOT1DjIdAGqIZiqRQuwwY4bz43mxtcI=;
 b=TdnNoYlUiWbAXe7NUOYJl7fK8/3+fat7NQPHMWSBiGMFA7mcXs5WuYh0IkmT0Bs4OCgHBF
 QrNB2cj8Z8dS42rGlgCqrK18qnJ8EJ+fh8vreeNQ/3Lb6Vnb4FbFIDk5BFQq9uQPt8SR5f
 01t3u6p13LBq3ryggKsIXplWigDZMe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-7GWUL3liOw-u_EtAJ_WHYA-1; Tue, 23 Mar 2021 17:57:01 -0400
X-MC-Unique: 7GWUL3liOw-u_EtAJ_WHYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4866383DD21;
 Tue, 23 Mar 2021 21:57:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E776D60877;
 Tue, 23 Mar 2021 21:56:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D07A11327E1; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/29] QAPI patches patches for 2021-03-23
Date: Tue, 23 Mar 2021 22:56:29 +0100
Message-Id: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9950da284fa5e2ea9ab57d87e05b693fb60c79ce:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210322-2' into staging (2021-03-23 15:30:46 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-03-23

for you to fetch changes up to bdabafc6836edc0f34732cac473899cb4e77a296:

  block: Remove monitor command block_passwd (2021-03-23 22:31:56 +0100)

----------------------------------------------------------------
QAPI patches patches for 2021-03-23

----------------------------------------------------------------
Markus Armbruster (29):
      qapi/pragma: Tidy up after removal of deprecated commands
      tests/qapi-schema: Drop redundant flat-union-inline test
      tests/qapi-schema: Rework comments on longhand member definitions
      tests/qapi-schema: Belatedly update comment on alternate clash
      tests/qapi-schema: Drop TODO comment on simple unions
      tests/qapi-schema: Tweak to demonstrate buggy member name check
      qapi: Fix to reject optional members with reserved names
      qapi: Permit flat union members for any tag value
      qapi: Lift enum-specific code out of check_name_str()
      qapi: Rework name checking in preparation of stricter checking
      qapi: Move uppercase rejection to check_name_lower()
      qapi: Consistently permit any case in downstream prefixes
      qapi: Enforce event naming rules
      qapi: Enforce type naming rules
      tests/qapi-schema: Rename redefined-builtin to redefined-predefined
      qapi: Factor out QAPISchemaParser._check_pragma_list_of_str()
      tests/qapi-schema: Rename pragma-*-crap to pragma-value-not-*
      tests/qapi-schema: Rename returns-whitelist to returns-bad-type
      qapi: Rename pragma *-whitelist to *-exceptions
      qapi/pragma: Streamline comments on member-name-exceptions
      tests-qmp-cmds: Drop unused and incorrect qmp_TestIfCmd()
      qapi: Prepare for rejecting underscore in command and member names
      qapi: Enforce feature naming rules
      qapi: Enforce command naming rules
      tests/qapi-schema: Switch member name clash test to struct
      qapi: Enforce struct member naming rules
      qapi: Enforce enum member naming rules
      qapi: Enforce union and alternate branch naming rules
      block: Remove monitor command block_passwd

 docs/devel/qapi-code-gen.txt                       | 28 ++++---
 qapi/block-core.json                               | 14 ----
 qapi/pragma.json                                   | 64 ++++++++++++---
 qga/qapi-schema.json                               |  6 +-
 block/monitor/block-hmp-cmds.c                     | 10 ---
 blockdev.c                                         |  8 --
 tests/unit/test-qmp-cmds.c                         | 17 ++--
 tests/unit/test-qmp-event.c                        |  6 +-
 hmp-commands.hx                                    | 15 ----
 scripts/qapi/common.py                             |  8 +-
 scripts/qapi/expr.py                               | 94 ++++++++++++++--------
 scripts/qapi/parser.py                             | 30 +++----
 scripts/qapi/schema.py                             |  2 +-
 scripts/qapi/source.py                             | 10 ++-
 tests/qapi-schema/alternate-clash.err              |  2 +-
 tests/qapi-schema/alternate-clash.json             |  9 +--
 tests/qapi-schema/args-member-case.err             |  2 +-
 tests/qapi-schema/args-name-clash.err              |  2 -
 tests/qapi-schema/args-name-clash.json             |  4 -
 tests/qapi-schema/doc-bad-union-member.json        |  4 +-
 tests/qapi-schema/doc-good.json                    |  4 +-
 tests/qapi-schema/doc-good.out                     |  4 +-
 tests/qapi-schema/doc-good.txt                     |  2 +-
 tests/qapi-schema/doc-invalid-return.json          |  4 +-
 tests/qapi-schema/double-type.err                  |  2 +-
 tests/qapi-schema/double-type.json                 |  2 +-
 tests/qapi-schema/enum-clash-member.err            |  2 +-
 tests/qapi-schema/enum-clash-member.json           |  1 +
 tests/qapi-schema/enum-member-case.err             |  2 +-
 tests/qapi-schema/enum-member-case.json            |  2 +-
 tests/qapi-schema/event-case.err                   |  2 +
 tests/qapi-schema/event-case.json                  |  2 -
 tests/qapi-schema/event-case.out                   | 14 ----
 tests/qapi-schema/event-member-invalid-dict.err    |  2 +-
 tests/qapi-schema/event-member-invalid-dict.json   |  2 +
 tests/qapi-schema/features-deprecated-type.err     |  2 +-
 tests/qapi-schema/features-deprecated-type.json    |  2 +-
 .../flat-union-inline-invalid-dict.json            |  4 +-
 tests/qapi-schema/flat-union-inline.err            |  2 -
 tests/qapi-schema/flat-union-inline.json           | 11 ---
 tests/qapi-schema/flat-union-no-base.err           |  2 +-
 tests/qapi-schema/flat-union-no-base.json          |  1 -
 tests/qapi-schema/meson.build                      | 14 ++--
 .../nested-struct-data-invalid-dict.err            |  2 +-
 .../nested-struct-data-invalid-dict.json           |  3 +-
 tests/qapi-schema/nested-struct-data.json          |  2 +-
 tests/qapi-schema/pragma-doc-required-crap.err     |  1 -
 .../pragma-name-case-whitelist-crap.err            |  1 -
 .../pragma-name-case-whitelist-crap.json           |  3 -
 .../qapi-schema/pragma-returns-whitelist-crap.err  |  1 -
 .../qapi-schema/pragma-returns-whitelist-crap.json |  3 -
 tests/qapi-schema/pragma-value-not-bool.err        |  1 +
 ...quired-crap.json => pragma-value-not-bool.json} |  2 +-
 ...gs-name-clash.out => pragma-value-not-bool.out} |  0
 tests/qapi-schema/pragma-value-not-list-of-str.err |  1 +
 .../qapi-schema/pragma-value-not-list-of-str.json  |  3 +
 ...inline.out => pragma-value-not-list-of-str.out} |  0
 tests/qapi-schema/pragma-value-not-list.err        |  1 +
 tests/qapi-schema/pragma-value-not-list.json       |  2 +
 ...required-crap.out => pragma-value-not-list.out} |  0
 tests/qapi-schema/qapi-schema-test.json            | 35 ++++----
 tests/qapi-schema/qapi-schema-test.out             | 42 +++++-----
 tests/qapi-schema/redefined-builtin.err            |  2 -
 tests/qapi-schema/redefined-builtin.json           |  2 -
 tests/qapi-schema/redefined-predefined.err         |  2 +
 tests/qapi-schema/redefined-predefined.json        |  2 +
 ...whitelist-crap.out => redefined-predefined.out} |  0
 tests/qapi-schema/redefined-type.err               |  6 +-
 tests/qapi-schema/redefined-type.json              |  4 +-
 tests/qapi-schema/reserved-member-u.err            |  2 +-
 tests/qapi-schema/reserved-member-u.json           |  2 +-
 tests/qapi-schema/returns-bad-type.err             |  2 +
 ...eturns-whitelist.json => returns-bad-type.json} |  2 +-
 ...rns-whitelist-crap.out => returns-bad-type.out} |  0
 tests/qapi-schema/returns-whitelist.err            |  2 -
 tests/qapi-schema/struct-data-invalid.err          |  2 +-
 tests/qapi-schema/struct-data-invalid.json         |  2 +-
 tests/qapi-schema/struct-member-invalid-dict.err   |  4 +-
 tests/qapi-schema/struct-member-invalid-dict.json  |  5 +-
 tests/qapi-schema/struct-member-invalid.err        |  2 +-
 tests/qapi-schema/struct-member-invalid.json       |  2 +-
 tests/qapi-schema/struct-member-name-clash.err     |  2 +
 tests/qapi-schema/struct-member-name-clash.json    |  5 ++
 ...ed-builtin.out => struct-member-name-clash.out} |  0
 tests/qapi-schema/type-case.err                    |  2 +
 tests/qapi-schema/type-case.json                   |  2 +
 .../{returns-whitelist.out => type-case.out}       |  0
 tests/qapi-schema/union-branch-case.err            |  2 +-
 tests/qapi-schema/union-clash-branches.err         |  2 +-
 tests/qapi-schema/union-clash-branches.json        |  6 +-
 tests/qapi-schema/unknown-expr-key.err             |  2 +-
 tests/qapi-schema/unknown-expr-key.json            |  2 +-
 92 files changed, 305 insertions(+), 288 deletions(-)
 delete mode 100644 tests/qapi-schema/args-name-clash.err
 delete mode 100644 tests/qapi-schema/args-name-clash.json
 delete mode 100644 tests/qapi-schema/flat-union-inline.err
 delete mode 100644 tests/qapi-schema/flat-union-inline.json
 delete mode 100644 tests/qapi-schema/pragma-doc-required-crap.err
 delete mode 100644 tests/qapi-schema/pragma-name-case-whitelist-crap.err
 delete mode 100644 tests/qapi-schema/pragma-name-case-whitelist-crap.json
 delete mode 100644 tests/qapi-schema/pragma-returns-whitelist-crap.err
 delete mode 100644 tests/qapi-schema/pragma-returns-whitelist-crap.json
 create mode 100644 tests/qapi-schema/pragma-value-not-bool.err
 rename tests/qapi-schema/{pragma-doc-required-crap.json => pragma-value-not-bool.json} (55%)
 rename tests/qapi-schema/{args-name-clash.out => pragma-value-not-bool.out} (100%)
 create mode 100644 tests/qapi-schema/pragma-value-not-list-of-str.err
 create mode 100644 tests/qapi-schema/pragma-value-not-list-of-str.json
 rename tests/qapi-schema/{flat-union-inline.out => pragma-value-not-list-of-str.out} (100%)
 create mode 100644 tests/qapi-schema/pragma-value-not-list.err
 create mode 100644 tests/qapi-schema/pragma-value-not-list.json
 rename tests/qapi-schema/{pragma-doc-required-crap.out => pragma-value-not-list.out} (100%)
 delete mode 100644 tests/qapi-schema/redefined-builtin.err
 delete mode 100644 tests/qapi-schema/redefined-builtin.json
 create mode 100644 tests/qapi-schema/redefined-predefined.err
 create mode 100644 tests/qapi-schema/redefined-predefined.json
 rename tests/qapi-schema/{pragma-name-case-whitelist-crap.out => redefined-predefined.out} (100%)
 create mode 100644 tests/qapi-schema/returns-bad-type.err
 rename tests/qapi-schema/{returns-whitelist.json => returns-bad-type.json} (91%)
 rename tests/qapi-schema/{pragma-returns-whitelist-crap.out => returns-bad-type.out} (100%)
 delete mode 100644 tests/qapi-schema/returns-whitelist.err
 create mode 100644 tests/qapi-schema/struct-member-name-clash.err
 create mode 100644 tests/qapi-schema/struct-member-name-clash.json
 rename tests/qapi-schema/{redefined-builtin.out => struct-member-name-clash.out} (100%)
 create mode 100644 tests/qapi-schema/type-case.err
 create mode 100644 tests/qapi-schema/type-case.json
 rename tests/qapi-schema/{returns-whitelist.out => type-case.out} (100%)

-- 
2.26.3


