Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E5382AE3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:24:19 +0200 (CEST)
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libMA-0002rI-0I
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIN-00062v-6o
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIA-0006LC-Gp
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wYipKf+ljs3fKfd/MOj5N8O5bj0c0MAqbozImlXmNLI=;
 b=KiKnocNyzcxnZPhC3ULs7OI4aq/m1i37MScJ0PyZLGmx9ZTSwDmt2Z6QVjtYKcCV6gAlT1
 uHGEGH+6BUOclF+3qabpguy6VilmuU9lkz4hSZ1Vnn3Kyp5EINyBoS1rCLpEltjIuX/sEi
 Fdr1Bch21/ZX6o4vn7CuEHIhQlVj16I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-71pMo3c7OOa0q2UsnpasXw-1; Mon, 17 May 2021 07:20:02 -0400
X-MC-Unique: 71pMo3c7OOa0q2UsnpasXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C545480DDFA
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 927EE163D4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] Misc patches for 2020-05-17
Date: Mon, 17 May 2021 07:19:41 -0400
Message-Id: <20210517112001.2564006-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6005ee07c380cbde44292f5f6c96e7daa70f4f7d:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-05-16 17:22:46 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 9b2de449e9593facd562fa7478b5ab15c9a8b588:

  KVM: Dirty ring support (2021-05-17 06:16:22 -0400)

----------------------------------------------------------------
* submodule cleanups (Philippe, myself)
* tiny step towards a usable preconfig mode (myself)
* bump Meson submodule (myself)
* Kconfig and LOCK_GUARD cleanups (philippe)
* new x86 CPUID feature (Yang Zhong)
* "-object qtest" support (myself)
* Dirty ring support for KVM (Peter)

----------------------------------------------------------------
Paolo Bonzini (6):
      configure: check for submodules if --with-git-submodules=ignore
      configure: simplify assignment to GIT_SUBMODULES
      meson: bump submodule to 0.57.2
      object: add more commands to preconfig mode
      qtest: add a QOM object for qtest
      KVM: do not allow setting properties at runtime

Peter Xu (10):
      memory: Introduce log_sync_global() to memory listener
      KVM: Use a big lock to replace per-kml slots_lock
      KVM: Create the KVMSlot dirty bitmap on flag changes
      KVM: Provide helper to get kvm dirty log
      KVM: Provide helper to sync dirty bitmap from slot to ramblock
      KVM: Simplify dirty log sync in kvm_set_phys_mem
      KVM: Cache kvm slot dirty bitmap size
      KVM: Add dirty-ring-size property
      KVM: Disable manual dirty log when dirty ring enabled
      KVM: Dirty ring support

Philippe Mathieu-Daudé (3):
      configure: Only clone softfloat-3 repositories if TCG is enabled
      hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'
      backends/tpm: Replace qemu_mutex_lock calls with QEMU_LOCK_GUARD

Yang Zhong (1):
      i386/cpu: Expose AVX_VNNI instruction to guest

 Makefile                                  |   2 +
 accel/kvm/kvm-all.c                       | 615 +++++++++++++++++++++++++-----
 accel/kvm/trace-events                    |   7 +
 backends/tpm/tpm_emulator.c               |  34 +-
 configure                                 |  67 ++--
 default-configs/devices/ppc64-softmmu.mak |   1 -
 hmp-commands.hx                           |   2 +
 hw/arm/Kconfig                            |   1 +
 hw/i386/Kconfig                           |   1 +
 hw/mem/Kconfig                            |   2 -
 hw/ppc/Kconfig                            |   1 +
 include/exec/memory.h                     |  12 +
 include/hw/core/cpu.h                     |   7 +
 include/sysemu/kvm_int.h                  |   7 +-
 meson                                     |   2 +-
 qapi/qom.json                             |  23 +-
 qemu-options.hx                           |  12 +
 softmmu/memory.c                          |  33 +-
 softmmu/qtest.c                           | 185 ++++++++-
 softmmu/vl.c                              |   5 +-
 target/i386/cpu.c                         |   4 +-
 target/i386/cpu.h                         |   2 +
 22 files changed, 853 insertions(+), 172 deletions(-)
-- 
2.27.0


