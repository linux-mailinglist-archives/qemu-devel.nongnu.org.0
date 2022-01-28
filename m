Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2C049FC4E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:00:23 +0100 (CET)
Received: from localhost ([::1]:42536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSje-0002YC-4N
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:00:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgK-0000Hy-Qg
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:57 -0500
Received: from [2a00:1450:4864:20::12a] (port=45819
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgJ-0000vv-8J
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:56 -0500
Received: by mail-lf1-x12a.google.com with SMTP id o12so12240486lfg.12
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D72DBiTCPuNkH4tTn3UAU7E8HBia19XHAFjEmEIApY0=;
 b=cezmwC/uo52Zpgm6Ilwfz0LwHD8alqdFGyMIifgTFfr/2emWXGiz6dJ3mYv9h+in29
 W/VfrS3FgLtFO/EpAFX+K6IOd8vu33LSRbykaUBw4cxnGEPsiuL9LaPWvcGZiQxeC5EF
 efNzpZCANph68DkhCEEmrhVC1Aep6QLbKGsNHg/g9k7stVgPsNXOgHVy0tfeG6SHIuxI
 iJKO7+CLcXpqahM2BIOHh2RlQVccRbatI44MGpRmanD3FNPb+9cPu5sg2iSnGBpcqSut
 NSAJ5k1TW23eUnCbwoARCPgHM+vyYibPCjJkWN0M4gGrjHDCM233wXIb7AmDU0O2+HHf
 tg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D72DBiTCPuNkH4tTn3UAU7E8HBia19XHAFjEmEIApY0=;
 b=LMQW6YRQvDZVDeAUm/aIYDO1isNeU3Z3O4BdRxmzNTaSXxpLYUOZfWkvWBg9ZSHVQh
 I1wHLypODU/lLZEzjXiQs6iuJPAQOFGNEcs31FAr2MKxu1ozkSOY/yb7nrW5TJqx0IOf
 IKpm2yGQc0U14fpEZ+lYyNXsftN6e3HW3fhHdJyC3qwmK1kgafRsRepZyyAQoEN2EYpg
 5WYCXv++23mnCLGAyIHIQ9u3xQBvqrxGCjXUTU9xW9Od9dMdsoAjqjWdZlX9rJAqvHQb
 MHYxUHo7lBkeLKQAXjOuRZSHqNqqcDjT55M9krGHMGPD6DXm1otwmfOtgYykSxSgQ9PS
 gbMg==
X-Gm-Message-State: AOAM530SbujqDEYprvFkiYZq1ol/iAc859jVw0VOgR0zgqoIq0ym9cAG
 sX40taXHC1q2MKd1B9s7YsigwTK7lj4qAPZy
X-Google-Smtp-Source: ABdhPJxvgQ/h2vttjsvhAPvd8zQSwdtIbyiObs5gjiQuHXA04slFp6291U+513ZB6Plgfh7edYqUYg==
X-Received: by 2002:a05:6512:3986:: with SMTP id
 j6mr6514909lfu.445.1643381813603; 
 Fri, 28 Jan 2022 06:56:53 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id b20sm1031234lfb.51.2022.01.28.06.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 06:56:52 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] target/riscv: add a MAINTAINERS entry for
 XVentanaCondOps
Date: Fri, 28 Jan 2022 15:56:42 +0100
Message-Id: <20220128145642.1305416-8-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12a.google.com
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
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The XVentanaCondOps extension is supported by VRULL on behalf of the
Ventana Micro.  Add myself as a point-of-contact.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

Changes in v3:
- add a MAINTAINERS entry for XVentanaCondOps

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b3a4bcdf..2ffcc5a87b 100644
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


