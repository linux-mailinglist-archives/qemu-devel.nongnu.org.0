Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DB33ADB3B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:17:23 +0200 (CEST)
Received: from localhost ([::1]:33400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufX0-0003Tt-Ef
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUf-0000cu-Id
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:14:57 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUd-0002CK-Bs
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:14:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so9664884pjb.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kD5CkWIDPiTVP4qmwsRibP5haD81j6R3/Mglsa45GYc=;
 b=oOKr8nT/zpvHW8XhwkVSnk4gc2OuHr5nnCWofNK/z5gtlr1p/UGeK/FSum7iQFVmvh
 vmp5ZgoGckAUYXdVYsMTSlSUhQyh8nR+gtrAW/kUzT7ebK/iEahg2WJO8cT0L5Op6cfc
 2Zd3O5arayEHqCk011qlpXvwb5+SgodmGNUVDgh5tYjtnthavnzm1b3w8MK6aMEcWTPC
 a3X194IzxfvOSdyYU5jpnPIgwzk9206tsJaN+L2EyhID07uwYggMUGMLHFxFI4o+UQov
 bJmjJVDaUPL7mmMY4f1d4OVCgVw0Dky6ER/S6scDCBTX6UAbEVfn+yB83OFB9pH7+/Y7
 UE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kD5CkWIDPiTVP4qmwsRibP5haD81j6R3/Mglsa45GYc=;
 b=QmVij8pD7yWQARPLDKKGoHklXwPtckcMMF8GyNNwdjuyUw/LLQvJO9vq+TE+hTpcP3
 UoIdJlqiRDjg9e3krckmn3bbTjNrfnpuMwKzMZRqK4Y9nWxzVSLGpOy4Haae2e3Q+9GJ
 KQbvJ7kIYn5ka0Leb0Y6XRldxAV4r02f9mu+1IbssUORYxmCz1cePfLDh1+xY7H60xWD
 4Hjuf/NHWmjwac08zZQo24OZVDcCn3DbBNwoSoJ/yMgDuz34k8wjTU2+9YPx1IWxMF6P
 SnAloFU5qcZE2duh7S/8S2gAeCmHv+auYXMWScK6G4YFX+8jr8XRhYUYZ767Tgasrsnc
 pNow==
X-Gm-Message-State: AOAM530wetq1pSnxOwqZyjDujLepf8zLmAn2J9SWeo4qJpoRtdv/tqu5
 xTorTUdB5tXyo7H4oe5IWPk+wRO2pUkUvQ==
X-Google-Smtp-Source: ABdhPJwPsqUJWsQp5tqBfOPkcHC6WRZ8aAPcSzzpb7l8zNDGv4DUt1CBtbqVcrV3FTN+6/MzFyItuw==
X-Received: by 2002:a17:90b:1e09:: with SMTP id
 pg9mr28749367pjb.208.1624126493507; 
 Sat, 19 Jun 2021 11:14:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/33] tcg patch queue
Date: Sat, 19 Jun 2021 11:14:19 -0700
Message-Id: <20210619181452.877683-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:

  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210619

for you to fetch changes up to 8169ec35eb766a12ad0ae898119060fde148ab61:

  util/oslib-win32: Fix fatal assertion in qemu_try_memalign (2021-06-19 11:09:11 -0700)

----------------------------------------------------------------
TCI cleanup and re-encoding
Fixes for #367 and #390.
Move TCGCond to tcg/tcg-cond.h.
Fix for win32 qemu_try_memalign.

----------------------------------------------------------------
Alessandro Di Federico (1):
      tcg: expose TCGCond manipulation routines

Richard Henderson (31):
      tcg: Combine dh_is_64bit and dh_is_signed to dh_typecode
      tcg: Add tcg_call_flags
      accel/tcg/plugin-gen: Drop inline markers
      plugins: Drop tcg_flags from struct qemu_plugin_dyn_cb
      accel/tcg: Add tcg call flags to plugins helpers
      tcg: Store the TCGHelperInfo in the TCGOp for call
      tcg: Add tcg_call_func
      tcg: Build ffi data structures for helpers
      tcg/tci: Improve tcg_target_call_clobber_regs
      tcg/tci: Move call-return regs to end of tcg_target_reg_alloc_order
      tcg/tci: Use ffi for calls
      tcg/tci: Reserve r13 for a temporary
      tcg/tci: Emit setcond before brcond
      tcg/tci: Remove tci_write_reg
      tcg/tci: Change encoding to uint32_t units
      tcg/tci: Implement goto_ptr
      tcg/tci: Implement movcond
      tcg/tci: Implement andc, orc, eqv, nand, nor
      tcg/tci: Implement extract, sextract
      tcg/tci: Implement clz, ctz, ctpop
      tcg/tci: Implement mulu2, muls2
      tcg/tci: Implement add2, sub2
      tcg/tci: Split out tci_qemu_ld, tci_qemu_st
      Revert "tcg/tci: Use exec/cpu_ldst.h interfaces"
      tcg/tci: Remove the qemu_ld/st_type macros
      tcg/tci: Use {set,clear}_helper_retaddr
      tests/tcg: Increase timeout for TCI
      accel/tcg: Probe the proper permissions for atomic ops
      tcg/sparc: Fix temp_allocate_frame vs sparc stack bias
      tcg: Allocate sufficient storage in temp_allocate_frame
      tcg: Restart when exhausting the stack frame

Stefan Weil (1):
      util/oslib-win32: Fix fatal assertion in qemu_try_memalign

 configure                                          |    3 +
 accel/tcg/atomic_template.h                        |   24 +-
 accel/tcg/plugin-helpers.h                         |    5 +-
 include/exec/helper-head.h                         |   37 +-
 include/exec/helper-tcg.h                          |   34 +-
 include/qemu/plugin.h                              |    1 -
 include/tcg/tcg-cond.h                             |  101 ++
 include/tcg/tcg-opc.h                              |    4 +-
 include/tcg/tcg.h                                  |   71 +-
 target/hppa/helper.h                               |    3 -
 target/i386/ops_sse_header.h                       |    3 -
 target/m68k/helper.h                               |    1 -
 target/ppc/helper.h                                |    3 -
 tcg/tcg-internal.h                                 |   22 +
 tcg/tci/tcg-target-con-set.h                       |    1 +
 tcg/tci/tcg-target.h                               |   68 +-
 accel/tcg/cputlb.c                                 |   95 +-
 accel/tcg/plugin-gen.c                             |   20 +-
 accel/tcg/user-exec.c                              |    8 +-
 plugins/core.c                                     |   30 +-
 tcg/optimize.c                                     |    3 +-
 tcg/tcg.c                                          |  300 +++--
 tcg/tci.c                                          | 1203 ++++++++++----------
 util/oslib-win32.c                                 |    6 +-
 tcg/sparc/tcg-target.c.inc                         |   16 +-
 tcg/tci/tcg-target.c.inc                           |  550 ++++-----
 tcg/meson.build                                    |    8 +-
 tcg/tci/README                                     |   20 +-
 tests/docker/dockerfiles/alpine.docker             |    1 +
 tests/docker/dockerfiles/centos8.docker            |    1 +
 tests/docker/dockerfiles/debian10.docker           |    1 +
 tests/docker/dockerfiles/fedora-i386-cross.docker  |    1 +
 tests/docker/dockerfiles/fedora-win32-cross.docker |    1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker |    1 +
 tests/docker/dockerfiles/fedora.docker             |    1 +
 tests/docker/dockerfiles/ubuntu.docker             |    1 +
 tests/docker/dockerfiles/ubuntu1804.docker         |    1 +
 tests/docker/dockerfiles/ubuntu2004.docker         |    1 +
 tests/tcg/Makefile.target                          |    6 +-
 39 files changed, 1454 insertions(+), 1202 deletions(-)
 create mode 100644 include/tcg/tcg-cond.h

