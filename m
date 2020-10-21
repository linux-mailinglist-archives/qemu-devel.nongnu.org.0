Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952522951CD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 19:52:20 +0200 (CEST)
Received: from localhost ([::1]:38072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVIHb-0002pv-Me
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 13:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kVI3v-0006bM-TG
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 13:38:11 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:35995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kVI3l-0006SQ-5t
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 13:38:11 -0400
Received: by mail-pl1-x644.google.com with SMTP id r10so1577515plx.3
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/PhyfxonOHMia69Uhhz8aFrAtnkrEZKYG1wmZQKttSI=;
 b=DffcFiJpFHZ7sBimYGJ2yffAGd0vidZCppEY70LI7qEQx+jYU04faKrjwLVzsOzMrs
 d2u5tirYAVWxQ9vBR0+8FmMhfrMKmnWoXrb5LbG73RPemtnf5srxVeqcFxPbr9CD8rDs
 rwFL7t1Fnl2uavRLqFGQqHn0GKqf1uc3r/vAAJsNL9X4tn5ya89K1f0emqgA3McPRr+y
 ZX4RcoVEDTKd1I39JC1AhFrEN/joVpZ12nD8g0SuElcKqhPQovqIaXy3+sPQVQlboYd5
 IyWR5adPjuI7FXCZ9HpKg9eyejWJGR3wI+zFc8O7qhWe9LRks2E6wfPQagkn4wD51NWU
 slvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/PhyfxonOHMia69Uhhz8aFrAtnkrEZKYG1wmZQKttSI=;
 b=QA24HYFsHU1e5xCC1wIphTZYByEfSxMr2XmU32yH5qsHHCGO+zLATN8DpHU0+sBx9G
 9EUUSOebqipQ1SU0Ogv2e2vVd84TbD03FMIvFBcZ4Mgt48FkziS6W3iP3dc/fkDnusH2
 fnphM5Q86fowi/21s1o2++FMKzWy1VDEd98Dz8txWyefs5GHiminIZGfvEKYMxAmCA7D
 CZCyIZ2IEiooeZ28wE80zyufWNxoNlh5uQkvisdIQ/dLCjDn/ZUeVd6Jfo1wR77KUI1I
 7wEmtm6R779fpqKBDbymL7MdWmqFWwH0RHmDXJOd0g7xMpWoglsRzgFP7moI30VoLUE7
 ks2g==
X-Gm-Message-State: AOAM532RCafpY6+1qeCiH8acmc7qzlOgp9eAj6BcibfG/FXh1WjwN5Zj
 INDbuPcI8Vfefcc7z9HRreRxcVhxvobwWw==
X-Google-Smtp-Source: ABdhPJz4+sv83j4LWgQCU1Xq1Hxx/SqkW76fIEEg1Bz47sx3TZj6b1pCll+2tdMXoxiQOdW7rzbG3w==
X-Received: by 2002:a17:902:8f90:b029:d5:f329:50b9 with SMTP id
 z16-20020a1709028f90b02900d5f32950b9mr4727688plo.21.1603301878128; 
 Wed, 21 Oct 2020 10:37:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h5sm2928829pfh.9.2020.10.21.10.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 10:37:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 05/12] linux-user/elfload: Fix coding style in
 load_elf_image
Date: Wed, 21 Oct 2020 10:37:42 -0700
Message-Id: <20201021173749.111103-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201021173749.111103-1-richard.henderson@linaro.org>
References: <20201021173749.111103-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixing this now will clarify following patches.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1a3150df7c..290ef70222 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2531,9 +2531,15 @@ static void load_elf_image(const char *image_name, int image_fd,
             abi_ulong vaddr, vaddr_po, vaddr_ps, vaddr_ef, vaddr_em, vaddr_len;
             int elf_prot = 0;
 
-            if (eppnt->p_flags & PF_R) elf_prot =  PROT_READ;
-            if (eppnt->p_flags & PF_W) elf_prot |= PROT_WRITE;
-            if (eppnt->p_flags & PF_X) elf_prot |= PROT_EXEC;
+            if (eppnt->p_flags & PF_R) {
+                elf_prot |= PROT_READ;
+            }
+            if (eppnt->p_flags & PF_W) {
+                elf_prot |= PROT_WRITE;
+            }
+            if (eppnt->p_flags & PF_X) {
+                elf_prot |= PROT_EXEC;
+            }
 
             vaddr = load_bias + eppnt->p_vaddr;
             vaddr_po = TARGET_ELF_PAGEOFFSET(vaddr);
-- 
2.25.1


