Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC5D31405E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:25:19 +0100 (CET)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9D5y-00034n-Dg
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974K-0005Yk-7x
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9740-0001an-Eq
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/RvZrvnDMHUlRGQ+ENzhnd2EpYB2eLB1lwm8K7HKqwU=;
 b=Q9PwZetcx6VTr4vvbPQi/mfKGt2LluUbR9HdT+aFYzmJsJ3eWjKqbj76ptYpm0xki+zvV6
 95oGuyChYMqI8dKlksXCGpyG+M4GvFE34Z3N63jz5tDiCBQzi5Y0ptv32tk2cfiR+VJ8Z1
 sNCk98jN6QGE8sMNeqDF4DAuaT2DRZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-nr1L58osOOycJTHoPgxL-A-1; Mon, 08 Feb 2021 08:58:49 -0500
X-MC-Unique: nr1L58osOOycJTHoPgxL-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1216380196E;
 Mon,  8 Feb 2021 13:58:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE6E860918;
 Mon,  8 Feb 2021 13:58:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B09C113865F; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/16] QAPI patches patches for 2021-02-08
Date: Mon,  8 Feb 2021 14:58:30 +0100
Message-Id: <20210208135846.3707170-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The following changes since commit 6f0e9c26dbae9ac18b89d359791008fe3432ca91:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/cgs-pull-request' into staging (2021-02-08 11:11:26 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-02-08

for you to fetch changes up to c51172667b64abc570640f141ca3bf7109fbbd17:

  qapi: enable strict-optional checks (2021-02-08 14:15:58 +0100)

----------------------------------------------------------------
QAPI patches patches for 2021-02-08

----------------------------------------------------------------
John Snow (11):
      qapi/commands: assert arg_type is not None
      qapi/events: fix visit_event typing
      qapi/main: handle theoretical None-return from re.match()
      qapi/gen: inline _wrap_ifcond into end_if()
      qapi: centralize is_[user|system|builtin]_module methods
      qapi: use explicitly internal module names
      qapi: use './builtin' as the built-in module name
      qapi: centralize the built-in module name definition
      qapi/gen: write _genc/_genh access shims
      qapi: type 'info' as Optional[QAPISourceInfo]
      qapi: enable strict-optional checks

Markus Armbruster (5):
      qapi/gen: Replace ._begin_system_module()
      qapi/gen: Combine ._add_[user|system]_module
      qapi/gen: Support switching to another module temporarily
      qapi/commands: Simplify command registry generation
      qapi/gen: Drop support for QAPIGen without a file name

 scripts/qapi/commands.py                 | 62 ++++++++++-----------
 scripts/qapi/events.py                   | 16 +++---
 scripts/qapi/gen.py                      | 94 +++++++++++++++++---------------
 scripts/qapi/main.py                     |  2 +
 scripts/qapi/mypy.ini                    |  1 -
 scripts/qapi/schema.py                   | 42 ++++++++++++--
 scripts/qapi/types.py                    |  4 +-
 scripts/qapi/visit.py                    |  6 +-
 tests/qapi-schema/comments.out           |  2 +-
 tests/qapi-schema/doc-good.out           |  2 +-
 tests/qapi-schema/empty.out              |  2 +-
 tests/qapi-schema/event-case.out         |  2 +-
 tests/qapi-schema/include-repetition.out |  2 +-
 tests/qapi-schema/include-simple.out     |  2 +-
 tests/qapi-schema/indented-expr.out      |  2 +-
 tests/qapi-schema/qapi-schema-test.out   |  2 +-
 16 files changed, 139 insertions(+), 104 deletions(-)

-- 
2.26.2


