Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE4C2E9FEC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:22:22 +0100 (CET)
Received: from localhost ([::1]:38940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwYF3-0006f2-3H
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5l-0007CA-NO
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:45 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5k-0007yI-9I
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:45 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q18so33690891wrn.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jz6DSMJb3Okox6KqPHpjD4NrZ1Oy5kyq5dcv/sox1cM=;
 b=pp2MnUl3BSCRwLIgChnE04jDOb9qc+hyQ97eR7Vac9H/tjS4ju3aE29AGZOU97EZfo
 VvK59Rx8GoYH8xwBrJZdivsIvtFrG+JfoSnTDloFjCS+9hEKcT3ITjhQ9M3SU1r70GQe
 lMStQ31vtrRGBvYYtAm9x1E9+P0IjC+0NGP5hs7Z4pAfTaTY/21oJKti05pDhu5hsGog
 mBQI39aVWomrkKBA5Qah349+h6RDY1pVKLWKyzksC0n6id2B6hkXvydaNOHBI8kvQFuz
 eLjiksc6A4u8KChgZrpupr7/K9HMesmSOirbJOfSv2IcTNVV6SiZct2miV6iw3PQZEQ7
 kNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Jz6DSMJb3Okox6KqPHpjD4NrZ1Oy5kyq5dcv/sox1cM=;
 b=XeTAxmH56rbHug/lSLexcsZSRYmLeNoitCfqxI2NqR1DGoDaQ9z74j5W4aCmj856lz
 8nzv+mEd0ExxIPIupT0/8r7TFx/H7V03G4re80mJX4YIkiuuiQD9Pw+56+kLvLfNKGlX
 24tYbUu9fsMsP8zSHP7hkxzdtCMMBBfV03j38BLhmCYuhHm+M3tQ3FhSs2rh1lisZ1J8
 zgycpzsyT23oVQdZvNFtsU/u3SVEu1krKdvuNzt5+7FvYTQkSX90dyXc+MHlN66JrwwR
 m3fnEeLcEjqY4lfGr5GEG5+LeNqkCvhdU1vIUY2PP793kh0zkQ8mfceOabgZp83/rWvu
 oPag==
X-Gm-Message-State: AOAM532sT2ZIIFPDetT9QZE21qybbOzvpItIC5jE4O4SgQktlDINAo/p
 jIw59CFQZUmNqrBezcsqNV+Ml7UyOQU=
X-Google-Smtp-Source: ABdhPJyMpc9ZRRvjT/31fMFhXdGmEUVQmt01comyrO0PNewJS14lAD4uMsVXhxzZiB5iAWsGXrGoZg==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr55001311wrr.319.1609798359597; 
 Mon, 04 Jan 2021 14:12:39 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id p15sm88510178wrt.15.2021.01.04.14.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:12:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/15] target/mips/mips-defs: Use ISA_MIPS32R3 definition
 to check Release 3
Date: Mon,  4 Jan 2021 23:11:47 +0100
Message-Id: <20210104221154.3127610-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the single ISA_MIPS32R3 definition to check if the Release 3
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R3 in few commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index b36b59c12d3..ccdde0b4a43 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -19,7 +19,6 @@
 #define ISA_MIPS32        0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
-#define ISA_MIPS64R3      0x0000000000000400ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
 #define ISA_MIPS64R5      0x0000000000001000ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
@@ -81,7 +80,7 @@
 
 /* MIPS Technologies "Release 3" */
 #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
-#define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3 | ISA_MIPS64R3)
+#define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3)
 
 /* MIPS Technologies "Release 5" */
 #define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS32R5)
-- 
2.26.2


