Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1EF3A8E79
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:38:58 +0200 (CEST)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKW9-0002lm-H8
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTq-0008MB-3L
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:34 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTo-0005af-60
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 i11-20020a17090a2acbb029016f0cce7c3fso564153pjg.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HwZ5wE7deK7PB6NLOA37eFYUnzRARHJg+XRdrF2uLH4=;
 b=FAusCewHwdSvR+MglbxRzwsffzDuCSDNZGTWqpOR5kkylaAk5OLM0iXSaaScICY+ju
 E1WgzP9Vfhb69/hOgDS2LpNYwWPCtuAecKSljpmh5Vs3VwAHlcoiYP59a+uKZIBoVqc0
 dHVsfW7etBz87bvLrgFTRN7JHyDvcYCKg2SA6H1tSXTMuGqygcud1zA4nFS2Tk0isl1o
 kBknkPx0hMziTFMyuCQ3V3vGXglF32vOR0DsJ7eTS2zh+1Qvotvmo7lbAJWIOBZ48jTk
 NMu+FSDBippKBp2LE64i/kSpcfXTzlMkeBpqQ/FNJcwK4i0Taf6D8072/PNCnf8qZ2Qv
 6q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HwZ5wE7deK7PB6NLOA37eFYUnzRARHJg+XRdrF2uLH4=;
 b=CXv6S24PN9WqywZ9RQxO+oNISi8GxQ1cBVLfaG3JcLxhgAXZUGlFdymaO6oI0pUOgm
 RqQwGESUWC4XmFtQN2K408J403Hqz2PhNVHipipZ2t5E+VJpMMnl/tSBw97gBR7wgdg1
 nWhUuF7ydRBok5CSJ6eGlUmDrGkr3onGNxXF0zKhxhiBAO8ZBZOnZ0b0dptdFd3n9G++
 0e+F2IHbqJLyMkTfH47wwWkUCEo3WkGFn6hqzR3yk73sItg2VxFrCoiPTbVA3nQbT8M3
 Z83sZb613LSnxZSKwCa8OjHnIXfk79Ri9nPcCe49YbKNeEYvepRn20/UkyT0tBixJJwf
 6vXA==
X-Gm-Message-State: AOAM531tZQC1E3P8Pp/NVHRDF2zpcSvmPk0qcMvV/8yo0hqMFmeUS1Ui
 pwr5pcRGR5QEO3EyykkQ7AzUopyevm0l9Q==
X-Google-Smtp-Source: ABdhPJwD85el9zWrg/mcdj13NtsJJhIV6Ghy47pd2ccdhFoVLwGxOCS7LKXb4oCg9yX+SI8BxY3JFg==
X-Received: by 2002:a17:90b:109:: with SMTP id p9mr8046801pjz.11.1623807390695; 
 Tue, 15 Jun 2021 18:36:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id o1sm321595pjf.56.2021.06.15.18.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:36:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] configure: Change to -std=gnu11
Date: Tue, 15 Jun 2021 18:36:21 -0700
Message-Id: <20210616013629.1458790-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-c11-20210615

for you to fetch changes up to c7a7cb5692690ad621b6eb2d1c7256907ff45d67:

  configure: Remove probe for _Static_assert (2021-06-15 18:31:00 -0700)

----------------------------------------------------------------
Change to -std=gnu11.
Replace QEMU_GENERIC with _Generic.
Remove configure detect of _Static_assert.

----------------------------------------------------------------
Richard Henderson (8):
      configure: Use -std=gnu11
      softfloat: Use _Generic instead of QEMU_GENERIC
      util: Use real functions for thread-posix QemuRecMutex
      util: Pass file+line to qemu_rec_mutex_unlock_impl
      util: Use unique type for QemuRecMutex in thread-posix.h
      include/qemu/lockable: Use _Generic instead of QEMU_GENERIC
      qemu/compiler: Remove QEMU_GENERIC
      configure: Remove probe for _Static_assert

 configure                   | 22 +----------
 meson.build                 |  2 +-
 include/qemu/compiler.h     | 51 -------------------------
 include/qemu/lockable.h     | 90 +++++++++++++++++++++------------------------
 include/qemu/thread-posix.h | 14 ++++---
 include/qemu/thread-win32.h |  6 ---
 include/qemu/thread.h       | 15 +++++++-
 fpu/softfloat.c             | 16 +++++---
 util/qemu-thread-posix.c    | 24 +++++++++++-
 util/qemu-thread-win32.c    |  2 +-
 10 files changed, 98 insertions(+), 144 deletions(-)

