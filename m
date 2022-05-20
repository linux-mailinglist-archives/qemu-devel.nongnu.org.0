Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F12E52F210
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:08:24 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns731-0004zY-GK
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wf-00041O-Hh; Fri, 20 May 2022 14:01:49 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wc-0004Fd-E4; Fri, 20 May 2022 14:01:48 -0400
Received: by mail-ej1-x62b.google.com with SMTP id m20so16968911ejj.10;
 Fri, 20 May 2022 11:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DBvS+pFO863lsAYFzkOqAuhOuaOf26uAgucILAzfDNA=;
 b=ku0NzfoMSPHBIXgJV4k4tW+lmZAK47zJXjXOuPdUn0lQ55zxtREkpP/Ps3RCLoCrWT
 ZH8KAs1kIgEKfQc2n90ClrSm8uPaSNg4yGRc7j0vJxD65pPpmRZ9NTKVie85YjkcaaR4
 c41/+fupoBD1uOXmBPsrToZz04hViZMyGJLzwza0ipfCOESYaL9O8pKbE4ySysuSTQs9
 BggGKqLXyVq7uh/vLvy6eaHV4vfon09IynHeI32k0s9aK+COLBmCJ93IjSZ6+UB50DYt
 5Yd7OUtCYTgWJeiG1UryMMzbd7a/w0CYKIh88D9HGJLjlViX9B6ZD9I11BKLQma2KLxV
 aI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DBvS+pFO863lsAYFzkOqAuhOuaOf26uAgucILAzfDNA=;
 b=Ymmp5/qbgG6B4dAC10YXRioHxteZDk/VaMKYca4seZW5woPh/wHa1HYGJoBrFlpuEq
 epHoNOgbTRI+wk7PrYGLyhheYW7mJyBQ74poZGQRiRSSU9iaX7hTzMjPzfM0UxlTpSCM
 bx8mlTlsUgo6DKU5i1VDFfL+6j9BI/UW61elECmkiM+VYPBo/9YxbtpSTbvuDevjX/hO
 JOzecYQPuE6WuCbCqHxQF5xfcAY4PARYNTkDe4OixhQCJZKEmZc7L1IzlzgOwpYNue+s
 ey9HlZv5faNGg6CJ8AltcSDHasdwayPOOFukFAEnNDFcaGYE7c0HQqjX+PLBd0T2Umnd
 zksA==
X-Gm-Message-State: AOAM530LMkaB8cyD1fHHYIQi/HCh1qKvzR8uwL5OAgrFonZEA2O5SVL4
 xLOCohabIOm1QmdPx5DlJYc+PTsXRnM=
X-Google-Smtp-Source: ABdhPJweJv0UWDL1Lk+iwZvv5wTTV32BOSYaVDMJKDjQdAjkP0z4DAjpM6K4f59JyVx2V7k04VAYuQ==
X-Received: by 2002:a17:907:d9e:b0:6f4:2983:c371 with SMTP id
 go30-20020a1709070d9e00b006f42983c371mr9960076ejc.558.1653069705205; 
 Fri, 20 May 2022 11:01:45 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:44 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 09/10] accel/tcg: Inline dump_opcount_info() and remove it
Date: Fri, 20 May 2022 20:01:08 +0200
Message-Id: <20220520180109.8224-10-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dump_opcount_info() is a one-line wrapper around tcg_dump_op_count()
which is also exported. So use the latter directly.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 accel/tcg/cpu-exec.c      | 2 +-
 accel/tcg/translate-all.c | 5 -----
 include/exec/cpu-all.h    | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7cbf9996b7..a565a3f8ec 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1091,7 +1091,7 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
         return NULL;
     }
 
-    dump_opcount_info(buf);
+    tcg_dump_op_count(buf);
 
     return human_readable_text_from_str(buf);
 }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 291034cb09..8fd23a9d05 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2124,11 +2124,6 @@ void dump_exec_info(GString *buf)
     tcg_dump_info(buf);
 }
 
-void dump_opcount_info(GString *buf)
-{
-    tcg_dump_op_count(buf);
-}
-
 #else /* CONFIG_USER_ONLY */
 
 void cpu_interrupt(CPUState *cpu, int mask)
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 9a716be80d..f5bda2c3ca 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -421,7 +421,6 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 #ifdef CONFIG_TCG
 /* accel/tcg/translate-all.c */
 void dump_exec_info(GString *buf);
-void dump_opcount_info(GString *buf);
 #endif /* CONFIG_TCG */
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.36.1


