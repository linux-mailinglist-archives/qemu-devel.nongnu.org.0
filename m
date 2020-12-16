Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D013E2DC455
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:33:22 +0100 (CET)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZjs-0008IO-Hl
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZed-0004DT-9B
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:27:55 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZeb-0007gj-RG
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:27:55 -0500
Received: by mail-wr1-x431.google.com with SMTP id t16so23779751wra.3
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HcaUQ8phc2eKx2cjJd7LMacBbnIUqnvu0WK0GQKhyVw=;
 b=QM0ESpSaMMD2+/y1v+DiHhGiV8MlnIV2ypDtt0muy8grZVZLgcubMO0aABaEvhVNvI
 /WBgVWbz3/s0kTFdUNfQd3I35f3MdAgd9ISJSTBLj0BEhFILQyK8qCJkczhEaBd7JbVZ
 fD9n9w4jjiguMOm8EQPH7EoeENbEfL4sZQrwextk4R0lqeRosqynaaw3pOKg8PaexssY
 su67SEGpT8sjjosFwMvDHbtE6qYig1h4j9ut7zjfqyYz+XYZM9r33f6eOex3mIo+Mmdk
 XUgyyzzJpaJkZXSVINrWQL1+Mqz26TiZ44n3Eu6c5tzdflUv8gcpIUL7rINI4AchC1Dh
 7KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HcaUQ8phc2eKx2cjJd7LMacBbnIUqnvu0WK0GQKhyVw=;
 b=UlBM7tKKgUBFU2b4GSIAimuSi9jbq890/fuTCWiaKP/4/+vpmZKGFOE4BNVVpD0v6p
 fenrwYkB+qHVcgzEb9IzupX9fq1fA487aBDdHxcCbdPeVRkFYLI3VNAM7VEZ0+WKSYfe
 eLqS+lnZumGevEmbhD2RVXIuQylUEThxrMPLPxxMj/hfobeboaHZ3HUOlv4XMpdYZrII
 9GPKEb/vcufWAuSIPmTX/1iExZmtD/e2O9eAwEx88GgYiqQPEHTBSHwQF3mk0WYmBoWe
 AALHQekttRaeiwnP5fjBSX2VAdw/dDFdDzo2YsTCqNjeFP6Yl6Ji6sci6D67AJ+ljY65
 TI5g==
X-Gm-Message-State: AOAM53258lPecDB3CHamiwXgkjq5LHb9nXh8UGVjuWZUgsq5cCJFP1Bc
 cKL/JDqHAf3KQ6UsTosDpgfCzUVwwo4=
X-Google-Smtp-Source: ABdhPJxcmtTfX7jazCEkaTj4uOayLWFDTPIoWclJNjM+Nr5qWOKGST/mQZ+dU2kuIBr1+xVycolbqA==
X-Received: by 2002:adf:fb52:: with SMTP id c18mr16481792wrs.186.1608136072175; 
 Wed, 16 Dec 2020 08:27:52 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s25sm4023579wrs.49.2020.12.16.08.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:27:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] target/mips/mips-defs: Reorder CPU_MIPS5 definition
Date: Wed, 16 Dec 2020 17:27:33 +0100
Message-Id: <20201216162744.895920-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216162744.895920-1-f4bug@amsat.org>
References: <20201216162744.895920-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move CPU_MIPS5 after CPU_MIPS4 :)

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 805034b8956..f4d76e562d1 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -70,13 +70,12 @@
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


