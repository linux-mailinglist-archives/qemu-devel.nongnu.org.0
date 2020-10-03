Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D728233D
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 11:40:12 +0200 (CEST)
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOe1T-0006Q2-45
	for lists+qemu-devel@lfdr.de; Sat, 03 Oct 2020 05:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kOe0I-00056K-Ch
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 05:38:58 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:41807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kOe0G-0000kY-Ct
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 05:38:58 -0400
Received: by mail-ot1-x331.google.com with SMTP id q21so3830851ota.8
 for <qemu-devel@nongnu.org>; Sat, 03 Oct 2020 02:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ifIPGL00gur+/n0tctA77gCE0Dh4Km++6yEVtBzthLA=;
 b=xRh9bFG/gi1H6k3ZtYsbsX2q5kXvtseln19TKOXDqbI5AobV61ys40qamnlcSG33Up
 +coAsZZkCmzkUSCCPpio83PvvNpI/7lek5fDJKdFxpXVyE/YyKwMiWfDPZvlZHLvsa/8
 mB9cd5/thOG7K2y7O8gy1wm9VdfeRGq4x6Bd9bjRwP3jEGPfslfgxXInNotj7bdLwNj1
 bMrgujLkZ4L0wNQjBUJcPqDDaz5b+yp6ikUh/5Xn79RTKPd0TxWq5UOCFcC/lou0rU1/
 KsJ+aNOP1smcrnUJHwhRjFQouCmNIYA7gTdvyqCbka9DfFSwzjUg2PniC5LN92NIIxLc
 WZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ifIPGL00gur+/n0tctA77gCE0Dh4Km++6yEVtBzthLA=;
 b=aHnwOASCkeLPz+zk1R58tONQNl3CNZB6G2yHBHoF/kbWtGC8nwgHOYd6nPj+dwxetT
 Hl3G3piILsPIXkVXcyDDLcYZILQ7OE0ryMlC9eKKyonNh81iQvy9537sFd4PfUaFVzat
 wvlvL1wtnrWzqUc+ctUHYia6aB6W7vac8gkV4T1JmDGQpmalqXau3U6ON4fRSVv2bx9M
 HY/xPslVVe9PQl8dLqmL/CLrA4Hc++P5luey54KojgPqR+P5ookPHjmjl7vgv6DUAlnB
 TsyXQqznz8qfuEq4UvIlCQZ/gcyCXARcc+wFq0HrbDBCpbYzqklcI7FhsvI5bz/MJKWr
 Okjw==
X-Gm-Message-State: AOAM532aEtiziVxHfsPtbgXNqNvsuhYP+zBOEckxYwJ2pVac+IVN8g+c
 JRIEeLppTaXlNTvjEz2GwYLdyN4Vha3AUNgO
X-Google-Smtp-Source: ABdhPJxJ0+7lp4cXo0HO32RqH/95PW3Z/Eb3XR05jW1tS+m+fotZ90Y2xseEFfuY21pA0MtpQh8g9Q==
X-Received: by 2002:a9d:51c2:: with SMTP id d2mr4898173oth.191.1601717934061; 
 Sat, 03 Oct 2020 02:38:54 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u2sm873131oig.48.2020.10.03.02.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 02:38:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/11] capstone + disassembler patch queue
Date: Sat,  3 Oct 2020 04:38:50 -0500
Message-Id: <20201003093851.324923-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Version 3 adds the method: to the dependency(), which avoids the
cmake warning, and also matches the bulk of the other dependency()
invocations throughout meson.build.

I also added the suggested current_source_dir() out of an abundance
of caution, even though it works for me either way.


r~


The following changes since commit dd8c1e808f1ca311e1f50bff218c3ee3198b1f02:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201002' into staging (2020-10-02 14:29:49 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-cap-20201003

for you to fetch changes up to c6d3da962f058bca09b25f99da35436816fb6de8:

  disas/capstone: Add skipdata hook for s390x (2020-10-03 04:25:14 -0500)

----------------------------------------------------------------
Update capstone submodule from v3.0.5 to v5 ("next").
Convert submodule build to meson.
Enable capstone disassembly for s390x.
Code cleanups in disas.c

----------------------------------------------------------------
Richard Henderson (11):
      capstone: Convert Makefile bits to meson bits
      capstone: Update to upstream "next" branch
      capstone: Require version 4.0 from a system library
      disas: Move host asm annotations to tb_gen_code
      disas: Clean up CPUDebug initialization
      disas: Use qemu/bswap.h for bfd endian loads
      disas: Cleanup plugin_disas
      disas: Configure capstone for aarch64 host without libvixl
      disas: Split out capstone code to disas/capstone.c
      disas: Enable capstone disassembly for s390x
      disas/capstone: Add skipdata hook for s390x

 configure                 |  68 +----
 Makefile                  |  18 +-
 meson.build               | 123 +++++++-
 include/disas/dis-asm.h   | 104 +++----
 include/disas/disas.h     |   2 +-
 include/exec/log.h        |   4 +-
 accel/tcg/translate-all.c |  24 +-
 disas.c                   | 707 +++++++++++-----------------------------------
 disas/capstone.c          | 326 +++++++++++++++++++++
 target/s390x/cpu.c        |   4 +
 tcg/tcg.c                 |   4 +-
 capstone                  |   2 +-
 disas/meson.build         |   1 +
 meson_options.txt         |   4 +
 14 files changed, 686 insertions(+), 705 deletions(-)
 create mode 100644 disas/capstone.c

