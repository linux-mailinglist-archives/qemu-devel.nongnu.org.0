Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0137F114284
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 15:24:30 +0100 (CET)
Received: from localhost ([::1]:55212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ics3R-0000Jk-P9
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 09:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1icrwD-0002c0-Qs
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 09:17:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1icrwC-0003tT-CI
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 09:17:01 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34183)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1icrwC-0003oN-26
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 09:17:00 -0500
Received: by mail-wr1-x441.google.com with SMTP id t2so3847049wrr.1
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2019 06:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j8BHLefjvES9SOUgRcfX4ySy651Dqcu3C9AOxEtMINE=;
 b=H9d2840qQHkWnEUhW/yRLuN9XbkJ2AtviP8lUc4S+3SvC/u3qn30KkX2ynW/dZwws6
 zkN3DLP2z983CcHPnDhwOXKwaQPjRbrb8BZ0L2Cezw2jGMmWpcKM2zXwhQEhlz1R3cII
 ROP0sz9Bf5oa8LMBWqXRrcTv4faM/KDoITZ3ntc5gh1gTrv99MHqd9g9rcfwDjIA4Avi
 496oyNAP8pZrxwjmMeooiCOX6usOZSK2uueloRDSm6appx2Qgz8nvOFZr6hhlMZSxExj
 nlMhC0NlKxfcyzLS1KpPcKIfdbNKs7OmIdAM1aBiUP1fixn8ZM2N5hiHAWki6e9euXrT
 leBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8BHLefjvES9SOUgRcfX4ySy651Dqcu3C9AOxEtMINE=;
 b=mDnz0TlgDjouTJP6vUuJ/XNPlCzJ8FVcgBT7IianKrEWI6NRybi3XV7H0gUWkXseap
 4miYtbWrbrxIm1sYGwOUzMwjHQXW2UQMoFNOnWsUuwUMGH3dE03xt3s7XQCiva0U9w4O
 OdBPoQTUt0n7Xdl+BeOlJCaIpgGx+YH3jgeIBpDnYguIjEn435BQ8f00JFZll9Zl6Qfd
 ted3Ce042xfxB5dFUbTC6MJjprqZ2e506LRAVRR6CLFkTbr+2TSqI44T0UneV93Kimk5
 VKKaj3i7Un2NNftCuzZSXpOrCvTbIYC7cjuC4XuPRDKmtoVR6gu+TaURRwz3MVld23Bb
 uulA==
X-Gm-Message-State: APjAAAURnyZ3ktPIOMqQrlatwKw3jGddm4NuqjCOMQIeF9Qv/T/3294x
 v8xZLRhEXfXvnZ+XTaPQacBzPnaQvDw=
X-Google-Smtp-Source: APXvYqxydtaMiRT0SEobaIhuXxFW9PNVF4Dvltqac99Cpx361b4ZTkA+usCgXtBBEasv5LBJRNCKGw==
X-Received: by 2002:adf:fa50:: with SMTP id y16mr9908354wrr.183.1575548723861; 
 Thu, 05 Dec 2019 04:25:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a64sm11379882wmc.18.2019.12.05.04.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 04:25:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5225C1FF90;
 Thu,  5 Dec 2019 12:25:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 3/6] linux-user: add target_mmap_complete tracepoint
Date: Thu,  5 Dec 2019 12:25:14 +0000
Message-Id: <20191205122518.10010-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191205122518.10010-1-alex.bennee@linaro.org>
References: <20191205122518.10010-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For full details we also want to see where the mmaps end up.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mmap.c       | 2 +-
 linux-user/trace-events | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index f4f10deaeac..0b1b43ac3c0 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -538,8 +538,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
  the_end1:
     page_set_flags(start, start + len, prot | PAGE_VALID);
  the_end:
+    trace_target_mmap_complete(start);
 #ifdef DEBUG_MMAP
-    printf("ret=0x" TARGET_ABI_FMT_lx "\n", start);
     page_dump(stdout);
     printf("\n");
 #endif
diff --git a/linux-user/trace-events b/linux-user/trace-events
index 8d8d4c3c68c..6d6aeef7b52 100644
--- a/linux-user/trace-events
+++ b/linux-user/trace-events
@@ -15,3 +15,4 @@ user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t env_psw_add
 # mmap.c
 target_mprotect(uint64_t start, uint64_t len, int flags) "start=0x%"PRIx64 " len=0x%"PRIx64 " prot=0x%x"
 target_mmap(uint64_t start, uint64_t len, int pflags, int mflags, int fd, uint64_t offset) "start=0x%"PRIx64 " len=0x%"PRIx64 " prot=0x%x flags=0x%x fd=%d offset=0x%"PRIx64
+target_mmap_complete(uint64_t retaddr) "retaddr=0x%"PRIx64
-- 
2.20.1


