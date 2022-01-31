Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00164A443F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:30:21 +0100 (CET)
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUt2-0006Vv-TL
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:30:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURt-0001vP-3G
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:17 -0500
Received: from [2a00:1450:4864:20::12d] (port=43758
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURq-00043E-7f
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:16 -0500
Received: by mail-lf1-x12d.google.com with SMTP id u6so25987051lfm.10
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 03:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bt5W1zbpmN0AezjNc3+ix0CBuxXy+bHpfuA3/L3gQH0=;
 b=XYUMSfFyaLzWabJCwjsgaCXWSEAw70tDxXiHS4mhP6nsObCjZB3dPoHhPHuP/abOPV
 z6q4v9cKnSQ+Lt75s8Biw+AmHJ4EplL3oFLhe+UL+w6hafVpogqcD5G3OGHqL9kB88ie
 Uj0YJJvurfJa0sN5cVKpAE2TA/ERKlfuwbQUlZRIb8oMNUXfA0cgonGGZRP8jyGpZ0pk
 Ynf/UAMeAk65dbMN0n/qUR8msxD08IOtGA4oDYfjgL6YIUePOq0we2iCg/ftYYQdJ4Mf
 GPX6caZlsdslwkaNll1zYwzA7C0iigxAG5We+Fj+tIAM/I/j7EXsZ9Z2nSvGDwlJqxvS
 fs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bt5W1zbpmN0AezjNc3+ix0CBuxXy+bHpfuA3/L3gQH0=;
 b=wjGvXWUNntIsselk/Z+AY6Ftym7PipeGqgko+UcYfH8hl2jUqnCQtK90VlUpHZiN0y
 AMFL0Py8iRvoAP5xI/p9VcLP/8AtSjACykT9F8DVMJ/o0+u3ZdLpj52q/BAm1F12K1vP
 qR7FtoSspTA08tsGivy4zRjlRgjiDCKHzfeMQ6qvkdJfuKb25pwKkm1GxQZ0hColLVmN
 yMJeh63I2BMKR8+SjL94Jf7V0tQdEWD+szM2Ra6a0zstFT/JAxHRx0RhfTCGDsj/2OCM
 uIF+wHBVHVBxCW6fEwmJ2NCc0cAFObEl080nG1UJacBdOSYR7BDjcvZri11oXhBQUCdb
 vaJA==
X-Gm-Message-State: AOAM533fZSOpsCFxwR1dF0tzIYafg2B19hHW7qX15Z+VZZwAEvsAf8YU
 C6xPqOUu/meu9W3jKtQf2BS0jYFxhez7egZ0
X-Google-Smtp-Source: ABdhPJyGpl8e9KHRAs4oH7kRGK1KGEC+v/kzYIQ/lcZwXMCeK2kqNe2dq+qqEh7MXNzXI4dyC3Rb+w==
X-Received: by 2002:ac2:5190:: with SMTP id u16mr13601115lfi.257.1643626931985; 
 Mon, 31 Jan 2022 03:02:11 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u22sm1952759lfl.26.2022.01.31.03.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 03:02:11 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 7/7] target/riscv: add a MAINTAINERS entry for
 XVentanaCondOps
Date: Mon, 31 Jan 2022 12:02:01 +0100
Message-Id: <20220131110201.2303275-8-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The XVentanaCondOps extension is supported by VRULL on behalf of the
Ventana Micro.  Add myself as a point-of-contact.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

(no changes since v3)

Changes in v3:
- add a MAINTAINERS entry for XVentanaCondOps

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b43344fa98..2e0b2ae947 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -286,6 +286,13 @@ F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
 
+RISC-V XVentanaCondOps extension
+M: Philipp Tomsich <philipp.tomsich@vrull.eu>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: target/riscv/XVentanaCondOps.decode
+F: target/riscv/insn_trans/trans_xventanacondops.c.inc
+
 RENESAS RX CPUs
 R: Yoshinori Sato <ysato@users.sourceforge.jp>
 S: Orphan
-- 
2.33.1


