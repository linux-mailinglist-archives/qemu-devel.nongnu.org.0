Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F66B3ABAD2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:46:14 +0200 (CEST)
Received: from localhost ([::1]:34204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltw5l-0008S7-IN
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw37-0005vJ-TL
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw36-00014h-0k
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:29 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so4201282wma.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+k2XucepkmkG8e9GV6FQjhl+P5PNeZGTt2Pw8efagM=;
 b=M6T6UfjZZf2CPxzAY3E2S8B8nvHKd6ieHZdmazQsIR3o9383+hgQFnn+EUds1VHCZC
 RbtLQSUXN9NxybM0AnKpyOyRh4mi8JGpgxtPny+c2lmzapCm1gdiIe7OG40JIwU88e8Y
 ahC4a3ap1bzcJ0o0+5M0/BBf8OJfKg/hB4YAIGEjDkgd1n1WSm0Q97dNq7IYPCSUTNjn
 l5pKNfniujLocHQ8ZF9H/xa/79yTcig7JjAnjlwZVDPh3ZVazjAZ0ZijQS3ieh/yHKdk
 1KowyvBMI8hdAR4ZMa2qNK57o56vhN8pUfVB2P/X5d7pMnMe2ganb/k+oril5uu8VDc4
 ZbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=A+k2XucepkmkG8e9GV6FQjhl+P5PNeZGTt2Pw8efagM=;
 b=ZNjbEqx28clP62o2gnR6snxDv+ur7maNbWDMgWG2Mw/cBA3dLaAmi0qZcIGvu3Ogjn
 JJcQYsKug/85Hkx91Kqgaf78Q6EDsY7/lSxCCmd8u/JuPYYI+SbLR9mc8wPIAtA0r4k3
 7zmufoNccHWsMrqsorP5QQ5c3HR05EEYP625Z9ZvV5rlmCuw+QB02lvW0lP1EXd01k61
 WEIj7Q3l8ujShiQf3b9Izde3KrQrWn6/BcV1izSUeZozko6/RnZsc+PYlYBs4hKwsB1Q
 E/xa2myjnqS/BoDgGmYhB/fQXvN98TdKE00uEjTHaVDwdUipcrdFSfP8nuBU70PNV4w+
 Hbkg==
X-Gm-Message-State: AOAM533ZUPZ08hXpOrqadDMXqFPZENRbC7bu0KlbOHj4kah4zHXmBeFd
 qXWbNgRaPrvnlFvxmCJQP9hBL3r15YaklQ==
X-Google-Smtp-Source: ABdhPJzfi6P/ueB+haBdJm+SXYpxScnjgr9utrqgGHfrp/BWxfU/vONkjPjgLUwPICR2F3Gmhcn4Rg==
X-Received: by 2002:a1c:4e12:: with SMTP id g18mr6443999wmh.101.1623951805042; 
 Thu, 17 Jun 2021 10:43:25 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l22sm3785293wrz.54.2021.06.17.10.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:43:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] target/mips: Various fixes & cleanups
Date: Thu, 17 Jun 2021 19:43:14 +0200
Message-Id: <20210617174323.2900831-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes and cleanup accumulated during the last month.=0D
Nothing particularly exciting :/=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  target/mips: Do not abort on invalid instruction=0D
  target/mips: Fix more TCG temporary leaks in=0D
    gen_pool32a5_nanomips_insn=0D
  target/mips: Move TCG trace events to tcg/ sub directory=0D
  target/mips: Move translate.h to tcg/ sub directory=0D
  target/mips: Restrict some system specific declarations to sysemu=0D
  target/mips: Remove SmartMIPS / MDMX unuseful comments=0D
  target/mips: Remove microMIPS BPOSGE32 / BPOSGE64 unuseful cases=0D
  target/mips: Constify host_to_mips_errno[]=0D
  target/mips: Optimize regnames[] arrays=0D
=0D
 meson.build                            |  2 +-=0D
 target/mips/cpu.h                      | 10 ++++++---=0D
 target/mips/internal.h                 |  2 +-=0D
 target/mips/tcg/tcg-internal.h         |  6 +++---=0D
 target/mips/{ =3D> tcg}/translate.h      |  0=0D
 target/mips/cpu.c                      |  2 +-=0D
 target/mips/tcg/msa_translate.c        |  4 ++--=0D
 target/mips/tcg/mxu_translate.c        |  6 +++---=0D
 target/mips/tcg/rel6_translate.c       |  2 +-=0D
 target/mips/tcg/sysemu/mips-semi.c     |  2 +-=0D
 target/mips/tcg/translate.c            | 29 +++++++++-----------------=0D
 target/mips/tcg/translate_addr_const.c |  2 +-=0D
 target/mips/tcg/tx79_translate.c       |  2 +-=0D
 target/mips/tcg/txx9_translate.c       |  2 +-=0D
 target/mips/{ =3D> tcg}/trace-events     |  0=0D
 15 files changed, 33 insertions(+), 38 deletions(-)=0D
 rename target/mips/{ =3D> tcg}/translate.h (100%)=0D
 rename target/mips/{ =3D> tcg}/trace-events (100%)=0D
=0D
-- =0D
2.31.1=0D
=0D

