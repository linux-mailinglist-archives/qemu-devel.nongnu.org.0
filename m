Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9370D46FCF5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:47:24 +0100 (CET)
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbYn-0002gR-HB
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:47:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvao3-0006El-3O
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:04 -0500
Received: from [2607:f8b0:4864:20::62a] (port=36644
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanz-0006uQ-N1
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:02 -0500
Received: by mail-pl1-x62a.google.com with SMTP id u11so5753151plf.3
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FpDAFQ9VhGfEqzrsyL1IUBrPTf1Mfsv/b6eAB28Wq7A=;
 b=cg35nr6ZJN8N/CR9ryTYww4E1FRztXWNY2KurLeed1SKhxyuQgNAckBL0z/wh81ngX
 0IiSkrFcp46IxM7zs2BwsBWJd2KmPINwQPhWqPnmDPeg4ZFlMYHMgVBFs8Qn4bJRc+D/
 9W5j67GCoULrdSaWIklJbhiZkF5hNCgY2yDZ7Qhccmq0uhLw86xeUzUwe32XkJjyK73k
 TA/8ODe1vzc9xHFfmiBiUqsInCMbw3iFxCKyBdx2/0rkb7wEt7UfI3W5A/wrJmfv3pnD
 /kiNzjTaFRa/+ijV7JnjdejCJH0JBt8FmdHOr3ZCQ8yyDup2lIzjK4okVUqqmh3KSEDw
 wdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FpDAFQ9VhGfEqzrsyL1IUBrPTf1Mfsv/b6eAB28Wq7A=;
 b=EhkQPA2Kt9mWpTAw2J7tIeyfuEBQbkwjGa0OBuTsMEUoPpzx/WTLt0/i4OwpymM3gh
 QG9pLqap/tgJdI7/MzayAju9wJQxqH6QhenXjv2iA/5LxV2eZuSYm4rcDVDp7b8K1KSo
 s2gLe4iTCQk1zRIvkiMcD/k7gddg5K0Y05ISAoeUANAHhc7fPuv/aqO1wvVjzgXHo78A
 d/fPQYLbEaO1mFv6C1lzWO0mxh0cfPCgDvMKybh0KcGYgb9SH4ggeRdCeJt7WoWvspLd
 8eUnOIzYIfGmGHQI1F8jjhYjHz+g9g2KzyT28CJYyZipvKN3LdMzV1vl8o6PNUk52Rnp
 BLjA==
X-Gm-Message-State: AOAM532UlcR9MCgfAO6w0Jdx4F//Kz29v4ZfBi34BHosQsDUsdksW5/y
 QrTe354MI7XYitJjRUn4neWi5M1dA/diuT7l
X-Google-Smtp-Source: ABdhPJy5XcPsqPbmkoVQ2D8pyarsEZr6VFzaLoumVX5bX5UqzV8oE5KmRPogZGlRt+CspSiAsCLj9Q==
X-Received: by 2002:a17:902:7c8a:b0:143:bb4a:7bb3 with SMTP id
 y10-20020a1709027c8a00b00143bb4a7bb3mr74440193pll.46.1639123137776; 
 Thu, 09 Dec 2021 23:58:57 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:57 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 33/77] target/riscv: rvv-1.0: element index instruction
Date: Fri, 10 Dec 2021 15:56:19 +0800
Message-Id: <20211210075704.23951-34-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3ac5162aeb..ab274dcde1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -633,7 +633,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
-vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
+vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-- 
2.31.1


