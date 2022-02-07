Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7631E4AB621
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:11:04 +0100 (CET)
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGz71-0000h4-I4
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:11:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyr6-0005eP-Qy
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:54:37 -0500
Received: from [2a00:1450:4864:20::333] (port=36599
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyr4-0001qz-UP
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:54:36 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so3187428wme.1
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r8HrcJkYiAi10kW5nOTqNv+fnk/dh+GFCeaZ9Il3sMo=;
 b=Yw2CkCC3H9Tq1F2Ga2HWQKbwtOu6U3QRzQmdlKoEph7Oy4sfZPhtg4cQA5lq6bsinR
 KlksSzYNnVZrgBf3dzkl50OXjt8p95aE+kFrf5O/m2KxoO95H2EeJP63/rw1ctBLioa9
 Kh4UMGXpb3WmMun0fl6++jrOCdb2WzcUBasBkJTvInj1XHjc4SsupNQqkrRMVTBpPIxO
 YDGc0sTnncfcDsOiBXf62/1XqUoNo061c5E8wACy+BuJXmWR97O1tIDq/8xyoO8C5ck0
 2wMa6jqC6OsYX9wb+r/xIcRq95KS8qAMnWqKDEH1+mLF2OyDPVFl7YAr1k8ezbBzmhXR
 HBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=r8HrcJkYiAi10kW5nOTqNv+fnk/dh+GFCeaZ9Il3sMo=;
 b=l995SkxwX8z/s/Tk8YiEEqfgSynBsf48H0QyWbd3RXtvFnHEtDWhMsTWEtE03rcxfe
 stkOwYCfIalKHij40GR3U7LIIO8nvtqmECRVROUWEtaveUecKG2ZCarrjtMqTIqf3V6I
 ONC4wvbs5tJZKQ8vxl1A1VRN3gY+PMtZ/eaQkR8Jr8poVX32xpyCVb7mG7N0FPQWfmEu
 eUDtdp3DSJZVBNhujmOTTYQKztrc5IZZSH6MgvYEXxPCAeYgUpR0V4Kl6bOEX4jNSmBf
 ixfnOKlzLEi16Krn2HScZFSfqjYaruV0dF9Uu32jG0fsOU/Sb7wClgychfaxIFvoNENi
 ABmQ==
X-Gm-Message-State: AOAM530z3aDW+mBuCYdlFkj5IZ4tFAR9P/dUiGSYqgWIYWveRx+tR155
 uAOci7SV53AifppfqSLfHrijcYaHo4I=
X-Google-Smtp-Source: ABdhPJzjX58y3BXtOHRDzAKk+shs0A+MrOV5C1sftlFvVvDFjrFX6+6vSID27Xna7vDtxebpqjI2ng==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr1677051wmi.37.1644220468270; 
 Sun, 06 Feb 2022 23:54:28 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p15sm9056696wrq.66.2022.02.06.23.54.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:54:27 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 00/21] softmmu: Make various objects target agnostic
Date: Mon,  7 Feb 2022 08:54:05 +0100
Message-Id: <20220207075426.81934-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

This is a re-org accel/ and softmmu/ to have more target-agnostic
objects.

Series fully reviewed. Paolo, Richard, do you want me to send a
pull request for this and the 'Remove "qemu/log.h"' series?

Since v1:
- Simplify kvm_cpus_are_resettable (Richard)

Since RFC:
- Rework accel/meson (Richard)
- Use vaddr in cpu_memory_rw_debug (Richard)
- Introduce CONFIG_HAX_IS_POSSIBLE (Richard)
- Introduce AccelOpsClass::cpu_thread_is_idle (Richard)
- Introduce AccelOpsClass::cpus_are_resettable (Richard)
- Add qemu_init_arch_modules (new)

Philippe Mathieu-Daudé (21):
  accel: Restrict sysemu stubs to system emulation
  accel/meson: Only build hw virtualization with system emulation
  exec: Declare vaddr as a generic target-agnostic type
  exec: Make cpu_memory_rw_debug() target agnostic
  sysemu/memory_mapping: Become target-agnostic
  sysemu/kvm: Make kvm_on_sigbus() / kvm_on_sigbus_vcpu() target
    agnostic
  accel/kvm: Simplify user-mode #ifdef'ry
  accel/hax: Introduce CONFIG_HAX_IS_POSSIBLE
  softmmu/cpus: Code movement
  accel: Introduce AccelOpsClass::cpu_thread_is_idle()
  accel: Introduce AccelOpsClass::cpus_are_resettable()
  softmmu/globals: Remove unused 'hw/i386/*' headers
  softmmu/runstate: Clean headers
  softmmu/physmem: Remove unnecessary include
  softmmu/cpu-timers: Remove unused 'exec/exec-all.h' header
  misc: Remove unnecessary "sysemu/cpu-timers.h" include
  misc: Add missing "sysemu/cpu-timers.h" include
  exec/gdbstub: Make gdb_exit() / gdb_set_stop_cpu() target agnostic
  exec/cpu: Make address_space_init/reloading_memory_map target agnostic
  softmmu: Add qemu_init_arch_modules()
  softmmu: Build target-agnostic objects once

 accel/kvm/kvm-accel-ops.c         | 12 ++++++++++
 accel/meson.build                 | 12 ++++++----
 accel/qtest/qtest.c               |  1 -
 accel/stubs/hax-stub.c            |  2 ++
 accel/stubs/kvm-stub.c            |  5 ----
 accel/stubs/meson.build           | 11 +++++----
 accel/tcg/tcg-accel-ops-icount.c  |  1 +
 accel/tcg/tcg-accel-ops-mttcg.c   |  1 +
 accel/tcg/tcg-accel-ops-rr.c      |  1 +
 accel/tcg/tcg-accel-ops.c         |  1 +
 cpu.c                             |  6 ++---
 include/exec/cpu-all.h            |  4 ----
 include/exec/cpu-common.h         | 39 +++++++++++++++++++++++++++++++
 include/exec/exec-all.h           | 26 ---------------------
 include/exec/gdbstub.h            | 25 ++++++++++----------
 include/hw/core/cpu.h             | 13 +----------
 include/sysemu/accel-ops.h        |  3 +++
 include/sysemu/arch_init.h        |  2 ++
 include/sysemu/hax.h              | 18 +++++++++-----
 include/sysemu/hw_accel.h         |  5 ----
 include/sysemu/kvm.h              |  6 ++---
 include/sysemu/memory_mapping.h   |  5 ++--
 softmmu/arch_init.c               |  9 +++++++
 softmmu/cpu-timers.c              |  1 -
 softmmu/cpus.c                    | 23 +++++++++++-------
 softmmu/globals.c                 |  2 --
 softmmu/memory_mapping.c          |  1 +
 softmmu/meson.build               | 24 +++++++++----------
 softmmu/physmem.c                 |  7 +++---
 softmmu/runstate.c                |  2 +-
 softmmu/vl.c                      |  5 +---
 target/alpha/translate.c          |  1 -
 target/i386/hax/hax-all.c         |  7 +-----
 target/i386/whpx/whpx-accel-ops.c |  6 +++++
 target/riscv/csr.c                |  1 +
 tests/unit/ptimer-test-stubs.c    |  1 -
 36 files changed, 159 insertions(+), 130 deletions(-)

-- 
2.34.1


