Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08104AB7EC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:44:39 +0100 (CET)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0Za-0002Yq-Fi
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:44:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzON-0006Pk-5K
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:29:11 -0500
Received: from [2a00:1450:4864:20::435] (port=33310
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzOH-0007Ca-CJ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:58 -0500
Received: by mail-wr1-x435.google.com with SMTP id e3so9307205wra.0
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hdBB/X6nviMUPi/3RiZOl4t1MJ3o93fU6/TxbiWLfrA=;
 b=YVc8SUZDCP7NuFqmcM7TkkrEK2Ey9cb+CdR5d8H9gb8bYGKn8JKC/JxsU+8L5ufEhP
 S+PxSiutA9GvLlcHr2zcQUI6i3Ce0KVBVCYk41VtkWex9+cOeULze1rzgxK1A4gfZlah
 rFhrEv8WJuw6Q2DimR79Nh8HymLNioRRYxvcHCm2hmw/uozuN+AhKqiIuTxHtFlNzKvV
 2O6i4sGbXs7MxiSl8xLYOP1pDKA+KWdC9e3O/8RugMNOciHtggPj1Z22Fjj+gdUifi1n
 OYisBnRSi/t1srtbAUDFctCNQ81H6xWd+wH7JS/e3XjTGhWnL15kTluyY3hbN1MfiZXP
 XuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hdBB/X6nviMUPi/3RiZOl4t1MJ3o93fU6/TxbiWLfrA=;
 b=SeP7+lpnj5sdhqoaOCZNJbty+9mMXrWqFDxcV9YTe2zxmsDg9y0KvyL0RMUNeCIfYc
 q/h8igs1z3ilUByqTUcV/yCdpi54FR7Pgzoq36BsEmVk4iokQ0q8A7DsGxDC0pbSVVPm
 vVXXqo3f6Cbl/RoFy9U0UpzHxwhLT/+qvFxI2Dz4sMbHjNNULciXXbSMB3EO6dMg/ftr
 9wIGmQr5iUhmx4ocbY9uzEHZtxWpUWSJJEZfz6D8mlXKa0OqfS8+tUL8/ee/cUZMZtmR
 S9EOXlL+m5r3HAmDJ+7sN8zB8T6EvfPVERdWUnyH+IsBLTuZ+WBcPhJCLmTQn0ICRE/L
 fGZw==
X-Gm-Message-State: AOAM530ETTH88EcekJ6DVXXs2/HSR2GzLrb8zc6rO+4ZbIh1w9jY1jFl
 luEttL/saRYh+33Jksom6gRzBXdxA5M=
X-Google-Smtp-Source: ABdhPJx4ghJoLUeUPyxqEWS3CIh+ka01mIJjf1Ow0Yy2UpPopOh24Qj0e6c72k8QpfO1CV0VieBegg==
X-Received: by 2002:adf:f68d:: with SMTP id v13mr8785354wrp.426.1644222510481; 
 Mon, 07 Feb 2022 00:28:30 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i19sm20250006wmq.45.2022.02.07.00.28.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Feb 2022 00:28:30 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 7/9] target: Add missing "qemu/timer.h" include
Date: Mon,  7 Feb 2022 09:27:54 +0100
Message-Id: <20220207082756.82600-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082756.82600-1-f4bug@amsat.org>
References: <20220207082756.82600-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

timer_new_ns(), cpu_get_host_ticks() and NANOSECONDS_PER_SECOND are
declared in "qemu/timer.h".

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c      | 1 +
 target/arm/helper.c   | 1 +
 target/hppa/cpu.c     | 1 +
 target/riscv/csr.c    | 1 +
 target/sparc/helper.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index cdbc4cdd01..9555f6707b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/qemu-print.h"
+#include "qemu/timer.h"
 #include "qemu-common.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6dd241fbef..e39faa2a98 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -15,6 +15,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
+#include "qemu/timer.h"
 #include "qemu/bitops.h"
 #include "qemu/crc32c.h"
 #include "qemu/qemu-print.h"
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 37b763fca0..5f46ba801e 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
+#include "qemu/timer.h"
 #include "cpu.h"
 #include "qemu/module.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a4db40769b..45f04c701a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
diff --git a/target/sparc/helper.c b/target/sparc/helper.c
index c7bcaa3a20..c4358bba84 100644
--- a/target/sparc/helper.c
+++ b/target/sparc/helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "qemu/timer.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 
-- 
2.34.1


