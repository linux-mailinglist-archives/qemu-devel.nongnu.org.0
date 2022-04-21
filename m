Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7852550A769
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:52:29 +0200 (CEST)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhayi-00067Z-BB
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeN-00009A-9D
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:27 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeK-0002vh-Id
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:26 -0400
Received: by mail-pj1-x102c.google.com with SMTP id bx5so5570490pjb.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rie+PnO7kdb6BDKcvKZwbPlA8J1ewQkRT9UyJeiCQC4=;
 b=CneO6V7p4FDzDqIho51DHBHo719FLQ5VcoNgfzvP9TlT14oPyt94E4eHZY5hSEA6xw
 UBNUpA3SeO3ne/pfCcOzsWZceUr32VfgFvGY/0qXmHS2cPqLNDRoe3X3xGhN8DQ9rBSw
 p5MdLvzZyFMabmUMTbT6LCQf3XUSZ49nuB8kc8u8AA1hl25hZ/3487BqC4Hspus68ZVf
 ewbu5DEOHggsFPPxMHByJIyzmDurO1wp76Ck2GWoEJEl4j594zfCv7ehR1vBFGyqHiCz
 U9cbPOSAk81748Zr3lct52hBcq8DH6US1DigpcJQbS3EjQgO6ubX5+beySUyhC2wne56
 P8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rie+PnO7kdb6BDKcvKZwbPlA8J1ewQkRT9UyJeiCQC4=;
 b=1WH9zZ24Q0pfxxKQbjbrSNMyecKcRBwZnjD9QVjvROf99C1uC7In5Wdl3EsQdOBIhv
 keaVxReGBJgeCxemBNRC91KoG3mkMHRaLOHH0gXuTGAZeGGY5Ec5ccBRR3DPa12eWiqL
 wynxkZltSGcKzkZYVPcB4ggbKnpphzxTVGXpzy5sNA8U5xrc9up5cRz//9Sgvbs0NvOl
 BCqNhh9tFQ0mQ/IFs7yK+CJ+IP4ivOZ8OVpsEBfZ4Euy7xfpnOyRgzp+1EJ8zs/nEMQN
 RPli5BbbZ8VsXeLcyF15nCPliXf7bMUKR5MOEQG8l4SiBbtwUrGzWgAhrSk1RJcg3+23
 DR2w==
X-Gm-Message-State: AOAM531Zh1FbC+8uXBFnzVwmEMzcyKCy2zJoOqhk+XD5HlMXRb16N+bj
 m6kRNcVRGJtaNQTCiAOxfvLVGGp2XGRTXUHA
X-Google-Smtp-Source: ABdhPJwz0LIymO4zu9JgR9W2cbJPwtTuKhgYbtBP8qU7Mq82ngNzzqdr+ovnYpwASdGdebsLdZ/WXQ==
X-Received: by 2002:a17:902:e741:b0:159:627:544c with SMTP id
 p1-20020a170902e74100b001590627544cmr375668plf.84.1650562279887; 
 Thu, 21 Apr 2022 10:31:19 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b00385f29b02b2sm23557644pgc.50.2022.04.21.10.31.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:31:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] target/rx patch queue
Date: Thu, 21 Apr 2022 10:31:07 -0700
Message-Id: <20220421173114.48357-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The following changes since commit 401d46789410e88e9e90d76a11f46e8e9f358d55:

  Merge tag 'pull-target-arm-20220421' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-04-21 08:04:43 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-rx-20220421

for you to fetch changes up to 724eaecec6d22cf3842f896684bdc5b79492f093:

  target/rx: update PC correctly in wait instruction (2022-04-21 10:09:12 -0700)

----------------------------------------------------------------
Fix usp/isp swapping upon clrpsw/setpsw.
Fix psw.i/pc upon wait.
Align dtb in ram.

----------------------------------------------------------------
Richard Henderson (4):
      target/rx: Put tb_flags into DisasContext
      target/rx: Store PSW.U in tb->flags
      target/rx: Move DISAS_UPDATE check for write to PSW
      target/rx: Swap stack pointers on clrpsw/setpsw instruction

Tomoaki Kawada (2):
      target/rx: set PSW.I when executing wait instruction
      target/rx: update PC correctly in wait instruction

Yoshinori Sato (1):
      hw/rx: rx-gdbsim DTB load address aligned of 16byte.

 target/rx/cpu.h       |  1 +
 hw/rx/rx-gdbsim.c     |  2 +-
 target/rx/op_helper.c |  1 +
 target/rx/translate.c | 69 +++++++++++++++++++++++++++------------------------
 4 files changed, 40 insertions(+), 33 deletions(-)

