Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCC046FD84
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:15:59 +0100 (CET)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvc0U-0003EI-2F
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:15:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapf-0000ZS-PM
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:00:44 -0500
Received: from [2607:f8b0:4864:20::632] (port=39521
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapc-0007tv-Ci
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:00:41 -0500
Received: by mail-pl1-x632.google.com with SMTP id z6so5750887plk.6
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 00:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pzcKVi+Bv60cC1ahgvxWBHMOsNggOIgMKGBP4AAGucU=;
 b=bkXwVEtKL8U+k4gINoqJIV7sbC/dxh/XUtPPa9JJzw2WPkoLVF8ez5H4IhFHW78L6F
 CEpAd7vDrJLqL+rCtAzzbg1ZX5MDvWM+4DHrEFTCYo8g5ZJmyf9AEOMZQQSAewKOZCNK
 /zoKw2U1Ul5PxPN3jMo1lcZVHES2S0XVmey/vJ7VxwetGMOgXh+36ybeL9SUZFrFhShe
 i0SCcMG5WTX6SVzWs2DI0EKoa/CJPE7tpQqCIceIU7VqRkmZ5w/6ATrFIVjww9i0Cu1w
 uhCrleXdDn+ONwNUDmQ5/8WcgwP4Zko1ezw9W7cvv6AAwfefpZjwc/glyUpP4PSO2Y4E
 yr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pzcKVi+Bv60cC1ahgvxWBHMOsNggOIgMKGBP4AAGucU=;
 b=yTGNer2yFHaWBOZr4QLmbwkjW4ERB58gr/aBaCVcxHkN4wlhqh0M3uZUokwYObKXCl
 byuT1ThDEk7DYIqEeuoycbFO9sIP78vi3rlNz4P95TRKGKqwijMJtVIeStiKOIkJRFnE
 o4y/Yv9tLNyx3nTApgVDL5ctPXUQV1vGH08qnjd/QsbSItUwUubuB+rqEPRZFpgUZXLB
 fYjnd3hLtZMr8n+NquUB4AswOZW36g+PjRJcJcO5vIWYigCjUeGe12tYPwtxGNN1kKnS
 WG8+8Of1HRTrTIGOqtdlfsmvPZYDUQTiDxQ/mkuo4nbMywSqcpAWtSQLEPoIaN4LyCKB
 jHuQ==
X-Gm-Message-State: AOAM533uUpmeEY3fTcfuXlGnNN85cim2Z46L2w/MoPhJjull6xybtWFW
 rnNouTRzM4YxYz1y1kd3WKIU7V1pN4BF57KN
X-Google-Smtp-Source: ABdhPJwoNnRtC9Ilc+IDPWtrn8CgMSnsynzAPFkPeOm+jpoxdAX2bXxA4X/ERLMESVaxbPaqS7bK9w==
X-Received: by 2002:a17:90b:3509:: with SMTP id
 ls9mr21876697pjb.99.1639123238419; 
 Fri, 10 Dec 2021 00:00:38 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:38 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 71/77] target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
Date: Fri, 10 Dec 2021 15:56:57 +0800
Message-Id: <20211210075704.23951-72-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Rename r2_zimm to r2_zimm11 for the upcoming vsetivli instruction.
vsetivli has 10-bits of zimm but vsetvli has 11-bits of zimm.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 952768f8de..d7c6bc9af2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -78,7 +78,7 @@
 @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
-@r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -671,7 +671,7 @@ vsext_vf2       010010 . ..... 00111 010 ..... 1010111 @r2_vm
 vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
 
-vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
+vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
 # *** RV32 Zba Standard Extension ***
-- 
2.31.1


