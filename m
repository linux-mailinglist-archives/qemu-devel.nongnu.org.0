Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11ED2DC565
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:33:30 +0100 (CET)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpag5-0001lB-HW
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpach-0008F5-VV
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:29:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpacg-00011a-9i
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608139797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yLjDfGt8aQ2MyROYcD3c9xU4GnKnKWjuPjAOp+93YzI=;
 b=bueqhwXL5yCGLLy2gnvq3AVHYjt9R2xB8lD8ZjJ8gW8z54meNvt4NOtzJz1v9AoU4FBR2O
 5Envdci2tUw+xk5bqML8+qRiPtOzd73ZxUlJBOOycZshgT82ffmJIdRqQOdo1fJM1qeLqm
 TeizHXyck0mOiNxgpvP0ee9wWoxuV2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-4mTQ8McQOjy__KQo94mSgA-1; Wed, 16 Dec 2020 12:29:55 -0500
X-MC-Unique: 4mTQ8McQOjy__KQo94mSgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8444059;
 Wed, 16 Dec 2020 17:29:54 +0000 (UTC)
Received: from thuth.com (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEFC510016F4;
 Wed, 16 Dec 2020 17:29:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/12] Compile QEMU with -Wimplicit-fallthrough
Date: Wed, 16 Dec 2020 18:29:37 +0100
Message-Id: <20201216172949.57380-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-12-15 21:24:31 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2020-12-16

for you to fetch changes up to cbbedfeeb77e25b065f8a2b0c33e81403edaf728:

  configure: Compile with -Wimplicit-fallthrough=2 (2020-12-16 12:52:20 +0100)

----------------------------------------------------------------
* Compile QEMU with -Wimplicit-fallthrough=2 to avoid bugs in
  switch-case statements
----------------------------------------------------------------

Chen Qun (6):
      hw/timer/renesas_tmr: silence the compiler warnings
      target/i386: silence the compiler warnings in gen_shiftd_rm_T1
      hw/intc/arm_gicv3_kvm: silence the compiler warnings
      accel/tcg/user-exec: silence the compiler warnings
      target/sparc/translate: silence the compiler warnings
      target/sparc/win_helper: silence the compiler warnings

Thomas Huth (6):
      disas/libvixl: Fix fall-through annotation for GCC >= 7
      target/unicore32/translate: Add missing fallthrough annotations
      hw/rtc/twl92230: Silence warnings about missing fallthrough statements
      tcg/optimize: Add fallthrough annotations
      tests/fp: Do not emit implicit-fallthrough warnings in the softfloat tests
      configure: Compile with -Wimplicit-fallthrough=2

 accel/tcg/user-exec.c                |  3 ++-
 configure                            |  1 +
 disas/libvixl/vixl/a64/disasm-a64.cc |  4 ++++
 disas/libvixl/vixl/globals.h         |  6 +++--
 hw/intc/arm_gicv3_kvm.c              |  8 +++++++
 hw/rtc/twl92230.c                    | 43 +++++++++++-------------------------
 hw/timer/renesas_tmr.c               |  1 +
 include/qemu/compiler.h              | 11 +++++++++
 target/i386/translate.c              |  7 ++++--
 target/sparc/translate.c             |  2 +-
 target/sparc/win_helper.c            |  2 +-
 target/unicore32/translate.c         |  2 ++
 tcg/optimize.c                       |  4 ++++
 tests/fp/meson.build                 |  2 ++
 14 files changed, 59 insertions(+), 37 deletions(-)


