Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A524A8CB9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:51:43 +0100 (CET)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFi8r-0003JR-DS
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:51:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhce-0001je-Sa
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:18:24 -0500
Received: from [2607:f8b0:4864:20::62f] (port=46642
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhcd-0002DK-14
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:18:24 -0500
Received: by mail-pl1-x62f.google.com with SMTP id t9so804713plg.13
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bfdnjqrm6FaaYQC0ex5SspVsLecz1zTsxmDOFdViZF0=;
 b=H363xTTxMrPH+MqN7jgqg07/x+R9S2SJZTFkCFQ+rjf4MMJV2TAF6/f6ijyNQ4vXUX
 ZBV1QTZOgxPyZh/STB0up9mr+cVEtAd6sD054K5Wtl3tppSkHHa+DnFRvDwyLMk062v+
 17qzRtEmMwUf+2T4EUJT/UrjrZYstXRSgJdnN12O8F3rDlpr9CsyhFdHowvfE87gblIS
 m6S0r0caBog+oqDyELG0/EXIHl0XGHjQo54KNMg1i+ygpDmitiV5gG6hEwlIi00VulHJ
 uylX7Qcfk+RizXwDYnOFKu79498Ysk+lEKEwEYgySKPpQ1+V6VhbFwjJUXRyCHhHvzLc
 K/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bfdnjqrm6FaaYQC0ex5SspVsLecz1zTsxmDOFdViZF0=;
 b=fsQ0j9Udr5ZGyry12DY2JhP0T5U8a4kxEFLqxLEUh+OvG8XLiQM6+bk3flk8O3Dw3B
 rhHWVNW9NK1ozuvIr+epPBy/tUaXVkr/mF6EJ8DGUNgtzindW/kH1kREp1M9/91zuXGL
 H2xWYls9HnvD8vIpjvKAAz1FyJFpAdfY0CEkYjjQZOjtK9nkVhP01rJSm1MXV7WiewfX
 7sEZV2TGti1f9e0fkx9os3IHQcFOj553na+1Q+BkshGajbqzxy4JdteK2FW7b+SjHtK4
 7xArwW9vg8N/7IL2hgFgrMMhY8XcNIyovm77RvCDo+ZwKkIKJH4De8eaQ0rfR0WKyC+0
 s2Cg==
X-Gm-Message-State: AOAM5313ACbuWN7R/CcdHRYp/XtMeuMeuTs2Fu4Zw/HBpCcPqwJVNSSp
 8bP6MtKGT46ukhzHD+Vix2YoQKDhxf8=
X-Google-Smtp-Source: ABdhPJxGbJc7E7h3rXmF6N8+UtPC1AltCcnuC03muuoDgfl2ptH9+7Aflj8vPqMcrp2iV6NWk1lt0Q==
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr15091296pjb.55.1643915900664; 
 Thu, 03 Feb 2022 11:18:20 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id k9sm3851594pfc.157.2022.02.03.11.18.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:18:20 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 00/21] softmmu: Make various objects target agnostic
Date: Thu,  3 Feb 2022 20:17:53 +0100
Message-Id: <20220203191814.45023-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 include/exec/gdbstub.h            | 23 +++++++++---------
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
 36 files changed, 158 insertions(+), 129 deletions(-)

-- 
2.34.1


