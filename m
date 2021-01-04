Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C404D2E9FE2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:18:04 +0100 (CET)
Received: from localhost ([::1]:58696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwYAt-00035b-PZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5D-0006NS-CV
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:11 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5C-0007nD-0g
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:11 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m5so33592953wrx.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1xSZWIVn+fZ9mZfvZyHB6Qw66SpG//htqcx68delhkw=;
 b=GROh1aZtRvffQCAgbfubLpHMJUjqJ4/eab8wE/js2x3/hhhQ6CKN4r+8Wu1cj8sW9h
 fuGjEFDq0OzM224vobuVADHRYeYTE82tp8kQTe56wddY7b0tLwJlmNForoParHk03oF3
 zmjh9rR6tbrLsSya1LCiWHy63PCY8DWMmurRQL21mo7xWiic86uCQ8zqZVHxtFNbMUnd
 Ga6kZUjpaLgZl0bNlj7rD3aNiYqTorNuEAsjVuDg2SK+WNl6fnpuCv1xC+6HOtjG0SrC
 a1irVpI2pDfOvdgp+81xL1N1aoNaOeeZj4YMsGtM+5ONZdEtPsuAzt3GS1Vs/0/g303S
 0cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1xSZWIVn+fZ9mZfvZyHB6Qw66SpG//htqcx68delhkw=;
 b=LBmInPLiyC9aXW/aQ+fTg0HPBr3ymrtawwvb4Ty9Y0h/3WQ0IeqOYgGtZkh9tjHdmH
 4ArE6vq/GRvzEZzNR3CMjHWpFA5nNgToZCdarawoavlLDQs7JP8uRoMMlB/9mxp7NikH
 xH+r90IhQac5iegKzUsjJ0kgqRjS4gZty+zEIYON/WFAV/dpx0WGZW3tZK7t4NgzBeKi
 KlH2jOf4AaDWyLcehzqOY/oX3BsfsMoMWcCZCXiuWv70Y7RnQWceyRIq1g3mUy0volCX
 re9aJft63yJA8wN/4Kti4eMlNNYNXeCvvr5jukNJffP1D09r9dbwAbnCpV7bGJRdInzN
 medA==
X-Gm-Message-State: AOAM531kbwLDeT2SXEuXHCcZ+WdCCxqEKhvBLBjmLDSnkGp68WfoNayd
 y/pdZHFNFY8hKchHxoxmNyqOr2lYgag=
X-Google-Smtp-Source: ABdhPJwugpLFpTrOd/MIMlxZ+LbvUp/F9kYOvaXpTYCCj9W5N/Cdgd+GwJd9q9oI5hpC/aRb+gWUhA==
X-Received: by 2002:adf:b343:: with SMTP id k3mr80617323wrd.202.1609798328315; 
 Mon, 04 Jan 2021 14:12:08 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s6sm102192699wro.79.2021.01.04.14.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:12:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/15] target/mips/mips-defs: Reorder CPU_MIPS5 definition
Date: Mon,  4 Jan 2021 23:11:41 +0100
Message-Id: <20210104221154.3127610-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move CPU_MIPS5 after CPU_MIPS4 :)

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 555e165fb01..48544ba73b4 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -65,13 +65,12 @@
 #define CPU_MIPS2       (CPU_MIPS1 | ISA_MIPS2)
 #define CPU_MIPS3       (CPU_MIPS2 | ISA_MIPS3)
 #define CPU_MIPS4       (CPU_MIPS3 | ISA_MIPS4)
+#define CPU_MIPS5       (CPU_MIPS4 | ISA_MIPS5)
 #define CPU_VR54XX      (CPU_MIPS4 | INSN_VR54XX)
 #define CPU_R5900       (CPU_MIPS3 | INSN_R5900)
 #define CPU_LOONGSON2E  (CPU_MIPS3 | INSN_LOONGSON2E)
 #define CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F | ASE_LMMI)
 
-#define CPU_MIPS5       (CPU_MIPS4 | ISA_MIPS5)
-
 /* MIPS Technologies "Release 1" */
 #define CPU_MIPS32      (CPU_MIPS2 | ISA_MIPS32)
 #define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)
-- 
2.26.2


