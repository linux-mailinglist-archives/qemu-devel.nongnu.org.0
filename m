Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AFB2EE8C3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:34:17 +0100 (CET)
Received: from localhost ([::1]:52840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdrE-00057o-1i
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdhf-0008GB-Py
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:23 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdhe-00051e-EK
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:23 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t30so7151026wrb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9zOVt5mC6BKrn8/aJIajQg1rLT3CbXMbjoqCH1psww=;
 b=beBwsrVB1OdeBJyHJfBZqSSkiXc2Ue4xXXcXCdc0Jq1ATjpysiX0D7pLfbYYgs9p94
 hzHmgbY8uphkM+OngIndbv618FCoFRiRQiGsaEbwCy8vo2/EblQvr/e876PpdWqGDr2P
 g0ZFsGLnVB0GURPU9O5ZweBRIQ97Tnuscuroddyz5MAR2HH4tb5vgbAWK+RLVWUihMJr
 FDiMccnI/iLbgv+VDCTgO1O47+aOCVltiBppBQn7Vx8qDI9vWTjpe/tXqqcvzAmj3maa
 pQQVd3VRhUjkIC13xujo2SqAmmnADXXIAquaq+TJ5wmyRWfdN+5A8b96KQ/eZv46wPUA
 a/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H9zOVt5mC6BKrn8/aJIajQg1rLT3CbXMbjoqCH1psww=;
 b=Je1XyuV20EKdvDHJZ3ID9LhZgIx5cuEt2OW642yQ/XEZP8SgXwHLyxzs8syt7JHjF5
 dy/SWy9cwSizI7knvC05Wcp9L1fwXuLTmqLymB4wX9aiP8S7UQbvz+S2us8efZOVYeV8
 +VFtAAK+endEV1pph642pAJMjFhsOL7gPX6CXbtUMiSaNmZ4Cso8bYuZ2eLqwTPqKyxl
 XaTt2hEfJ4CSPKQ5He9vyYpLFX8cPDDwOpcIW6rkJCog3A1Miteoo1SaEpzmmNpV92Ip
 jUK4MBGPAnI6JUvdPYmTnVQBP56keSU0ZlnYdilIOYmktD9qWWPNyz0/akHpgZwjDrcd
 jtXA==
X-Gm-Message-State: AOAM532ni5tPnC2pqs/KVIYdadqP2cJXr6Ey+XqMSjwi5pgJ+THcYCG5
 1gD6bkbIWue4CgquszpSA+b91klXIOs=
X-Google-Smtp-Source: ABdhPJzWKwcEhW2PD8mOSa2fKu6MVLKZYReyP+7sdgmKhxVPAKNtE8mLuWtkAEUYiNitLhmQDoaWQg==
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr692233wrx.138.1610058259241; 
 Thu, 07 Jan 2021 14:24:19 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s205sm9587176wmf.46.2021.01.07.14.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:24:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/66] target/mips/mips-defs: Rename ISA_MIPS32R3 as ISA_MIPS_R3
Date: Thu,  7 Jan 2021 23:22:03 +0100
Message-Id: <20210107222253.20382-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPS ISA release 3 is common to 32/64-bit CPUs.

To avoid holes in the insn_flags type, update the
definition with the next available bit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210104221154.3127610-14-f4bug@amsat.org>
---
 target/mips/mips-defs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index d1eeb69dfd7..12ff2b3280c 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -18,7 +18,7 @@
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS_R1       0x0000000000000020ULL
 #define ISA_MIPS_R2       0x0000000000000040ULL
-#define ISA_MIPS32R3      0x0000000000000200ULL
+#define ISA_MIPS_R3       0x0000000000000080ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
@@ -77,7 +77,7 @@
 #define CPU_MIPS64R2    (CPU_MIPS64R1 | CPU_MIPS32R2)
 
 /* MIPS Technologies "Release 3" */
-#define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
+#define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS_R3)
 #define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3)
 
 /* MIPS Technologies "Release 5" */
-- 
2.26.2


