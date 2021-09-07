Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C664029C3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:33:19 +0200 (CEST)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbDy-00072d-Gm
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawJ-0002yA-W8
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawH-0002DM-HR
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PRsTtLDtqYu/0afU0mC8z2JEdfpowVorK7zw9xegRUU=;
 b=IEJ3wOaLAFkaYBV8iRVL31Fqno2JB0mZZngbWm4y8Yy9vyBDjvu9Ux8BxCp3XD3lVcAKFI
 b1bArTBE9/UHKul1wCJBpQ9s5jjvkA9Ihx82aQTeWrUkDWe6oJ3kcCjXccBuxj5zd3D1YK
 R3GfC3gbJgIkMUkfG6CFJ5oJI2v5nOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-TyV7LP8OOkKMj8paft2GCg-1; Tue, 07 Sep 2021 09:14:58 -0400
X-MC-Unique: TyV7LP8OOkKMj8paft2GCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36B221883535;
 Tue,  7 Sep 2021 13:14:57 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BA855C25D;
 Tue,  7 Sep 2021 13:14:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/20] s390x patches
Date: Tue,  7 Sep 2021 15:14:29 +0200
Message-Id: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter!

The following changes since commit 935efca6c246c108253b0e4e51cc87648fc7ca10:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-09-06' into staging (2021-09-06 12:38:07 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/s390x-pull-request-2021-09-07

for you to fetch changes up to 30e398f796d882d829162a16ab7c920f7422da3b:

  s390x/cpumodel: Add more feature to gen16 default model (2021-09-07 13:36:43 +0200)

(Cornelia is currently on vacation, so I'm doing the s390x patches this time)

----------------------------------------------------------------
* Some CSS related fixes
* Storage key related fixes
* Test SIGILL and SIGSEGV handling in usermode emulation
* Fix SETPREFIX instruction
* Replace PAGE_SIZE, PAGE_SHIFT and PAGE_MASK to fix Alpine compilation
* Add more feature to gen16 default model

----------------------------------------------------------------
Christian Borntraeger (1):
      s390x/cpumodel: Add more feature to gen16 default model

Cornelia Huck (2):
      vfio-ccw: forward halt/clear errors
      css: fix actl handling for unit exceptions

David Hildenbrand (15):
      s390x/tcg: fix and optimize SPX (SET PREFIX)
      s390x/ioinst: Fix wrong MSCH alignment check on little endian
      s390x/tcg: wrap address for RRBE
      s390x/tcg: fix ignoring bit 63 when setting the storage key in SSKE
      s390x/tcg: convert real to absolute address for RRBE, SSKE and ISKE
      s390x/tcg: check for addressing exceptions for RRBE, SSKE and ISKE
      s390x/mmu_helper: no need to pass access type to mmu_translate_asce()
      s390x/mmu_helper: fixup mmu_translate() documentation
      s390x/mmu_helper: move address validation into mmu_translate*()
      s390x/mmu_helper: avoid setting the storage key if nothing changed
      hw/s390x/s390-skeys: use memory mapping to detect which storage keys to migrate
      hw/s390x/s390-skeys: use memory mapping to detect which storage keys to dump
      hw/s390x/s390-skeys: check if an address is valid before dumping the key
      hw/s390x/s390-skeys: rename skeys_enabled to skeys_are_enabled
      hw/s390x/s390-skeys: lazy storage key enablement under TCG

Ilya Leoshkevich (1):
      tests/tcg/s390x: Test SIGILL and SIGSEGV handling

Thomas Huth (1):
      s390x: Replace PAGE_SIZE, PAGE_SHIFT and PAGE_MASK

 hw/s390x/css.c                                |  38 ++++-
 hw/s390x/s390-pci-bus.c                       |  10 +-
 hw/s390x/s390-pci-inst.c                      |   8 +-
 hw/s390x/s390-skeys-kvm.c                     |   4 +-
 hw/s390x/s390-skeys.c                         | 206 +++++++++++++++++---------
 hw/s390x/s390-virtio-ccw.c                    |   5 +
 hw/s390x/sclp.c                               |   2 +-
 hw/vfio/ccw.c                                 |   4 +-
 include/hw/s390x/css.h                        |   3 +-
 include/hw/s390x/s390-pci-bus.h               |   5 +-
 include/hw/s390x/storage-keys.h               |  65 +++++++-
 target/s390x/gen-features.c                   |   8 +-
 target/s390x/helper.h                         |   6 +-
 target/s390x/ioinst.c                         |   2 +-
 target/s390x/mmu_helper.c                     |  70 ++++++---
 target/s390x/s390x-internal.h                 |   3 +
 target/s390x/tcg/excp_helper.c                |  13 --
 target/s390x/tcg/mem_helper.c                 |  53 +++++--
 target/s390x/tcg/misc_helper.c                |  15 +-
 tests/tcg/s390x/Makefile.target               |  17 ++-
 tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++++
 tests/tcg/s390x/signals-s390x.c               | 165 +++++++++++++++++++++
 22 files changed, 627 insertions(+), 151 deletions(-)
 create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
 create mode 100644 tests/tcg/s390x/signals-s390x.c


