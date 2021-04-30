Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0EB36FA6D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:37:47 +0200 (CEST)
Received: from localhost ([::1]:34042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSOw-0004TC-GM
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRde-0002zT-Dh
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdX-0007az-RC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jgwRaH9gNejUXAUtdvU+a1wPDOCvKmtKufz1ptPX0mk=;
 b=DV9xfeg6W38bCCAS9X4utdnHuTBe/E96OyibkQihikO8vKUyJ2T3f2UKoKAQTiPlUzE94I
 BI/m7LNuugUlFESostZVvWmT0NRzhr5azeVsY2vl/2QObBuEA3TJnaNoxPFkFnyIQQdOCT
 +LeeTRekaApVCKWhe9qRS5I55uKcYzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-3MSo4LipPvOHJR5O5KdrLw-1; Fri, 30 Apr 2021 07:48:40 -0400
X-MC-Unique: 3MSo4LipPvOHJR5O5KdrLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27BBF801106;
 Fri, 30 Apr 2021 11:48:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBA8A5B684;
 Fri, 30 Apr 2021 11:48:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B0E7113525D; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/25] QAPI patches patches for 2021-04-30
Date: Fri, 30 Apr 2021 13:48:13 +0200
Message-Id: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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

The following changes since commit ccdf06c1db192152ac70a1dd974c624f566cb7d4:

  Open 6.1 development tree (2021-04-30 11:15:40 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-04-30

for you to fetch changes up to b54626e0b8f423e91b2e31fa7741e4954cebd2d6:

  qapi/error.py: enable mypy checks (2021-04-30 12:59:54 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-04-30

----------------------------------------------------------------
John Snow (25):
      qapi/expr: Comment cleanup
      qapi/expr.py: Remove 'info' argument from nested check_if_str
      qapi/expr.py: Check for dict instead of OrderedDict
      qapi/expr.py: constrain incoming expression types
      qapi/expr.py: Add assertion for union type 'check_dict'
      qapi/expr.py: move string check upwards in check_type
      qapi/expr.py: Check type of union and alternate 'data' member
      qapi/expr.py: Add casts in a few select cases
      qapi/expr.py: Modify check_keys to accept any Collection
      qapi/expr.py: add type hint annotations
      qapi/expr.py: Consolidate check_if_str calls in check_if
      qapi/expr.py: Remove single-letter variable
      qapi/expr.py: enable pylint checks
      qapi/expr: Only explicitly prohibit 'Kind' nor 'List' for type names
      qapi/expr.py: Add docstrings
      qapi/expr.py: Use tuples instead of lists for static data
      qapi/expr: Update authorship and copyright information
      qapi/error: Repurpose QAPIError as an abstract base exception class
      qapi/error: Use Python3-style super()
      qapi/error: Make QAPISourceError 'col' parameter optional
      qapi/error: assert QAPISourceInfo is not None
      qapi/error.py: move QAPIParseError to parser.py
      qapi/error.py: enable pylint checks
      qapi/error: Add type hints
      qapi/error.py: enable mypy checks

 docs/sphinx/qapidoc.py                        |   3 +-
 scripts/qapi/error.py                         |  51 +--
 scripts/qapi/expr.py                          | 444 +++++++++++++++++++++-----
 scripts/qapi/mypy.ini                         |  10 -
 scripts/qapi/parser.py                        |  14 +-
 scripts/qapi/pylintrc                         |   4 +-
 scripts/qapi/schema.py                        |   4 +-
 tests/qapi-schema/alternate-data-invalid.err  |   2 +
 tests/qapi-schema/alternate-data-invalid.json |   4 +
 tests/qapi-schema/alternate-data-invalid.out  |   0
 tests/qapi-schema/meson.build                 |   2 +
 tests/qapi-schema/union-invalid-data.err      |   2 +
 tests/qapi-schema/union-invalid-data.json     |   6 +
 tests/qapi-schema/union-invalid-data.out      |   0
 14 files changed, 432 insertions(+), 114 deletions(-)
 create mode 100644 tests/qapi-schema/alternate-data-invalid.err
 create mode 100644 tests/qapi-schema/alternate-data-invalid.json
 create mode 100644 tests/qapi-schema/alternate-data-invalid.out
 create mode 100644 tests/qapi-schema/union-invalid-data.err
 create mode 100644 tests/qapi-schema/union-invalid-data.json
 create mode 100644 tests/qapi-schema/union-invalid-data.out

-- 
2.26.3


