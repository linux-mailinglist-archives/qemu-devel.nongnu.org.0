Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDF43329E0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:12:01 +0100 (CET)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJe1g-0003IV-GD
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnF-0004S1-8r
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:05 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnA-0002Ln-Um
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:04 -0500
Received: by mail-ej1-x62f.google.com with SMTP id dx17so28475730ejb.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HH26cU5A0i8raW+zocYPoYUE+HBXnO6h7fo4ht7A3ig=;
 b=p0PVKeluxXLZYsRiFBK5dUwq4jgtahEr1vvNOEC4zWCSNtaAIP4VEvgtUEvtBsCzEo
 39GXAYqh6xhCM5Z7IPUrm39pXzbg/J7BW2yGU3N6fNVbFEXIfvrpRQPFbPjszA1B+Iy3
 xB/474eU51MsaPenZlrXHtaTbVKBhcVJm2gr0WHxaovZqoIkx9rBwbASZdvzAb9gVyw1
 DKBahwI4VeLmJctuvxapx9TdPLyt9vOx5Gw6IEHV/uJuA6rcf7xvslA10hpsQoELXfiY
 DoMR5x1BJBH/mSm7oz+i3OpX77mA8ZJ7+R027NZghdn0WCtisMxPP6fdGPiW1kCivAkj
 bM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HH26cU5A0i8raW+zocYPoYUE+HBXnO6h7fo4ht7A3ig=;
 b=Uub2VMVG2N1I2VeNHYfpTKRtJElkfZu3S2Wkb+9yOusXf6ZpnoXiSZRH04XBx3IPsU
 arCdcPkiHx8QvQlG6ovtUBK4iKiJIEWyenhbrGEG+JMygozZ9aGpeOBJCe8KxqFDGpHU
 LluNAtPKx/Jo0/6gb/eVoySVXKGIlXLXo/T6k6EWrWQN4sJtNIQ7kXQ0AP9VyY8aVKmC
 RMP2MQ4DIkn4dUBkXJ2RITGUaaNykpnDQfn1ahe01J9PiRLBWuzdNznN3LFkXA83uCpa
 UrIis5+B51tOxEGNNGgKPrAsS+GJziuRpLKrRVRhYA+V0fyKN5hrMKcDkvP4Z2upauU+
 jf7g==
X-Gm-Message-State: AOAM530ql0u7HDvbZJWs7gWh+QKBR6UUZ6iMOqYTlhpoeNQlenMzK0Of
 sIHtRgkkUesYIjEEEJRSPhr1UuS6ihU=
X-Google-Smtp-Source: ABdhPJwkBuv4EIq/kxn5vV/gCtVWk2No/cVmCgsRjvKrf4Up0I9joQD6VEmnm90gxl4MxzhzRWuQIw==
X-Received: by 2002:a17:906:ecfb:: with SMTP id
 qt27mr20220875ejb.245.1615301815416; 
 Tue, 09 Mar 2021 06:56:55 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o1sm9329884eds.26.2021.03.09.06.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:56:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 00/22] target/mips: Reintroduce the R5900 CPU (without
 testing)
Date: Tue,  9 Mar 2021 15:56:31 +0100
Message-Id: <20210309145653.743937-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
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
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First part (TCG, testing postponed) of RFC v1:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg782449.html=0D
=0D
3 patches can still be improved for performance, but the improvement=0D
is not yet addressed in this series. Other patches are good enough=0D
for review.=0D
=0D
https://gitlab.com/philmd/qemu/-/commits/mips-r5900-v2=0D
Based-on: mips-next=0D
Supersedes: <20210214175912.732946-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (22):=0D
  target/mips/tx79: Move MFHI1 / MFLO1 opcodes to decodetree=0D
  target/mips/tx79: Move MTHI1 / MTLO1 opcodes to decodetree=0D
  target/mips/translate: Make gen_rdhwr() public=0D
  target/mips/translate: Simplify PCPYH using deposit_i64()=0D
  target/mips/tx79: Move PCPYH opcode to decodetree=0D
  target/mips/tx79: Move PCPYLD / PCPYUD opcodes to decodetree=0D
  target/mips: Remove 'C790 Multimedia Instructions' dead code=0D
  target/mips/tx79: Salvage instructions description comment=0D
  target/mips/tx79: Introduce PAND/POR/PXOR/PNOR opcodes (parallel=0D
    logic)=0D
  target/mips/tx79: Introduce PSUB* opcodes (Parallel Subtract)=0D
  target/mips/tx79: Introduce PEXTUW (Parallel Extend Upper from Word)=0D
  target/mips/tx79: Introduce PEXTL[BHW] opcodes (Parallel Extend Lower)=0D
  target/mips/tx79: Introduce PCEQ* opcodes (Parallel Compare for Equal)=0D
  target/mips/tx79: Introduce PCGT* (Parallel Compare for Greater Than)=0D
  target/mips/tx79: Introduce PPACW opcode (Parallel Pack to Word)=0D
  target/mips/tx79: Introduce PINTEH (Parallel Interleave Even Halfword)=0D
  target/mips/tx79: Introduce PEXE[HW] opcodes (Parallel Exchange Even)=0D
  target/mips/tx79: Introduce PROT3W opcode (Parallel Rotate 3 Words)=0D
  target/mips/tx79: Introduce LQ opcode (Load Quadword)=0D
  target/mips/tx79: Introduce SQ opcode (Store Quadword)=0D
  target/mips/tx79: Move RDHWR usermode kludge to trans_SQ()=0D
  target/mips: Reintroduce the R5900 CPU=0D
=0D
 target/mips/translate.h      |   6 +=0D
 target/mips/tx79.decode      |  79 ++++=0D
 target/mips/translate.c      | 790 +---------------------------------=0D
 target/mips/tx79_translate.c | 808 +++++++++++++++++++++++++++++++++++=0D
 target/mips/txx9_translate.c |  20 +=0D
 target/mips/cpu-defs.c.inc   |  59 +++=0D
 target/mips/meson.build      |   5 +=0D
 7 files changed, 983 insertions(+), 784 deletions(-)=0D
 create mode 100644 target/mips/tx79.decode=0D
 create mode 100644 target/mips/tx79_translate.c=0D
 create mode 100644 target/mips/txx9_translate.c=0D
=0D
-- =0D
2.26.2=0D
=0D

