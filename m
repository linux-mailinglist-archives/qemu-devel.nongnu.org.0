Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9245719942B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 12:53:51 +0200 (CEST)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJEWk-00057R-K2
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 06:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jJEU8-0002VI-7y
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jJEU7-0006O8-6F
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:51:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34030)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jJEU7-0006NP-0F
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:51:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id 65so25327664wrl.1
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 03:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7AsrAmCtFf8M+d+3PR/ZWRVO3rzbQ0QtqWSom6Etlcg=;
 b=ewFUCJ+kImsIGp9g94uCeB/hCfHGIfwuhS5E51hPmk0LDnK61dfxTqwY19LYk24EYl
 tkwSY6VRdlHorkW0+WU9YPBrHVxzWHpEv7N9x8xUH2gCfY0kfLJdEGbFDQmVUhknAT4u
 2atRcLUkbEffgzoM7xjtZxvtCKEmDxhfxCAY0rvS8KRy6d/CiGsdSE3yTufGM0kJkHO6
 rgtGBcmCLqsWIjOQ1M6nVJZKXPidltSgc3snsEoYIu/yS1bPigcpeKzKo2Mbnh0rtE52
 D/Ge0nuYsqUPF2YFpNPjzzrT4LtQ8yR6XnNj2VvARSf/gbg/IQdSeWSrNsshW1ARJ3BY
 IjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7AsrAmCtFf8M+d+3PR/ZWRVO3rzbQ0QtqWSom6Etlcg=;
 b=bnPEpjn/l+36rBXHzvjt/yqM8uMVLas/BypSqbP5yywG8v406cuSoXMYbn4RHbeW2o
 szPduiCln4gdEvSdWhJSyYfGz7WGYc8ib8P1ldeEBP3mXzc8ULGdBYiQ25YLbDdjcJbz
 6N3tVdTOm9LCeetTVhcLDelwk6LZoES/1ArfJfL3tRIOTKlH6XDgo7JScRLAHsbGkwmT
 /A8Rni9dEEjz5fy0LY/yIf8L3ceCeE1K1tsZnzswGCuC42b9lcBdVmrQ8iJycPGifSwg
 8GG5TOamTYvRJPeLW/Xo8T2QjX7rxWjn3RzvuYMJ55ur/h++JGGrTlVI3Qql0b5VTqWV
 gO/A==
X-Gm-Message-State: ANhLgQ25anuT4gSSB0LrM8j/ifFuxwcXiVsyK+S9NU5zbC4TsqfZnamg
 apn1sXAmKxtHE7JHE0xYTKQSllEimSk=
X-Google-Smtp-Source: ADFU+vvAwfEvmSQiMc2pGUEq7QuEuvyX659dMjF+uzTgZRAQ0M5pdAKz8rBq20riCxz4aj/2HlYPIg==
X-Received: by 2002:adf:e584:: with SMTP id l4mr18062967wrm.388.1585651865782; 
 Tue, 31 Mar 2020 03:51:05 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id w3sm26042830wrn.31.2020.03.31.03.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 03:51:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 6/7] target/sparc/int32_helper: Remove DEBUG_PCALL
 definition
Date: Tue, 31 Mar 2020 12:50:47 +0200
Message-Id: <20200331105048.27989-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200331105048.27989-1-f4bug@amsat.org>
References: <20200331105048.27989-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Jiri Gaisler <jiri@gaisler.se>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We define DEBUG_PCALL since b884fc5e (2012-10-06).
7.5 years later it is safe to assume we can remove it :)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/int32_helper.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
index 813b47dbb2..c56dd3df18 100644
--- a/target/sparc/int32_helper.c
+++ b/target/sparc/int32_helper.c
@@ -23,9 +23,7 @@
 #include "exec/log.h"
 #include "sysemu/runstate.h"
 
-#define DEBUG_PCALL
 
-#ifdef DEBUG_PCALL
 static const char * const excp_names[0x80] = {
     [TT_TFAULT] = "Instruction Access Fault",
     [TT_ILL_INSN] = "Illegal Instruction",
@@ -58,7 +56,6 @@ static const char * const excp_names[0x80] = {
     [TT_DIV_ZERO] = "Division By Zero",
     [TT_NCP_INSN] = "Coprocessor Disabled",
 };
-#endif
 
 void sparc_cpu_do_interrupt(CPUState *cs)
 {
@@ -71,7 +68,6 @@ void sparc_cpu_do_interrupt(CPUState *cs)
         cpu_get_psr(env);
     }
 
-#ifdef DEBUG_PCALL
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         static int count;
         const char *name;
@@ -104,7 +100,6 @@ void sparc_cpu_do_interrupt(CPUState *cs)
 #endif
         count++;
     }
-#endif
 #if !defined(CONFIG_USER_ONLY)
     if (env->psret == 0) {
         if (cs->exception_index == 0x80 &&
-- 
2.21.1


