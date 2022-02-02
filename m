Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A321C4A6A53
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:51:45 +0100 (CET)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5kF-0002Un-R4
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:51:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tP-0000fw-Aj
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:03 -0500
Received: from [2a00:1450:4864:20::12c] (port=37731
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tN-0003E9-CV
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:03 -0500
Received: by mail-lf1-x12c.google.com with SMTP id n8so37326065lfq.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 16:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YoxciKZhlCi7ZZ4HagAQ/NJL8dW70IiMiStjwYTsRJ8=;
 b=m2h03dE7IZ3a7lDFCk4Y53tvppsi8yh5qsJWuoJx9WDoeWBDNbL8+34+0oXXF9m7Td
 NHWX1J7AqLgdT5FBncIRvzS924IpZ7XmOxuRkYvurQANLgYxcpwL5tHJ4S0mCvF/StjA
 01OtTvqyTfSABAhkxkF91DQgxs7xiW703asalD7geMSsBxkH6OSmzbMbo1XmPi6Mdabs
 M75mHcyT4i+Y3g8HXEkGmMzddyDORofW0AWcSeldSqK0z1FYDs74pGcDxrHigf+UQdAz
 bPTGIN1sgiXIuEI0edm52YSqIkKwraprASHcExpQrNVmC02mpjEq72kNb0vsYmsqQqNy
 NpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YoxciKZhlCi7ZZ4HagAQ/NJL8dW70IiMiStjwYTsRJ8=;
 b=fqQdPa31qTZ4Xm6BmhFqSxqu28pCTDY0JAONq+Z7/EcTPL2cWzqeM+q0BszYOWsBnE
 BZRUerq+ZgtFjiK6eexIx5crPO5UHaDpe2scbFfTtmLd1/aQIllUazmHtIuKgUMGqisv
 5RWO3DjVwQnsDTgFrrvSDJ/1PqIIHCeHgMq37Tv63i3OR7SlqATPLhJ/EiU18R9qquZ0
 3z+/53MgbqHKHJmRARy1dm4IfxD0da7HYH8JL83DwEFpZlN3tRy2vI0amtLbRWol6Sk2
 V75LIKE3GYiROI0mGCypN4LIWfZgrhcvtwmzdpZz7/vJy9UmzKs3IuGrtpsUZx3f6wiy
 LFag==
X-Gm-Message-State: AOAM530s6Zo9IP0YUmmjTLejjSecXr6qAa9M8vuq18ElY0wW3iAAB7xT
 Fe65qfYjVffELnn50sMBxdwf/zDid+EnIz6I
X-Google-Smtp-Source: ABdhPJwwU1bMtEh4m6CUOC88YEZso5+nRQvDG5ZfXGmWqYcxubOvbtw8lyda5xTNy5y1R6ecM7F+Gw==
X-Received: by 2002:ac2:5629:: with SMTP id b9mr21404987lff.351.1643763179735; 
 Tue, 01 Feb 2022 16:52:59 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id bt22sm4305297lfb.262.2022.02.01.16.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 16:52:59 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 7/7] target/riscv: add a MAINTAINERS entry for
 XVentanaCondOps
Date: Wed,  2 Feb 2022 01:52:49 +0100
Message-Id: <20220202005249.3566542-8-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
References: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12c.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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


