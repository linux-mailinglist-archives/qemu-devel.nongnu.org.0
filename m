Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FCD3C7534
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:46:13 +0200 (CEST)
Received: from localhost ([::1]:36162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LXw-0006Ss-Bs
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LU9-0006pO-TR
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:17 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LU7-0005c7-9F
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:17 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z2so8495015plg.8
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5EWJdV5hfn22q5jQ60G/msWBWIk7ubQOKQ9is2UGCgo=;
 b=ub9gaUFnz0WMOZ1FR659xiDvlyOSvBxlZCUyyyMX42od0HVgs52thNs2LNS2c8bbBQ
 SHS1S3I9xWa5S8tDDvwHJdiLRBFMGDBOArqtSFMyQMs3yD4UeC2EtRzhjDqG6R/7p94M
 NqqDK+kM5Z0c2GhDh5SnMCIRhW86xgZ++kH0AuLZ8QSHd89UqEhUONnBm5839sa72ury
 gytmfRGda21Mtue8howpyIz+suGJI2MiLwKFK+uthgMwE+P2tP7vhcpTFDEL2AmzXFyC
 +8mEMtttF2KMWU3lCI/APne/gHKWvoh98xaIp3jkZeiB4s7e8ZDYb6/uRyNVHRdjU9f7
 +Heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5EWJdV5hfn22q5jQ60G/msWBWIk7ubQOKQ9is2UGCgo=;
 b=WRtSK6LjzjmEJE+t3sMyuDGLXzjDxm/dX3r/XxqPblh1ZjqHCnKd6Gxb34ulhI4OaD
 w6BLw4c1bxG3n9laPzjNIpMn3wHrJXZiLwneBzRxntYy5ehFgrcB+ku/mj4OuNrLToHA
 Yine3gt65LHpqa8DNwQkOug+Mh+ClhwWbyXRGNJAJLxg/Tqi4K9ZusiKlga5mUwVaSn6
 MBRO4g2TvOog5jsn9dV7nhZSgPdcfp+rYuHQs/EjxTAtVBqiujAGm6MeaMw3S5mEDqiX
 lh+izVr30SaCoVP3bO4sfo3qplKSl7ZCAq77CaS29zUQ3Y/r8wrQijI6+obD2iEw55Kd
 gFag==
X-Gm-Message-State: AOAM530MKEY449CoM+K+BOs8xecipBVqQ4ZrDZ63JQwdOdXnSwgPzlY5
 aKlNPT7Jzo1B6g+aeLLJCSQiuWu60TnU2g==
X-Google-Smtp-Source: ABdhPJwl9TP3e/vktQtKtDp3EcmiXprpY4qxgNqmng4h/DFeYvMqAGf3q3j+vlJoIZZNeNs2Vy/2uQ==
X-Received: by 2002:a17:90a:1909:: with SMTP id
 9mr5236132pjg.105.1626194532300; 
 Tue, 13 Jul 2021 09:42:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] misc translator patch queue
Date: Tue, 13 Jul 2021 09:41:57 -0700
Message-Id: <20210713164211.1520109-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-misc-20210713

for you to fetch changes up to 6e94937a54c6ef80c3f523d8560c8b6521e6c79c:

  target/hppa: Clean up DisasCond (2021-07-13 08:13:19 -0700)

----------------------------------------------------------------
Cleanup alpha, hppa, or1k wrt tcg_constant_tl.
Implement x86 fcs:fip, fds:fdp.
Trivial x86 watchpoint cleanup.

----------------------------------------------------------------
Dmitry Voronetskiy (1):
      target/i386: Tidy hw_breakpoint_remove

Richard Henderson (11):
      target/i386: Split out do_fninit
      target/alpha: Store set into rx flag
      target/alpha: Use dest_sink for HW_RET temporary
      target/alpha: Use tcg_constant_i64 for zero and lit
      target/alpha: Use tcg_constant_* elsewhere
      target/openrisc: Use tcg_constant_*
      target/openrisc: Use tcg_constant_tl for dc->R0
      target/openrisc: Cache constant 0 in DisasContext
      target/openrisc: Use dc->zero in gen_add, gen_addc
      target/hppa: Use tcg_constant_*
      target/hppa: Clean up DisasCond

Ziqiao Kong (2):
      target/i386: Trivial code motion and code style fix
      target/i386: Correct implementation for FCS, FIP, FDS and FDP

 target/i386/cpu.h                   |   2 +
 target/alpha/translate.c            |  70 +--
 target/hppa/translate.c             |  99 +---
 target/i386/tcg/fpu_helper.c        |  42 +-
 target/i386/tcg/sysemu/bpt_helper.c |   4 +-
 target/i386/tcg/translate.c         | 970 +++++++++++++++++++-----------------
 target/openrisc/translate.c         |  68 +--
 7 files changed, 599 insertions(+), 656 deletions(-)

