Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA9E4AFFA9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 22:58:40 +0100 (CET)
Received: from localhost ([::1]:45104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHuz0-0006m5-V4
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 16:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuvQ-0004nt-V6
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:54:57 -0500
Received: from [2607:f8b0:4864:20::1033] (port=56145
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuvP-0007pn-2m
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:54:56 -0500
Received: by mail-pj1-x1033.google.com with SMTP id om7so3399393pjb.5
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2KZkL2wmQwQy7hm8UUEMimxqqP2Wiic8rnGUinwm1fs=;
 b=ksyqlfPeU9E3kKcvbuvzQMR3Pjj4y3gf3Jh7lbs+I8z4vsfuaA9KgYjJ2zbjNzQhXJ
 96MLLApHmJj5J8wheZIvQ1fRMWdajhITPk5IwsEDvQopmIQPrMKBQLJzMMBndBkB7uRP
 pTRen5aAb79WdrynAZn7lB+hRBhjN85r9e9iQyIMOhAW4GU/glRjBbiLihJVXKLWBBgC
 RMoagPTs4Tmu2oCaURUNzUXsJ9zjjANCUDl6mUacYDNwO40eQwgdqdqIcD+zqU9zgwBJ
 /pdNZTp4VKzQD9D3vGBo0ynuZrM5Qa9jNNtYPd4uieeqk2KVdQqezGyHPVyw26Z/lpv1
 yAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2KZkL2wmQwQy7hm8UUEMimxqqP2Wiic8rnGUinwm1fs=;
 b=AhvNiLl/oD5lGSf/wsMg7chbaFzpNVZbQ2xJHIpVbY0h5tBQTlJ4Zs99u2dB+9Ghmb
 8EUHpZfoe51xjXuAp8xCX2j5iyylESRao4NKGxqOfY+b1Y5i19sT8s5VV9t4fhsloKDL
 WCardHJ7cvwpDYEiKinjiqI6VY0aH3K4yzubuqTDOrSjSXqNSTmXIjmOec1RMIvHOCM/
 o9Vl9vci+Wr7iNNTDbu0411uBpud8uzYm+R0TgJw4iNZAT+sdu5R761OQlrXMS+yycx7
 uyfloU2hb3I6xFHkig9zxFaE/WvzWGuRirUHFYXPQhiOkfyjZN/GyViw1WfJklOeJ10j
 pk8w==
X-Gm-Message-State: AOAM530tSbdaKvor9k6YJlKhKgeoV1FGEKmPBRzi7cpo+2o0i7YMQe9Z
 MmTUIuqTAgXN46RJX3YI25D1Zawi4hk=
X-Google-Smtp-Source: ABdhPJxa3gvxkLOrz6JIdY6OYyiEF1eN79hp7x4VDAtEZ5+M99pTlZhY1gnOwE6ptwmBcP2Wogs1nA==
X-Received: by 2002:a17:902:d2ca:: with SMTP id
 n10mr4337875plc.28.1644443692541; 
 Wed, 09 Feb 2022 13:54:52 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id oo7sm7980768pjb.33.2022.02.09.13.54.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:54:52 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 00/15] target: Use ArchCPU & CPUArchState as abstract
 interface to target CPU
Date: Wed,  9 Feb 2022 22:54:31 +0100
Message-Id: <20220209215446.58402-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

Hi Richard,

Kind of respin of the "exec: Move translation declarations to
'translate-all.h'" series, but without modifying translate-all.h :)
(same same but different).

Last patches are RFC, not sure worthwhile (at least for now).

Based-on: <20220207082756.82600-1-f4bug@amsat.org>
"exec: Remove 'qemu/log.h' from 'exec-all.h'"

Philippe Mathieu-Daudé (15):
  meson: Display libfdt as disabled when system emulation is disabled
  hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
  hw/tricore: Remove unused and incorrect header
  exec/cpu_ldst: Include 'cpu.h' to get target_ulong definition
  cpu: Add missing 'exec/exec-all.h' and 'qemu/accel.h' headers
  target/i386/cpu: Ensure accelerators set CPU addressble physical bits
  target/i386/tcg/sysemu: Include missing 'exec/exec-all.h' header
  target: Include missing 'cpu.h'
  target: Use forward declared type instead of structure type
  target: Use CPUArchState as interface to target-specific CPU state
  target: Use ArchCPU as interface to target CPU
  hw/m68k: Restrict M68kCPU type to target/ code
  hw/mips: Restrict MIPSCPU type to target/ code
  hw/sparc: Restrict SPARCCPU type to target/ code
  hw/sh4: Restrict SuperHCPU type to target/ code

 cpu.c                                |  2 ++
 include/exec/cpu_ldst.h              |  1 +
 include/exec/poison.h                |  2 --
 include/hw/core/cpu.h                |  2 +-
 include/hw/m68k/mcf.h                |  4 ++--
 include/hw/mips/cpudevs.h            |  6 ++----
 include/hw/sh4/sh.h                  |  3 +--
 include/hw/sparc/sparc64.h           |  4 +---
 include/hw/tricore/triboard.h        |  1 -
 include/qemu/typedefs.h              |  2 ++
 meson.build                          |  4 +++-
 target/alpha/cpu-qom.h               |  4 +++-
 target/alpha/cpu.h                   | 11 +++--------
 target/arm/cpu-qom.h                 |  4 +++-
 target/arm/cpu.h                     |  5 +----
 target/arm/hvf_arm.h                 |  2 +-
 target/avr/cpu-qom.h                 |  4 +++-
 target/avr/cpu.h                     | 13 ++++---------
 target/cris/cpu-qom.h                |  4 +++-
 target/cris/cpu.h                    |  7 ++-----
 target/hexagon/cpu.h                 | 10 +++-------
 target/hppa/cpu-qom.h                |  4 +++-
 target/hppa/cpu.h                    | 12 +++---------
 target/i386/cpu-qom.h                |  4 +++-
 target/i386/cpu.c                    |  1 +
 target/i386/cpu.h                    |  7 ++-----
 target/i386/tcg/sysemu/excp_helper.c |  1 +
 target/i386/tcg/sysemu/misc_helper.c |  1 +
 target/m68k/cpu-qom.h                |  2 +-
 target/m68k/cpu.h                    |  9 +++------
 target/microblaze/cpu-qom.h          |  4 +++-
 target/microblaze/cpu.h              | 11 +++++------
 target/microblaze/mmu.h              |  2 ++
 target/mips/cpu-qom.h                |  2 +-
 target/mips/cpu.h                    | 12 ++++--------
 target/mips/internal.h               | 15 ++++++++-------
 target/nios2/cpu.h                   |  8 ++++----
 target/nios2/mmu.h                   |  2 ++
 target/openrisc/cpu.h                | 18 +++++++-----------
 target/ppc/cpu-qom.h                 |  6 ++++--
 target/ppc/cpu.h                     |  7 ++-----
 target/riscv/cpu.h                   | 10 ++++------
 target/riscv/pmp.h                   |  2 ++
 target/rx/cpu-qom.h                  |  6 +++---
 target/rx/cpu.h                      |  6 ++----
 target/s390x/cpu-qom.h               |  8 +++++---
 target/s390x/cpu.h                   |  7 ++-----
 target/sh4/cpu-qom.h                 |  2 +-
 target/sh4/cpu.h                     |  9 +++------
 target/sparc/cpu-qom.h               |  2 +-
 target/sparc/cpu.h                   | 11 ++++-------
 target/tricore/cpu-qom.h             |  4 +++-
 target/tricore/cpu.h                 | 10 +++-------
 target/xtensa/cpu-qom.h              |  4 +++-
 target/xtensa/cpu.h                  | 13 +++++--------
 55 files changed, 142 insertions(+), 175 deletions(-)

-- 
2.34.1


