Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D402D9073
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:24:14 +0100 (CET)
Received: from localhost ([::1]:56228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXuf-0006nF-0U
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrZ-0002FP-O0
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:05 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrY-0005VT-8p
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:01 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w5so10656294wrm.11
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E1hxADG4MX0Qqgj23YttpXWtCnMPo6j/2Ptp7rd9RPE=;
 b=QJFYRIMo8edvn29D1DGA7j5LQJwzHYFijAw70dc84SW3Bf5yGOmnjKsKS20YMVf9Wt
 /BD5B0paE6WUu0sC6SPFI/4L1EkLVjUANPBop7Qd2o7tEG7H4SFdNffeLoeMrdeUyN8z
 xhz1zVIA8ydanmWq2pkfHi2+YLcjJaKSqEfen8BB77Ms4Y6KGkalcIGf9sLp2uQlBvx7
 DlsC2gtyLoRhTEL493heZAMTVZY1zTTl+3c+oQy5DXIAezp5gGPbalKVXSyPzrQN2SaJ
 h0/jSmHwfX8nYQWjO9UW2HsD0YtMOv2J4LePNa8IXiKqUHQIdHayhMfSCp+1uiqPPckO
 ALRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E1hxADG4MX0Qqgj23YttpXWtCnMPo6j/2Ptp7rd9RPE=;
 b=T1SRbDCfs/hTrVz3+y5rtieeCf1mbrVE39LOMjeph0JoMRFutci4gQ/+kZSvdMS6Ct
 WMGomFUvieU97DlM0cxTDl1REeizonMcfrYDNCPdlE0ORbO5RwnA5S02KepKpw6hKQoV
 PDgPiLejp4sgZg6Tg2flbkP0KcNaEQgMVL4t2LKVKlpLsUMc5Ev/eTNXvxNI2RGzugz7
 BPWWTHgb1Yy62gh1FQ3vgUyphEeSBBdFGLTlsYLvG86dMhnGCJkSIvHdjaiR9aC25wQ+
 0iDNZ56qAoCbn4V8hnEm+5ne0BTEeAw+P7yjuSwuq11T6cMbiFplkElQDiopELhJsgu0
 zsnQ==
X-Gm-Message-State: AOAM531P23ZCBRg6yzZiZlW9ccaN7iXPi2qKemN3aCMpRydyCunY/RxJ
 GqRASQ5Br3llWFKpBLdHr7naQEl7UV8=
X-Google-Smtp-Source: ABdhPJygLgMquJOuVDVVtUz62vwP8PWlMlcYv5NJwKGEiE1SobyrQYByafn6qthVZy6ISQ4FO2l0uA==
X-Received: by 2002:adf:90d0:: with SMTP id i74mr26003505wri.288.1607890858762; 
 Sun, 13 Dec 2020 12:20:58 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u3sm30014199wre.54.2020.12.13.12.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/26] target/mips: Remove unused headers from translate.c
Date: Sun, 13 Dec 2020 21:19:34 +0100
Message-Id: <20201213201946.236123-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-3-f4bug@amsat.org>
---
 target/mips/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 4a1ae73f9d0..e87f472a8d1 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24,8 +24,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internal.h"
-#include "disas/disas.h"
-#include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
-- 
2.26.2


