Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6DD2D907D
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:25:38 +0100 (CET)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXw1-0000iu-CW
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXr1-0001WE-25
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:27 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqz-0005KQ-Fm
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:26 -0500
Received: by mail-wr1-x430.google.com with SMTP id a11so6648261wrr.13
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ElGn7JwtMTMMU13LrhvDMbTZ+gVsyAEKbzwxbxdSXTQ=;
 b=r279oMzyuCA06s9efRNLeeAbvEmXQa8MM5wCrkN4z80SdfG4YW8i5qEoPXL3o3oJzi
 RmVwgMhKBr4cnlxAyCF1GV3mj4WeRSBTBlqhLnx+iO+4rrza/osaiircUIlMbzxNd3iK
 Cbwao2wMXofejyOGUVwrDa3Mf/5sK/dAsxP39CKyeGmdw4+1UtmB9pQuHKPBPFn9bSht
 7zAg5Kaca5zsZLeJuvFC37lgO14GuwKCNbMWbpRowN04gx/ili7iU2l2H8mkWf8bmfS0
 tq3lVJknSoW4EbcjJAJPadvtUseVOKUUdCQvD5ciCtG5101ztnGpoCG/dKyAxgwTlvjB
 lG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ElGn7JwtMTMMU13LrhvDMbTZ+gVsyAEKbzwxbxdSXTQ=;
 b=MQlPc4UH8n58sjUBVGX1R2A2nGgSgsnyCJl2uhy5Wv6zDCdQUN1Z3r0XZ3nX/Pydut
 8J66l7lqdHSzG+R5BWz3pRZXRKhd25i610gcczHxBLv9ixJWe2JoJT/IB2IuNuo0DXDe
 rbdND3Q1x1u0YJ3br9qHYYvSPW1fQrf6Gb3OcyHTVWKNg0xFFQ0Gy2i5QiRQVyH5JTXW
 nJ+V4W6t81eYq7Kgfm7DXn2nxluJkBT1s9FSe4f8BEKymMKSSWZKsvmPup3KJFSxxZOG
 7/fwzSSdBrkHV/GRLexm6EeZkPghciKUdaYwwcKvDCWi1XQpKTqw42X20HDZqaqHY1EV
 tT2g==
X-Gm-Message-State: AOAM530lUhl9d2SD7CXw//YAQZ+/1pub6lXXBsE5hDQugo6kkVNPT893
 j6cnyaoKrAv65VlZLBrbsKWvwf+EwyE=
X-Google-Smtp-Source: ABdhPJyXLdF/7P0sm1YXBUTdja+xRF+QyOyW3QdtUpku/c3SnS6EaVS1ygEllhtb7X2nkTZzGO+ydg==
X-Received: by 2002:a5d:4349:: with SMTP id u9mr24715442wrr.319.1607890823912; 
 Sun, 13 Dec 2020 12:20:23 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id q17sm27617700wrr.53.2020.12.13.12.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/26] target/mips: Remove unused headers from cp0_helper.c
Date: Sun, 13 Dec 2020 21:19:27 +0100
Message-Id: <20201213201946.236123-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

Remove unused headers and add missing "qemu/log.h" since
qemu_log() is called.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-5-f4bug@amsat.org>
---
 target/mips/cp0_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index caaaefcc8ad..cb899fe3d73 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -21,15 +21,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internal.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
-#include "exec/memop.h"
-#include "sysemu/kvm.h"
 
 
 /* SMP helpers.  */
-- 
2.26.2


