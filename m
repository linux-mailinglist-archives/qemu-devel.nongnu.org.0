Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E54B5A00
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:36:04 +0100 (CET)
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgCg-0001IB-JH
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:36:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg8g-000781-GC
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:31:54 -0500
Received: from [2607:f8b0:4864:20::42d] (port=45957
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg8e-0002Wp-K5
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:31:54 -0500
Received: by mail-pf1-x42d.google.com with SMTP id p10so10063540pfo.12
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+4xj+MlI8zGDNVRed5Q9OOMgGp7L5eqIeyqcmelIMpA=;
 b=hKtANDbVFAyamZ2Gga3IzG/fLYLTdwMpfjXgys+3kmMpZtWHiobqTeIk85qyh/xyG5
 yoOxy0ghkWylo0t8JwrCrE6MtBW1/YERx69xC+PQqs186FNIbn9U/b4acELZiqGDRVmj
 HMMMG0CHX032oaY9lrg7HxbCOEuA5S9ppcSxavwLG2SoaYc5mWE1cEnj7JtY1UWslAXZ
 GghIl1VwSU3PxUu4ZhKRrNpYjLay9l44LswJYuIZp60Y/HaZ+XVLx29ZiLSEk0PmqItN
 deW+1PkbVtR+X23lr5qtkyaZxFPJ7+FRwDn+yk7azHvt5r/5fbnzTdZiM2tZFtqTQJ6X
 VYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+4xj+MlI8zGDNVRed5Q9OOMgGp7L5eqIeyqcmelIMpA=;
 b=BmS7puX5kZQItX1L3+CoMrJUqqwOF8USssxbyzCuL77jiH2R6IS+neJV1zwqksGezs
 gpIYAnc86V70blK/FMJnN9f1WJWHOg5V6PvGSRXFzTwrVUAzAqdKFLUcA5o13D9DhFq/
 GOUzpKEngG8UQCFIT/DQEwQsKBq9+C9RIx/OiMTBGxesn3G1pwBQVB7GVDsHQ8ubBiVu
 aLRdgP4DseZXBtTL9UtHnQfmvlHYVGaV9pay6rbd2gvkn+Y0yK969GavcMZJf35Z7BX3
 27tT5YgmG0rT5B2FW5SrwPXl2mewk3OztzAAVjcy4+F8E81R+nS8XbCLEC6IhuyQp8Pe
 IYRA==
X-Gm-Message-State: AOAM5308D7GRkokvgma3n+lLnsggW+yy00KXbwaaY7u9pyNvejWbl4qC
 8jUvzaCTYWn4LG8FKWG46UuVkq7BCiE=
X-Google-Smtp-Source: ABdhPJwe4FR92wkKt11vWQDg7ULr0j1RIbmeNRiSDXWqJTkvAbyHLObXqt6Cyq0ZPebDUYE9zSG4QQ==
X-Received: by 2002:a63:1f19:: with SMTP id f25mr277446pgf.324.1644863510857; 
 Mon, 14 Feb 2022 10:31:50 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id p2sm25137941pfo.125.2022.02.14.10.31.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:31:50 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 00/14] target: Use ArchCPU & CPUArchState as abstract
 interface to target CPU
Date: Mon, 14 Feb 2022 19:31:30 +0100
Message-Id: <20220214183144.27402-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Missing review: 10, 13, 14

Since v1:
- Include Hexagon OBJECT_DECLARE_TYPE() patch
- Add missing includes to Hexagon
- Introduce OBJECT_DECLARE_CPU_TYPE() macro
- Use OBJECT_DECLARE_CPU_TYPE()

Kind of respin of the "exec: Move translation declarations to
'translate-all.h'" series, but without modifying translate-all.h :)
(same same but different).

Based-on: <20220207082756.82600-1-f4bug@amsat.org>
"exec: Remove 'qemu/log.h' from 'exec-all.h'"

Philippe Mathieu-Daudé (13):
  meson: Display libfdt as disabled when system emulation is disabled
  hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
  hw/tricore: Remove unused and incorrect header
  exec/cpu_ldst: Include 'cpu.h' to get target_ulong definition
  cpu: Add missing 'exec/exec-all.h' and 'qemu/accel.h' headers
  target/i386/cpu: Ensure accelerators set CPU addressble physical bits
  target/i386/tcg/sysemu: Include missing 'exec/exec-all.h' header
  target: Include missing 'cpu.h'
  target/hexagon: Add missing 'hw/core/cpu.h' include
  target: Use forward declared type instead of structure type
  target: Use CPUArchState as interface to target-specific CPU state
  target: Introduce and use OBJECT_DECLARE_CPU_TYPE() macro
  target: Use ArchCPU as interface to target CPU

Taylor Simpson (1):
  Hexagon (target/hexagon) convert to OBJECT_DECLARE_TYPE

 cpu.c                                |  2 ++
 include/exec/cpu_ldst.h              |  1 +
 include/exec/poison.h                |  2 --
 include/hw/core/cpu.h                | 20 +++++++++++++++++++-
 include/hw/m68k/mcf.h                |  1 +
 include/hw/tricore/triboard.h        |  1 -
 include/qemu/typedefs.h              |  2 ++
 meson.build                          |  4 +++-
 target/alpha/cpu-qom.h               |  3 +--
 target/alpha/cpu.h                   | 11 +++--------
 target/arm/cpu-qom.h                 |  3 +--
 target/arm/cpu.h                     |  7 ++-----
 target/arm/hvf_arm.h                 |  2 +-
 target/avr/cpu-qom.h                 |  3 +--
 target/avr/cpu.h                     | 13 ++++---------
 target/cris/cpu-qom.h                |  3 +--
 target/cris/cpu.h                    |  7 ++-----
 target/hexagon/cpu.h                 | 23 ++++++++---------------
 target/hppa/cpu-qom.h                |  3 +--
 target/hppa/cpu.h                    | 12 +++---------
 target/i386/cpu-qom.h                |  3 +--
 target/i386/cpu.c                    |  1 +
 target/i386/cpu.h                    |  7 ++-----
 target/i386/tcg/sysemu/excp_helper.c |  1 +
 target/i386/tcg/sysemu/misc_helper.c |  1 +
 target/m68k/cpu-qom.h                |  3 +--
 target/m68k/cpu.h                    |  7 ++-----
 target/microblaze/cpu-qom.h          |  3 +--
 target/microblaze/cpu.h              |  9 +++------
 target/microblaze/mmu.h              |  2 ++
 target/mips/cpu-qom.h                |  3 +--
 target/mips/cpu.h                    | 10 +++-------
 target/mips/internal.h               | 15 ++++++++-------
 target/nios2/cpu.h                   |  9 ++++-----
 target/nios2/mmu.h                   |  2 ++
 target/openrisc/cpu.h                | 17 +++++------------
 target/ppc/cpu-qom.h                 |  5 ++---
 target/ppc/cpu.h                     |  7 ++-----
 target/riscv/cpu.h                   | 11 ++++-------
 target/riscv/pmp.h                   |  2 ++
 target/rx/cpu-qom.h                  |  5 +----
 target/rx/cpu.h                      |  6 ++----
 target/s390x/cpu-qom.h               |  7 +++----
 target/s390x/cpu.h                   |  7 ++-----
 target/sh4/cpu-qom.h                 |  3 +--
 target/sh4/cpu.h                     |  7 ++-----
 target/sparc/cpu-qom.h               |  3 +--
 target/sparc/cpu.h                   |  9 +++------
 target/tricore/cpu-qom.h             |  3 +--
 target/tricore/cpu.h                 | 10 +++-------
 target/xtensa/cpu-qom.h              |  3 +--
 target/xtensa/cpu.h                  | 13 +++++--------
 52 files changed, 129 insertions(+), 188 deletions(-)

-- 
2.34.1


