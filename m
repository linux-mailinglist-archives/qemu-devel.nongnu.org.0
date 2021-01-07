Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C042EE96C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:00:45 +0100 (CET)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeGq-0001U7-Bo
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdji-0002nK-S4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjh-00066e-A7
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:30 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d13so7071896wrc.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sIZITomoctnrg7h438bGjGhxwrMRbJgeE72R2oM+qvs=;
 b=sSmpj4/wRqPA48lkOUtGrBDg+BaiS9WsRfX+STUuCl2/YlykDLj5gnH3I/shWnTzix
 O+IVGc7o1psx8VZcj+BmaNUWKTpQ37PDA/sK/uCgrlTud9mFxD4lw0P+uGl5SEToNvDH
 kEHJrUFldXp6vtuElqG9tXLYZLYMRF/o2nGs+fnN+pakzTlgUVRJivOoBBGSqDEAc1D0
 Vc3dCeu5Q/YStRUM/Aj45fYGaLyQ8DZk0iAsaoO6c55KwH5nMvT9QabStCu821OBnTE9
 nrxz/W29WSeKWns7KvIuTMri1j1Uy6f1a8lgjovyLA9gh5J+qKX7ozF9EsKeBEsTV6m1
 CZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sIZITomoctnrg7h438bGjGhxwrMRbJgeE72R2oM+qvs=;
 b=ddk5++R2CKdDQE4yhac5mr7xZjQu88lLT/KEAf5EtMncYalFx1WalvM1S/0YI99f+h
 BEaPWnKvOhmKloX/vWTjx0LHj+nl2cq2RvvAuNsb4YpfI6tNQXCi+EkdS0AmkWzBaCve
 ny+OvAeBsxqkDc1VIOiceNnPU/YWfZjhvugwfXEO7MwKcBNEvwshmVrZx8AkQSDVHJRX
 MtEKI23GvSdCsvBIJrQRHTZRxmN5rdYU5MfR+dJ0yYC88bF9Uyngc+/OUy+sglZ/S9Jx
 9MqZXxvGdsIhLbLPzFWAmACKlKDLwdlnhsSsGsq+zI0mf2vRNAdeU0Trx8epgCCBmw1G
 b+hQ==
X-Gm-Message-State: AOAM530Sho7JQFprwRWOTyBwnBp2sjJ2rqfnOR9NpGkrUyBLppgcLWQM
 2H65hFbUuFYQx34TfvVA7oHL90HjgmE=
X-Google-Smtp-Source: ABdhPJyyA9DkDecms4e6imKW1wY4KetEc5pLg7CYsciqR3ze1CMjyrI87mZDUwtj/Zw1OWmM6byPBg==
X-Received: by 2002:adf:c387:: with SMTP id p7mr668077wrf.95.1610058387817;
 Thu, 07 Jan 2021 14:26:27 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id l5sm10517666wrv.44.2021.01.07.14.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:26:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/66] target/mips: Remove now unused ASE_MSA definition
Date: Thu,  7 Jan 2021 23:22:28 +0100
Message-Id: <20210107222253.20382-42-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

We don't use ASE_MSA anymore (replaced by ase_msa_available()
checking MSAP bit from CP0_Config3). Remove it.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201208003702.4088927-6-f4bug@amsat.org>
---
 target/mips/mips-defs.h    | 1 -
 target/mips/cpu-defs.c.inc | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 97866019a72..6b8e6800115 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -34,7 +34,6 @@
 #define ASE_MT            0x0000000040000000ULL
 #define ASE_SMARTMIPS     0x0000000080000000ULL
 #define ASE_MICROMIPS     0x0000000100000000ULL
-#define ASE_MSA           0x0000000200000000ULL
 /*
  *   bits 40-51: vendor-specific base instruction sets
  */
diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index fe0f47aadf8..3d44b394773 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -410,7 +410,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 32,
         .PABITS = 40,
-        .insn_flags = CPU_MIPS32R5 | ASE_MSA,
+        .insn_flags = CPU_MIPS32R5,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -723,7 +723,7 @@ const mips_def_t mips_defs[] =
         .MSAIR = 0x03 << MSAIR_ProcID,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_MIPS64R6 | ASE_MSA,
+        .insn_flags = CPU_MIPS64R6,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -763,7 +763,7 @@ const mips_def_t mips_defs[] =
         .MSAIR = 0x03 << MSAIR_ProcID,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_MIPS64R6 | ASE_MSA,
+        .insn_flags = CPU_MIPS64R6,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -889,7 +889,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_LOONGSON3A | ASE_MSA,
+        .insn_flags = CPU_LOONGSON3A,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-- 
2.26.2


