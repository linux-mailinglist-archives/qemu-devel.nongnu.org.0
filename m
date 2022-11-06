Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112861E30E
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 16:34:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orhd1-0005pi-O6; Sun, 06 Nov 2022 10:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhcy-0005p6-CS
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhcw-0000uk-LL
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667748721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zvhqBtC8UtOCQuwq5a0lz0GFQ8oSmfc2VMR2VwB0AnU=;
 b=aVeHxILgBSfzyyyLJ1k6XhSB77dAOuWX84nNtriWueYPmbp6Pc22hn945nl1BZudiHV8+W
 +ejm3pWerBKdjzpIw1ibbPLdX3vd8uy2LEfrJ59RJlJYzz12OpwP6xDlgnTu+LoA22HPet
 m8wjKrTgOVxJHSK7OFJHNLjzOuMoBUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-Mq4lL8agPp-skkgjeohSoQ-1; Sun, 06 Nov 2022 10:31:59 -0500
X-MC-Unique: Mq4lL8agPp-skkgjeohSoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1CEF101A528
 for <qemu-devel@nongnu.org>; Sun,  6 Nov 2022 15:31:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C783840C6EC4;
 Sun,  6 Nov 2022 15:31:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 00/12] qtest and s390x patches
Date: Sun,  6 Nov 2022 16:31:44 +0100
Message-Id: <20221106153156.620150-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 Hi Stefan!

The following changes since commit 6295a58ad1b73985b9c32d184de7d2ed1fbe1774:

  Merge tag 'pull-target-arm-20221104' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-11-04 11:01:17 -0400)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-11-06

for you to fetch changes up to 6393b29966fce3c0e47746a9646ae439e7fd0728:

  s390x/cpu topology: add max_threads machine class attribute (2022-11-06 12:38:57 +0100)

----------------------------------------------------------------
* e1000e qtest improvements
* Allow TLS PSK tests on win32
* Increase the timeout of the clang-user CI job
* Some s390x fixes for QEMU 7.2

----------------------------------------------------------------
Akihiko Odaki (5):
      tests/qtest/libqos/e1000e: Refer common PCI ID definitions
      tests/qtest/libqos/e1000e: Set E1000_CTRL_SLU
      tests/qtest/e1000e-test: Use e1000_regs.h
      tests/qtest/libqos/e1000e: Use E1000_STATUS_ASDV_1000
      tests/qtest/libqos/e1000e: Use IVAR shift definitions

Bin Meng (1):
      tests/qtest: migration-test: Enable TLS PSK tests for win32

Matthew Rosato (1):
      s390x/pci: RPCIT second pass when mappings exhausted

Peter Jin (1):
      s390x/css: revert SCSW ctrl/flag bits on error

Pierre Morel (2):
      s390x: Register TYPE_S390_CCW_MACHINE properties as class properties
      s390x/cpu topology: add max_threads machine class attribute

Stefan Hajnoczi (1):
      gitlab-ci: increase clang-user timeout

Stefan Weil (1):
      tests/qtest: Fix two format strings

 include/hw/s390x/s390-virtio-ccw.h |   1 +
 hw/s390x/css.c                     |  51 +++++++++++++-
 hw/s390x/s390-pci-inst.c           |  29 ++++++--
 hw/s390x/s390-virtio-ccw.c         | 138 ++++++++++++++++++++++---------------
 tests/qtest/e1000e-test.c          |  66 +++---------------
 tests/qtest/libqos/e1000e.c        |  17 ++---
 tests/qtest/migration-test.c       |  18 +----
 .gitlab-ci.d/buildtest.yml         |   1 +
 8 files changed, 176 insertions(+), 145 deletions(-)


