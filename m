Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3628738B595
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:54:59 +0200 (CEST)
Received: from localhost ([::1]:42318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmss-0005Tx-7u
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmr4-0002k9-Ki
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmr1-0006Yt-1j
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621533180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ey02Bdo722p3zZY39FxzeigeDvjW/9E9wUF1+3bTNHI=;
 b=XRy9wiandJROPen3qn3mj7QHUxn09O5wdl6TEQXZ5HhdAjLg58f+M/H+FUDs+qS5D/DkMZ
 Oaf6BvnZ3vgsimiPYr+2KcB2twb+Y5GUhQWwGcLMT6f3EH0mK1clHjDLbmcYQYF8aeN6Cr
 QwFMsEYH8kztL9IZcsU8Fhn1T1jb53M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-L_2CQnjCNvifqBpSZ_lffA-1; Thu, 20 May 2021 13:52:58 -0400
X-MC-Unique: L_2CQnjCNvifqBpSZ_lffA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4D251007B16;
 Thu, 20 May 2021 17:52:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 998596064B;
 Thu, 20 May 2021 17:52:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 359A7113865F; Thu, 20 May 2021 19:52:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] QAPI patches patches for 2021-05-20
Date: Thu, 20 May 2021 19:52:41 +0200
Message-Id: <20210520175256.1119684-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

The following changes since commit d874bc081600528f0400977460b4f98f21e156a1:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-05-19 16:10:35 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-05-20

for you to fetch changes up to d4092ffa2604e07b2e1bb5b1f7b2651bc1edda80:

  qapi/parser: add docstrings (2021-05-20 17:10:09 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-05-20

----------------------------------------------------------------
John Snow (15):
      qapi/parser: Don't try to handle file errors
      qapi: Add test for nonexistent schema file
      qapi/source: Remove line number from QAPISourceInfo initializer
      qapi/parser: factor parsing routine into method
      qapi/parser: Assert lexer value is a string
      qapi/parser: enforce all top-level expressions must be dict in _parse()
      qapi/parser: assert object keys are strings
      qapi/parser: Use @staticmethod where appropriate
      qapi: add must_match helper
      qapi/parser: Fix token membership tests when token can be None
      qapi/parser: Rework _check_pragma_list_of_str as a TypeGuard
      qapi/parser: add type hint annotations
      qapi/parser: Remove superfluous list comprehension
      qapi/parser: allow 'ch' variable name
      qapi/parser: add docstrings

 scripts/qapi/common.py                             |   8 +-
 scripts/qapi/main.py                               |   6 +-
 scripts/qapi/parser.py                             | 230 +++++++++++++++------
 scripts/qapi/pylintrc                              |   1 +
 scripts/qapi/schema.py                             |  11 +-
 scripts/qapi/source.py                             |  13 +-
 tests/qapi-schema/meson.build                      |   9 +-
 tests/qapi-schema/missing-array-rsqb.err           |   1 +
 tests/qapi-schema/missing-array-rsqb.json          |   1 +
 tests/qapi-schema/missing-array-rsqb.out           |   0
 .../qapi-schema/missing-object-member-element.err  |   1 +
 .../qapi-schema/missing-object-member-element.json |   1 +
 .../qapi-schema/missing-object-member-element.out  |   0
 tests/qapi-schema/missing-schema.err               |   1 +
 tests/qapi-schema/missing-schema.out               |   0
 tests/qapi-schema/non-objects.err                  |   2 +-
 tests/qapi-schema/quoted-structural-chars.err      |   2 +-
 tests/qapi-schema/test-qapi.py                     |   3 -
 18 files changed, 209 insertions(+), 81 deletions(-)
 create mode 100644 tests/qapi-schema/missing-array-rsqb.err
 create mode 100644 tests/qapi-schema/missing-array-rsqb.json
 create mode 100644 tests/qapi-schema/missing-array-rsqb.out
 create mode 100644 tests/qapi-schema/missing-object-member-element.err
 create mode 100644 tests/qapi-schema/missing-object-member-element.json
 create mode 100644 tests/qapi-schema/missing-object-member-element.out
 create mode 100644 tests/qapi-schema/missing-schema.err
 create mode 100644 tests/qapi-schema/missing-schema.out

-- 
2.26.3


