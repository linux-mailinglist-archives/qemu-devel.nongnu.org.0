Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3EB5793D3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:08:06 +0200 (CEST)
Received: from localhost ([::1]:56778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhKv-0007mo-DO
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHM-00023J-Q5
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHJ-0002yC-JQ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/HbYPxsQOppVQcLz0VZfsxd81dFI6CMgz4FfmYJsARk=;
 b=StaMf6Th1eR4Q5gQCRYEpGi3Jk0Rd2CpJHHu6y5cKk0TLLJuT0S7uhIifOfUGWaupqQsB0
 l48jGEDLYXrh6hZTR5MHvauw5+TnReveUjZKUBD7T4kt1VkQiF4mTyxLiWhVC9qkJxrRvT
 IATj/lxTSG5GJ6pXrI2nNdxzyKapPUw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-sP0Nm_TFNoyx3DIWWRUM7A-1; Tue, 19 Jul 2022 03:04:14 -0400
X-MC-Unique: sP0Nm_TFNoyx3DIWWRUM7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E9A0280D21B;
 Tue, 19 Jul 2022 07:04:14 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D36F140CF8E5;
 Tue, 19 Jul 2022 07:04:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/14] Testing and misc patches
Date: Tue, 19 Jul 2022 09:03:58 +0200
Message-Id: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

 Hi!

The following changes since commit 782378973121addeb11b13fd12a6ac2e69faa33f:

  Merge tag 'pull-target-arm-20220718' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-18 16:29:32 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-07-19

for you to fetch changes up to 9b0ecfaba5920ddf8601d7b31746a428aa3779c6:

  python/qemu/qmp/legacy: Replace 'returns-whitelist' with the correct type (2022-07-18 20:28:06 +0200)

----------------------------------------------------------------
* Clean up tests/vm (remove obsolte VMs, upgrade Ubuntu 18.04 to 20.04 etc.)
* Fix broken build on Haiku
* Replace the term 'whitelist' in some files with a better one
* Some other minor test related fixes

----------------------------------------------------------------
John Snow (9):
  qga: treat get-guest-fsinfo as "best effort"
  tests/vm: use 'cp' instead of 'ln' for temporary vm images
  tests/vm: switch CentOS 8 to CentOS 8 Stream
  tests/vm: switch centos.aarch64 to CentOS 8 Stream
  tests/vm: upgrade Ubuntu 18.04 VM to 20.04
  tests/vm: remove ubuntu.i386 VM test
  tests/vm: remove duplicate 'centos' VM test
  tests/vm: add 1GB extra memory per core
  tests/vm: Remove docker cross-compile test from CentOS VM

Philippe Mathieu-Daudé (1):
  tests/unit: Replace g_memdup() by g_memdup2()

Song Gao (1):
  qtest/machine-none: Add LoongArch support

Thomas Huth (3):
  Replace 'whitelist' with 'allow'
  util: Fix broken build on Haiku
  python/qemu/qmp/legacy: Replace 'returns-whitelist' with the correct
    type

 docs/devel/submitting-a-patch.rst |   2 +-
 docs/tools/qemu-nbd.rst           |   2 +-
 qga/commands-posix.c              |  10 +-
 tests/qtest/machine-none-test.c   |   1 +
 tests/unit/ptimer-test.c          |  22 ++--
 tests/unit/test-iov.c             |  26 ++---
 util/cutils.c                     |   4 +
 util/oslib-posix.c                |   4 -
 python/qemu/qmp/legacy.py         |   2 +-
 scripts/vmstate-static-checker.py |   2 +-
 tests/vm/Makefile.include         |   5 +-
 tests/vm/basevm.py                |   5 +
 tests/vm/centos                   |   9 +-
 tests/vm/centos.aarch64           | 174 +++++-------------------------
 tests/vm/ubuntu.aarch64           |  10 +-
 tests/vm/ubuntu.i386              |  40 -------
 16 files changed, 84 insertions(+), 234 deletions(-)
 delete mode 100755 tests/vm/ubuntu.i386

-- 
2.31.1


