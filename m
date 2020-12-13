Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D99C2D9071
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:23:40 +0100 (CET)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXu7-0005ln-1j
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXql-0000vC-TE
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:11 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqk-00056G-Di
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:11 -0500
Received: by mail-wr1-x431.google.com with SMTP id a11so6647836wrr.13
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h9xJIRQyKnane3GYzE3+NuQLJbx63PUZ7Fm8rhK2xB8=;
 b=mbgZQSGvTX3mqzqH4M6D4PcWZL78hL4Wie0tg103QQUUWktW0cmRGQYR0h7V3slQhg
 t4gSMQ34Q5A54o0Y1Sa7R7MGoucJqp3Q0Us+rViwnYoy08Q/6oLfcMz0cdEkMESRDLRr
 Pi8LEeMxrAFFcLQoiRffdL7iBoiQ/mR2Dzj7OwnN+lylVIQ42+5OjzgEPKLsgfYebJJu
 HihK+fShS3Ky+qibhLQDYRXvfHcg3/ibMXrTXJWu5fXCMu3lLORDVMWeiJK9Sw1coYqp
 i+kYxZP+dhrTFNcy+GQGtkLBuIULoYdwIAI0mI2UoaytcdImai1YpdGbLcLvVZ4xDrrh
 X4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h9xJIRQyKnane3GYzE3+NuQLJbx63PUZ7Fm8rhK2xB8=;
 b=gIE+CKRqkYy0SLG+PCfcqdrzeEN5TdMtO+QBRYPSa8tXQeOPImG7y3v3/KvcaCM3Lg
 gcaVN2Cyr4QSHb3xl67RDkL9tfGKfkPBKiPFg2KNhfQ1M5yMRpFyCdF64lycHHJlcdKH
 9jcRqR3MnPiGuUoFKyHvyCaIz7eK8qpyFl1DPC0d0oWYhU1+NslJZXGcuYc3U+viRCJv
 0inXLzHSVvsLWjac4a6fhxQEXRmFIN8vvrCX7MmBlMzb4dItmv2E7S1mPfNgS1ixOeFu
 W64E2C6cdZuVqfyAldkbofT+/hkLP8Y5gUxDYb8VQLpXJNo2tbr1WIV12OXO3iWleBIk
 anVA==
X-Gm-Message-State: AOAM533/dGviM8rxcyOLh4IS00u9WgZrbw6c4HrLbmmPAg5TTL2U4T97
 EQXk8xd3ERanZBUK/gZB22sEwrYgR4M=
X-Google-Smtp-Source: ABdhPJyhMywD88l8pOLmlXDRQKN769S3On8PU2OFuV79N9zVGRbpyseC8eMUVxtOcr1kWIil4eIZuw==
X-Received: by 2002:adf:d18a:: with SMTP id v10mr25231575wrc.273.1607890808840; 
 Sun, 13 Dec 2020 12:20:08 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id w189sm15877043wmg.31.2020.12.13.12.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/26] target/mips: Include "exec/memattrs.h" in 'internal.h'
Date: Sun, 13 Dec 2020 21:19:24 +0100
Message-Id: <20201213201946.236123-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mips_cpu_do_transaction_failed() requires MemTxAttrs
and MemTxResult declarations.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-8-f4bug@amsat.org>
---
 target/mips/internal.h | 1 +
 target/mips/kvm.c      | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index dd8a7809b64..76b7a85cbb3 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -8,6 +8,7 @@
 #ifndef MIPS_INTERNAL_H
 #define MIPS_INTERNAL_H
 
+#include "exec/memattrs.h"
 #include "fpu/softfloat-helpers.h"
 
 /*
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 94b3a88d8f8..477692566a4 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -23,7 +23,6 @@
 #include "sysemu/kvm_int.h"
 #include "sysemu/runstate.h"
 #include "kvm_mips.h"
-#include "exec/memattrs.h"
 #include "hw/boards.h"
 
 #define DEBUG_KVM 0
-- 
2.26.2


