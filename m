Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9703DBE5A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:29:57 +0200 (CEST)
Received: from localhost ([::1]:53456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XGe-0005YH-43
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XFC-0003co-Jh
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:28:26 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XFA-0002F0-VH
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:28:26 -0400
Received: by mail-pl1-x632.google.com with SMTP id t3so9978036plg.9
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7KpA7daHPuYduk0+qTomUEeK0D/dNyV9992dw1hDW0Y=;
 b=n2jdPscS4kxt3vnN+ZLhEyAqhBSfhHIY0w25ZEVgFbeGiyKEhSfOhWW3yllV0lTzHq
 gdsuwndUthZuGxZDHwr+tdyA+RV79uQo5waHLkpAXvXBZUCpZhG+4lWgGx88w173LWdL
 OabReg3NHuIvc7Vz5+8g/sqgtEIajGSaIvv+K3II/1/UclKcZHCC9bSSl/mgDiRz30dS
 rEe/5F0MlX5jRSCegGiIN9wzollyJEq74iiAexy/zBzFx5SXz3IAGEfruyA4Pc7VFAz4
 F5g2Tw3hsxomSL4X1uox8YYWn2OWk7f3X5G3PUW+EOnog+DJ9ss6HonemnpQd5TPkYGw
 vZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7KpA7daHPuYduk0+qTomUEeK0D/dNyV9992dw1hDW0Y=;
 b=BG8CzsfH2H9flnRKzvayvEOaHYlLuX8zsmw2FG8c+2oeZhyJTWg5nw3DB4FNr+i2Ay
 cFSgZua7thhuQY/n/INzxcNDqpOlAUwYoWUcQLeCShDoNCwiIDJz4vW2wrmD/v6xQKgp
 E414Roe8qJK+21UQ5Hrx1XcfQtOnQT6/8ZH0wkKg/WifYUwLLVLd+u2zCJkicxH/IUma
 DiXagQEMgefuKOoJzDUypQGKi3J9Lh/Yet+/NOJa4QdBsSUyyFLse+R/4Vwges0eihtd
 X5W+8JfoZ3ntkBuT3SDS/yiHRyl40Fm2CNDyD8yiVxZaErXRtmjwUiGqmfhPhiiajWVX
 P+wA==
X-Gm-Message-State: AOAM531ecHNrW5LWHK23yd6bbNGsSaBLFxxslN0QaHjpSeghHf/iheJ7
 fUViIugkwlzt+MbIer2e/ebkr5ZOweTVtA==
X-Google-Smtp-Source: ABdhPJwbbjRoyUYuAoiIcupVet54RN+gOV4WZKdhyFRICYJ5kctNKgyeh+s8/lOpAxKbzhUrhxntsA==
X-Received: by 2002:a05:6a00:2ac:b029:331:690d:7f26 with SMTP id
 q12-20020a056a0002acb0290331690d7f26mr3778675pfs.78.1627669703184; 
 Fri, 30 Jul 2021 11:28:23 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id k16sm3004185pfu.83.2021.07.30.11.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 11:28:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] tcg patch queue for rc2
Date: Fri, 30 Jul 2021 08:28:18 -1000
Message-Id: <20210730182820.451248-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

The following changes since commit dbdc621be937d9efe3e4dff994e54e8eea051f7a:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-07-30 09:14:56 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210730

for you to fetch changes up to 236f6709ae0da224314c3344c339ed0dc07c15cf:

  target/nios2: Mark raise_exception() as noreturn (2021-07-30 08:23:12 -1000)

----------------------------------------------------------------
Fix double bswap in 16-byte atomic store
Mark nios2 raise_exception noreturn

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      target/nios2: Mark raise_exception() as noreturn

Richard Henderson (1):
      accel/tcg: Remove double bswap for helper_atomic_sto_*_mmu

 accel/tcg/atomic_template.h | 1 -
 target/nios2/helper.h       | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

