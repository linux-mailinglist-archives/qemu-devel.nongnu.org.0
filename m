Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B6408892
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 11:53:20 +0200 (CEST)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPieN-0002s5-Ri
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 05:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPibz-00007R-FP
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:50:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPibu-000726-1C
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631526644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xwbFpP71CZMVK/ixDr4txWgRx23L/1jMi9GQ6faoV2M=;
 b=N/Hn1HuO9B4A1muJb3J+66UdU6Jid3OEMgwA8QVEQX7umtCG4krVSsZKnZlrVvKOtg7XYg
 rYmLq22zpRGU7Dq+Ig1JXJy+98dwQFgLxKOi82Ve1e6nhjhksPANRAu1l5YbJ+8xgQUGZ3
 agcd37yzzz5bxNHw6m86qKWql86pffg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-5osQEvLzMVOKgNzGKQy4Mw-1; Mon, 13 Sep 2021 05:50:41 -0400
X-MC-Unique: 5osQEvLzMVOKgNzGKQy4Mw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EEE01084688;
 Mon, 13 Sep 2021 09:50:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3C2A5D9D3;
 Mon, 13 Sep 2021 09:50:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 683ED113865F; Mon, 13 Sep 2021 11:50:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] QAPI patches patches for 2021-09-13
Date: Mon, 13 Sep 2021 11:50:33 +0200
Message-Id: <20210913095038.3040776-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

The following changes since commit abf7aee72ea66944a62962603e4c2381f5e473e7:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/s390x-pull-request-2021-09-07' into staging (2021-09-07 17:46:13 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-09-13

for you to fetch changes up to 62f27589f8549d6cf1f7fe21ed55ce6f2f705450:

  qapi: Fix bogus error for 'if': { 'not': '' } (2021-09-08 15:30:30 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-09-13

----------------------------------------------------------------
Markus Armbruster (5):
      qapi: Fix a botched type annotation
      qapi: Drop Indentation.__bool__()
      qapi: Bury some unused code in class Indentation
      tests/qapi-schema: Cover 'not' condition with empty argument
      qapi: Fix bogus error for 'if': { 'not': '' }

 scripts/qapi/common.py            | 19 ++++++-------------
 scripts/qapi/expr.py              | 21 +++++++++++++--------
 tests/qapi-schema/bad-if-not.err  |  2 ++
 tests/qapi-schema/bad-if-not.json |  3 +++
 tests/qapi-schema/bad-if-not.out  |  0
 tests/qapi-schema/meson.build     |  1 +
 6 files changed, 25 insertions(+), 21 deletions(-)
 create mode 100644 tests/qapi-schema/bad-if-not.err
 create mode 100644 tests/qapi-schema/bad-if-not.json
 create mode 100644 tests/qapi-schema/bad-if-not.out

Markus Armbruster (5):
  qapi: Fix a botched type annotation
  qapi: Drop Indentation.__bool__()
  qapi: Bury some unused code in class Indentation
  tests/qapi-schema: Cover 'not' condition with empty argument
  qapi: Fix bogus error for 'if': { 'not': '' }

 scripts/qapi/common.py            | 19 ++++++-------------
 scripts/qapi/expr.py              | 21 +++++++++++++--------
 tests/qapi-schema/bad-if-not.err  |  2 ++
 tests/qapi-schema/bad-if-not.json |  3 +++
 tests/qapi-schema/bad-if-not.out  |  0
 tests/qapi-schema/meson.build     |  1 +
 6 files changed, 25 insertions(+), 21 deletions(-)
 create mode 100644 tests/qapi-schema/bad-if-not.err
 create mode 100644 tests/qapi-schema/bad-if-not.json
 create mode 100644 tests/qapi-schema/bad-if-not.out

-- 
2.31.1


