Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF03FFCCC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:13:03 +0200 (CEST)
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Fu-0003r6-Dl
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM579-00069R-Lv
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:59 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM573-0005cG-6h
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id t15so7186480wrg.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CcEiZFSnEtjqSiIOeERnRYXveIeTcuQ3wV2faAUN+dY=;
 b=EqCBDTQWjcK00BGL83rihXO0Nni0WZELsJwDPtAjeKZhOTBRZP+kKSkcR2oT7RhMx6
 0zHVgXi60bjdX8ZerShh6uYb9S7bj42MfLUN/eBU0mI+yvjOcfb0LyV9fSGTF4yF+7+d
 3LP+5lnC5JVesrUz3W9lwYPf/m7/bIrj165Up4+O2ZsJ/AXO7pDaB9lAVjXOZdJDMJSD
 9/ntE/ov4fkNZIbIhD0EqAb3ifbui24qXwOGg7z0xy2/qTMb3Zv5Z1MzgE+m7xzfIYvn
 Bm1vZrMPMu3HGByrOTix8vdFjhljJmF4R2mxk/g/un1c4HYXglyLKRnK/m/5Ebfiz5ng
 hFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CcEiZFSnEtjqSiIOeERnRYXveIeTcuQ3wV2faAUN+dY=;
 b=DAHlA7CJB75v5uZW+RKkFsuUnEFqaH9lJ3YxWdYdqn9LhDW02r4hI+9OtkXw1pjd89
 RT6KDBwMBqzjhXs18VQnXaHp135fJY/m8pf41o9Azg2bRu6Vzhi+4ZUDg0kiHS8IcxKT
 KPzQHCeNaIHJ7E40GhmFeltJ3kdwPMN/ZOf8JqWc7UDBWsRqRUTwh9sF1nvDWr7tb+x5
 5KE55uRlMCKYLaAN6G3s9z+m1iN04q/lRjrP2uCVDWQ9zH1q5PspiUdtjEdmHJhdVdZ2
 hdZRPnYe8eNvnGGLAWcQvz6CVzXl225KJmpHp095tMlDPaa7Nf9CHoJsjvYjp4/LUPmG
 VqqQ==
X-Gm-Message-State: AOAM5312ed1+pxUXyHXc+x26n6b/+35BuAaZOcjLXFPcolAPtICWBqct
 lf6m3nIpvVfBibMFqJF7rKwrJg==
X-Google-Smtp-Source: ABdhPJxmvwCeUcXa7QwTEJoTQbf40sh0vBeDXcq81sWHlSNh89ht+8MD04SspEiWx7KHZXrkccGMBQ==
X-Received: by 2002:adf:d1b3:: with SMTP id w19mr2810735wrc.152.1630659831791; 
 Fri, 03 Sep 2021 02:03:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r20sm4335349wrr.47.2021.09.03.02.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F7941FF9E;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/22] plugins: sort exported symbol list
Date: Fri,  3 Sep 2021 10:03:24 +0100
Message-Id: <20210903090339.1074887-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make it easier to add new exported functions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 40b4ff3821..dee7610387 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -1,37 +1,37 @@
 {
-  qemu_plugin_uninstall;
-  qemu_plugin_reset;
-  qemu_plugin_register_vcpu_init_cb;
+  qemu_plugin_get_hwaddr;
+  qemu_plugin_hwaddr_is_io;
+  qemu_plugin_insn_data;
+  qemu_plugin_insn_disas;
+  qemu_plugin_insn_haddr;
+  qemu_plugin_insn_size;
+  qemu_plugin_insn_vaddr;
+  qemu_plugin_mem_is_big_endian;
+  qemu_plugin_mem_is_sign_extended;
+  qemu_plugin_mem_is_store;
+  qemu_plugin_mem_size_shift;
+  qemu_plugin_n_max_vcpus;
+  qemu_plugin_n_vcpus;
+  qemu_plugin_outs;
+  qemu_plugin_register_atexit_cb;
+  qemu_plugin_register_flush_cb;
   qemu_plugin_register_vcpu_exit_cb;
   qemu_plugin_register_vcpu_idle_cb;
-  qemu_plugin_register_vcpu_resume_cb;
+  qemu_plugin_register_vcpu_init_cb;
   qemu_plugin_register_vcpu_insn_exec_cb;
   qemu_plugin_register_vcpu_insn_exec_inline;
   qemu_plugin_register_vcpu_mem_cb;
   qemu_plugin_register_vcpu_mem_inline;
-  qemu_plugin_register_vcpu_tb_trans_cb;
-  qemu_plugin_register_vcpu_tb_exec_cb;
-  qemu_plugin_register_vcpu_tb_exec_inline;
-  qemu_plugin_register_flush_cb;
+  qemu_plugin_register_vcpu_resume_cb;
   qemu_plugin_register_vcpu_syscall_cb;
   qemu_plugin_register_vcpu_syscall_ret_cb;
-  qemu_plugin_register_atexit_cb;
-  qemu_plugin_tb_n_insns;
+  qemu_plugin_register_vcpu_tb_exec_cb;
+  qemu_plugin_register_vcpu_tb_exec_inline;
+  qemu_plugin_register_vcpu_tb_trans_cb;
+  qemu_plugin_reset;
   qemu_plugin_tb_get_insn;
+  qemu_plugin_tb_n_insns;
   qemu_plugin_tb_vaddr;
-  qemu_plugin_insn_data;
-  qemu_plugin_insn_size;
-  qemu_plugin_insn_vaddr;
-  qemu_plugin_insn_haddr;
-  qemu_plugin_insn_disas;
-  qemu_plugin_mem_size_shift;
-  qemu_plugin_mem_is_sign_extended;
-  qemu_plugin_mem_is_big_endian;
-  qemu_plugin_mem_is_store;
-  qemu_plugin_get_hwaddr;
-  qemu_plugin_hwaddr_is_io;
+  qemu_plugin_uninstall;
   qemu_plugin_vcpu_for_each;
-  qemu_plugin_n_vcpus;
-  qemu_plugin_n_max_vcpus;
-  qemu_plugin_outs;
 };
-- 
2.30.2


