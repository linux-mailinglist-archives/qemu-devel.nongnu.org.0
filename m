Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564213B411E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:07:57 +0200 (CEST)
Received: from localhost ([::1]:41216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwike-0007XU-Ca
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi3k-0003im-S8
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi3h-0001Ta-9d
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 o33-20020a05600c5121b02901e360c98c08so6268397wms.5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ocTZ5CFkRVEvaS92O2Il/pyHOrPWFHxWjWzPkTUnz+Y=;
 b=TusqxrG2C0LGej8JUceeV2VQkfjpWKyW2cLSBFtdPSSs2OLNZERchCi8d2+lEKFRWX
 Kr+m/rNsO5Tk5aRYCkHIg7smHnxvFihdqFsblI7wyKp7LK01STWEtPGn5l3FSyAJJAqq
 EwUMaesnkHaC/3e7XGVTgLbaHqTbdiJ7MlJf+lEWA2TvAT2XSw9Kchd1lE7FUH59sjFw
 CCO1+3qSroSy4tgETb8KQQPhHVckwSf3L2K/lLqy60ugbZBEwuYNLxbSNUcSBjelYNN1
 fwWPjlnqaKhBAecsyqhRg/hSXO2DPmzeyUxB0PAPMPZjXQw4afgql0zkk8apfXLU4AT4
 VxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ocTZ5CFkRVEvaS92O2Il/pyHOrPWFHxWjWzPkTUnz+Y=;
 b=dZbfXU/ncpFWvkK2DB7msxKXihCQDWpdeIkPqkcYQ/9Gqj/3k+l4MlrcQ5zZyCoxj5
 4/JUdOtRkvfjKKIj/um3J3oAXUPMQ1u2oxcmgMtcnlHBPe6v5hEy9BtDSVOkGVGBsXFY
 pxFvpa69KR+g94VccaWGBmBgF54Gz0p+SxzUdxy4aKZkKyIAvqCZUmftqdR0xS1dWCOU
 97Ycu3i6KiGDDuRGjZZNXUDrY9u+J7PaS4uIIH+0aLjBxxsZbRnafgNsGx3VmepYAd7T
 ITAI0UfRDlwVcxAflhOfb4p92NYb7QR/nCW5lyxMuprX73EHsT815jAZ2mS2J+pbZ3JP
 9mPw==
X-Gm-Message-State: AOAM531hpncDc5UmYCR1wKG6SP0k46/jDSUmWyyd0yIqcQiEMH7fA/GK
 D3LrNb5KGjjfYibOz5JUCinAHyXUU3j0Xw==
X-Google-Smtp-Source: ABdhPJwF/3mCI/C+lOJZOZFlUDJnaeYv7Tfi/pyNjUNFIldLy9v70ypARFJA2Ic3z3++xKX98KJuPw==
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr9741086wml.49.1624613011312; 
 Fri, 25 Jun 2021 02:23:31 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g83sm5134822wma.10.2021.06.25.02.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:23:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] MIPS patches for 2021-06-25
Date: Fri, 25 Jun 2021 11:23:14 +0200
Message-Id: <20210625092329.1529100-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIME-Version: 1.0=0D
Content-Type: text/plain; charset=3D"utf-8"=0D
Content-Transfer-Encoding: 8bit=0D
=0D
The following changes since commit d0ac9a61474cf594d19082bc8976247e984ea9a3=
:=0D
=0D
  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021=
-06-21' into staging (2021-06-24 09:31:26 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-20210625=0D
=0D
for you to fetch changes up to f5c6ee0c6b7b4b79b52a1614a808633dbb694de4:=0D
=0D
  target/mips: Merge msa32/msa64 decodetree definitions (2021-06-24 16:48:0=
8 +0200)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
Various fixes:=0D
- Potential integer overflow (CID 1452921)=0D
- Invalid emulation of nanoMIPS BPOSGE32 opcode=0D
- Missing exception when DINSV opcode used with DSP disabled=0D
- Do not abort but emit exception for invalid BRANCH opcodes=0D
- TCG temporary leaks=0D
=0D
Housekeeping:=0D
- Remove dead code / comments=0D
- Restrict few files to TCG, declarations to sysemu=0D
- Merge MSA32 and MSA64 decodetree definitions=0D
=0D
----------------------------------------------------------------=0D
=0D
Aleksandar Rikalo (1):=0D
  target/mips: fix emulation of nanoMIPS BPOSGE32 instruction=0D
=0D
Philippe Mathieu-Daud=C3=A9 (14):=0D
  target/mips: Fix potential integer overflow (CID 1452921)=0D
  target/mips: Fix TCG temporary leaks in gen_pool32a5_nanomips_insn()=0D
  target/mips: Fix more TCG temporary leaks in=0D
    gen_pool32a5_nanomips_insn=0D
  target/mips: Raise exception when DINSV opcode used with DSP disabled=0D
  target/mips: Do not abort on invalid instruction=0D
  target/mips: Move TCG trace events to tcg/ sub directory=0D
  target/mips: Move translate.h to tcg/ sub directory=0D
  target/mips: Restrict some system specific declarations to sysemu=0D
  target/mips: Remove SmartMIPS / MDMX unuseful comments=0D
  target/mips: Remove microMIPS BPOSGE32 / BPOSGE64 unuseful cases=0D
  target/mips: Constify host_to_mips_errno[]=0D
  target/mips: Optimize regnames[] arrays=0D
  target/mips: Remove pointless gen_msa()=0D
  target/mips: Merge msa32/msa64 decodetree definitions=0D
=0D
 meson.build                                  |  2 +-=0D
 target/mips/cpu.h                            | 10 ++++--=0D
 target/mips/internal.h                       |  2 +-=0D
 target/mips/tcg/trace.h                      |  1 +=0D
 target/mips/{ =3D> tcg}/translate.h            |  0=0D
 target/mips/trace.h                          |  1 -=0D
 target/mips/tcg/{msa32.decode =3D> msa.decode} |  8 +++--=0D
 target/mips/tcg/msa64.decode                 | 17 ----------=0D
 target/mips/cpu.c                            |  2 +-=0D
 target/mips/tcg/msa_translate.c              | 23 ++++---------=0D
 target/mips/tcg/mxu_translate.c              |  4 +--=0D
 target/mips/tcg/sysemu/mips-semi.c           |  2 +-=0D
 target/mips/tcg/sysemu/tlb_helper.c          |  3 +-=0D
 target/mips/tcg/translate.c                  | 35 ++++++++------------=0D
 target/mips/tcg/meson.build                  |  3 +-=0D
 target/mips/{ =3D> tcg}/trace-events           |  0=0D
 16 files changed, 42 insertions(+), 71 deletions(-)=0D
 create mode 100644 target/mips/tcg/trace.h=0D
 rename target/mips/{ =3D> tcg}/translate.h (100%)=0D
 delete mode 100644 target/mips/trace.h=0D
 rename target/mips/tcg/{msa32.decode =3D> msa.decode} (74%)=0D
 delete mode 100644 target/mips/tcg/msa64.decode=0D
 rename target/mips/{ =3D> tcg}/trace-events (100%)=0D
=0D
-- =0D
2.31.1=0D
=0D

