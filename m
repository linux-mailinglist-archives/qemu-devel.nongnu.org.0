Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC05DB045
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:41:22 +0200 (CEST)
Received: from localhost ([::1]:49512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6xt-0001MV-AP
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iL5wB-0005zQ-4w
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iL5w9-0004SN-38
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:35:30 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43690)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iL5w7-0004R6-2t
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:35:29 -0400
Received: by mail-wr1-x443.google.com with SMTP id j18so2377807wrq.10
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ouhbdjwj8mfD0TiFH/h8tXJayT2ifkgem8zqWo4b7jU=;
 b=q0TJ69hObxttWqupFwHOTnVy2N6DTQOVgPbIFPnn9/DUoy/XlYFikpJJgzUmeexajR
 aNXAn/t1t64ia8PrqcL5/y2W1AgCtPmqT4FrmiCrbBNALg/rEox/DG3jJqtXTYyjeOkk
 fIH06iTqeN3FHMy1EPqXB8tGNQaq7NundRCpnRemzPHT79yvdnq8htHngMFpeM83t4Wv
 YmsoXGex/hsm3NCATuE3/2PcEA1CggERHcKKx27G61dPYI7KRdEaCHcQX8YMuZT+jpan
 YXQ71B8OG7LXVac3woAmTv3THwKPYIwNdgm+17veMFCNZc4Too60T3SX1h2UKMg/EXvU
 Cd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ouhbdjwj8mfD0TiFH/h8tXJayT2ifkgem8zqWo4b7jU=;
 b=gO+MHpfKPSo7IBUXDiDt5K3EEMD6O/KhUQxEh3av6qmgfTLg4zU6nL4KXaswzz297C
 W76yQQVP1vfonNuwWdoOmk6bR2zJqGfj1l1RrWDm9nN0CvFB5Y89RA15duUPPRAEygGe
 LbM3mEOQPNR5kiLgmIT+EvZjhmU+tauE6l7UTme+SzhsgwSjlB5nmhxlLZbtSZ1aKVEQ
 bw6Vbz7bdRqa3fnjaCI0zLU/+5OStCaRlmc72jwikLGnwcHRMPAJYK4s1nWF8/Ucadl7
 +IyghzE5Iuxp/MdquZtCPwEse6zICYFRGVgDtygrMWZwuCzhlLrQzUjyv7ugQd5ngBEZ
 q/RQ==
X-Gm-Message-State: APjAAAVMGklZxDt5+AGkA1bfHVZ04o9xnR6F6KwYQKnWDr3g58eZdSJl
 qm5C1kuDwtZhrzqa/1BYJTXDHA==
X-Google-Smtp-Source: APXvYqwXbrRlOm0xqB/5M/C4IYhScan8KmhHTUSk0JJ61K9rN/aLAZWZ1wVVSF97dpGcvp5C6saAcA==
X-Received: by 2002:adf:e38a:: with SMTP id e10mr3242232wrm.348.1571319325374; 
 Thu, 17 Oct 2019 06:35:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm2294000wmi.4.2019.10.17.06.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:35:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DEAEF1FFB7;
 Thu, 17 Oct 2019 14:16:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v6 32/54] target/xtensa: fetch code with translator_ld
Date: Thu, 17 Oct 2019 14:15:53 +0100
Message-Id: <20191017131615.19660-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017131615.19660-1-alex.bennee@linaro.org>
References: <20191017131615.19660-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: robert.foley@futurewei.com,
 Richard Henderson <richard.henderson@linaro.org>, peter.puhov@futurewei.com,
 Max Filippov <jcmvbkbc@gmail.com>, aaron@os.amperecomputing.com,
 cota@braap.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/xtensa/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index d20e60ce77..a99f5296e2 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -859,7 +859,7 @@ static int arg_copy_compare(const void *a, const void *b)
 static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 {
     xtensa_isa isa = dc->config->isa;
-    unsigned char b[MAX_INSN_LENGTH] = {cpu_ldub_code(env, dc->pc)};
+    unsigned char b[MAX_INSN_LENGTH] = {translator_ldub(env, dc->pc)};
     unsigned len = xtensa_op0_insn_len(dc, b[0]);
     xtensa_format fmt;
     int slot, slots;
@@ -883,7 +883,7 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 
     dc->base.pc_next = dc->pc + len;
     for (i = 1; i < len; ++i) {
-        b[i] = cpu_ldub_code(env, dc->pc + i);
+        b[i] = translator_ldub(env, dc->pc + i);
     }
     xtensa_insnbuf_from_chars(isa, dc->insnbuf, b, len);
     fmt = xtensa_format_decode(isa, dc->insnbuf);
-- 
2.20.1


