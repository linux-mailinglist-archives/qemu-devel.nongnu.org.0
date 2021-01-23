Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE303017BE
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:52:06 +0100 (CET)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3O0z-0006W3-0p
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzS-0005AD-Ve
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:30 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzO-0008DQ-F1
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:30 -0500
Received: by mail-pj1-x102c.google.com with SMTP id g15so5969100pjd.2
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Dn3paDwYs/XVMdPSob631/2BsKj2nyGGS5Sh7mc2RY=;
 b=u1wpe4/7/zuDjUZmO+z7g5bF6cScd95PMQoqZa1nMzwC8BcjlUbk0KHHTzHAWbri2Q
 AFC6tJdj7RjR9iuEiyhXxBSoDJ4kb5ml1qDGipIAoPWH3SA9WIWS+VXRzbgtmnECFS7o
 +3tCjsG9cEjVgrbpRrYgvnpTqST01k/cF9NIeOqOKYAiVGJ+BYLOxv+Ab0ZZfRYZdWJ6
 2POrUxS9eTtxE/uQ4sF6YRwuy8fMPVsGe1vcGvgkaU+zunQ/63V5WhkYaNhkQNgykogn
 NFMmO6xyee/Zb0QJhY/7BuGlBNaWfblj5rdC9XWb1CYuCzfKA1HT4/EGnzeM/1qsV5tp
 d86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Dn3paDwYs/XVMdPSob631/2BsKj2nyGGS5Sh7mc2RY=;
 b=gozz84fFkaZt44twNWAbIiSvLMl9SucYbSKDQYyYJmRB3aQf3+9TQDGV9fwJwN/z+6
 0zMnzLzLfRpmON9UUpiDkiuaRB0HaEoubcVNnTT6U5n13Op8wHDIYUKxaZPZJ1CJ4jug
 m1MGjPy6RG0bsFrEFdx8r5sRjTInk0/YdjIuiZxoUDYNdoqpke1QoaPBWmBZkxvDrLnI
 mnfd/qo2XdyRPvsQxj/HF27zZifKgWeCqg8RLSjP/o/eUZzHskZ5x+FVFmWeI+VECkb5
 +oRyPYGuBmuhHb5Tq0Fz8YFKfO1whGEq2bKQG/JwZbMtyNxRuRruThhmcbeszS5sqp+y
 VpeQ==
X-Gm-Message-State: AOAM5306aWkp2qu0QwGbTMJQ5arx8FQcKfRw1Pp48cVFM1gFuXCXGR4N
 jVGsUr3igm34LKii27mTgDPohyfZPuCNKg==
X-Google-Smtp-Source: ABdhPJwV4MSPlecgWXH80HJor2/LOoAvAerad8dFWFjzsg/qTxx8MbA2B+iQomNcYHU3OvkrqEhcvA==
X-Received: by 2002:a17:902:ed8c:b029:de:8484:809 with SMTP id
 e12-20020a170902ed8cb02900de84840809mr3094399plj.23.1611427823558; 
 Sat, 23 Jan 2021 10:50:23 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] tcg patch queue
Date: Sat, 23 Jan 2021 08:50:10 -1000
Message-Id: <20210123185020.1766324-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

The following changes since commit 0e32462630687a18039464511bd0447ada5709c3:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-01-22 10:35:55 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210123

for you to fetch changes up to 2e34067e9959f149a904cf1255985d3b68b52566:

  tcg: Toggle page execution for Apple Silicon (2021-01-22 12:48:01 -1000)

----------------------------------------------------------------
Fix tcg constant segv.
Optimize inline dup_const for MO_64.
Update the cpu running flag in cpu_exec_step_atomic
Some tidy up of tcg vs other accelerators

----------------------------------------------------------------
Douglas Crosher (1):
      tcg: update the cpu running flag in cpu_exec_step_atomic

Philippe Mathieu-Daudé (4):
      accel/tcg: Make cpu_gen_init() static
      accel/tcg: Restrict tb_gen_code() from other accelerators
      accel/tcg: Declare missing cpu_loop_exit*() stubs
      accel/tcg: Restrict cpu_io_recompile() from other accelerators

Richard Henderson (4):
      qemu/compiler: Split out qemu_build_not_reached_always
      tcg: Optimize inline dup_const for MO_64
      tcg: Increase the static number of temporaries
      accel/tcg: Move tb_flush_jmp_cache() to cputlb.c

Roman Bolshakov (1):
      tcg: Toggle page execution for Apple Silicon

 accel/tcg/internal.h      | 20 ++++++++++++++++++++
 include/exec/exec-all.h   | 11 -----------
 include/qemu/compiler.h   |  5 +++--
 include/qemu/osdep.h      | 28 ++++++++++++++++++++++++++++
 include/tcg/tcg.h         |  5 +++--
 accel/stubs/tcg-stub.c    | 10 ++++++++++
 accel/tcg/cpu-exec.c      |  7 +++++++
 accel/tcg/cputlb.c        | 19 +++++++++++++++++++
 accel/tcg/translate-all.c | 23 +++++------------------
 tcg/tcg.c                 |  7 ++++---
 10 files changed, 99 insertions(+), 36 deletions(-)
 create mode 100644 accel/tcg/internal.h

