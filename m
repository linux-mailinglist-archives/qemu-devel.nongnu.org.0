Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C5325C63
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:11:19 +0100 (CET)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUTF-0007MS-UO
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlG-0003vI-9b
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:50 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlB-0003Cu-U3
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:49 -0500
Received: by mail-pf1-x42d.google.com with SMTP id b145so5334742pfb.4
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p2Cv65iddYh9lUPOmu+RQhwDFSR8I38LzbJE2A/leCk=;
 b=KltcwfyYQv+H2VZj1YuYiweHb8GOzyOpNKEhaT/EM6CtIxhkmURRtT3oZqvQTpiExO
 8jVWAV4a/lDEcKb3mgUpkn/sDm52CNNb17LKfE+ShPqeOo6dTSa4qkr1IUaciYfWQr1g
 2o3laBhtCBH3AOP7sHNHpSoRzvozcKSfybO1VVParhE52L3DeThOPlQQuZubKVaURjUF
 Vali07PSIT8gu+QNfVA/WXw7IujqFB4+dT5KvtVzjsOhLKY160DAvtlhjLFVB7Aqld+H
 0tCAJzZiD2+ieJQT6ZBkNm5JjPVjtUikxOwtwwJrh0nBi69cddrsb/pTAT0osmCDFd+v
 Ixyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p2Cv65iddYh9lUPOmu+RQhwDFSR8I38LzbJE2A/leCk=;
 b=Uw8vjORwjy4Ev9a+4mPWPhuTjC4oEkAo/ntxhGR7yy/NGBnTPjZ655F2dtFaSPY+sd
 JAYTBJM5QmSotT+xxvrQoRg9gVer7lggPURpoEfR+Dpw1QH8LYAR1rYNVDp2xzDRQBU5
 uVR09xB8lU7dSQzkZOz/sNseSYuPdHejo8X1LDSJjDDKajAOv4N+Xfj06CoDtxA5xnTK
 Ts5S/wuTmg1n5xDxErjME2uJCuFuw8o0UFjCYynK1/wF2hgYsHEqoVEXKcRncVhiqGdD
 QdeHb1mnYyX5IozFgsoJb6uT37Tlihd5DlVNb7X25B9DlltaqYqlEN3l9gHmdrE5DwQn
 3lvQ==
X-Gm-Message-State: AOAM530N2Pzt4n3vzzsi8pyPoNn9a65a4JU7vA1eZ2E8LUKRfw/hQ1S3
 CjGCeutc+AvVF4KssAWFKOPBjv62z3SJZQ==
X-Google-Smtp-Source: ABdhPJy0KxoyIRwrigzmVbzSydXFTbPfGEW6bz8SoNUAdpw9iGmxQaQ02XzKG8DKuKvckAYikMPEBQ==
X-Received: by 2002:a62:7797:0:b029:1ed:7b10:84c2 with SMTP id
 s145-20020a6277970000b02901ed7b1084c2mr953794pfc.47.1614309944404; 
 Thu, 25 Feb 2021 19:25:44 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 72/75] target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
Date: Fri, 26 Feb 2021 11:18:56 +0800
Message-Id: <20210226031902.23656-73-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Rename r2_zimm to r2_zimm11 for the upcoming vsetivli instruction.
vsetivli has 10-bits of zimm but vsetvli has 11-bits of zimm.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 916367703f1..6fb85c83278 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -77,7 +77,7 @@
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
 @r_wdvm  ..... wd:1 vm:1 ..... ..... ... ..... ....... &rwdvm %rs2 %rs1 %rd
-@r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -646,5 +646,5 @@ vsext_vf2       010010 . ..... 00111 010 ..... 1010111 @r2_vm
 vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
 
-vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
+vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
-- 
2.17.1


