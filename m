Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E0786758
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 18:44:43 +0200 (CEST)
Received: from localhost ([::1]:54106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvlWs-0000Vq-IJ
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 12:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hvlTh-0004T2-OW
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 12:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hvlTg-0007ar-I3
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 12:41:25 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37643)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hvlTg-0007Y0-BY
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 12:41:24 -0400
Received: by mail-wr1-x444.google.com with SMTP id b3so3192801wro.4
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHaCdXGh8EVx3YP7Nogh/BDIDsukD0V5+eFPdAJezxc=;
 b=UMFGPkoU2A4+TW8JBjGnCbCQ1uvS4Eh3Mmhb7j8A30QiJ7KeZJ7XUmGP5N6jzwM5kA
 YePjMDh6mdXz7e5FE2SRpix2BlNJ30f6SbSCuIKLo4fiN6SQ05/PlvrtmX7UPRAb1MkP
 JfJ36xm2fy3iUddb6j64Xk3nLhEuOt9DsUs3ZgLKRtG4jc4f1e7yM1KBhiCJP01x5v+W
 lL2qDqDynhlrdgh8KKmytOfnduKPsXZf87YHyWY4hgGgVR+8WsteTLWXNut/WkyMlked
 H/ewRrIDNo8tJ0bPUQG0jShypTe95nV2Pd484MjpUib2r/xvImog9fNuH3gNiXmqberP
 c6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHaCdXGh8EVx3YP7Nogh/BDIDsukD0V5+eFPdAJezxc=;
 b=Nx8Prv/OEwkfUjYMsguYRE2arpaOOtlrzHJdcr5w+5i92MoW1I1vImA3xRuY0BmTy1
 YtEf9LI9WKqSFqXaf0cuuIfb1PI/lM+r6CzkWorhNXnNCN9rb2N2i9Rjr9CmKdx0X846
 c8GmQWHh6RYXtdOP4ot1YkxRpmdIPFU+XpNcwhbUo6IAlc381eN1lQ1sDu17QKrBUS7L
 YpRxctICLHfsRkgcY0l2cYK6fS+UHwzsoz5UVt8guA+zpL0IfChDG8u9vAur8qjyphu1
 llg+LVkL2Xovl+1XpijNfdvxpFaATWp0TN+fcLnkCEQ9OxjAS+qYpG0tBh8TTTu+rjqj
 ShbA==
X-Gm-Message-State: APjAAAXX8qRUjLAXULy8ELQETkemaLY5tcDQPDc63uJRpcuDwFAdW4Lm
 nvOGXHIg6Jatyd7ratuiY3y82A==
X-Google-Smtp-Source: APXvYqxq1DKzJ+i4SvL+xtkeP4oNgxjKqitw7robVC0J6Lv/hoxrq56fIjVWcWln5cbjEemguC0pDQ==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr2135215wrs.347.1565282483044; 
 Thu, 08 Aug 2019 09:41:23 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id u130sm4469137wmg.28.2019.08.08.09.41.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 09:41:21 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 188D11FF93;
 Thu,  8 Aug 2019 17:41:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 17:41:16 +0100
Message-Id: <20190808164117.23348-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808164117.23348-1-alex.bennee@linaro.org>
References: <20190808164117.23348-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v1 6/7] target/riscv: rationalise softfloat
 includes
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, armbru@redhat.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should avoid including the whole of softfloat headers in cpu.h and
explicitly include it only where we will be calling softfloat
functions. We can use the -types.h and -helpers.h in cpu.h for the few
bits that are global.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/cpu.c        | 1 +
 target/riscv/cpu.h        | 2 +-
 target/riscv/fpu_helper.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f8d07bd20ad..6d52f97d7c3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -27,6 +27,7 @@
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "fpu/softfloat-helpers.h"
 
 /* RISC-V CPU definitions */
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0adb307f329..240b31e2ebb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -22,7 +22,7 @@
 
 #include "qom/cpu.h"
 #include "exec/cpu-defs.h"
-#include "fpu/softfloat.h"
+#include "fpu/softfloat-types.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index b4f818a6465..0b79562a690 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "fpu/softfloat.h"
 
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env)
 {
-- 
2.20.1


