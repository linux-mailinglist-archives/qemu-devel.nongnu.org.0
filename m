Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BF241F150
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:36:27 +0200 (CEST)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKaI-00009T-PH
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXr-0006HM-BM
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:33:55 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXo-0007dl-4P
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:33:55 -0400
Received: by mail-qt1-x82e.google.com with SMTP id c20so9317211qtb.2
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vpzik9fNKhz18PtMw1zdDs2SKKM1QI9JJwM6/JJ0jiw=;
 b=Q/jcSR+2vgYTaLDG/lu58ZJtvalhEbeSKP2Yd5ZyuNSHGSWIjFXNbWJYiJ09zZHJOp
 TvSijhj5UqY2Kh4q+bSTTwSD4IwUW8DWMPUKU/rpetzGupwXusHXK9o3XTQ5PAVetTgm
 nn2VWGr2/Nm9D8NW2nfUmK0JI7+ZQ+KQTnErZjOQStr812XkYntW8SoPHaEN4QaX9iK9
 Uips5ExioaP1S/XL/goxBoSaP4+pQTYVwzW9kfzNak4bG1NM8cdO7oHan9xJjJVqbWLP
 gG5KHYNHEf7pX0xT4A4+Ahq9B2W6h8uOn+w/igs7efhYNj+wgM08fOxFBJdPU0fs6CaO
 VdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vpzik9fNKhz18PtMw1zdDs2SKKM1QI9JJwM6/JJ0jiw=;
 b=Ur52oKySqDgm7xDTbq5whyvB7NxxG797GdylACxiVcXYC77auzRk0cuUvSY7IF2Gn3
 C3hbmfBSVnbEyf2BMwWIpaDMP+JvIRbxBEzjLoEsbtT8RUje/9GSyNH/3MTqBU+wA9VM
 C6kdg7KbWo067PSIIYJoieIcVNAE1OHLJMk1YadSKzP51l59M4amMKnsZ7NvsXGHl3qX
 8sDyYE4S27Lb2I8SU3YN2gdzaAU3/cb+pgyJaa7m8JgC+EEsd1jHp3hwuJSnAclhIfgG
 ZQ3ewgqR3UFA/0EjKu2rCZ4LiWuYCEYD5ycO5vo95V/GCX74Iv5tWDmeupLeF19S6/Kz
 ln3g==
X-Gm-Message-State: AOAM531N7+8U+panZdZZVQdjwJ9McMEaSIhFkZ+1vTE0Elvy25DbOL1d
 zekSTvKfXjh5x2yh/5F0U9hENjTOp3v3aw==
X-Google-Smtp-Source: ABdhPJzgmfFWYTdaoR5Y63Yg361OnQ8sZSpnq4RnXvvedpHU1w2nr9dLwmomT13Hi63A7IifGISeTg==
X-Received: by 2002:ac8:71d4:: with SMTP id i20mr13627955qtp.248.1633102429588; 
 Fri, 01 Oct 2021 08:33:49 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] nios2: Enable cross compile and fix signals
Date: Fri,  1 Oct 2021 11:33:36 -0400
Message-Id: <20211001153347.1736014-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patches 2, 3, and 5 have appeared before.

The patch for the kuser page has been updated to use the commpage
infrastructure, which needed expanding just a bit to handle the
page being at the beginning of the address space.

Getting the toolchain built allowed the code to actually be tested,
which showed up a few more problems in the testsuite.

I have already pushed the debian-nios2-cross image to gitlab, much
like we did for hexagon and its locally built toolchain.


r~


Richard Henderson (9):
  tests/docker: Add debian-nios2-cross image
  linux-user/nios2: Properly emulate EXCP_TRAP
  linux-user/nios2: Fixes for signal frame setup
  linux-user/elfload: Rename ARM_COMMPAGE to HI_COMMPAGE
  linux-user/nios2: Map a real kuser page
  linux-user/nios2: Fix EA vs PC confusion
  linux-user/nios2: Fix sigmask in setup_rt_frame
  linux-user/nios2: Use set_sigmask in do_rt_sigreturn
  tests/tcg: Enable container_cross_cc for nios2

 target/nios2/cpu.h                            |  2 +-
 linux-user/elfload.c                          | 66 +++++++++++--
 linux-user/nios2/cpu_loop.c                   | 93 +++++++++---------
 linux-user/nios2/signal.c                     | 56 +++++------
 linux-user/signal.c                           |  2 -
 target/nios2/translate.c                      | 26 +++--
 tests/docker/Makefile.include                 | 19 ++++
 .../dockerfiles/debian-nios2-cross.docker     | 34 +++++++
 .../build-toolchain.sh                        | 97 +++++++++++++++++++
 tests/tcg/configure.sh                        |  6 ++
 10 files changed, 302 insertions(+), 99 deletions(-)
 create mode 100644 tests/docker/dockerfiles/debian-nios2-cross.docker
 create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.docker.d/build-toolchain.sh

-- 
2.25.1


