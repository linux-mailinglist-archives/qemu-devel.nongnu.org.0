Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6A3E05AA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 15:59:40 +0200 (CEST)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMuhH-0008BF-7i
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 09:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36985)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMuH8-00038C-7q
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMuH5-0001Q8-Vz
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:32:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44015)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMuH5-0001PZ-Pq
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:32:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c2so12855883wrr.10
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XIcMLgLOy6AOjihetZxPEvZlo29WPIvHIy0xHe5Xspw=;
 b=Cw0FXpfYiZ0MB8qI9iXrI5B0xjpmT94qfAYKX5hbnRaV+gxwEvRLw7xxFPix9GkBGK
 v2SixdegqgmQONCeazgzWtw32b2akft8j1k7MX0r6usDCiwmYCmii4odkYvLDEX4YIU0
 EI+vl2lfTt28+lfiqbE4hhS59jW/xoG8mB6+olZHfn90FU1k9xuQrfql16/yyey3r2Qi
 IV0yErEgKOOYUBY0ITgJka7IH2xJcg0djOHYpd2shJq3cpOjbWwrET+1oLNh0812Xqfm
 PbD7JjnNcEVAM7PUYUd41UUmyz70zNjm/HaZIIyUqiIa1VFJk/HXGpEeEvivsdK+OzPo
 gOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIcMLgLOy6AOjihetZxPEvZlo29WPIvHIy0xHe5Xspw=;
 b=CpXk5a5qHokQEJ+0eX9xDkd96p7WWQjYZge6qW4pmY+qMNSmFaCtrvqZ8aZ2kAGONT
 vpxZFHvGr3XE5b0+WS+JytRjf7l1/sJKOQG6JvY0KM5QCJsiVfspMP/nVkr613kn8h96
 ovCqlrH8xrvhJCYpneU2/Vl3U7sWUJD3oiqTQP+bDPbRsgy6qwORF1CsJ0K2mbCjpLWQ
 KwDedR5pqQeVqpal0C0EZgmck+pKo1eYXHBmvC4VIq38jfAoeiTLDwTX3nje128T7IFA
 LAdFDyC8s6yuZRg3HhsCL37rOsrgDf4WPKaSb6CK6ENg/ofNG2ilsyH35eCNUT6EDgeM
 WWPQ==
X-Gm-Message-State: APjAAAXl2tSLL18ye+Jqa0lVgrku/rPgX9AoCcvuqKDiDbj2nqTpzruv
 ykOb9iQJMKi4yXb2VJ+pDezbuZ8ljG0=
X-Google-Smtp-Source: APXvYqwt7TVu0nuElov9iGVoNVfyW9Oe1UJ2PJmOtjSLNSLJ91uFfreIW07trc4SX8l//IYcgI1XrA==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr3807170wru.304.1571751154248; 
 Tue, 22 Oct 2019 06:32:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm20263856wma.1.2019.10.22.06.32.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 06:32:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/41] target/arm: Hoist store to cs_base in
 cpu_get_tb_cpu_state
Date: Tue, 22 Oct 2019 14:31:17 +0100
Message-Id: <20191022133134.14487-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022133134.14487-1-peter.maydell@linaro.org>
References: <20191022133134.14487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

By performing this store early, we avoid having to save and restore
the register holding the address around any function calls.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20191018174431.1784-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f7d3f257d8..37424e3d4dd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11225,6 +11225,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 {
     uint32_t flags, pstate_for_ss;
 
+    *cs_base = 0;
     flags = rebuild_hflags_internal(env);
 
     if (is_a64(env)) {
@@ -11298,7 +11299,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     }
 
     *pflags = flags;
-    *cs_base = 0;
 }
 
 #ifdef TARGET_AARCH64
-- 
2.20.1


