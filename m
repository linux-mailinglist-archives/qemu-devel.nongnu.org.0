Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4A27FB5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 16:31:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTol3-0000LE-Cz
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 10:31:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTodY-0002XR-8c
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:24:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTodW-0006qU-T7
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:24:04 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTodW-0006pj-Mo
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:24:02 -0400
Received: by mail-wm1-x344.google.com with SMTP id t5so6005503wmh.3
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 07:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=HbJqlpqkF0phR9V9E/untsO2SeobncFpU3t1rLBGqVo=;
	b=xVi8Djz0A3TSWpGSGD1q4Wjj+TIKwElYL5HSWgNxLocEg37bESuF9hEn9oN/BONiQg
	e0jDu3pjYuL1jOOJtE/56YeNDHBqEoBkFrj/nWZu9MsyqCLUVKaGdCi1MsPYuaEwKwAv
	RksxX1ZaDQ+adVdKXbkXXtC+PntRqr8ma4n9Luvyi/Fz5Vauvq23rFLvClxjekkAgsxg
	8iozFhp5h0ADezTcjC+g6lL+EyldBhXtw01/8DqHfGnG/mwuMVFNe9GZzMSTWTk5+tvG
	wRenBryDoAmtddSIzbUqD9xCW757bmFmRJonIG5xGly3KXp/H9KUAQE2ezm6nCFaAmSW
	sU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HbJqlpqkF0phR9V9E/untsO2SeobncFpU3t1rLBGqVo=;
	b=Ut71cf1RZG69nNAseYK0IFYclJzY32HPk9JqwnKcBW2kvetleBMlvyufJ7b9Kr+I9U
	TQ5IfJk3URQfJLXlQ917Ly1f9MPsuzVcm3x+LeeSLxJpZlWjYZG0vvyChHF93t8XtYkt
	rEz9XYXDtPTYaQyWwns109msF+2iGvI4N+rAwgjeaSbDgFE/BHQciY7kp+QbM434u3mZ
	ZBTHHm2P4qkYUB1sRxxosWNjPRGxjXTBRZ8n3aW1z6kNtrpeh03fmZ0Ls8IGtRceUYc6
	nnXC6DtLN33JiiR33qDK6lCfLo+bG+RBZLX0bUKmEy7Qnb1Kj2Cwwp+IT3OSmSUrv6xv
	6PMw==
X-Gm-Message-State: APjAAAVebjahYCLhGeXdq7k7k60kMhOaYdnJbNHqkuegGi4isS/LzSb+
	w4XII2LN6OxP0bSq1V8WUUCJwnbUMUcnaw==
X-Google-Smtp-Source: APXvYqw9cMDlMXkefD5a6uBrSQ2FsypQq4/0/1gvghPtR4562IFhAoLtuCkRKQR1FPoLzZdkXmiicw==
X-Received: by 2002:a1c:2245:: with SMTP id i66mr11871793wmi.19.1558621441501; 
	Thu, 23 May 2019 07:24:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id z5sm9700617wmi.34.2019.05.23.07.24.00
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 07:24:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 15:23:47 +0100
Message-Id: <20190523142357.5175-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523142357.5175-1-peter.maydell@linaro.org>
References: <20190523142357.5175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PULL 02/12] target/arm: Simplify BFXIL expansion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The mask implied by the extract is redundant with the one
implied by the deposit.  Also, fix spelling of BFXIL.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20190514011129.11330-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2b135b938ce..42999c58011 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4043,8 +4043,8 @@ static void disas_bitfield(DisasContext *s, uint32_t insn)
             tcg_gen_extract_i64(tcg_rd, tcg_tmp, ri, len);
             return;
         }
-        /* opc == 1, BXFIL fall through to deposit */
-        tcg_gen_extract_i64(tcg_tmp, tcg_tmp, ri, len);
+        /* opc == 1, BFXIL fall through to deposit */
+        tcg_gen_shri_i64(tcg_tmp, tcg_tmp, ri);
         pos = 0;
     } else {
         /* Handle the ri > si case with a deposit
@@ -4062,7 +4062,7 @@ static void disas_bitfield(DisasContext *s, uint32_t insn)
         len = ri;
     }
 
-    if (opc == 1) { /* BFM, BXFIL */
+    if (opc == 1) { /* BFM, BFXIL */
         tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);
     } else {
         /* SBFM or UBFM: We start with zero, and we haven't modified
-- 
2.20.1


