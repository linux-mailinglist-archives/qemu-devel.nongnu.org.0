Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0B4852EA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 13:41:01 +0100 (CET)
Received: from localhost ([::1]:42486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n55b9-0004mn-VP
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 07:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55Wk-0002ie-Nw
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55Wi-0000Pz-Cg
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641386177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zzPSqBb40qOQwujROQGhlNygNbmk2xcCsx0x+PoyVSk=;
 b=CxnkK9x2FA43CO7QSyH/dJNLv9X2rcrxgAFbplSeVxiGhEIvHc1ORBwiQQi9BHAk3eUgws
 IOB7mwpcBhg9Vx8diJKXCbfrMxkQdyymdB3AjejeRQrahBCvZoAz420d6H8bOynyomu1rC
 KpTS+4lewlO+vp4KpUu/BU8+fwkAKNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-22uWjUuGPi2xm5bYulT6WQ-1; Wed, 05 Jan 2022 07:36:15 -0500
X-MC-Unique: 22uWjUuGPi2xm5bYulT6WQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA02C801AAB;
 Wed,  5 Jan 2022 12:36:14 +0000 (UTC)
Received: from thuth.com (dhcp-192-229.str.redhat.com [10.33.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A4B622DFC;
 Wed,  5 Jan 2022 12:36:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] Misc patches (tests, docs, compat machines)
Date: Wed,  5 Jan 2022 13:36:04 +0100
Message-Id: <20220105123612.432038-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit fb084237a3b78b20fd9d888dffd673b6656ea3be:

  common-user: Really fix i386 calls to safe_syscall_set_errno_tail (2022-01-04 21:14:23 -0800)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-01-05

for you to fetch changes up to 057dc9a635fe37118a98b32e8bd9d8ed47b1a102:

  docs/tools/qemu-trace-stap.rst: Do not hard-code the QEMU binary name (2022-01-05 11:10:13 +0100)

----------------------------------------------------------------
* Add compat machines for 7.0
* Some minor qtest and unit test improvements
* Remove -no-quit option
* Fixes for the docs

----------------------------------------------------------------
Cornelia Huck (1):
      hw: Add compat machines for 7.0

Marc-André Lureau (1):
      docs/sphinx: fix compatibility with sphinx < 1.8

Philippe Mathieu-Daudé (1):
      tests/unit/test-util-sockets: Use g_file_open_tmp() to create temp file

Thomas Huth (5):
      tests/qtest/test-x86-cpuid-compat: Check for machines before using them
      tests/qtest/hd-geo-test: Check for the lsi53c895a controller before using it
      qemu-options: Remove the deprecated -no-quit option
      gitlab-ci: Enable docs in the centos job
      docs/tools/qemu-trace-stap.rst: Do not hard-code the QEMU binary name

 .gitlab-ci.d/buildtest.yml          |  2 +-
 docs/about/deprecated.rst           |  6 ---
 docs/about/removed-features.rst     |  7 +++
 docs/sphinx/fakedbusdoc.py          |  4 +-
 docs/tools/qemu-trace-stap.rst      | 24 +++++------
 hw/arm/virt.c                       |  9 +++-
 hw/core/machine.c                   |  3 ++
 hw/i386/pc.c                        |  3 ++
 hw/i386/pc_piix.c                   | 14 +++++-
 hw/i386/pc_q35.c                    | 13 +++++-
 hw/ppc/spapr.c                      | 15 ++++++-
 hw/s390x/s390-virtio-ccw.c          | 14 +++++-
 include/hw/boards.h                 |  3 ++
 include/hw/i386/pc.h                |  3 ++
 qemu-options.hx                     |  8 ----
 softmmu/vl.c                        |  8 +---
 tests/qtest/hd-geo-test.c           |  8 ++--
 tests/qtest/test-x86-cpuid-compat.c | 85 +++++++++++++++++++++----------------
 tests/unit/test-util-sockets.c      |  6 ++-
 19 files changed, 151 insertions(+), 84 deletions(-)


