Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1904953B14B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:38:02 +0200 (CEST)
Received: from localhost ([::1]:53090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZmi-0005EG-Ff
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZiw-0002KB-J9
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:06 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZiu-0005Ds-K6
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:05 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so3575538pjt.4
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y5vy3/X+g6WXlq/QvTas6dtz2i+KTZ3LujdDxrh/AVY=;
 b=xSJELZd/e8kgU4igdbdlhpA92dMG/XjZb+CmnoCshZ8n/vzxnqtuZVJKg+sHihBRfk
 X5U5Pl1enJzHomyMxmKKxvol7KpOuhKUKo/uNSzJc91J2nZlQXff3Z9DrEHkfiDHUUAh
 Yfdfz+79OqBFyWmV3cir9f1woarXWxwOxbB/cHg6JaluVBhCa3AW9qwjCVkK96tIayZX
 gTLNhw87Bf3GLQoZl7XFTdd5pQ4mc24P0azo5f4mWFWTWzqlqrEOjYQvPCvmthvkpToh
 D+BQHg9kU+Iqu4G1Yc6At3j9blkcFHwW6HJSiLnMH8WP1SPpnwKz346uABcs2KJc1jTt
 HEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y5vy3/X+g6WXlq/QvTas6dtz2i+KTZ3LujdDxrh/AVY=;
 b=ZlgvXBmOt4ofki4ov7CXb4ePGRi8TRj8PBOxeF3bj5jpgpE8ZrIjXj6qa7i7cYDvRI
 cWTrdHKre/xgAHAtotD2N6B6yGFTfIAqwu9jkLwkTdc1X4mlGYiwcstuCyqtyFS7fUp6
 t0oRCvNZwn+XYneynb9Egp5C/+aDdpnEdyohVEIpzxU/ZAkm06jHG8GjZCBaRin0OMiK
 Cg9leZSXfmxiUgzyFzkglLFyF9RFSGOTcAsX+dD2PYcKd14XtruNK1uuMMyDDvUgFttE
 GwFEk0YXnJMnzcYhdWG9piE8OcBwe9PZG/1c5XR3CrNnSIwgibMpIeE/a60oaEiUk5ws
 walQ==
X-Gm-Message-State: AOAM531FYy4Iq8Gk52MDNNmmUgJuilaYzJ+ws9fR3vmBHBmDkedH3YC+
 m3oTT0NWbPA8NyUptWTb5GXcs8P6ndze2Q==
X-Google-Smtp-Source: ABdhPJzy7qrgfhTSmJRxOa5956v5U5rWcgAUSokjZex0mEBqg2dM0uHQFeK6aNQTuxNnSRXCDbDazg==
X-Received: by 2002:a17:902:7247:b0:162:32db:a9a1 with SMTP id
 c7-20020a170902724700b0016232dba9a1mr2253435pll.131.1654133642836; 
 Wed, 01 Jun 2022 18:34:02 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 00/17] target/m68k: Conditional traps + trap cleanup
Date: Wed,  1 Jun 2022 18:33:44 -0700
Message-Id: <20220602013401.303699-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Changes for v6:
  * Use exact masks for registering trapcc and ftrapcc.
    These insn overlap illegal scc and fscc operands,
    so we need to be exact about the registration.


r~


Richard Henderson (17):
  target/m68k: Raise the TRAPn exception with the correct pc
  target/m68k: Switch over exception type in m68k_interrupt_all
  target/m68k: Fix coding style in m68k_interrupt_all
  linux-user/m68k: Handle EXCP_TRAP1 through EXCP_TRAP15
  target/m68k: Remove retaddr in m68k_interrupt_all
  target/m68k: Fix address argument for EXCP_CHK
  target/m68k: Fix pc, c flag, and address argument for EXCP_DIV0
  target/m68k: Fix address argument for EXCP_TRACE
  target/m68k: Fix stack frame for EXCP_ILLEGAL
  target/m68k: Implement TRAPcc
  target/m68k: Implement TPF in terms of TRAPcc
  target/m68k: Implement TRAPV
  target/m68k: Implement FTRAPcc
  tests/tcg/m68k: Add trap.c
  linux-user/strace: Use is_error in print_syscall_err
  linux-user/strace: Adjust get_thread_area for m68k
  target/m68k: Mark helper_raise_exception as noreturn

 target/m68k/cpu.h              |   8 ++
 target/m68k/helper.h           |  14 +--
 linux-user/m68k/cpu_loop.c     |  13 ++-
 linux-user/strace.c            |   2 +-
 target/m68k/cpu.c              |   1 +
 target/m68k/op_helper.c        | 173 +++++++++++++++--------------
 target/m68k/translate.c        | 191 ++++++++++++++++++++++++---------
 tests/tcg/m68k/trap.c          | 129 ++++++++++++++++++++++
 linux-user/strace.list         |   5 +
 tests/tcg/m68k/Makefile.target |   3 +
 10 files changed, 396 insertions(+), 143 deletions(-)
 create mode 100644 tests/tcg/m68k/trap.c

-- 
2.34.1


