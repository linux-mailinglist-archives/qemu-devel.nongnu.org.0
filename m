Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505A93C16AA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:54:28 +0200 (CEST)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WM7-0007g3-CM
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1VoC-0003fk-43
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1Vo7-000091-Ni
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625757559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rLgI9z6XwjQIDDq4uvLT/S+bjf9pyqhMG3RaNbAgJ28=;
 b=WpcAAC6zFQVn4mngRqhZG5lx/kyBBaSYPaHbZfq1rqZO5DkbiHmOCiv+VorBTcTJQkFidf
 Kbw1bpr3jG/2kzTIY1/FbuwITUyRjQrX4gFgHkIpER+F3xiwdvfjXLYF1kURBkF3B4zytM
 DLQQKNWuvoeztsMa+50Yj14ALfsevTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-ouKsKdVzPk6NiF8lHe0iVw-1; Thu, 08 Jul 2021 11:19:16 -0400
X-MC-Unique: ouKsKdVzPk6NiF8lHe0iVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 259E1101C8C9;
 Thu,  8 Jul 2021 15:19:15 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-112-175.ams2.redhat.com
 [10.36.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C10B2E71C;
 Thu,  8 Jul 2021 15:19:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/17] s390x update for softfreeze
Date: Thu,  8 Jul 2021 17:18:52 +0200
Message-Id: <20210708151909.907124-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)

are available in the Git repository at:

  https://gitlab.com/cohuck/qemu.git tags/s390x-20210708

for you to fetch changes up to 7ab3eb42b0d795f7321c4fca0ea06cb76a005b04:

  target/s390x: split sysemu part of cpu models (2021-07-07 14:01:59 +0200)

----------------------------------------------------------------
s390x updates:
- add gen16 cpumodels
- refactor/cleanup some code
- bugfixes

----------------------------------------------------------------

Cho, Yu-Chen (14):
  target/s390x: meson: add target_user_arch
  hw/s390x: rename tod-qemu.c to tod-tcg.c
  hw/s390x: tod: make explicit checks for accelerators when initializing
  hw/s390x: only build tod-tcg from the CONFIG_TCG build
  target/s390x: remove tcg-stub.c
  target/s390x: rename internal.h to s390x-internal.h
  target/s390x: start moving TCG-only code to tcg/
  target/s390x: move sysemu-only code out to cpu-sysemu.c
  target/s390x: split cpu-dump from helper.c
  target/s390x: make helper.c sysemu-only
  target/s390x: use kvm_enabled() to wrap call to kvm_s390_get_hpage_1m
  target/s390x: remove kvm-stub.c
  target/s390x: move kvm files into kvm/
  target/s390x: split sysemu part of cpu models

Christian Borntraeger (1):
  s390x/cpumodel: add 3931 and 3932

David Hildenbrand (1):
  s390x/tcg: Fix m5 vs. m4 field for VECTOR MULTIPLY SUM LOGICAL

Ulrich Weigand (1):
  target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL

 MAINTAINERS                                   |   6 +-
 hw/intc/s390_flic_kvm.c                       |   2 +-
 hw/s390x/meson.build                          |   4 +-
 hw/s390x/s390-stattrib-kvm.c                  |   2 +-
 hw/s390x/tod-kvm.c                            |   2 +-
 hw/s390x/{tod-qemu.c => tod-tcg.c}            |   4 +-
 hw/s390x/tod.c                                |   9 +-
 hw/vfio/ap.c                                  |   2 +-
 include/hw/s390x/tod.h                        |   2 +-
 meson.build                                   |   1 +
 target/s390x/arch_dump.c                      |   2 +-
 target/s390x/cpu-dump.c                       | 134 ++++++
 target/s390x/cpu-sysemu.c                     | 309 +++++++++++++
 target/s390x/cpu.c                            | 332 +++-----------
 target/s390x/cpu_features_def.h.inc           |   5 +
 target/s390x/cpu_models.c                     | 427 +-----------------
 target/s390x/cpu_models_sysemu.c              | 426 +++++++++++++++++
 target/s390x/cpu_models_user.c                |  20 +
 target/s390x/diag.c                           |   7 +-
 target/s390x/gdbstub.c                        |   2 +-
 target/s390x/gen-features.c                   |  14 +
 target/s390x/helper.c                         | 162 +------
 target/s390x/helper.h                         |  24 +-
 target/s390x/interrupt.c                      |   6 +-
 target/s390x/ioinst.c                         |   2 +-
 target/s390x/kvm-stub.c                       | 121 -----
 target/s390x/{ => kvm}/kvm.c                  |   2 +-
 target/s390x/{ => kvm}/kvm_s390x.h            |   0
 target/s390x/kvm/meson.build                  |  17 +
 target/s390x/kvm/trace-events                 |   7 +
 target/s390x/kvm/trace.h                      |   1 +
 target/s390x/machine.c                        |   6 +-
 target/s390x/meson.build                      |  42 +-
 target/s390x/mmu_helper.c                     |   4 +-
 target/s390x/{internal.h => s390x-internal.h} |   8 +
 target/s390x/sigp.c                           |   2 +-
 target/s390x/tcg-stub.c                       |  30 --
 target/s390x/{ => tcg}/cc_helper.c            |   2 +-
 target/s390x/{ => tcg}/crypto_helper.c        |   2 +-
 target/s390x/{ => tcg}/excp_helper.c          |   2 +-
 target/s390x/{ => tcg}/fpu_helper.c           |  65 ++-
 target/s390x/{ => tcg}/insn-data.def          |   0
 target/s390x/{ => tcg}/insn-format.def        |   0
 target/s390x/{ => tcg}/int_helper.c           |   2 +-
 target/s390x/{ => tcg}/mem_helper.c           |   2 +-
 target/s390x/tcg/meson.build                  |  14 +
 target/s390x/{ => tcg}/misc_helper.c          |   2 +-
 target/s390x/{ => tcg}/s390-tod.h             |   0
 target/s390x/{ => tcg}/tcg_s390x.h            |   0
 target/s390x/{ => tcg}/translate.c            |  41 +-
 target/s390x/{ => tcg}/translate_vx.c.inc     |   2 +-
 target/s390x/{ => tcg}/vec.h                  |   0
 target/s390x/{ => tcg}/vec_fpu_helper.c       |   2 +-
 target/s390x/{ => tcg}/vec_helper.c           |   2 +-
 target/s390x/{ => tcg}/vec_int_helper.c       |   0
 target/s390x/{ => tcg}/vec_string_helper.c    |   2 +-
 target/s390x/trace-events                     |   8 +-
 57 files changed, 1167 insertions(+), 1127 deletions(-)
 rename hw/s390x/{tod-qemu.c => tod-tcg.c} (96%)
 create mode 100644 target/s390x/cpu-dump.c
 create mode 100644 target/s390x/cpu-sysemu.c
 create mode 100644 target/s390x/cpu_models_sysemu.c
 create mode 100644 target/s390x/cpu_models_user.c
 delete mode 100644 target/s390x/kvm-stub.c
 rename target/s390x/{ => kvm}/kvm.c (99%)
 rename target/s390x/{ => kvm}/kvm_s390x.h (100%)
 create mode 100644 target/s390x/kvm/meson.build
 create mode 100644 target/s390x/kvm/trace-events
 create mode 100644 target/s390x/kvm/trace.h
 rename target/s390x/{internal.h => s390x-internal.h} (97%)
 delete mode 100644 target/s390x/tcg-stub.c
 rename target/s390x/{ => tcg}/cc_helper.c (99%)
 rename target/s390x/{ => tcg}/crypto_helper.c (98%)
 rename target/s390x/{ => tcg}/excp_helper.c (99%)
 rename target/s390x/{ => tcg}/fpu_helper.c (93%)
 rename target/s390x/{ => tcg}/insn-data.def (100%)
 rename target/s390x/{ => tcg}/insn-format.def (100%)
 rename target/s390x/{ => tcg}/int_helper.c (99%)
 rename target/s390x/{ => tcg}/mem_helper.c (99%)
 create mode 100644 target/s390x/tcg/meson.build
 rename target/s390x/{ => tcg}/misc_helper.c (99%)
 rename target/s390x/{ => tcg}/s390-tod.h (100%)
 rename target/s390x/{ => tcg}/tcg_s390x.h (100%)
 rename target/s390x/{ => tcg}/translate.c (99%)
 rename target/s390x/{ => tcg}/translate_vx.c.inc (99%)
 rename target/s390x/{ => tcg}/vec.h (100%)
 rename target/s390x/{ => tcg}/vec_fpu_helper.c (99%)
 rename target/s390x/{ => tcg}/vec_helper.c (99%)
 rename target/s390x/{ => tcg}/vec_int_helper.c (100%)
 rename target/s390x/{ => tcg}/vec_string_helper.c (99%)

-- 
2.31.1


