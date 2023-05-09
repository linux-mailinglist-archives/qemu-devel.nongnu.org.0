Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A236D6FC138
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:06:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGs-0008WK-DI; Tue, 09 May 2023 04:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGn-0008UZ-5D
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGk-0008Uj-Rn
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=57YbhkH1wyTeUgFsTGdtqF+SjIaqUDAXGRbir1xjxwU=;
 b=heINm81F3Syxu+YH3uZ4ztD+MwdohYA44qm305oIxBMIRfZ3R1mQ7I0RK9b22s1sd0TcKZ
 erSpBwelHApmQrBW7S3DoC0oYx//ujqHpeW8/g/2M+nr6NBRM+qULpxKPdj18NEsoxjjca
 uasOE9SRp6VA2LBUXEocXsi4gGb1kg4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-AHGTkNjnPXiENO0FMYGMQQ-1; Tue, 09 May 2023 04:00:18 -0400
X-MC-Unique: AHGTkNjnPXiENO0FMYGMQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93956100F652;
 Tue,  9 May 2023 08:00:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51DFD1121315;
 Tue,  9 May 2023 08:00:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1EBEB21E6924; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 00/17] QAPI patches patches for 2023-05-09
Date: Tue,  9 May 2023 09:59:54 +0200
Message-Id: <20230509080011.3231661-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The following changes since commit 792f77f376adef944f9a03e601f6ad90c2f891b2:

  Merge tag 'pull-loongarch-20230506' of https://gitlab.com/gaosong/qemu into staging (2023-05-06 08:11:52 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2023-05-09

for you to fetch changes up to ddd37ae995acacfd858d2ee090c3fa61e33b986b:

  qapi: Reformat doc comments to conform to current conventions (2023-05-09 09:57:15 +0200)

----------------------------------------------------------------
QAPI patches patches for 2023-05-09

----------------------------------------------------------------
Markus Armbruster (17):
      docs/devel/qapi-code-gen: Clean up use of quotes a bit
      docs/devel/qapi-code-gen: Turn FIXME admonitions into comments
      qapi: Fix crash on stray double quote character
      meson: Fix to make QAPI generator output depend on main.py
      Revert "qapi: BlockExportRemoveMode: move comments to TODO"
      sphinx/qapidoc: Do not emit TODO sections into user manuals
      qapi: Tidy up a slightly awkward TODO comment
      qapi/dump: Indent bulleted lists consistently
      tests/qapi-schema/doc-good: Improve a comment
      tests/qapi-schema/doc-good: Improve argument description tests
      qapi: Fix argument description indentation stripping
      qapi: Rewrite parsing of doc comment section symbols and tags
      qapi: Relax doc string @name: description indentation rules
      qapi: Section parameter @indent is no longer used, drop
      docs/devel/qapi-code-gen: Update doc comment conventions
      qga/qapi-schema: Reformat doc comments to conform to current conventions
      qapi: Reformat doc comments to conform to current conventions

 docs/devel/qapi-code-gen.rst          |   74 +-
 docs/sphinx/qapidoc.py                |    3 +
 meson.build                           |    2 +-
 qapi/acpi.json                        |   50 +-
 qapi/audio.json                       |   93 +-
 qapi/authz.json                       |   29 +-
 qapi/block-core.json                  | 2801 +++++++++++++++++----------------
 qapi/block-export.json                |  244 +--
 qapi/block.json                       |  214 +--
 qapi/char.json                        |  134 +-
 qapi/common.json                      |   19 +-
 qapi/compat.json                      |   13 +-
 qapi/control.json                     |   59 +-
 qapi/crypto.json                      |  261 +--
 qapi/cryptodev.json                   |    3 +
 qapi/cxl.json                         |   74 +-
 qapi/dump.json                        |   78 +-
 qapi/error.json                       |    6 +-
 qapi/introspect.json                  |   89 +-
 qapi/job.json                         |  139 +-
 qapi/machine-target.json              |  303 ++--
 qapi/machine.json                     |  389 ++---
 qapi/migration.json                   | 1120 +++++++------
 qapi/misc-target.json                 |   67 +-
 qapi/misc.json                        |  180 +--
 qapi/net.json                         |  260 ++-
 qapi/pci.json                         |   35 +-
 qapi/qapi-schema.json                 |   25 +-
 qapi/qdev.json                        |   63 +-
 qapi/qom.json                         |  404 ++---
 qapi/rdma.json                        |    1 -
 qapi/replay.json                      |   48 +-
 qapi/rocker.json                      |   20 +-
 qapi/run-state.json                   |  227 +--
 qapi/sockets.json                     |   50 +-
 qapi/stats.json                       |   83 +-
 qapi/tpm.json                         |   20 +-
 qapi/trace.json                       |   34 +-
 qapi/transaction.json                 |   87 +-
 qapi/ui.json                          |  435 ++---
 qapi/virtio.json                      |   84 +-
 qapi/yank.json                        |   42 +-
 qga/qapi-schema.json                  |  668 ++++----
 scripts/qapi/parser.py                |  137 +-
 tests/qapi-schema/doc-bad-indent.err  |    2 +-
 tests/qapi-schema/doc-bad-indent.json |    3 +-
 tests/qapi-schema/doc-good.json       |   20 +-
 tests/qapi-schema/doc-good.out        |   19 +-
 48 files changed, 4833 insertions(+), 4378 deletions(-)

-- 
2.39.2


