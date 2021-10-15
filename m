Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08D42ECCF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:52:06 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIwf-0003Z7-5H
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbI07-0005uf-CN
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:51:37 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbI02-0005uR-O8
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:51:35 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 75so7883671pga.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B589Lc8u+iFgd3azZrRezrhQo/6daZgVnkshkdfwJow=;
 b=XAiqkZNFwM4ZOV/OBZNGg7oDZtxgBGERa0t7jMwwhpazXlgGIXhb4NOcjzF1J6FI/e
 15NImMpEDgm4dU0s52f/ECiAU3TRMzQ/qm1jIy6Nx+fFfrrGjg3LlIowOtTqzsSW1sUY
 L6zmpT0cZtb1FZJYAwBUIhm1u/bRZX0f66sLwPGMIFDvfYI26quNxIEsWswaJckNrHXY
 0Wiqmo30rJnDieDZMeftawWA2AKo28BPLUOU9WMuG7yyeLRDLEU5zAqnFTkMScHsYoEa
 ASvvfApM7nhziliESqaQHP2BjW69axRz/YE1gl4Lgpk7nyylbyC64oN3apghxZhxg+eo
 +1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B589Lc8u+iFgd3azZrRezrhQo/6daZgVnkshkdfwJow=;
 b=OfzbnWKdqrdxW1ZyJnOayssLUIj1N/SpF5kMkXJuPmypGII83NthpI8YCMs0segKP/
 /yFTDTawFo8flE0zRsuqIe3Ll7TtLGYiIqP4Wqfz0Vjonbbz7JlvJ8qW7CpWeUwaDtEl
 GJbQW87RwJvc5z9R6VH1KJ+OVUKTvodiEa2kck7387YwyvB+7QgwkDxC8Vc4aFSxd0x4
 f4H0cJuTRH13J4tlqDlLpq0iEjC51rMKeIs3SZJGoIqm28+eeYN5bG4bz1OSPphCfC8x
 D/vQbkCgGspShzeXL+ggEqmTifbao9hefurzzvaz0MGMUS4fyPyIGdXmWEZgoMo4NdED
 Gvbg==
X-Gm-Message-State: AOAM533zPMnxETxSDug9SyBvsWBELjSjZKoeuGq+APjn/+kcUxkvrjKS
 Aj7C34paNve2AiKAUEBIcmiLignwRZsTXh44
X-Google-Smtp-Source: ABdhPJy8eTJkEJJ0KwrxXtMaWPc8Z7enN8iwKUontgn/TKNuRa/d7o2reZFcAkJy5XYhSJ7a0dQ0TA==
X-Received: by 2002:a63:79c1:: with SMTP id u184mr8082351pgc.19.1634284289124; 
 Fri, 15 Oct 2021 00:51:29 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:51:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 78/78] target/riscv: rvv-1.0: update opivv_vadc_check()
 comment
Date: Fri, 15 Oct 2021 15:46:26 +0800
Message-Id: <20211015074627.3957162-86-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions is
moved to Section 11.4 in RVV v1.0 spec. Update the comment, no
functional changes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b78c13f0be7..de2e2e506fe 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1613,7 +1613,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.4)
+ * destination vector register is v0 and LMUL > 1. (Section 11.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
-- 
2.25.1


