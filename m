Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169564ED82A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 13:05:18 +0200 (CEST)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsc9-0005P6-4h
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 07:05:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRM-0006jd-8B
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRJ-0007jJ-BR
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648724044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wB9GGs4BfGgoHhGvlGR8K+IdWuifQ6pqF5LU6T3R10w=;
 b=Vn36W8fSNo340Nk3+bjELXHziTum1g+paRFalU40w4m11ojl/aEaXNCbewaq1FOkhl3G/8
 v11sPA6r68OG6I832KoElAjC3AIMmg8DdfHefOPAd2S6/GaLj1ivwwZ0exBSwcgHF63sRm
 gtx6mm2tu9SHP8V5/+YbwU9ann9ar40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-m9LC3pv-O1inFqk2ihx1Sw-1; Thu, 31 Mar 2022 06:54:03 -0400
X-MC-Unique: m9LC3pv-O1inFqk2ihx1Sw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D476D101161C;
 Thu, 31 Mar 2022 10:53:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF731402648;
 Thu, 31 Mar 2022 10:53:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B47221E691D; Thu, 31 Mar 2022 12:53:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] QAPI patches patches for 2022-03-31
Date: Thu, 31 Mar 2022 12:53:29 +0200
Message-Id: <20220331105344.3471295-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I double-checked these patches affect *only* generated documentation.
Safe enough for 7.0, I think.  But I'm quite content to hold on to
them until after the release, if that's preferred.

The following changes since commit aea6e471085f39ada1ccd637043c3ee3dfd88750:

  Update version for v7.0.0-rc2 release (2022-03-29 23:32:18 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-03-31

for you to fetch changes up to 4375cf9868fbb7abcaae119ac993b13f72dfe8f2:

  qapi: fix example of dump-guest-memory (2022-03-31 12:35:59 +0200)

----------------------------------------------------------------
QAPI patches patches for 2022-03-31

----------------------------------------------------------------
Victor Toso (15):
      schemas: add missing vim modeline
      qapi: BlockExportRemoveMode: move comments to TODO
      qapi: fix example of BLOCK_IMAGE_CORRUPTED event
      qapi: fix example of BLOCK_IO_ERROR event
      qapi: fix example of BLOCK_JOB_PENDING event
      qapi: fix example of DUMP_COMPLETED event
      qapi: fix example of MEMORY_DEVICE_SIZE_CHANGE event
      qapi: fix example of UNPLUG_PRIMARY event
      qapi: fix example of FAILOVER_NEGOTIATED event
      qapi: fix examples: SHUTDOWN and RESET events
      qapi: run-state examples: add missing @timestamp
      qapi: fix example of MEMORY_FAILURE
      qapi: ui examples: add missing @websocket member
      qapi: fix example of ACPI_DEVICE_OST event
      qapi: fix example of dump-guest-memory

 qapi/acpi.json         |  5 +++--
 qapi/block-core.json   | 14 +++++++-------
 qapi/block-export.json | 10 +++++-----
 qapi/dump.json         |  9 +++++----
 qapi/machine.json      |  3 ++-
 qapi/migration.json    |  4 +++-
 qapi/net.json          |  6 ++++--
 qapi/pragma.json       |  3 +++
 qapi/run-state.json    | 16 +++++++++++-----
 qapi/ui.json           | 12 ++++++------
 10 files changed, 49 insertions(+), 33 deletions(-)

-- 
2.35.1


