Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8641053C5C8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:12:48 +0200 (CEST)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1UF-0006bi-Jm
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HA-0005cx-9I
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1H6-0003HI-O3
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654239551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lt0Nj/bcn2TR+zh/o4jqGtPzMMuk5iIsHWLXrtePRyc=;
 b=Gn2bihOLMf3MDZqilRLWf/0EjaNwIwfDGdcIH8C3DjJh7KPzxKisEuTgySfojTsGPxtm3i
 q7pXT8eUbKbp8bF2kzG5wQRwU47hzmV8DeIs9zEui+YpClWyG2ey1sgNwn7/F2DPMvRyAE
 /AX6vRYPDKSFiPvRd+Z5vzSy2ycZGvw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-pZonbpGBN0GS8g_vjinftw-1; Fri, 03 Jun 2022 02:59:09 -0400
X-MC-Unique: pZonbpGBN0GS8g_vjinftw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CBF3185A794;
 Fri,  3 Jun 2022 06:59:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1285A2166B26;
 Fri,  3 Jun 2022 06:59:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 00/12] s390x and misc patches
Date: Fri,  3 Jun 2022 08:58:53 +0200
Message-Id: <20220603065905.23805-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 1e62a82574fc28e64deca589a23cf55ada2e1a7d:

  Merge tag 'm68k-for-7.1-pull-request' of https://github.com/vivier/qemu-m68k into staging (2022-06-02 06:30:24 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-06-03

for you to fetch changes up to 707d93d4abc6485c638e2aecd93fbd904f2f6b3e:

  ui: Remove deprecated options "-sdl" and "-curses" (2022-06-03 08:03:28 +0200)

----------------------------------------------------------------
* s390x storage key improvements for KVM
* Some cosmetics for s390x
* Update MAINTAINERS entries
* Improve some spots wrt memory handling in the qtests
* Clean up the "-display sdl" parameter parsing

----------------------------------------------------------------
Alex Bennée (1):
      tests/qtest: use g_autofree for test_server_create_chr

Dr. David Alan Gilbert (1):
      s390: Typo fix FLOATING_POINT_SUPPPORT_ENH

Eric Farman (1):
      MAINTAINERS: Update s390 vhost entries

Gautam Agrawal (1):
      tests/tcg: Test overflow conditions

Hailiang Zhang (1):
      MAINTAINERS: Change my email address

Janis Schoetterl-Glausch (1):
      target/s390x: kvm: Honor storage keys during emulation

Miaoqian Lin (1):
      qtest/npcm7xx_pwm-test: Fix memory leak in mft_qom_set

Thomas Huth (4):
      hw/s390x/s390-virtio-ccw: Improve the machine description string
      ui: Remove deprecated parameters of the "-display sdl" option
      ui: Switch "-display sdl" to use the QAPI parser
      ui: Remove deprecated options "-sdl" and "-curses"

Wenchao Wang (1):
      MAINTAINERS: Update maintainers for Guest x86 HAXM CPUs

 docs/about/deprecated.rst           |  26 --------
 docs/about/removed-features.rst     |  27 ++++++++
 qapi/ui.json                        |  26 +++++++-
 include/sysemu/sysemu.h             |   2 -
 target/s390x/cpu_features_def.h.inc |   2 +-
 hw/s390x/s390-virtio-ccw.c          |   2 +-
 softmmu/globals.c                   |   2 -
 softmmu/vl.c                        | 128 +-----------------------------------
 target/s390x/gen-features.c         |   6 +-
 target/s390x/kvm/kvm.c              |   9 +++
 target/s390x/tcg/translate.c        |   8 +--
 tests/qtest/npcm7xx_pwm-test.c      |   3 +
 tests/qtest/vhost-user-test.c       |   7 +-
 tests/tcg/multiarch/overflow.c      |  58 ++++++++++++++++
 ui/sdl2.c                           |  10 +++
 MAINTAINERS                         |   6 +-
 qemu-options.hx                     |  56 ++--------------
 17 files changed, 151 insertions(+), 227 deletions(-)
 create mode 100644 tests/tcg/multiarch/overflow.c


