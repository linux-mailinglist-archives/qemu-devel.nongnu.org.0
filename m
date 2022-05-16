Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C456D527EC5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 09:45:17 +0200 (CEST)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqVPo-0000jL-JZ
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 03:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGL-0000p3-Pv
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGJ-0001r0-3F
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652686525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oHjAmRy4GQWBxIqbFxoIopoQDBPS4Rjpsun4+pCGyG4=;
 b=KgUztAgX2rSNrJdLiijEaNUHpMmJE+Nb9Q2gRLzZ28Sd/k7nr0PoBrvV349P8fiukNbNlZ
 Ywwqs+nFFG/gVzVDE+b00MPF25CqhUC9g7GzgSYJFBhVhEvU2GnRKkoo9u+6m6xodyPB37
 hIUr7iRvA2k/VW2knWbhsNWMKaEksy0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-mRHVtvlnMEyVrLFA3W_rLQ-1; Mon, 16 May 2022 03:35:24 -0400
X-MC-Unique: mRHVtvlnMEyVrLFA3W_rLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F2DF801210;
 Mon, 16 May 2022 07:35:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1CD7156146C;
 Mon, 16 May 2022 07:35:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D144C21E690D; Mon, 16 May 2022 09:35:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 00/11] QAPI patches patches for 2022-05-16
Date: Mon, 16 May 2022 09:35:11 +0200
Message-Id: <20220516073522.3880774-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 10c2a0c5e7d48e590d945c017b5b8af5b4c89a3c:

  Merge tag 'or1k-pull-request-20220515' of https://github.com/stffrdhrn/qemu into staging (2022-05-15 16:56:27 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-05-16

for you to fetch changes up to dd8f0f332f34a2466d855d1067386b04ff2eb6d9:

  qapi/pragma: Tidy up comments (2022-05-16 07:31:26 +0200)

----------------------------------------------------------------
QAPI patches patches for 2022-05-16

----------------------------------------------------------------
Andrea Bolognani (7):
      qapi: Drop stray trailing symbol
      qapi: Fix comment indentation
      qapi: Add missing separators between sections
      qapi: Drop unnecessary empty lines in comments
      qapi: Drop unnecessary empty lines outside of comments
      qapi: Drop unnecessary whitespace in comments
      qapi: Stop using whitespace for alignment in comments

Markus Armbruster (4):
      qapi: Fix malformed "Since:" section tags
      qapi/expr: Enforce feature naming rules again
      docs/devel/qapi-code-gen: Belatedly document feature naming rules
      qapi/pragma: Tidy up comments

 docs/devel/qapi-code-gen.rst |  9 ++--
 qapi/audio.json              |  1 -
 qapi/block-core.json         | 97 ++++++++++++++++++++------------------------
 qapi/block-export.json       |  2 +-
 qapi/block.json              | 13 +++---
 qapi/char.json               | 10 ++---
 qapi/common.json             |  2 -
 qapi/control.json            | 13 +++---
 qapi/crypto.json             | 64 +++++++++++++----------------
 qapi/dump.json               |  4 +-
 qapi/job.json                |  1 -
 qapi/machine-target.json     |  1 -
 qapi/machine.json            | 14 +++----
 qapi/migration.json          | 19 ++++-----
 qapi/misc-target.json        | 13 ++----
 qapi/misc.json               |  8 ++--
 qapi/pragma.json             |  3 +-
 qapi/replay.json             |  1 -
 qapi/run-state.json          | 10 ++---
 qapi/sockets.json            |  6 +--
 qapi/ui.json                 | 70 +++++++++++---------------------
 qga/qapi-schema.json         |  2 +-
 scripts/qapi/expr.py         |  2 +-
 23 files changed, 148 insertions(+), 217 deletions(-)

-- 
2.35.3


