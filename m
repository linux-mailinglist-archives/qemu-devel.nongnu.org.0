Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2BD47C42E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:50:37 +0100 (CET)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziLU-0002Ze-JA
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:50:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIg-0008FL-SM
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:42 -0500
Received: from [2607:f8b0:4864:20::629] (port=45922
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIe-0007a7-Sk
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:42 -0500
Received: by mail-pl1-x629.google.com with SMTP id w24so11177507ply.12
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zdkxIfrs7etEbo2HKYMlzJUCkwRxmRb8fbolS7aee08=;
 b=PTpRP/91tPsDoOn88FRAKkk0hDXa5KnbhOL5wE0rwzZwhuh1xb6VX2SbG5p1HnEt03
 uNvrFOXLZ3kHXZiV9os7TMlHhPc8fFHXJtxOt4G0ZRk1cfmoJyUKwejT56JrZHrqyfSj
 sNAfzW/W7EdpFXwDeVXDnBSS7vsWlQiRTM6c6hemekqPcZQwkViOe1367N6x6gAwi0OD
 /xJW5fM1kEbQJi2BY5Gdh/JBfU4vMBPVEPcl9tVkFKUQtAxtQLYhLk12vdblWh9y4Hl5
 YMrmPsxCvQwl9tzpJ//I1Sel5+Sw1O1WEVMxxway9SvUIdQyUh2YJaunyXjrlZyxwNWU
 IBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zdkxIfrs7etEbo2HKYMlzJUCkwRxmRb8fbolS7aee08=;
 b=409KoVJYJFzEOehHqE8Rfk6mEBk6v8UdH9Af+EQfh6A8OFxnqRIRieKKODOvcLt1QY
 VNPmD23Y+iTu82vXFtvSJ/1GhP92r7Mew/8wqjbRJ1aC6vNhds/dPmmGEzsFYiSdejC+
 yLHW1gdExRTg4NJBoHtg9ftk68R8bmtqCAT3RtgVYoWENUqaDo9POOG7BdZmwyY9uLb9
 cCQbeklH7KpHIxRORw8fIFGAo2n66TFucTVkVZyu62YQSZgsdRcvnNUeVGcy6NWfP0YC
 Ho6XNxuXho7T9UXu8od62bprmD+eRdASJ/Vi+vWkvGFQxROROdt+haTzFWMbDNIe65b6
 hb5Q==
X-Gm-Message-State: AOAM532QDicEuXqu99C2xEZR34GC9mF2vv25QmhyopqGkEHErC4kBU9K
 PvlVB6saSHWfOz0XtlP6PVpZ5WH72Kkmug==
X-Google-Smtp-Source: ABdhPJyf13O/q30hzJeISP8OeskkneZJOwcbzQULY+nmsUyQ1ZPs5Eem09KvPCjQWfB7w6dOfu4QMQ==
X-Received: by 2002:a17:902:e793:b0:148:98d3:1950 with SMTP id
 cp19-20020a170902e79300b0014898d31950mr3837557plb.54.1640105259258; 
 Tue, 21 Dec 2021 08:47:39 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/31] tcg/loongarch64: New tcg backend
Date: Tue, 21 Dec 2021 08:47:06 -0800
Message-Id: <20211221164737.1076007-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 2bf40d0841b942e7ba12953d515e62a436f0af84:

  Merge tag 'pull-user-20211220' of https://gitlab.com/rth7680/qemu into staging (2021-12-20 13:20:07 -0800)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-loong-20211221

for you to fetch changes up to a00966914bf8e5223427894ae36bb439c4b266dd:

  tests/docker: Add gentoo-loongarch64-cross image and run cross builds in GitLab (2021-12-21 07:45:47 -0800)

----------------------------------------------------------------
Initial commit of tcg/loongarch64

----------------------------------------------------------------
WANG Xuerui (31):
      elf: Add machine type value for LoongArch
      MAINTAINERS: Add tcg/loongarch64 entry with myself as maintainer
      tcg/loongarch64: Add the tcg-target.h file
      tcg/loongarch64: Add generated instruction opcodes and encoding helpers
      tcg/loongarch64: Add register names, allocation order and input/output sets
      tcg/loongarch64: Define the operand constraints
      tcg/loongarch64: Implement necessary relocation operations
      tcg/loongarch64: Implement the memory barrier op
      tcg/loongarch64: Implement tcg_out_mov and tcg_out_movi
      tcg/loongarch64: Implement goto_ptr
      tcg/loongarch64: Implement sign-/zero-extension ops
      tcg/loongarch64: Implement not/and/or/xor/nor/andc/orc ops
      tcg/loongarch64: Implement deposit/extract ops
      tcg/loongarch64: Implement bswap{16,32,64} ops
      tcg/loongarch64: Implement clz/ctz ops
      tcg/loongarch64: Implement shl/shr/sar/rotl/rotr ops
      tcg/loongarch64: Implement add/sub ops
      tcg/loongarch64: Implement mul/mulsh/muluh/div/divu/rem/remu ops
      tcg/loongarch64: Implement br/brcond ops
      tcg/loongarch64: Implement setcond ops
      tcg/loongarch64: Implement tcg_out_call
      tcg/loongarch64: Implement simple load/store ops
      tcg/loongarch64: Add softmmu load/store helpers, implement qemu_ld/qemu_st ops
      tcg/loongarch64: Implement tcg_target_qemu_prologue
      tcg/loongarch64: Implement exit_tb/goto_tb
      tcg/loongarch64: Implement tcg_target_init
      tcg/loongarch64: Register the JIT
      common-user: Add safe syscall handling for loongarch64 hosts
      linux-user: Implement CPU-specific signal handler for loongarch64 hosts
      configure, meson.build: Mark support for loongarch64 hosts
      tests/docker: Add gentoo-loongarch64-cross image and run cross builds in GitLab

 configure                                          |    5 +
 meson.build                                        |    2 +-
 include/elf.h                                      |    2 +
 linux-user/host/loongarch64/host-signal.h          |   87 +
 tcg/loongarch64/tcg-target-con-set.h               |   31 +
 tcg/loongarch64/tcg-target-con-str.h               |   28 +
 tcg/loongarch64/tcg-target.h                       |  180 +++
 tcg/loongarch64/tcg-insn-defs.c.inc                |  979 ++++++++++++
 tcg/loongarch64/tcg-target.c.inc                   | 1677 ++++++++++++++++++++
 .gitlab-ci.d/container-cross.yml                   |   27 +
 .gitlab-ci.d/crossbuilds.yml                       |   19 +
 MAINTAINERS                                        |    7 +
 common-user/host/loongarch64/safe-syscall.inc.S    |   90 ++
 tests/docker/Makefile.include                      |   21 +
 .../dockerfiles/gentoo-loongarch64-cross.docker    |   21 +
 .../build-toolchain.sh                             |  128 ++
 16 files changed, 3303 insertions(+), 1 deletion(-)
 create mode 100644 linux-user/host/loongarch64/host-signal.h
 create mode 100644 tcg/loongarch64/tcg-target-con-set.h
 create mode 100644 tcg/loongarch64/tcg-target-con-str.h
 create mode 100644 tcg/loongarch64/tcg-target.h
 create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc
 create mode 100644 tcg/loongarch64/tcg-target.c.inc
 create mode 100644 common-user/host/loongarch64/safe-syscall.inc.S
 create mode 100644 tests/docker/dockerfiles/gentoo-loongarch64-cross.docker
 create mode 100755 tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/build-toolchain.sh

