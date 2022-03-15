Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02AF4D9A4C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:23:34 +0100 (CET)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5H3-0003qz-WC
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:23:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5Ec-00015R-TD
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5Ea-0008UZ-AP
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647343258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o2au2NzEHXWQuqfuCm9PXn/O7xCbUgIUXY6K9KQypbw=;
 b=eznTLLQDFtDAGlEBHw00oUABtwx+EMX6lbw4sdb0jIJlFqZgocH6dCCP4DwblIaViv+I5u
 tGiANcRxic6oSVN7zKwu+syamiM6ovR/203pe8o1xQNQLG9wNdJGrEjpfHQRe0ePD/F++c
 6BWLgnYrJq4K5PkEV4XnC34FTLfpL88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-TEpJW8dxPxadR0CrMDTF6w-1; Tue, 15 Mar 2022 07:20:56 -0400
X-MC-Unique: TEpJW8dxPxadR0CrMDTF6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FBB2899EC1;
 Tue, 15 Mar 2022 11:20:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 669EEC15D42;
 Tue, 15 Mar 2022 11:20:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] s390x and misc fixes
Date: Tue, 15 Mar 2022 12:20:44 +0100
Message-Id: <20220315112052.515467-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter!

The following changes since commit 352998df1c53b366413690d95b35f76d0721ebed:

  Merge tag 'i2c-20220314' of https://github.com/philmd/qemu into staging (2022-03-14 14:39:33 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-15

for you to fetch changes up to 36149534792dcf07a3c59867f967eaee23ab906c:

  meson: Update to version 0.61.3 (2022-03-15 10:32:36 +0100)

----------------------------------------------------------------
* Fixes for s390x branch instruction emulation
* Fixes for the tests/avocado/boot_linux.py:BootLinuxS390X test
* Fix for "-cpu help" output
* Bump meson to 0.61.3 to fix stderr log of the iotests

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

Thomas Huth (1):
      meson: Update to version 0.61.3

 accel/tcg/cputlb.c                     |  2 +-
 configure                              |  2 +-
 cpu.c                                  |  9 +++++
 include/exec/cpu-common.h              |  2 +
 include/sysemu/cpus.h                  |  2 -
 meson                                  |  2 +-
 softmmu/cpus.c                         |  8 ----
 target/s390x/tcg/translate.c           |  4 +-
 tests/avocado/avocado_qemu/__init__.py | 13 ++++---
 tests/tcg/s390x/Makefile.target        |  3 +-
 tests/tcg/s390x/branch-relative-long.c | 68 ++++++++++++++++++++++++++++++++++
 11 files changed, 92 insertions(+), 23 deletions(-)
 create mode 100644 tests/tcg/s390x/branch-relative-long.c


