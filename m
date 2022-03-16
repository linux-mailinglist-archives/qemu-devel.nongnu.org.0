Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B2B4DAC46
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 09:15:50 +0100 (CET)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUOov-0000Re-H7
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 04:15:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUOnb-0007ej-2Y
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 04:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUOnY-0000nb-OY
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 04:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647418464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2xA94LWCXek5JsIlYnbGqwnwzKTkVAARh80Xku3Q63g=;
 b=KXSzsYj/Nh5NdzjTKRhJEynPkJOn6Ye5c30fKCsRQKkMYmHLOatSn6eu+9zkX2qwS3j7bH
 h7NyBIUlXSmykANuA5Aal8fY3rQHaQCtpPopzr4H6Z76fAMJjgtgOwhH6UEHk5LaiwU/TD
 LFz4q3CTmS72HG7i7uDccUg7e7bmKMs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-WeiJPHQdNBOe9tMuL3IWEA-1; Wed, 16 Mar 2022 04:14:20 -0400
X-MC-Unique: WeiJPHQdNBOe9tMuL3IWEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E9FF85A5A8;
 Wed, 16 Mar 2022 08:14:20 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDC5C10031FC;
 Wed, 16 Mar 2022 08:14:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/7] s390x and misc fixes
Date: Wed, 16 Mar 2022 09:14:18 +0100
Message-Id: <20220316081418.1090247-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter!

The following changes since commit d6f229f9a0592c4d5beb0a5c4e024231c27680d3:

  Update version for v7.0.0-rc0 release (2022-03-15 23:07:40 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-15v2

for you to fetch changes up to 377bf6f37da11d14641a0e973c4ed272259cca9c:

  softmmu: List CPU types again (2022-03-16 08:43:10 +0100)

----------------------------------------------------------------
* Fixes for s390x branch instruction emulation
* Fixes for the tests/avocado/boot_linux.py:BootLinuxS390X test
* Re-enable the "-cpu help" output

v2: Dropped the update to meson 0.61.3

Note: The "Test BRASL ..." patch triggers a warning from checkpatch,
      but this can be ignored (I think the "extern"s are fine in this case)

----------------------------------------------------------------
Alex Bennée (1):
      tests/tcg: drop -cpu max from s390x sha512-mvx invocation

Beraldo Leal (1):
      tests/avocado: start PhoneServer upfront

Ilya Leoshkevich (3):
      s390x/tcg: Fix BRASL with a large negative offset
      s390x/tcg: Fix BRCL with a large negative offset
      tests/tcg/s390x: Test BRASL and BRCL with large negative offsets

Philippe Mathieu-Daudé (1):
      softmmu: List CPU types again

Richard Henderson (1):
      accel/tcg: Fix cpu_ldq_be_mmu typo

 accel/tcg/cputlb.c                     |  2 +-
 cpu.c                                  |  9 +++++
 include/exec/cpu-common.h              |  2 +
 include/sysemu/cpus.h                  |  2 -
 softmmu/cpus.c                         |  8 ----
 target/s390x/tcg/translate.c           |  4 +-
 tests/avocado/avocado_qemu/__init__.py | 13 ++++---
 tests/tcg/s390x/Makefile.target        |  3 +-
 tests/tcg/s390x/branch-relative-long.c | 68 ++++++++++++++++++++++++++++++++++
 9 files changed, 90 insertions(+), 21 deletions(-)
 create mode 100644 tests/tcg/s390x/branch-relative-long.c


