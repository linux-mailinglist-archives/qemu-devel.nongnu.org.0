Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4DA4005E4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:36:14 +0200 (CEST)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEyz-0000Bb-Is
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvB-0005cK-Ri
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEv8-0003Xp-V8
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IuIjet2vdbDq+ZiNAUdWEVVyAsp9N9jTHFgfDjr8YPU=;
 b=eAeTSh8Ms5+k9M/bIIR4cM25hySRgDhCvWSmFoNZQnlnIFJMpEL/PH0nwUerQ5iREQ6uRt
 1qJMlrCKjqcNko2+zSCE29xuIZ0JBd6w0zlN7LeT1AxEFzA1gXmPU/UI+QMT8L0eVRUMRN
 8uK3mqJkTNqwml7TByWOsclVwjSnHLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-JGsF_XZbNmi4MAxUYlUz2w-1; Fri, 03 Sep 2021 15:32:12 -0400
X-MC-Unique: JGsF_XZbNmi4MAxUYlUz2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 580B3107ACC7;
 Fri,  3 Sep 2021 19:32:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C1995F706;
 Fri,  3 Sep 2021 19:32:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BA4C31138606; Fri,  3 Sep 2021 21:32:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] QAPI patches patches for 2021-09-03
Date: Fri,  3 Sep 2021 21:31:56 +0200
Message-Id: <20210903193209.1426791-1-armbru@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:

  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-09-03

for you to fetch changes up to 34f7b25e575a93182b7c0a3558caac34e26227cf:

  qapi: Tweak error messages for unknown / conflicting 'if' keys (2021-09-03 17:09:10 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-09-03

----------------------------------------------------------------
Guoyi Tu (1):
      qapi: Set boolean value correctly in examples

Markus Armbruster (12):
      qapi: Simplify QAPISchemaIfCond's interface for generating C
      qapi: Simplify how QAPISchemaIfCond represents "no condition"
      tests/qapi-schema: Correct two 'if' conditionals
      tests/qapi-schema: Demonstrate broken C code for 'if'
      qapi: Fix C code generation for 'if'
      qapi: Factor common recursion out of cgen_ifcond(), docgen_ifcond()
      qapi: Avoid redundant parens in code generated for conditionals
      qapi: Use "not COND" instead of "!COND" for generated documentation
      qapi: Use re.fullmatch() where appropriate
      tests/qapi-schema: Hide OrderedDict in test output
      qapi: Tweak error messages for missing / conflicting meta-type
      qapi: Tweak error messages for unknown / conflicting 'if' keys

 qapi/trace.json                         |  2 +-
 scripts/qapi/common.py                  | 51 +++++++++++++++++++--------------
 scripts/qapi/expr.py                    | 32 +++++++++------------
 scripts/qapi/gen.py                     |  6 ++--
 scripts/qapi/introspect.py              | 11 ++-----
 scripts/qapi/schema.py                  | 12 ++++++--
 scripts/qapi/types.py                   | 28 +++++++-----------
 scripts/qapi/visit.py                   | 14 ++++-----
 tests/qapi-schema/bad-if-key.err        |  2 +-
 tests/qapi-schema/bad-if-keys.err       |  2 +-
 tests/qapi-schema/doc-good.json         |  2 +-
 tests/qapi-schema/doc-good.out          |  6 ++--
 tests/qapi-schema/doc-good.txt          |  8 +++---
 tests/qapi-schema/double-type.err       |  4 +--
 tests/qapi-schema/enum-if-invalid.err   |  2 +-
 tests/qapi-schema/missing-type.err      |  2 +-
 tests/qapi-schema/qapi-schema-test.json |  9 ++++--
 tests/qapi-schema/qapi-schema-test.out  | 31 +++++++++++---------
 tests/qapi-schema/test-qapi.py          | 11 ++++++-
 19 files changed, 121 insertions(+), 114 deletions(-)

-- 
2.31.1


