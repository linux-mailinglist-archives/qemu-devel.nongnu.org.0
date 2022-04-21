Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1891F50A2B8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:37:44 +0200 (CEST)
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXwF-0003Vp-5a
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqQ-0002Zp-DS
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqN-0004KT-K7
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650551498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ji3xe9u4KJDmULF5Mf/ekH2tXe8iVfpRG1vjaxzVTFw=;
 b=ccV1/1U3/0xQ7xafAsn6XADtjvn7W5rXjPPUjXlGUKu0EQR+c+RzsK4Skcy0dPVO5AQWae
 MZTlQSX9k+ClQvDlmj5QwYJPtCEmlMVO5oRkiXVikn4YY2MO3HlpJjYVq5r99kLflgnVcv
 v+hS430IOQprhiLjo27sh7By7jIPlzE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-S16MmNLXMiSoLSJNvOO0XQ-1; Thu, 21 Apr 2022 10:31:37 -0400
X-MC-Unique: S16MmNLXMiSoLSJNvOO0XQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE90F3811A37;
 Thu, 21 Apr 2022 14:31:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6512026D07;
 Thu, 21 Apr 2022 14:31:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0D5C21E6A1F; Thu, 21 Apr 2022 16:31:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] QAPI patches patches for 2022-04-21
Date: Thu, 21 Apr 2022 16:31:28 +0200
Message-Id: <20220421143135.1491256-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9c125d17e9402c232c46610802e5931b3639d77b:

  Merge tag 'pull-tcg-20220420' of https://gitlab.com/rth7680/qemu into staging (2022-04-20 16:43:11 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-04-21

for you to fetch changes up to de7371bc7c39ccacb963acb5129b261087967070:

  qapi: Fix version of cpu0-id field (2022-04-21 10:23:06 +0200)

----------------------------------------------------------------
QAPI patches patches for 2022-04-21

----------------------------------------------------------------
Andrea Bolognani (3):
      docs: qapi: Remove outdated reference to simple unions
      qapi: Fix documentation for query-xen-replication-status
      qapi: Fix typo

Dov Murik (1):
      qapi: Fix version of cpu0-id field

Paolo Bonzini (3):
      qapi-schema: support alternates with array type
      qapi-schema: test: add a qapi-schema-test for array alternates
      qapi-schema: test: add a unit test for parsing array alternates

 docs/devel/qapi-code-gen.rst                    |  4 +--
 qapi/migration.json                             |  2 +-
 qapi/misc-target.json                           |  2 +-
 qapi/sockets.json                               |  2 +-
 tests/unit/test-qobject-input-visitor.c         | 40 +++++++++++++++++++++++++
 scripts/qapi/expr.py                            |  2 +-
 scripts/qapi/schema.py                          |  4 +++
 tests/qapi-schema/alternate-array.err           |  2 --
 tests/qapi-schema/alternate-array.json          |  2 --
 tests/qapi-schema/alternate-array.out           | 18 +++++++++++
 tests/qapi-schema/alternate-conflict-lists.err  |  2 ++
 tests/qapi-schema/alternate-conflict-lists.json |  6 ++++
 tests/qapi-schema/alternate-conflict-lists.out  |  0
 tests/qapi-schema/meson.build                   |  1 +
 tests/qapi-schema/qapi-schema-test.json         |  1 +
 tests/qapi-schema/qapi-schema-test.out          |  4 +++
 16 files changed, 82 insertions(+), 10 deletions(-)
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.err
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.json
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.out

-- 
2.35.1


