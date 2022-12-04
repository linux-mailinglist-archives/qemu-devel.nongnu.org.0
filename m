Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23715641B52
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 08:32:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1jSi-0000uQ-Lv; Sun, 04 Dec 2022 02:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p1jSg-0000u6-Iq
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 02:30:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p1jSe-0001eO-LE
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 02:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670139051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V+FtkQWUUoPWTAuP7ndGiwl6bfqm5RIQIK7xy6dvtJg=;
 b=N0VEuUmvJ4UjV+qvgnAZN47A6KCLLRugJn64lf6qVhZrwHQ6zWwrrcuhw6VYdnQ/tG3iDI
 LATnbvajQuiFYdWzdMBjfExRmM/uMcUiL+W4HOm64J977gYVhaKBk0G5kolyiL9+gI8KXF
 MWidkEJ+gsBVN6sGVlJCi6eNIxExHu0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-nmXEvBlCOSWNyQ_WDLu-lw-1; Sun, 04 Dec 2022 02:30:50 -0500
X-MC-Unique: nmXEvBlCOSWNyQ_WDLu-lw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0D6E800B23
 for <qemu-devel@nongnu.org>; Sun,  4 Dec 2022 07:30:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C986B2166B29;
 Sun,  4 Dec 2022 07:30:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 0/3] Optional fixes for inclusion into QEMU 7.2.0-rc4
Date: Sun,  4 Dec 2022 08:30:40 +0100
Message-Id: <20221204073043.54402-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

 Hi Stefan!

The following changes since commit c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:

  Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-12-04

for you to fetch changes up to c1966f515d9bb6d8ed7076f4bebdc45407700100:

  hw/display/next-fb: Fix comment typo (2022-12-03 22:07:07 +0100)

----------------------------------------------------------------
In case we're doing a rc4 before the release, I'd like to see
these three patches included. They contain:
* Fix for a potential undefined behavior in cleanup of migration-test
* Fix for a s390x instruction that causes Java to crash
* Fix for a typo in a comment in next-fb.c
All patches are rather small and self-contained and have been
properly reviewed, so I think it should be OK to still include
them at this point in time.

----------------------------------------------------------------
Evgeny Ermakov (1):
      hw/display/next-fb: Fix comment typo

Thomas Huth (2):
      tests/qtest/migration-test: Fix unlink error and memory leaks
      target/s390x/tcg: Fix and improve the SACF instruction

 target/s390x/tcg/insn-data.h.inc |  2 +-
 hw/display/next-fb.c             |  2 +-
 target/s390x/tcg/cc_helper.c     |  7 +++++++
 tests/qtest/migration-test.c     | 20 ++++++++++++++++----
 4 files changed, 25 insertions(+), 6 deletions(-)


