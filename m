Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388FC4A3C18
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 01:09:37 +0100 (CET)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEKGG-0000Mj-76
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 19:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK5G-0005bD-61
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:16 -0500
Received: from [2a00:1450:4864:20::22b] (port=37381
 helo=mail-lj1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK5D-0006v6-Iy
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:13 -0500
Received: by mail-lj1-x22b.google.com with SMTP id z7so17158475ljj.4
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 15:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bt5W1zbpmN0AezjNc3+ix0CBuxXy+bHpfuA3/L3gQH0=;
 b=W0BPK33yfNtUdGQxNOzi+wzoltR3WY6Xkm5aZsHRhPidRp0tqEo96NTxRG0M3it9XW
 MdLBhyo4CA/5fhKr5zm8ligQisSlV2YUHoFEey2fGiyzjIS3sVZ7myEtsUsWTA7GaweQ
 +dKWcS9tE2xDWEWNqVEGYjdFKYmuK64Jw8M+KM0ajQMR/hmltpTMZXzfXcENToIhA53f
 G+TbSlJOyllM3QTWqWqRYs2aQU6CDIDgD4DibJ2eBykgXaTZmYa52YttxLQtLkqkwa+J
 DFBYAZz9yCsuayMV26XIIFzRXvYNonAkYaxETH/u+aQW2wHgY0+HI/pZ1Tv+35Bca8SE
 +C5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bt5W1zbpmN0AezjNc3+ix0CBuxXy+bHpfuA3/L3gQH0=;
 b=VsG2JI12zeoNfgZCVyCU+oikGw0dFIuN54cDc86wSHGejvPTyB4vYRftUcrh5HrAY5
 qX6sF0ZmdoWLtYFl4ULqC3dYN5mpIZZsCAKs/HzuJmdLlTGHnEC4OT2GtdRGFQUzlV5e
 FVIUBAnMhoakZTNMy39ehE0o9954G4pVICbzQ6liXg7IJqpE2Yk4F0r+2LcqfXdUFOsh
 SIrE5k9/F3LYutcDu1dgZeoHVT8vsg4UcC5I908Q3aLeiRSeQl/ewCdb7ld0D3yD3PM0
 RdOol44Za5jlPjn0RcvaTYyQlJswZ2w5ErRZPOGWYsAkQmJK7WuGkeBMRhFQGYbUb9G6
 iyQg==
X-Gm-Message-State: AOAM532Cfq+EnBWKJoHQzqmBI8exCgVtaBDtp9PSksfBS8f1tpLMn0eM
 yno0vO0e9VYu3pjqB7Fm21y+LlaM1G8VobW4
X-Google-Smtp-Source: ABdhPJyulWLo0JJv938A93rV1jr/Br/P58wTh99eCCsikQewwcCeYoLo6P0I9nLJrpdzscBFftv+sw==
X-Received: by 2002:a05:651c:1787:: with SMTP id
 bn7mr12508844ljb.16.1643587089298; 
 Sun, 30 Jan 2022 15:58:09 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 8sm2132159lfq.200.2022.01.30.15.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:58:08 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/7] target/riscv: add a MAINTAINERS entry for
 XVentanaCondOps
Date: Mon, 31 Jan 2022 00:57:59 +0100
Message-Id: <20220130235759.1378871-8-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
References: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
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


