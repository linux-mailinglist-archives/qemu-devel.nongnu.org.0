Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577CD3EB459
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 13:03:31 +0200 (CEST)
Received: from localhost ([::1]:36518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEUyI-0003ro-E6
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 07:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEUwp-0001rY-LY
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:01:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEUwo-0003gx-8z
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:01:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b13so12741059wrs.3
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OCBKdpsSkLNfHYRlxEtzDBxCv0tkX8TiQApWYZnhXrI=;
 b=V1UxVj4bZ7uWyD8VV7nZMX6soPRYHFKb587myth1d3w43jaoRm/bMYu97YtcoabrX7
 FAHQGhL2GUJqBqSNB6C/jsEJWQmy+ORzo7r76hE6nQwTLae+ZxrcumQPE5NpeMQslLUg
 FX6ArM8KZFvMOWRp2vucSsezlvTiPOAKEQOceGs9NjEPMTd9qMmtc/DJCnpRuBJgOuP0
 3ltD8wLI5yAWU38i8UW/48LgKBYWHdlbTHyPIqEi6uY6gT8exwUPlJRPZXi0CaeQ5vaB
 6EuNoVUUHCBvonJzFQxspSEAnhp1x0W2FSBBH/aVUT3ogXybOIS+zx6je7FwhPkaixYB
 V8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OCBKdpsSkLNfHYRlxEtzDBxCv0tkX8TiQApWYZnhXrI=;
 b=EvSRLfO2Ghz0AkFkyl6z2lKtgBe9sR7fxp6oMS3FbnwaoPLRYnCZnrpKyW5cPh7pla
 YHvbeJeKbk2ntUIZ0lV5luNyt3aQxb8gn1r8bieTLic1+3SXahewqSTaXh0w0WzIxUzV
 abqXZTv550oJOkt610Un0COvSr20Rvq5NiMeB/ejFawhtExJLlI2MNk8V3v5N0GknTGd
 ShV2CGokm88FT842xHfnzsRGqjbz1iZunwoFRWyCipCBZYjAtAM/y26d4FETa0JWBsCY
 Ydg99GB/Hr4+6wUJ6xye+81IuAACPOCebkcEgfWHyUjZMsqLdzigL+7eltZi79xdRgtA
 W3+Q==
X-Gm-Message-State: AOAM531izXMy3HAajGxrrcwXv81IgDMZG+Psu4U4gHxH1+A59u2pvd/5
 zJjL5C0NJA4i/BVVHH21GC5B4XR57BI=
X-Google-Smtp-Source: ABdhPJzsWE7LiyKEM2qOrTYi3bnLQpDw3KeenBwtIQDyRfCfnSfMPAaWiVJYRS9+DlJErSPlM1hnBA==
X-Received: by 2002:a5d:6b8f:: with SMTP id n15mr2383121wrx.241.1628852516421; 
 Fri, 13 Aug 2021 04:01:56 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 q11sm1109071wmc.41.2021.08.13.04.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 04:01:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/mips: Document Loongson-3A CPU definitions
Date: Fri, 13 Aug 2021 13:01:48 +0200
Message-Id: <20210813110149.1432692-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813110149.1432692-1-f4bug@amsat.org>
References: <20210813110149.1432692-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document the cores on which each Loongson-3A CPU is based (see
commit af868995e1b, "target/mips: Add Loongson-3 CPU definition").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu-defs.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index e03b2a998cd..c6ab3af190e 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -805,7 +805,7 @@ const mips_def_t mips_defs[] =
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-        .name = "Loongson-3A1000",
+        .name = "Loongson-3A1000", /* Loongson-3A R1, GS464-based */
         .CP0_PRid = 0x6305,
         /* 64KB I-cache and d-cache. 4 way with 32 bit cache line size.  */
         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C0_AT) |
@@ -835,7 +835,7 @@ const mips_def_t mips_defs[] =
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-        .name = "Loongson-3A4000", /* GS464V-based */
+        .name = "Loongson-3A4000", /* Loongson-3A R4, GS464V-based */
         .CP0_PRid = 0x14C000,
         /* 64KB I-cache and d-cache. 4 way with 32 bit cache line size.  */
         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C0_AT) |
-- 
2.31.1


