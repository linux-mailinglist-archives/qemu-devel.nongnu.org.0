Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF139440375
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:42:58 +0200 (CEST)
Received: from localhost ([::1]:45424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXmE-0000vQ-0f
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgXa5-0000Mv-0K
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgXa1-0000on-73
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635535819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X9NCrPR9M2Tr2fMWab+MnSL3P76wHwieaZMVca9Lkkw=;
 b=bVfVILtH1tUbPUKBlpUlVDRH9RtyvNDKr34a/e3g5cLsuPV37eNT9pzNi6Enmzvi/T5jiT
 EL7k4khmmWZlVR/MTd4IuBto27jnXdEJNTHYuHDVT/FSE8qxUuX6MSf6a1ThpKGikh7k6p
 7nF6nP4ppOV0xI51vXgHem89XBDPhAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-RkLywUT-M_WpexMftQnoLg-1; Fri, 29 Oct 2021 15:30:18 -0400
X-MC-Unique: RkLywUT-M_WpexMftQnoLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85DF3180831A;
 Fri, 29 Oct 2021 19:30:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58BE95DF56;
 Fri, 29 Oct 2021 19:30:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DED2211380A7; Fri, 29 Oct 2021 21:30:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] QAPI patches patches for 2021-10-29
Date: Fri, 29 Oct 2021 21:30:06 +0200
Message-Id: <20211029193015.1312198-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c30161d:

  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20211027' into staging (2021-10-27 11:45:18 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-10-29

for you to fetch changes up to 57df0dff1a1f4c846aa74a082bfd595a8a990015:

  qapi: Extend -compat to set policy for unstable interfaces (2021-10-29 21:28:01 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-10-29

----------------------------------------------------------------
Markus Armbruster (9):
      qapi: New special feature flag "unstable"
      qapi: Mark unstable QMP parts with feature 'unstable'
      qapi: Eliminate QCO_NO_OPTIONS for a slight simplification
      qapi: Tools for sets of special feature flags in generated code
      qapi: Generalize struct member policy checking
      qapi: Generalize command policy checking
      qapi: Generalize enum member policy checking
      qapi: Factor out compat_policy_input_ok()
      qapi: Extend -compat to set policy for unstable interfaces

 docs/devel/qapi-code-gen.rst            |   9 ++-
 qapi/block-core.json                    | 123 +++++++++++++++++++++++---------
 qapi/compat.json                        |   8 ++-
 qapi/migration.json                     |  35 +++++++--
 qapi/misc.json                          |   6 +-
 qapi/qom.json                           |  11 +--
 include/qapi/compat-policy.h            |   7 ++
 include/qapi/qmp/dispatch.h             |   6 +-
 include/qapi/util.h                     |   8 ++-
 include/qapi/visitor-impl.h             |   6 +-
 include/qapi/visitor.h                  |  17 +++--
 monitor/misc.c                          |   7 +-
 qapi/qapi-forward-visitor.c             |  20 +++---
 qapi/qapi-util.c                        |  43 +++++++++++
 qapi/qapi-visit-core.c                  |  41 +++++------
 qapi/qmp-dispatch.c                     |  19 ++---
 qapi/qmp-registry.c                     |   4 +-
 qapi/qobject-input-visitor.c            |  22 +++---
 qapi/qobject-output-visitor.c           |  13 +++-
 storage-daemon/qemu-storage-daemon.c    |   3 +-
 qapi/trace-events                       |   4 +-
 qemu-options.hx                         |  20 +++++-
 scripts/qapi/commands.py                |  12 ++--
 scripts/qapi/events.py                  |  10 +--
 scripts/qapi/gen.py                     |   8 +++
 scripts/qapi/schema.py                  |  11 ++-
 scripts/qapi/types.py                   |  22 +++---
 scripts/qapi/visit.py                   |  14 ++--
 tests/qapi-schema/qapi-schema-test.json |   7 +-
 tests/qapi-schema/qapi-schema-test.out  |   5 ++
 30 files changed, 355 insertions(+), 166 deletions(-)

-- 
2.31.1


