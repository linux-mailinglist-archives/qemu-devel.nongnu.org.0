Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3221A40CD2D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 21:27:23 +0200 (CEST)
Received: from localhost ([::1]:46138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQaYz-00068n-N5
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 15:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQaWX-00047K-4H
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 15:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQaWT-0000R1-Vc
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 15:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631733884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0iUegX8ej2egtKiYdbAIatVGDJMCcRm9KxS7WotGcB0=;
 b=UwpXLQdYD5TT4hkU4IoOBGbopy5aDwFqUOhXyiW8uRzxWjSn9HuQaIvAKOcfvUso6ytrIr
 dMBvwyFCs1pd9qm0DuHKiDegdSX0SO7/LIIH3p3LfwUkQlNuk8H9cnsRdki3vKFcBV288l
 LC4IVqjE6H3ub4Nn63DRKnhxPToJuMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-RleBhoB6PDmyxbJUQMmchQ-1; Wed, 15 Sep 2021 15:24:40 -0400
X-MC-Unique: RleBhoB6PDmyxbJUQMmchQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD781006AA8;
 Wed, 15 Sep 2021 19:24:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96BC161093;
 Wed, 15 Sep 2021 19:24:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1D4E5113865F; Wed, 15 Sep 2021 21:24:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/5] Subject: [PATCH RFC 0/5] qapi: Add feature flags to
 enum members
Date: Wed, 15 Sep 2021 21:24:20 +0200
Message-Id: <20210915192425.4104210-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PATCH 1+2 add feature flags to enum members.  Awkward due to an
introspection design mistake; see PATCH 1 for details.  Feedback
welcome, in particular from management application guys.

PATCH 3+4 implement policy deprecated-input={reject,crash} for enum
values.

Policy deprecated-output=hide is not implemented, because we can't
hide a value without hiding the entire member, which is almost
certainly more than the requester of this policy bargained for.
Perhaps we want a new policy deprecated-output=crash to help us catch
unwanted use of deprecated enum values.  Thoughts?

PATCH 5 puts the new feature flags to use.  It makes sense only on top
of Vladimir's deprecation of drive-backup.  See its commit message for
a reference.

Based on my "[PATCH 00/22] qapi: Remove simple unions from the schema
language".

Based-on: Message-Id: <20210913123932.3306639-1-armbru@redhat.com>

Markus Armbruster (5):
  qapi: Enable enum member introspection to show more than name
  qapi: Add feature flags to enum members
  qapi: Move compat policy from QObject to generic visitor
  qapi: Implement deprecated-input={reject,crash} for enum values
  block: Deprecate transaction type drive-backup

 docs/devel/qapi-code-gen.rst                  |  4 ++-
 qapi/compat.json                              |  3 +++
 qapi/introspect.json                          | 23 ++++++++++++++--
 qapi/transaction.json                         |  5 +++-
 include/qapi/qobject-input-visitor.h          |  4 ---
 include/qapi/qobject-output-visitor.h         |  4 ---
 include/qapi/util.h                           |  6 ++++-
 include/qapi/visitor-impl.h                   |  3 +++
 include/qapi/visitor.h                        |  9 +++++++
 qapi/qapi-visit-core.c                        | 27 ++++++++++++++++---
 qapi/qmp-dispatch.c                           |  4 +--
 qapi/qobject-input-visitor.c                  | 14 +---------
 qapi/qobject-output-visitor.c                 | 14 +---------
 scripts/qapi/expr.py                          |  3 ++-
 scripts/qapi/introspect.py                    | 19 ++++++++++---
 scripts/qapi/schema.py                        | 22 +++++++++++++--
 scripts/qapi/types.py                         | 17 +++++++++++-
 tests/qapi-schema/doc-good.json               |  5 +++-
 tests/qapi-schema/doc-good.out                |  3 +++
 tests/qapi-schema/doc-good.txt                |  3 +++
 .../qapi-schema/enum-dict-member-unknown.err  |  2 +-
 tests/qapi-schema/qapi-schema-test.json       |  3 ++-
 tests/qapi-schema/qapi-schema-test.out        |  1 +
 tests/qapi-schema/test-qapi.py                |  1 +
 24 files changed, 144 insertions(+), 55 deletions(-)

-- 
2.31.1


