Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AFC341BE2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:59:42 +0100 (CET)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDn2-0005oa-Uu
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNDlw-00054A-1e
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:58:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNDlt-0002iB-C2
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616155107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FiaAryBS6csr0ZEoXaIZkWqUKHNzhxloPM7spDsl0Ac=;
 b=aYJgv5hpZ6twuvpegiglPe+HfpveoLVP12V8Uk8FmEvtXjLwJgn+ysoeTkCWVWTmWwu4GS
 VP61/neHrxTEgosbvkA0gGxT9wv94P8ltOrG4jqWf4Ul0Lot/FTmTvgNVvAaNf5PF5ySlC
 vrapF66alnhF7hNP64QEY/tngAxm0rA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-MohX-UqiM3-QWgt6kbKaMw-1; Fri, 19 Mar 2021 07:58:26 -0400
X-MC-Unique: MohX-UqiM3-QWgt6kbKaMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 324C4871377;
 Fri, 19 Mar 2021 11:58:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB95760C13;
 Fri, 19 Mar 2021 11:58:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 71AF911386A7; Fri, 19 Mar 2021 12:58:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/11] QAPI patches patches for 2021-03-16
Date: Fri, 19 Mar 2021 12:58:23 +0100
Message-Id: <20210319115823.1762787-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

The following changes since commit cf6b56d4f2107259f52413f979a1d474dad0c1e1:

  Merge remote-tracking branch 'remotes/philmd/tags/pflash-20210318' into staging (2021-03-18 23:04:41 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-03-16-v3

for you to fetch changes up to 64e9c1e5bc73192bbf740db40c5b2c3764dcaf05:

  qapi: New -compat deprecated-input=crash (2021-03-19 11:36:52 +0100)

----------------------------------------------------------------
QAPI patches patches for 2021-03-16

----------------------------------------------------------------
Markus Armbruster (10):
      qemu-options: New -compat to set policy for deprecated interfaces
      qapi: Implement deprecated-output=hide for QMP command results
      qapi: Implement deprecated-output=hide for QMP events
      qapi: Implement deprecated-output=hide for QMP event data
      monitor: Drop query-qmp-schema 'gen': false hack
      qapi: Implement deprecated-output=hide for QMP introspection
      test-util-sockets: Add stub for monitor_set_cur()
      qapi: Implement deprecated-input=reject for QMP commands
      qapi: Implement deprecated-input=reject for QMP command arguments
      qapi: New -compat deprecated-input=crash

Paolo Bonzini (1):
      qemuutil: remove qemu_set_fd_handler duplicate symbol

 qapi/compat.json                        |  52 +++++++++++++++++
 qapi/introspect.json                    |   2 +-
 qapi/qapi-schema.json                   |   1 +
 include/qapi/compat-policy.h            |  38 ++++++++++++
 include/qapi/qmp/dispatch.h             |   1 +
 include/qapi/qobject-input-visitor.h    |   4 ++
 include/qapi/qobject-output-visitor.h   |   4 ++
 include/qapi/visitor-impl.h             |   6 ++
 include/qapi/visitor.h                  |  18 ++++++
 monitor/monitor-internal.h              |   3 -
 monitor/misc.c                          |   2 -
 monitor/qmp-cmds-control.c              | 100 ++++++++++++++++++++++++++++----
 qapi/qapi-visit-core.c                  |  18 ++++++
 qapi/qmp-dispatch.c                     |  35 +++++++++++
 qapi/qobject-input-visitor.c            |  29 +++++++++
 qapi/qobject-output-visitor.c           |  19 ++++++
 softmmu/vl.c                            |  17 ++++++
 storage-daemon/qemu-storage-daemon.c    |   2 -
 stubs/set-fd-handler.c                  |  10 ----
 tests/unit/test-qmp-cmds.c              |  91 +++++++++++++++++++++++++++--
 tests/unit/test-qmp-event.c             |  41 +++++++++++++
 tests/unit/test-util-sockets.c          |   1 +
 qapi/meson.build                        |   1 +
 qapi/trace-events                       |   2 +
 qemu-options.hx                         |  22 +++++++
 scripts/qapi/commands.py                |  17 +++---
 scripts/qapi/events.py                  |  21 +++++--
 scripts/qapi/visit.py                   |  15 +++++
 stubs/meson.build                       |   1 -
 tests/qapi-schema/qapi-schema-test.json |  20 ++++---
 tests/qapi-schema/qapi-schema-test.out  |  20 ++++---
 31 files changed, 549 insertions(+), 64 deletions(-)
 create mode 100644 qapi/compat.json
 create mode 100644 include/qapi/compat-policy.h
 delete mode 100644 stubs/set-fd-handler.c

-- 
2.26.3


