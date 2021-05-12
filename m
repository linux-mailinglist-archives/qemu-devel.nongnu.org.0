Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B551A37CEFE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:26:49 +0200 (CEST)
Received: from localhost ([::1]:43300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsdE-00035H-PP
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUV-00078Z-LU
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:50 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:33612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUK-0008Kd-7J
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:46 -0400
Received: by mail-il1-x12f.google.com with SMTP id z1so12940234ils.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WmsTH6YeQ6QLzMbKIKIH647DYkY/XXINReCjYAIywDM=;
 b=jU3N8HXLumCmcQJcucuEP6FEeIvJRgqxz6Ls1NAEPChtmnegIxgkEdZM4d714oUGiG
 Ee0h5ni5rInlum90ZNBhJZcYww9KW3ikxpwzF6cpDRPMEO/t4GeaHGr5x/erU0BgV50z
 8BjIVQaxTnx0azPiZXkkCWNGH2r2uDmrEWfDVWPFo3iqWmePsuqkq7wkYmpDltfXYtXY
 FzfonS+ig7GNN0tm2VZouLGdXBfcbYnsHDfq1+KvBCtyVyLox2AoLULhYDCESnTSzuNw
 Wv065Wp+dw4wrYNiWZEyd9d0ROfgNKnM86u5txw6Pg3Q8Ls6P1cM2oOzAqwJ+HuGryGB
 GkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WmsTH6YeQ6QLzMbKIKIH647DYkY/XXINReCjYAIywDM=;
 b=Dh9oSiPGYSBiFvIhiiGHAiLYmWKpGvI183nHbiuT6QTsrudEAQjB1zsWmCuvgP/NqA
 6rPCfIPYTM3eJeObU9pdcoOn4qx7hZTjbVaP+8X+i+S0oWraJ4jXCOIyxM54Nv1NkuKo
 5iA2E5xagBimd0SHnXAMu4hACQJn88jQ3bvVgCVD53930oZlpuwTtSlshWLQDN7ef3gs
 4TovTuF8jyO1eau76/3aNuYfK43W6h8u0ahtJKBoJmLWf9i8GID7SUORTHwP7IMwhH0B
 3wSflT65WDx1+QcQ/2V+nRjOupdShF7ppQq1vJudB5ZJWbMqN58V0MgTbQ3A2JtJlLpn
 OJmQ==
X-Gm-Message-State: AOAM531EXXfCPS7DzLQGPMcvLsqNzUS2TcdGFS+OkB9z+LZc6EYST+we
 Eg//62dmk1hgXHMjzF+Mj8Asah1nf++REA==
X-Google-Smtp-Source: ABdhPJwWcJwMg/AgiQHUyGybyBsSBVX/TLf3zzBVlriVeQlzYuoju9phDJG2Xbu+oGQ/TWHCytTFvA==
X-Received: by 2002:a05:6e02:1a4b:: with SMTP id
 u11mr31905409ilv.258.1620839854501; 
 Wed, 12 May 2021 10:17:34 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:34 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] bsd-user: style tweak: remove spacing after '*' and add
 after }
Date: Wed, 12 May 2021 11:17:07 -0600
Message-Id: <20210512171720.46744-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 5a82722281..de20e8329a 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -124,19 +124,19 @@ struct linux_binprm {
         int argc, envc;
         char **argv;
         char **envp;
-        char * filename;        /* Name of binary */
+        char *filename;         /* Name of binary */
 };
 
 void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
 abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
                               abi_ulong stringp, int push_ptr);
-int loader_exec(const char * filename, char ** argv, char ** envp,
-             struct target_pt_regs * regs, struct image_info *infop);
+int loader_exec(const char *filename, char **argv, char **envp,
+             struct target_pt_regs *regs, struct image_info *infop);
 
-int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
-                    struct image_info * info);
-int load_flt_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
-                    struct image_info * info);
+int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
+                    struct image_info *info);
+int load_flt_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
+                    struct image_info *info);
 
 abi_long memcpy_to_target(abi_ulong dest, const void *src,
                           unsigned long len);
@@ -246,7 +246,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
         break;\
     default:\
         abort();\
-    }\
+    } \
     0;\
 })
 
@@ -270,7 +270,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
         /* avoid warning */\
         x = 0;\
         abort();\
-    }\
+    } \
     0;\
 })
 
-- 
2.22.1


