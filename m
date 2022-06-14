Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169A54A32F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 02:45:59 +0200 (CEST)
Received: from localhost ([::1]:60238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0ugw-0002he-4t
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 20:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udJ-0008LY-Sd
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:16 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udI-00051g-5f
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:13 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w17so1576741wrg.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 17:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tm4WT5AsHKf5nHW8X5/uaW1jqdindg84mRL7k6Gz76w=;
 b=ewJdW6W0eAsjJLmyFrNTIpiueo7qrAMQ6svBf2PncSp7jGqorFdRZJJVLPvZOqEKOt
 /+7qG3thhf8twRukNl/REq3N3652kSdySUtKz3sDUsoquhKkeeHlWb5sKIjs0tAgx5Fh
 1LGJUrwSbSp4l0VP3G+d2DEwJpkJfT29w11nUyQBCsnfIpA4vphODICMxskmMv1crdT6
 0PmDcMkM9DFpyFYjY1JtegVC0YdHGgTc13G+uN0sfAlov+wi+tXpj4Gx3ZWWbl8P91rt
 GOO5iPz30GKy+JcjKF6JN16ygE04uQilfyZb7RBBZpAnufAaaoMq80hjJ5t0+P6MHQKx
 hwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tm4WT5AsHKf5nHW8X5/uaW1jqdindg84mRL7k6Gz76w=;
 b=CHcoCU08XT+j5HG4SK8+wgFKJDCNiKTdglHOUA7WcDjuToKBT8d2BM1SxU0I3jhDXR
 LeFpFhRoHtlkBNSSAhAEr7lRkSll8/wH+9KfWKplrYVgW7qVjnL7zLk5FfDaOAFEnkAc
 o6fOdeB9lNgG5x92e2IbH1xbEw1QGwiPom/VP1WFMrOmzyylsPor7YbgKUJw1fX7IwLk
 9xMy3jZNibv5rLp9i/ISNbSutX/1c69qyYcYqdur5Fo/9E9Umd3N71SQL0NOuiyFqcA0
 n5JbMNxWBaCmeuudD8x+AP1OJss85qkgAlecCMMxgESnPVsUI/sMKMlXCIvZpDh+Rbga
 619g==
X-Gm-Message-State: AJIora9xXdOp1T099LtKsv//Ka0nsNtkoptwOLHBFm2RHl8DJCNxDyy5
 HcestzSW34OnXXLxRPhiCBBNWg==
X-Google-Smtp-Source: AGRyM1tbQ5Kcxhd9yXMfJ9ewjSwwBDo5xhC95bRSNQqZaVAxohsLUmRxK0R96UoyVTbUIDrnax/kNw==
X-Received: by 2002:a05:6000:15ca:b0:218:48a7:a45f with SMTP id
 y10-20020a05600015ca00b0021848a7a45fmr2101218wry.591.1655167330510; 
 Mon, 13 Jun 2022 17:42:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a056000050300b0020d09f0b766sm9947454wrf.71.2022.06.13.17.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:42:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F2391FFB7;
 Tue, 14 Jun 2022 01:42:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 0/7] testing/next (docker, gitlab,tcg)
Date: Tue, 14 Jun 2022 01:42:02 +0100
Message-Id: <20220614004209.1970284-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:

  Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-next-140622-1

for you to fetch changes up to b56d1ee9514be227854a589b4e11551bed4448a0:

  .gitlab: use less aggressive nproc on our aarch64/32 runners (2022-06-14 00:15:06 +0100)

----------------------------------------------------------------
Various testing fixes:

  - fix compiler abi for test-armv6m-undef
  - fix isns suffixes for i386 tcg tests
  - fix gitlab cfi jobs
  - fix makefile docker invocation
  - don't enable xtensa-linux-user builds with system compiler
  - fix CIRRUS_nn var checking
  - don't spam the aarch64/32 runners with too many jobs at once

----------------------------------------------------------------
Alex Bennée (2):
      tests/docker: fix the IMAGE for build invocation
      .gitlab: use less aggressive nproc on our aarch64/32 runners

Daniel P. Berrangé (1):
      gitlab: compare CIRRUS_nn vars against 'null' not ""

Paolo Bonzini (1):
      tests/tcg: disable xtensa-linux-user again

Richard Henderson (2):
      test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
      tests/tcg/i386: Use explicit suffix on fist insns

Thomas Huth (1):
      gitlab-ci: Fix the build-cfi-aarch64 and build-cfi-ppc64-s390x jobs

 configure                                          |  5 ++++-
 tests/tcg/i386/test-i386-fp-exceptions.c           | 24 +++++++++++-----------
 tests/tcg/i386/test-i386.c                         |  2 +-
 .gitlab-ci.d/base.yml                              |  2 +-
 .gitlab-ci.d/buildtest.yml                         | 22 +++++++++-----------
 .../custom-runners/ubuntu-20.04-aarch32.yml        |  4 ++--
 .../custom-runners/ubuntu-20.04-aarch64.yml        | 24 +++++++++++-----------
 tests/docker/Makefile.include                      |  2 +-
 tests/tcg/arm/Makefile.softmmu-target              |  2 +-
 9 files changed, 44 insertions(+), 43 deletions(-)

-- 
2.30.2


