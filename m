Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA776EEDDA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:59:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAI-0006AJ-1w; Wed, 26 Apr 2023 01:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA2-00064Y-Dk
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA0-0002kZ-DF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oZg4NSR4L/Mujdb2USzvaQev50KSWuCQXyXll7XtRyw=;
 b=Zskwj21W0mFV+VWnyW4kNNwHRdg4SCMsQOUTagwYfWQnOKvfa0iiuOvKxRkHx74JZAbtJD
 +BaAMMT76Oymy4reA+6w5wxQw9Wx0dzcBmE6yhEseO/Eg4XKLmZVQzpgsTAHXs/KKkgCrE
 sl487Sv3adhqeWfpoDbH/GVZ6zC4dCg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-IKVNnHHaNVKb2LP0hCF4JA-1; Wed, 26 Apr 2023 01:57:45 -0400
X-MC-Unique: IKVNnHHaNVKb2LP0hCF4JA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7999D185A790;
 Wed, 26 Apr 2023 05:57:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB6C14171BA;
 Wed, 26 Apr 2023 05:57:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1E6E721E66EF; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 00/17] QAPI patches patches for 2023-04-26
Date: Wed, 26 Apr 2023 07:57:27 +0200
Message-Id: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


The following changes since commit 327ec8d6c2a2223b78d311153a471036e474c5c5:

  Merge tag 'pull-tcg-20230423' of https://gitlab.com/rth7680/qemu into staging (2023-04-23 11:20:37 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2023-04-26

for you to fetch changes up to a17dbc4b79a28ffb9511f192474ffefd88214cde:

  qapi: allow unions to contain further unions (2023-04-26 07:52:45 +0200)

----------------------------------------------------------------
QAPI patches patches for 2023-04-26

----------------------------------------------------------------
Daniel P. Berrangé (2):
      qapi: support updating expected test output via make
      qapi: allow unions to contain further unions

Markus Armbruster (15):
      qapi: Fix error message format regression
      qapi/schema: Use super()
      qapi: Clean up after removal of simple unions
      qapi: Split up check_type()
      qapi: Improve error message for unexpected array types
      qapi: Simplify code a bit after previous commits
      qapi: Fix error message when type name or array is expected
      qapi: Fix to reject 'data': 'mumble' in struct
      tests/qapi-schema: Improve union discriminator coverage
      tests/qapi-schema: Rename a few conditionals
      tests/qapi-schema: Clean up positive test for conditionals
      tests/qapi-schema: Cover optional conditional struct member
      qapi: Fix code generated for optional conditional struct member
      qapi: Require boxed for conditional command and event arguments
      qapi: Improve specificity of type/member descriptions

 docs/devel/qapi-code-gen.rst                       |   5 +-
 tests/unit/test-qobject-input-visitor.c            |  47 +++++++++
 tests/unit/test-qobject-output-visitor.c           |  58 +++++++++++
 scripts/qapi/commands.py                           |   1 +
 scripts/qapi/expr.py                               | 115 +++++++++++----------
 scripts/qapi/gen.py                                |   1 +
 scripts/qapi/main.py                               |   2 +-
 scripts/qapi/schema.py                             |  31 ++++--
 scripts/qapi/visit.py                              |   2 +
 tests/qapi-schema/args-if-implicit.err             |   2 +
 tests/qapi-schema/args-if-implicit.json            |   4 +
 tests/qapi-schema/args-if-implicit.out             |   0
 tests/qapi-schema/args-if-unboxed.err              |   2 +
 tests/qapi-schema/args-if-unboxed.json             |   6 ++
 tests/qapi-schema/args-if-unboxed.out              |   0
 tests/qapi-schema/bad-data.err                     |   2 +-
 tests/qapi-schema/event-args-if-unboxed.err        |   2 +
 tests/qapi-schema/event-args-if-unboxed.json       |   4 +
 tests/qapi-schema/event-args-if-unboxed.out        |   0
 tests/qapi-schema/event-nest-struct.err            |   2 +-
 tests/qapi-schema/meson.build                      |   5 +
 tests/qapi-schema/nested-struct-data.err           |   2 +-
 tests/qapi-schema/qapi-schema-test.json            |  52 ++++++++--
 tests/qapi-schema/qapi-schema-test.out             |  61 +++++++----
 tests/qapi-schema/returns-dict.err                 |   2 +-
 tests/qapi-schema/struct-data-typename.err         |   2 +
 tests/qapi-schema/struct-data-typename.json        |   2 +
 tests/qapi-schema/struct-data-typename.out         |   0
 tests/qapi-schema/struct-member-invalid.err        |   2 +-
 tests/qapi-schema/test-qapi.py                     |   1 +
 tests/qapi-schema/union-array-branch.err           |   2 +-
 tests/qapi-schema/union-invalid-discriminator.err  |   2 +-
 tests/qapi-schema/union-invalid-discriminator.json |   4 +-
 tests/qapi-schema/union-invalid-union-subfield.err |   2 +
 .../qapi-schema/union-invalid-union-subfield.json  |  30 ++++++
 tests/qapi-schema/union-invalid-union-subfield.out |   0
 tests/qapi-schema/union-invalid-union-subtype.err  |   2 +
 tests/qapi-schema/union-invalid-union-subtype.json |  29 ++++++
 tests/qapi-schema/union-invalid-union-subtype.out  |   0
 39 files changed, 383 insertions(+), 103 deletions(-)
 create mode 100644 tests/qapi-schema/args-if-implicit.err
 create mode 100644 tests/qapi-schema/args-if-implicit.json
 create mode 100644 tests/qapi-schema/args-if-implicit.out
 create mode 100644 tests/qapi-schema/args-if-unboxed.err
 create mode 100644 tests/qapi-schema/args-if-unboxed.json
 create mode 100644 tests/qapi-schema/args-if-unboxed.out
 create mode 100644 tests/qapi-schema/event-args-if-unboxed.err
 create mode 100644 tests/qapi-schema/event-args-if-unboxed.json
 create mode 100644 tests/qapi-schema/event-args-if-unboxed.out
 create mode 100644 tests/qapi-schema/struct-data-typename.err
 create mode 100644 tests/qapi-schema/struct-data-typename.json
 create mode 100644 tests/qapi-schema/struct-data-typename.out
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.err
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.json
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.out
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.err
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.json
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.out

-- 
2.39.2


