Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ABD43CEE6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:45:10 +0200 (CEST)
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfm32-0002fO-R6
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfl6D-0004ak-8G
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:44:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfl68-000410-0K
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635349454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IeCsMiDlLzvb8puonzb7Bjjd5X2XYpuY5Dx+qHjeVck=;
 b=RNKFhZrj29TeWnEwQ7XhaDl/cMpJW40mj29dF9dFJ3KCUd66pYrjK3VnhSqjh+O9z2bTVH
 dIyiqQWZUe7op0BZH2wmZnL4RlR0qbHH2WRNOn3bNsQjXxy+pvsJ7KV6NBdY0NREY0onOt
 Fq1Vz5XtUBFiGh+BlzOeXTKQvOvUmJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-BI4iOHuAO2635Dwb_rZ84g-1; Wed, 27 Oct 2021 11:44:09 -0400
X-MC-Unique: BI4iOHuAO2635Dwb_rZ84g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3A591B2C981;
 Wed, 27 Oct 2021 15:44:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 836326A905;
 Wed, 27 Oct 2021 15:44:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 17B4511380A7; Wed, 27 Oct 2021 17:44:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] QAPI patches patches for 2021-10-27
Date: Wed, 27 Oct 2021 17:44:02 +0200
Message-Id: <20211027154407.214122-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 931ce30859176f0f7daac6bac255dae5eb21284e:

  Merge remote-tracking branch 'remotes/dagrh/tags/pull-virtiofs-20211026' into staging (2021-10-26 07:38:41 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-10-27

for you to fetch changes up to aa2370444b62f8f9a809c024d0c41cb40658a5c3:

  qapi: Implement deprecated-input={reject,crash} for enum values (2021-10-27 17:19:34 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-10-27

----------------------------------------------------------------
Markus Armbruster (5):
      qapi: Improve input_type_enum()'s error message
      qapi: Enable enum member introspection to show more than name
      qapi: Add feature flags to enum members
      qapi: Move compat policy from QObject to generic visitor
      qapi: Implement deprecated-input={reject,crash} for enum values

 docs/about/deprecated.rst                      |  6 ++++++
 docs/devel/qapi-code-gen.rst                   | 29 ++++++++++++++++++-------
 qapi/compat.json                               |  3 +++
 qapi/introspect.json                           | 28 ++++++++++++++++++++++--
 include/qapi/qobject-input-visitor.h           |  4 ----
 include/qapi/qobject-output-visitor.h          |  4 ----
 include/qapi/util.h                            |  6 +++++-
 include/qapi/visitor-impl.h                    |  3 +++
 include/qapi/visitor.h                         |  9 ++++++++
 qapi/qapi-visit-core.c                         | 30 ++++++++++++++++++++++----
 qapi/qmp-dispatch.c                            |  4 ++--
 qapi/qobject-input-visitor.c                   | 14 +-----------
 qapi/qobject-output-visitor.c                  | 14 +-----------
 tests/unit/check-qom-proplist.c                |  2 +-
 scripts/qapi/expr.py                           |  3 ++-
 scripts/qapi/introspect.py                     | 19 ++++++++++++----
 scripts/qapi/schema.py                         | 22 +++++++++++++++++--
 scripts/qapi/types.py                          | 17 ++++++++++++++-
 tests/qapi-schema/doc-good.json                |  5 ++++-
 tests/qapi-schema/doc-good.out                 |  3 +++
 tests/qapi-schema/doc-good.txt                 |  3 +++
 tests/qapi-schema/enum-dict-member-unknown.err |  2 +-
 tests/qapi-schema/qapi-schema-test.json        |  3 ++-
 tests/qapi-schema/qapi-schema-test.out         |  1 +
 tests/qapi-schema/test-qapi.py                 |  1 +
 tests/qemu-iotests/049.out                     |  6 +++---
 tests/qemu-iotests/206.out                     |  2 +-
 tests/qemu-iotests/237.out                     |  6 +++---
 tests/qemu-iotests/245                         |  2 +-
 tests/qemu-iotests/287                         |  2 +-
 tests/qemu-iotests/308                         |  2 +-
 31 files changed, 182 insertions(+), 73 deletions(-)

-- 
2.31.1


