Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC43708BA
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:14:12 +0200 (CEST)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcv47-0003Qu-R8
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcui1-0006Rd-08
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:51:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuhz-0003kZ-2O
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:51:20 -0400
Received: by mail-pg1-x534.google.com with SMTP id i14so849481pgk.5
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMLKr9oDHcVOpzZ1zRNW7GiVm/jcytwR8TFZ/kEnpH0=;
 b=rgyG498TV0DxitSszdgmO6S1FcXus/Znezwwe1AD14tuEOerHCGPjy0LKsp6u214UC
 uneGdRYO7PWn738ODNBuRkHmYuYH5imt5LqaB6t+rWtHpqDcFfL93dygcuezEuAsymMB
 aCei5I4dkrqAkEc+DJmOFxBNtq2s6sZHmPjcQ1nI+W0XKwJYPnyFXLxM8/B331LzIlqb
 vPyWyIzvltSaJDKp9v+iuI29Em8koxE0qj15NA7GVb4qU+e4rJc2ergExrbMj7rhh/a0
 g9xFl3+puix75NDsfWkJNS0vpGsaUqqnRVrz+PPKpTMM8QZ4gE88wiDGrozeJKwGEUhf
 uSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMLKr9oDHcVOpzZ1zRNW7GiVm/jcytwR8TFZ/kEnpH0=;
 b=gR95gDDMUIewDUviz75EnSHewZxR3iW4nBJ18q9uffs6xmKujKu0dIh6Vm5Ally3WK
 967hCAeEttgqQTVx45f5zCtBle/jUjaD6EIaSeBDWtzrQeyPxVd7o9dCYa6YwTr3Oy2+
 bSxPH7WCCnzWuCoRQssu1jstqdFsaFOslvOdn09QSJwrEhVwhpsYKB1QyWCCGhI7btaK
 MvCtSZCACu/VsYq2YdAvY4JBF71i8+WvoGYUMUDnHDY827nl7++hEqWYPePJ+gnqTfQq
 CfA0BJkRGuFoqH6lpyF6yqp6PBYev/yiWAwIsMFy40PW2st/XgCEwFe30JBA4Qu8/ATR
 UAFw==
X-Gm-Message-State: AOAM531AsVu659EpRoGb2dgYxE1WiULP5juSSd6E3GSzDTyQMa+5o5Cz
 HdRan8JtzsHV8RI9vGXttQDBXpvVj9fb4Q==
X-Google-Smtp-Source: ABdhPJz93Z+/UObZGePCfukuHakgyTIUXlitFp5A5FwloPGjYE4i21FqpF8NHd9QyP30fUD5SrVCUw==
X-Received: by 2002:a62:e90a:0:b029:28e:62a0:a3df with SMTP id
 j10-20020a62e90a0000b029028e62a0a3dfmr2303388pfh.31.1619895077615; 
 Sat, 01 May 2021 11:51:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm4971360pfa.68.2021.05.01.11.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:51:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] tcg patch queue
Date: Sat,  1 May 2021 11:51:11 -0700
Message-Id: <20210501185116.1338875-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

The following changes since commit 8f860d2633baf9c2b6261f703f86e394c6bc22ca:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-04-30' into staging (2021-04-30 16:02:00 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210501

for you to fetch changes up to af93ccacc772019298be4c3e47251cdaa60d0c21:

  decodetree: Extend argument set syntax to allow types (2021-05-01 11:45:35 -0700)

----------------------------------------------------------------
Include cleanups.
Decodetree enhancements for power10.

----------------------------------------------------------------
Luis Fernando Fujita Pires (1):
      decodetree: Add support for 64-bit instructions

Philippe Mathieu-Daudé (1):
      exec: Remove accel/tcg/ from include paths

Richard Henderson (3):
      decodetree: Introduce whex and whexC helpers
      decodetree: More use of f-strings
      decodetree: Extend argument set syntax to allow types

 docs/devel/decodetree.rst             |  11 ++-
 meson.build                           |   1 -
 include/exec/helper-gen.h             |   4 +-
 include/exec/helper-proto.h           |   4 +-
 include/exec/helper-tcg.h             |   4 +-
 tests/decode/succ_argset_type1.decode |   1 +
 scripts/decodetree.py                 | 172 +++++++++++++++++++---------------
 7 files changed, 112 insertions(+), 85 deletions(-)
 create mode 100644 tests/decode/succ_argset_type1.decode

