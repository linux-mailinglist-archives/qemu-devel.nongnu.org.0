Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299DE69B21A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:56:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4vR-00057S-Gq; Fri, 17 Feb 2023 12:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vP-00056u-NJ
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:53:35 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vN-0000sW-F0
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:53:35 -0500
Received: by mail-pl1-x635.google.com with SMTP id b6so2148832plg.11
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=YzwdI5K8y8Tic1JwbEz4kn4kuyRk5B0nB92f6tC+1Ns=;
 b=UatQDxqUDj85d8Hss8P8xeXPjmIjq+mEjwk7TX7SLufy8nKnFnlaJwBEo7zDTrRiVh
 2Uf2uPc7INmD7XBIQedkJCoSfkcp9Gm59Fzl5raBqB/MJRNu20prF617FlwI3rL+E+Yx
 cZr49+WrRV/r7ShQSWvUyfrHsEnyxGYAdDppQG3LDpiV0T2GSlORcNesbRjFAWPX6MN6
 B5FJUt8ibuBcIUhnBnf7gSFoQrGPqZD7jdX58G1NEf6AXDUeF8MxczYAosHAO7J7NIOe
 IAsWfzfwgS0gIMJqV0gsZ8ZrK4e9dOEj/4zQC966rAOExv8DBQb6G2RnXDXaeJntZLJK
 CXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YzwdI5K8y8Tic1JwbEz4kn4kuyRk5B0nB92f6tC+1Ns=;
 b=k/RoZMvEUbqi878yXfFKIN+nJHsL1fVXV3SONodYJ6e1+IK71H+hxDSeRSKjatd2Br
 2AszyN7llNBmbJPx10O0QNxHmNKA9DKvMH8Xm0VxSxoguHdjwQvHVsdABPtSwCP4GrVD
 WRJZuOtFSLbg+evpTSv5EGrOYXis6+NoEhKjBUgE0LJ5vuLBR8esAbDyjZeBDmts+4If
 LjnsTKMYUp1+zDNXQ0GtuEt0Pwu1MA1dJ5SW6iA8h+WwvBY9kKrkXxA+05E+b54ByT2B
 p+Zv6ZoGSiu0TyFE6rTZ9cR5bz57na5Y1ev9Syrvy+hBWqCsDqkE5N2qLVnoZE2e7w5F
 c0sg==
X-Gm-Message-State: AO0yUKWn1ZsZ1Dfspzh6WObIyNEhwPYgF6H2xoad+Fs/apm4ZXSKWXGS
 s1rbCVUVHGYQZ2ojBFAUzrLOKQ==
X-Google-Smtp-Source: AK7set/sNJp+H9nku9PgTwU6yPQ1EHhFve82Y6TqlJTV5UxCY8B4Jp6I/4Gg2neqV86xP7a1YSuBhA==
X-Received: by 2002:a05:6a20:9386:b0:bc:ee04:275d with SMTP id
 x6-20020a056a20938600b000bcee04275dmr8413588pzh.61.1676656411171; 
 Fri, 17 Feb 2023 09:53:31 -0800 (PST)
Received: from localhost ([135.180.226.51]) by smtp.gmail.com with ESMTPSA id
 y26-20020a62b51a000000b00592417157f2sm3420021pfe.148.2023.02.17.09.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 09:53:30 -0800 (PST)
Subject: [PULL 0/9] Fourth RISC-V PR for QEMU 8.0
Date: Fri, 17 Feb 2023 09:51:54 -0800
Message-Id: <20230217175203.19510-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:

  tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)

are available in the Git repository at:

  https://github.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230217

for you to fetch changes up to e8c0697d79ef05aa5aefb1121dfede59855556b4:

  target/riscv: Fix vslide1up.vf and vslide1down.vf (2023-02-16 08:10:40 -0800)

----------------------------------------------------------------
Fourth RISC-V PR for QEMU 8.0

* A triplet of cleanups to the kernel/initrd loader that avoids
  duplication between the various boards.
* OpenSBI has been updated to version 1.2.
* Weiwei Li, Daniel Henrique Barboza, and Liu Zhiwei have been added as
  reviewers.  Thanks for the help!
* A fix for PMP matching to avoid incorrectly appling the default
  permissions on PMP permission violations.
* A cleanup to avoid an unnecessary avoid env_archcpu() in
  cpu_get_tb_cpu_state().
* Fixes for the vector slide instructions to avoid truncating 64-bit
  values (such as doubles) on 32-bit targets.

----------------------------------------------------------------
Alistair is going to be out for a bit, so I'm going to pick up the pull
requests for a bit until he's back online.  It's been a while so
apologies in advance if anything has gone off the rails, the only thing
I know of is that I moved to a Yubikey a while ago so there's likely
some new subkeys involved in the signing here.

This is all passing my standard tests (make check along with a handful
of Linux boots), both on its own and when merge into master from this
morning.  There has been some flakiness in both of those for a while
now, but it doesn't appear to be anything new here (and I think might
just be flaky infrastructure on my end).

----------------------------------------------------------------
Alistair Francis (1):
      MAINTAINERS: Add some RISC-V reviewers

Bin Meng (1):
      roms/opensbi: Upgrade from v1.1 to v1.2

Daniel Henrique Barboza (4):
      hw/riscv: handle 32 bit CPUs kernel_entry in riscv_load_kernel()
      hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
      hw/riscv/boot.c: make riscv_load_initrd() static
      target/riscv: avoid env_archcpu() in cpu_get_tb_cpu_state()

Frank Chang (1):
      target/riscv: Remove privileged spec version restriction for RVV

Himanshu Chauhan (1):
      target/riscv: Smepmp: Skip applying default rules when address matches

LIU Zhiwei (1):
      target/riscv: Fix vslide1up.vf and vslide1down.vf

 MAINTAINERS                                    |   3 +
 hw/riscv/boot.c                                |  97 ++++++++++++++++---------
 hw/riscv/microchip_pfsoc.c                     |  12 +--
 hw/riscv/opentitan.c                           |   4 +-
 hw/riscv/sifive_e.c                            |   4 +-
 hw/riscv/sifive_u.c                            |  12 +--
 hw/riscv/spike.c                               |  14 +---
 hw/riscv/virt.c                                |  12 +--
 include/hw/riscv/boot.h                        |   3 +-
 pc-bios/opensbi-riscv32-generic-fw_dynamic.bin | Bin 117704 -> 123072 bytes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.bin | Bin 115344 -> 121800 bytes
 roms/opensbi                                   |   2 +-
 target/riscv/cpu.c                             |   2 +-
 target/riscv/cpu_helper.c                      |   2 +-
 target/riscv/csr.c                             |  21 ++----
 target/riscv/pmp.c                             |   9 ++-
 target/riscv/vector_helper.c                   |   4 +-
 17 files changed, 99 insertions(+), 102 deletions(-)


