Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCFD2D0839
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:51:07 +0100 (CET)
Received: from localhost ([::1]:34164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3o2-0006mv-DJ
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dn-0005Y1-Dc
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:31 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dm-0007g4-09
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:31 -0500
Received: by mail-wm1-x332.google.com with SMTP id e25so12106035wme.0
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nvvnuVAXyMXpDzWyrVINIXmEpj3Xa1vtGYGPNmttFgg=;
 b=n88N84E/kJAVo0Mxv3CD6rucxKCZvjzDLCaLmUaDQq7FtRotXM5HNe+7mTUSvR0xw2
 e+nh5+7e7RxkOcIpAN2a2l2lagy9R6AgbXqmKb3gjMtVS1rHZ24aRbBB8lKg3Dfwhrdt
 m/uqQbHQE3GChYP9x8yxehO52L680Z91+AKqEpWZungeZHoMVteAU9JqSw2NQ3oGmo4Z
 yamgUSSLJVXaHyJxIoLCczu+vMChZUaLx/8CqTsxii9Oql71csY140FfWl1VDk1vysui
 PgDlYmZUw/2UQRF8XdM7RZsCY9HV3vf9kq8vGtuHY8TV0g2w3o7Yh33h2p0uYQN7chvi
 cmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nvvnuVAXyMXpDzWyrVINIXmEpj3Xa1vtGYGPNmttFgg=;
 b=hL9/u7aYRJb6rh9A+U4QcYGqmjGvyIY05XZNGYYSD6MkWC9G0TlT1Vq426MzjHC/+8
 08TFsD1LcKOGMhzZ6lal6RlXsY05Qo3bK2F6pLF2PrsvyK6Znxn7EcL9ZnRNzm7OTG9/
 AMAmT6UNcEjArLnkKH51ZojJREbnIXsHBkZw22u/RtLVjjO0Pql/yfp1gtiNJbq5645l
 dKY61o5b9BX3SfI7+h4YnHmJ3axSyqos6+sZKRUH9RTdS8I82GXd1Asca9TSzq+N4cEa
 q/jHbTE4nDri8VPLH19lZ6vfe9Gb5/RcO/xIeF/JMmYwz2ZxxIWQ3IUviOz/CeUDywKk
 u/rA==
X-Gm-Message-State: AOAM531dbl1V6EJ9iH652gBwqopsPAMqqHmRqgzQ4zjxFMHtPOiCe9bZ
 +ffRycdZFp9xnfK9KQOkCIc4SihGs8A=
X-Google-Smtp-Source: ABdhPJw3Z/Cg8aKrlfWwSiz6cd42kt3hOEz7TpaPUsuc69JEMA3JkZ1sJCT+n/WH6cgUMPmM3FmWTw==
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr15343246wmb.77.1607298027981; 
 Sun, 06 Dec 2020 15:40:27 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c4sm13758103wrw.72.2020.12.06.15.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/19] target/mips: Include "exec/memattrs.h" in 'internal.h'
Date: Mon,  7 Dec 2020 00:39:37 +0100
Message-Id: <20201206233949.3783184-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mips_cpu_do_transaction_failed() requires MemTxAttrs
and MemTxResult declarations.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index b3f193f7764..7a6ea5299fb 100644
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


