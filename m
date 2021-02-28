Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8132752D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:25:58 +0100 (CET)
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVRl-000733-Mr
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPK-0005J0-Q4
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:26 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:50748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPI-0007dg-QN
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:26 -0500
Received: by mail-pj1-x102b.google.com with SMTP id b15so9868513pjb.0
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3umkeXZytXS+Abg6MpYJb33hrNdOOsXWBYLz/xjcZrc=;
 b=FgdOHxVrZDC8X7qBRi4RmAZtmR3b74kOkgapPd/++KbQ+uP1+br1eJW7to0h1VfpqK
 zSSCAe4ETkTP6MZDdldTbVktiM8ZzsBQ5GY9OPVJ+LuatcdrJ8vll0oenqemiFGCegGu
 w6AJ8mburiR/VaeNgeCHcUBukRyNZehvk8p+E9YdFfY2lAZzzQQrdFV4s/4vAWFieG3R
 0J4t4D4KFNL3bbvam91sbMzmM5KXxNY7Moyq4GTzjUuHnuVBo7vFhDcZMQPy+RhiBstE
 sLfA6fWIAGkBWzETNiSuP+Zxd2cGhmK0zGcmv6B4bGqJfcpgiTeI5lA+c4fRaAQVCmRt
 YeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3umkeXZytXS+Abg6MpYJb33hrNdOOsXWBYLz/xjcZrc=;
 b=QcFSATa6DELCRtWHQrgdNVGjtbgu8SoG+uS0/YYhZEancIbjTlLS5SSqM1VDHVb/VO
 5S91gQQ26f5P3EKmgAdR9ww9gbFVqhmVoSYBwt8JcnneM4vAosr03FotPC1gN89RnFhI
 ckD/M7UwCtJtBM4ZUB0ythmRlV5RcIz9MzEYfS59JjdjK+Tb/GChOxYF66NA0v7CU3wu
 jjCDODp57KCXKTlBe6i0oNu41EuLkpFmYKIGrsQ7RwTbP5uLrZbtNXlBppEf2QbeWQ73
 6eABfUpVWD9GwHi/zU4j8mg/sUlO+7xrUylR87yGvE7xNq26wP2/7xS5ONFZBxoOHY7W
 U14g==
X-Gm-Message-State: AOAM532Kzbp9F7Nlsa8FZhN+E1erUfZHd4+xmgs408zYKOJcPE5WMkl6
 wMmdNkhQUF1cRpjxIVNpTQ+tM97m8EY5Lg==
X-Google-Smtp-Source: ABdhPJwpPDjBqxGmpvuzEGcIfJcJ2gfNyIYb3eoc0S6RxuSgL5aRoUUgx/25enH4rGjZS5bzDD0L+w==
X-Received: by 2002:a17:90a:c483:: with SMTP id
 j3mr14351211pjt.196.1614554603030; 
 Sun, 28 Feb 2021 15:23:23 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/50] i386 cleanup part 3
Date: Sun, 28 Feb 2021 15:22:31 -0800
Message-Id: <20210228232321.322053-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20210226175143.22388-1-cfontana@suse.de
("[PATCH v25 00/20] i386 cleanup PART 2")

This started out to address a fixme in Claudio's patch set, then
wandered a bit, with cleanups and bug fixes in the code that I was
touching.  I stopped when I reached my original goal of removing
target/i386/tcg/user/*_stubs.c.

There are a lot of patches, but hopefully they're all small
enough to be obvious.


r~

Richard Henderson (50):
  target/i386: Split out gen_exception_gpf
  target/i386: Split out check_cpl0
  target/i386: Unify code paths for IRET
  target/i386: Split out check_vm86_iopl
  target/i386: Split out check_iopl
  target/i386: Assert PE is set for user-only
  target/i386: Assert CPL is 3 for user-only
  target/i386: Assert IOPL is 0 for user-only
  target/i386: Assert !VM86 for x86_64 user-only
  target/i386: Assert CODE32 for x86_64 user-only
  target/i386: Assert SS32 for x86_64 user-only
  target/i386: Assert CODE64 for x86_64 user-only
  target/i386: Assert LMA for x86_64 user-only
  target/i386: Assert !ADDSEG for x86_64 user-only
  target/i386: Introduce REX_PREFIX
  target/i386: Tidy REX_B, REX_X definition
  target/i386: Move rex_r into DisasContext
  target/i386: Move rex_w into DisasContext
  target/i386: Remove DisasContext.f_st as unused
  target/i386: Reduce DisasContext.flags to uint32_t
  target/i386: Reduce DisasContext.override to int8_t
  target/i386: Reduce DisasContext.prefix to uint8_t
  target/i386: Reduce DisasContext.vex_[lv] to uint8_t
  target/i386: Reduce DisasContext popl_esp_hack and rip_offset to
    uint8_t
  target/i386: Leave TF in DisasContext.flags
  target/i386: Reduce DisasContext jmp_opt, repz_opt to bool
  target/i386: Fix the comment for repz_opt
  target/i386: Reorder DisasContext members
  target/i386: Add stub generator for helper_set_dr
  target/i386: Assert !SVME for user-only
  target/i386: Assert !GUEST for user-only
  target/i386: Implement skinit in translate.c
  target/i386: Eliminate SVM helpers for user-only
  target/i386: Mark some helpers as noreturn
  target/i386: Simplify gen_debug usage
  target/i386: Tidy svm_check_intercept from tcg
  target/i386: Remove pc_start argument to gen_svm_check_intercept
  target/i386: Remove user stub for cpu_vmexit
  target/i386: Cleanup read_crN, write_crN, lmsw
  target/i386: Pass env to do_pause and do_hlt
  target/i386: Move invlpg, hlt, monitor, mwait to sysemu
  target/i386: Unify invlpg, invlpga
  target/i386: Inline user cpu_svm_check_intercept_param
  target/i386: Eliminate user stubs for read/write_crN, rd/wrmsr
  target/i386: Exit tb after wrmsr
  target/i386: Tidy gen_check_io
  target/i386: Pass in port to gen_check_io
  target/i386: Create helper_check_io
  target/i386: Move helper_check_io to sysemu
  target/i386: Remove user-only i/o stubs

 target/i386/cpu.h                    |   8 +
 target/i386/helper.h                 |  43 +-
 target/i386/tcg/helper-tcg.h         |   5 +-
 target/i386/tcg/bpt_helper.c         |   2 +-
 target/i386/tcg/excp_helper.c        |  18 +-
 target/i386/tcg/misc_helper.c        |  79 +--
 target/i386/tcg/seg_helper.c         |  43 --
 target/i386/tcg/sysemu/misc_helper.c |  52 +-
 target/i386/tcg/sysemu/seg_helper.c  |  29 +
 target/i386/tcg/sysemu/svm_helper.c  |  30 +-
 target/i386/tcg/translate.c          | 891 ++++++++++++++-------------
 target/i386/tcg/user/misc_stubs.c    |  75 ---
 target/i386/tcg/user/svm_stubs.c     |  76 ---
 target/i386/tcg/user/meson.build     |   2 -
 14 files changed, 600 insertions(+), 753 deletions(-)
 delete mode 100644 target/i386/tcg/user/misc_stubs.c
 delete mode 100644 target/i386/tcg/user/svm_stubs.c

-- 
2.25.1


