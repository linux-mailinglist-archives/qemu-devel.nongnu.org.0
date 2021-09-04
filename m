Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CB0400D97
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:58:10 +0200 (CEST)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfY1-0007yp-Hf
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfW4-0005S1-2t
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:08 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfW2-0007TN-L9
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:07 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so2115961wms.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/LWud8OdJVFwV057VSOD2zPTsJ4r3xLQGTPSjELmcjM=;
 b=buEvoCUTzfIJSaaVc24FrMk37gdaMrvf3aWU/RNXtMsnvv7OSTBkxZbtzJ7a0qKr3K
 /4MEOJc9A6FbIbqSK8iAh1hNqiDfb+T4iXFRYGT+zv7Q3vE+9oNG34mVfWTD5PTj3pae
 5wgbl6o4FF4Ki0bX74YwA5sN2r+UhO9FnOGpCe/2h40Y1Egqg8nlpqDuc1hk/96J83SR
 q7lIB2bu09mpO1+lWw7EgbB53kRmwsho49E9880qndgDOT0xc5JvIrsopuBityE9V0Bf
 7DU25Fm5aqIgfxB2QWYBo13UlwsbtR2ab7p1dd3jptCnLHwxy/y4MZHSz/88WQhA0i7s
 hbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/LWud8OdJVFwV057VSOD2zPTsJ4r3xLQGTPSjELmcjM=;
 b=DqMel7IEMi1fpPGY35QvZB8aHR6nXq/vo1er5dL6e9iQ29SeAl4jb2NCnEqbCOUAn2
 3pwHXX++0LPoH2xEuQQeu6cbxxgj6+TQ3Z1ONaP1ajzOU7k5niWw+NcbcEefATT4yP9x
 MsNetUVTyCWWL29vU56hm+nIQMEStalfKZbddyECr5a10S1Qzb4h8DMCOStFdECLtMuG
 tBlTohxPsP4Bu1hcSz9HvnSVN8AK8J1XFRWEwTC6GiNR5mKeh91z4JRrH3LMo+aPgVIQ
 kvK0A4SaFQ/tn6o4a4GnPpYuhaSQdphQKy5enYt4QOEqCphJbtaagSNXJfb7Yv7WiipH
 7mcw==
X-Gm-Message-State: AOAM532VlgNFdXz/11QVB+sSGaJ/T84wKb3oV+XGhwxk/55+UjDGtKHD
 0rMP7Db9HSli0puy1RswbuTN0O7W0TU=
X-Google-Smtp-Source: ABdhPJw+uDwoP19T2xtaELhXKdMGQ1EQIcrL5LtARjFU7gdYFtu+mE7jmScipuyt9nvkquRoyOZ8bg==
X-Received: by 2002:a05:600c:414f:: with SMTP id
 h15mr4932425wmm.124.1630799765054; 
 Sat, 04 Sep 2021 16:56:05 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id g1sm4379251wrb.27.2021.09.04.16.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:56:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/24] target/xtensa: Restrict do_transaction_failed() to
 sysemu
Date: Sun,  5 Sep 2021 01:55:22 +0200
Message-Id: <20210904235542.1092641-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The do_transaction_failed() is restricted to system emulation since
commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops").

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 2345cb59c79..1e0cb1535ca 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -568,10 +568,12 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          bool probe, uintptr_t retaddr);
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
+#endif /* !CONFIG_USER_ONLY */
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
-- 
2.31.1


