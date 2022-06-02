Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A7253BB76
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:16:02 +0200 (CEST)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwmYL-0003cF-Gz
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmVj-0008Rh-Hp
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:13:19 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmVh-0006Bk-TZ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:13:19 -0400
Received: by mail-pg1-x52a.google.com with SMTP id s68so4994501pgs.10
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mfxIepI7REQ1pc/GZHkomJOyJfs6dqdVXfDND3WH78w=;
 b=lbr41fptKihTot39A2ywxxrlKVkBBe2saOnYYvTNyWO6Zuj6KaaPsvWhjkx4M5Km8d
 Nhi1xhlBrsHnrON0puP2bOE59H0Hvz+blLNyVmSjHjugCr+kBpeg5QNWMbifTub0CELu
 VxBv4agKmuXzIJDOsMBTKA2k2R/aYG9ChnYp0ANxLxxTX5m2y4Q82a4yf/s4U/iZX2ca
 LTMlGoU7GjvanZ6woIZBEydwSWIpXYqPWacF0/fqH1v6vw/+4qLPMbnKdS7svkv11qUI
 ay4qw6s8QY+rnPo6IfaENq9hlN9h0h+f56vjal0IACUNR4X/VjbMC7DNGJBMmfLg7ffp
 BaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mfxIepI7REQ1pc/GZHkomJOyJfs6dqdVXfDND3WH78w=;
 b=tebh0WXH7I82G7hpbiAo5xwGUlD/DQsyI7ZNrAnB9YlpOhdc/I1x5+m3pn5CXJTGme
 vOMmjFkTYmC+Xk6gAycVBdkZFK3E0UgdFSn+dvFmnQ6zI0YdPTFxvktKm/49nANnsl+w
 b34QMs/PM7agPvVKWSAzbeSfrUWBfMgJut7elR+zw5qtQMTVq+zDGHPkDxTs380Nr5m4
 8TO+QMxEggZWf5wFa3Fp3XesvV+c83enYbUzxgmWkQR6+syMwzxHrcJXchNfxxE5t33k
 My25QKTm7gUfhsiC5egcXrCss1sHJNrQCdsNTliIEHXAPuqKUYjsyw2yK7zPxqSvNlYq
 5giQ==
X-Gm-Message-State: AOAM533mZ5DAFyWw1/b6njzg/24+rqFeC+df2kM07+oVuiqyg6ylXG1a
 9QW3az21t1bMDmEfBysvfc8+XB4GXSp5Dg==
X-Google-Smtp-Source: ABdhPJxawhecQAKUm5awcwIWcKkUtQ/fJrcZTc3Y1Qc6jzmk09Pb6NV5+MziW2+aEzQd4/0OMum1OA==
X-Received: by 2002:a05:6a02:11a:b0:3fb:d90c:b3f8 with SMTP id
 bg26-20020a056a02011a00b003fbd90cb3f8mr4811955pgb.192.1654182796168; 
 Thu, 02 Jun 2022 08:13:16 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a170902820100b001618383483fsm3625159pln.224.2022.06.02.08.13.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 08:13:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] tcg patch queue
Date: Thu,  2 Jun 2022 08:13:09 -0700
Message-Id: <20220602151312.477967-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

The following changes since commit 1e62a82574fc28e64deca589a23cf55ada2e1a7d:

  Merge tag 'm68k-for-7.1-pull-request' of https://github.com/vivier/qemu-m68k into staging (2022-06-02 06:30:24 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220602

for you to fetch changes up to 94bcc91b2e95e02ec57ed18d5a5e7cb75aa19a50:

  tcg/aarch64: Fix illegal insn from out-of-range shli (2022-06-02 08:09:46 -0700)

----------------------------------------------------------------
Add tcg_gen_mov_ptr.
Fix tcg/i386 encoding of avx512 vpsraq.
Fix tcg/aarch64 handling of out-of-range shli.

----------------------------------------------------------------
Richard Henderson (3):
      tcg: Add tcg_gen_mov_ptr
      tcg/i386: Fix encoding of OPC_VPSRAQ for INDEX_op_sars_vec
      tcg/aarch64: Fix illegal insn from out-of-range shli

 include/tcg/tcg-op.h         | 5 +++++
 tcg/aarch64/tcg-target.c.inc | 2 +-
 tcg/i386/tcg-target.c.inc    | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

