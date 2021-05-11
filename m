Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8447537A181
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:16:11 +0200 (CEST)
Received: from localhost ([::1]:56030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNYj-00048R-BH
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWf-0001JH-GH
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWd-0000eR-6x
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iRWvQMvp22OmFpBPkzZ7S97HM9c4Iq/dQ24BHzTG9kE=;
 b=gfCRBt7+T52zSdYT1mKt4EXnMDo5gbpAeyMb7UlZQzy05viXeE6FpkTkqz85zI9r57oCkn
 vbx2UN/1EsyucWzUelRl26BQvdjnX1GK/cmtDVsYB4CFAyA7kW15VYTU25sc2+bmeIQRSJ
 HeY2HriKzvc8F9qmBIZcPrzHAQoF9ZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-wpp4Jx7yPyC7Z3uJtT7Q5g-1; Tue, 11 May 2021 04:13:52 -0400
X-MC-Unique: wpp4Jx7yPyC7Z3uJtT7Q5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67472107ACC7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:13:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35CA45D9E3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:13:51 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/33] Misc (mostly i386) patches for 2021-05-11
Date: Tue, 11 May 2021 04:13:17 -0400
Message-Id: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e58c7a3bba3076890592f02d2b0e596bf191b5c2:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210510-1' into staging (2021-05-10 17:28:11 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 8708c1e0182293b51e07c0640848f93a3354376e:

  coverity-scan: list components, move model to scripts/coverity-scan (2021-05-11 04:11:14 -0400)

----------------------------------------------------------------
* AccelCPUClass and sysemu/user split for i386 (Claudio)
* i386 page walk unification
* Fix detection of gdbus-codegen
* Misc refactoring
* snapshot-load bugfix

----------------------------------------------------------------
Claudio Fontana (18):
      i386: split cpu accelerators from cpu.c, using AccelCPUClass
      cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
      accel: introduce new accessor functions
      target/i386: fix host_cpu_adjust_phys_bits error handling
      accel-cpu: make cpu_realizefn return a bool
      i386: split smm helper (sysemu)
      i386: split tcg excp_helper into sysemu and user parts
      i386: move TCG bpt_helper into sysemu/
      i386: split misc helper user stubs and sysemu part
      i386: separate fpu_helper sysemu-only parts
      i386: split svm_helper into sysemu and stub-only user
      i386: split seg_helper into user-only and sysemu parts
      i386: split off sysemu part of cpu.c
      target/i386: gdbstub: introduce aux functions to read/write CS64 regs
      target/i386: gdbstub: only write CR0/CR2/CR3/EFER for sysemu
      i386: make cpu_load_efer sysemu-only
      accel: move call to accel_init_interfaces
      accel: add init_accel_cpu for adapting accel behavior to CPU type

Paolo Bonzini (13):
      i386: split off sysemu-only functionality in tcg-cpu
      target/i386: merge SVM_NPTEXIT_* with PF_ERROR_* constants
      target/i386: move paging mode constants from SVM to cpu.h
      target/i386: extract mmu_translate
      target/i386: pass cr3 to mmu_translate
      target/i386: extend pg_mode to more CR0 and CR4 bits
      target/i386: allow customizing the next phase of the translation
      target/i386: use mmu_translate for NPT walk
      main-loop: remove dead code
      migration: do not restart VM after successful snapshot-load
      qemu-option: support accept-any QemuOptsList in qemu_opts_absorb_qdict
      configure: fix detection of gdbus-codegen
      coverity-scan: list components, move model to scripts/coverity-scan

Richard Henderson (2):
      target/i386: Rename helper_fldt, helper_fstt
      target/i386: Split out do_fsave, do_frstor, do_fxsave, do_fxrstor

 MAINTAINERS                                        |   2 +-
 accel/accel-common.c                               |  32 +
 bsd-user/main.c                                    |   2 +-
 configure                                          |   4 +-
 cpu.c                                              |   5 +-
 hw/core/machine.c                                  |   1 +
 hw/i386/pc_piix.c                                  |   1 +
 include/hw/core/accel-cpu.h                        |   2 +-
 include/hw/core/cpu.h                              |   6 +
 include/qemu/accel.h                               |  13 +
 include/qemu/main-loop.h                           |  18 -
 linux-user/main.c                                  |   2 +-
 migration/savevm.c                                 |  16 +-
 monitor/hmp-cmds.c                                 |   7 +-
 scripts/coverity-scan/COMPONENTS.md                | 154 ++++
 .../{coverity-model.c => coverity-scan/model.c}    |   0
 softmmu/vl.c                                       |   1 -
 target/i386/cpu-internal.h                         |  70 ++
 target/i386/cpu-sysemu.c                           | 352 ++++++++++
 target/i386/cpu.c                                  | 775 ++-------------------
 target/i386/cpu.h                                  |  59 +-
 target/i386/gdbstub.c                              | 165 ++---
 target/i386/helper.c                               |  13 +
 target/i386/helper.h                               |  11 +
 target/i386/host-cpu.c                             | 204 ++++++
 target/i386/host-cpu.h                             |  19 +
 target/i386/hvf/hvf-cpu.c                          |  68 ++
 target/i386/hvf/meson.build                        |   1 +
 target/i386/kvm/kvm-cpu.c                          | 151 ++++
 target/i386/kvm/kvm-cpu.h                          |  41 ++
 target/i386/kvm/kvm.c                              |   3 +-
 target/i386/kvm/meson.build                        |   7 +-
 target/i386/meson.build                            |   9 +-
 target/i386/svm.h                                  |  10 -
 target/i386/tcg/bpt_helper.c                       | 276 --------
 target/i386/tcg/excp_helper.c                      | 573 ---------------
 target/i386/tcg/fpu_helper.c                       | 106 ++-
 target/i386/tcg/helper-tcg.h                       |   8 +
 target/i386/tcg/meson.build                        |   5 +-
 target/i386/tcg/misc_helper.c                      | 467 -------------
 target/i386/tcg/seg_helper.c                       | 237 +------
 target/i386/tcg/seg_helper.h                       |  66 ++
 target/i386/tcg/sysemu/bpt_helper.c                | 293 ++++++++
 target/i386/tcg/sysemu/excp_helper.c               | 471 +++++++++++++
 target/i386/tcg/sysemu/fpu_helper.c                |  57 ++
 target/i386/tcg/sysemu/meson.build                 |  10 +
 target/i386/tcg/sysemu/misc_helper.c               | 442 ++++++++++++
 target/i386/tcg/sysemu/seg_helper.c                | 125 ++++
 target/i386/tcg/{ => sysemu}/smm_helper.c          |  19 +-
 target/i386/tcg/{ => sysemu}/svm_helper.c          |  75 +-
 target/i386/tcg/sysemu/tcg-cpu.c                   |  83 +++
 target/i386/tcg/tcg-cpu.c                          |  56 +-
 target/i386/tcg/tcg-cpu.h                          |  21 +-
 target/i386/tcg/translate.c                        |  13 +-
 target/i386/tcg/user/excp_helper.c                 |  39 ++
 target/i386/tcg/user/meson.build                   |   6 +
 target/i386/tcg/user/misc_stubs.c                  |  75 ++
 target/i386/tcg/user/seg_helper.c                  | 109 +++
 target/i386/tcg/user/svm_stubs.c                   |  76 ++
 util/main-loop.c                                   |  61 --
 util/qemu-option.c                                 |   3 +-
 61 files changed, 3308 insertions(+), 2688 deletions(-)
 create mode 100644 scripts/coverity-scan/COMPONENTS.md
 rename scripts/{coverity-model.c => coverity-scan/model.c} (100%)
 create mode 100644 target/i386/cpu-internal.h
 create mode 100644 target/i386/cpu-sysemu.c
 create mode 100644 target/i386/host-cpu.c
 create mode 100644 target/i386/host-cpu.h
 create mode 100644 target/i386/hvf/hvf-cpu.c
 create mode 100644 target/i386/kvm/kvm-cpu.c
 create mode 100644 target/i386/kvm/kvm-cpu.h
 create mode 100644 target/i386/tcg/seg_helper.h
 create mode 100644 target/i386/tcg/sysemu/bpt_helper.c
 create mode 100644 target/i386/tcg/sysemu/excp_helper.c
 create mode 100644 target/i386/tcg/sysemu/fpu_helper.c
 create mode 100644 target/i386/tcg/sysemu/meson.build
 create mode 100644 target/i386/tcg/sysemu/misc_helper.c
 create mode 100644 target/i386/tcg/sysemu/seg_helper.c
 rename target/i386/tcg/{ => sysemu}/smm_helper.c (98%)
 rename target/i386/tcg/{ => sysemu}/svm_helper.c (95%)
 create mode 100644 target/i386/tcg/sysemu/tcg-cpu.c
 create mode 100644 target/i386/tcg/user/excp_helper.c
 create mode 100644 target/i386/tcg/user/meson.build
 create mode 100644 target/i386/tcg/user/misc_stubs.c
 create mode 100644 target/i386/tcg/user/seg_helper.c
 create mode 100644 target/i386/tcg/user/svm_stubs.c
-- 
2.26.2


