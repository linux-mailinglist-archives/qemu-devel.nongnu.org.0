Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76132DB8C0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:08:06 +0100 (CET)
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMEW-0002hP-Jo
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8k-00067P-Ja
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:06 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8g-0000qp-Np
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:06 -0500
Received: by mail-pf1-x42a.google.com with SMTP id m6so5890281pfm.6
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qfT6duDws+MOs/ITpPJGxXNHBfmmSHU+0mu3jVfJTvE=;
 b=gVZrAxM7DyzMSmWYAAsFeUUq+iQS9yALO7XkjDCZeSMAP2+/p5h74ubyeqm+CVaTEg
 CQKM1VcJ2QTYJ0L+sVX2BH7Qzb7S+p6Ot4upz2g3s94evW2/u8STYs+m+lfJVkUFIB8G
 VEgbo2lvBHi2UJN2fiGHGLiPY9xmhbfIbkRWHd0QXmHNgElEqnJgs4vU9gnxOEAhTn6g
 80Js0bWQUS2S4FL4x+PdI04XxYxGjB5ThVrJZaCAqwHSpEkuQFKErpC/yW2jxSJj5aLr
 7axC+7bWXmGPm+jLtEMT5a6z+VPs6Xzb0xRdX/qN6VMWdC3aOyCnmBbsoZIhLFLzNgqX
 X1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qfT6duDws+MOs/ITpPJGxXNHBfmmSHU+0mu3jVfJTvE=;
 b=YHBtMrSrlLGWUx4g6czLfYNTnl2lCdOA+NkdJKiXsBlssrHDLbgeOxnFQTjI7nS7Qp
 vRpVOxdfyKgux/e1Q/hLTfJ3eHbEhlfqNdEPW/RTqZXSiSz3sKR+BqgWPFv9x42KWd1J
 1u/9GMkuPHnqA06c4bPoJj3ilIJ4e+eiT0hYdkx21AOiu/hZeUQZuLFQkBKXsevwREN4
 OLyx2A58YUnCc8crn5ogbXiwxtWEsguzV0Na8ypBapeyXN7IkYKUwZjo9FSOdMlSmEI6
 426loheK9Twmbq1gcBedtxUv/w9BEbDq2r1S6IwXNzVn8Srq5l1xiyFYjXoH/WvYZPjw
 2cTQ==
X-Gm-Message-State: AOAM531BkMkmKJ/0joOjb1naWbIpofrrHY58Y20VMNdfPcJlIVdS63PP
 jZ5/qm/Ob2HByZYTPaRmDmnJtBOd+3RoHfxVMGw=
X-Google-Smtp-Source: ABdhPJzrTfklxaSSBTR8o+ZBC1oHW9f96Oji6w7QNIAlRy8nPBMkGuT4hFSGKlLDe/NttJDw6sBhww==
X-Received: by 2002:aa7:9dc7:0:b029:19b:178f:84d7 with SMTP id
 g7-20020aa79dc70000b029019b178f84d7mr1393014pfq.70.1608084121054; 
 Tue, 15 Dec 2020 18:02:01 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:00 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 01/15] target/riscv: reformat @sh format encoding for
 B-extension
Date: Wed, 16 Dec 2020 10:01:26 +0800
Message-Id: <20201216020150.3157-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 84080dd18ca..3823b3ea800 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,7 +22,7 @@
 %rs1       15:5
 %rd        7:5
 
-%sh10    20:10
+%sh7    20:7
 %csr    20:12
 %rm     12:3
 %nf     29:3                     !function=ex_plus_1
@@ -58,7 +58,7 @@
 @u       ....................      ..... ....... &u      imm=%imm_u          %rd
 @j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
-@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
+@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -122,9 +122,9 @@ sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
 ori      ............     ..... 110 ..... 0010011 @i
 andi     ............     ..... 111 ..... 0010011 @i
-slli     00.... ......    ..... 001 ..... 0010011 @sh
-srli     00.... ......    ..... 101 ..... 0010011 @sh
-srai     01.... ......    ..... 101 ..... 0010011 @sh
+slli     00000. ......    ..... 001 ..... 0010011 @sh
+srli     00000. ......    ..... 101 ..... 0010011 @sh
+srai     01000. ......    ..... 101 ..... 0010011 @sh
 add      0000000 .....    ..... 000 ..... 0110011 @r
 sub      0100000 .....    ..... 000 ..... 0110011 @r
 sll      0000000 .....    ..... 001 ..... 0110011 @r
-- 
2.17.1


