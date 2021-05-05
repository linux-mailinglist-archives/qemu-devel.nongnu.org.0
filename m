Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7193B37377A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:27:23 +0200 (CEST)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDoQ-0002xs-H0
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkQ-0000ru-S7
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:15 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkJ-00058T-Mc
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:12 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l24-20020a7bc4580000b029014ac3b80020so2991083wmi.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQ8679cFYPFRKCt5xKP0d5J4rP4I/8eL7P8Ydf6Ygrc=;
 b=wIOIhpeRlnuvzo+stWllXWq7BKZFMNPUGyIigHtKCeVdRzFCvdjkuHJGZtsInNHJ9d
 CdfcbyVBYL5gbvUq+IkyNPFpGA6nY0fVgszNGrnz1Bg5gi8yP32tjpk/Zg48giCmeMqW
 SODq5wpoxHmJsxEl2v8FthPvTxq6o2YxfYAm5ARVZMCZXIWPuSLJ2mNxSlwG2BKNY3w8
 HRTE1C7L61jmSssy2dc2oQyAvbLIqmOuuakb4d+QpfAnfdnYXtNueaXQRY1jZsV47Xb1
 BCLFpl8hJa22MtvcAGOdPmKgE/U4hPro8XRvSTMEf98iANGZovyuN+hP0WoBItOmFn17
 /N2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQ8679cFYPFRKCt5xKP0d5J4rP4I/8eL7P8Ydf6Ygrc=;
 b=OaleXpDnvI6RKNRr30gQqMz1OJL8f0Q5KjOgSaUZSC+mEVoVEm95b0e297CHNojWbI
 kGQNfcQxUiryfMbqewgc/mWJkkOlrMoLoCQXRfKo6gL1JkMqwdekLfGLJoUYhsBnTLrb
 n345o1Ex3E/lPqx21TI0JhtfNhnX4eai0qQWE8VeBzCm9ODtQ2/3YVumiOYLL78xZJA7
 dIAFpuGR98Ox2vNnFPRaGDtWWe0BfuGvoQdtSMWrDkLHGi/ixBnh97TJp+CZDoRWwqYR
 BnQixcWstzN+FZV4dNeOjrLF36RPhQGFV2YELe2hccf1XrtIY6oOpsSTKVLMdO2HEGyo
 6G8g==
X-Gm-Message-State: AOAM532qrtu1OEZdjuHi+LuNG904Vq/NvpiRsM0Y0LBGv3oYgzurGpRK
 vxXe9OKq+8idjvOAWZYR05G6tw==
X-Google-Smtp-Source: ABdhPJzV78qEZBe0CVJsVPNpV/S197CDRHFjY2HO83fl4/+PooANSgZY89DGjh16BmeWL50/R0F2Zw==
X-Received: by 2002:a1c:731a:: with SMTP id d26mr9070351wmb.36.1620206585443; 
 Wed, 05 May 2021 02:23:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c15sm19212753wrr.3.2021.05.05.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:23:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DBDA71FF87;
 Wed,  5 May 2021 10:22:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/7] plugins: Update qemu-plugins.symbols to match
 qemu-plugins.h
Date: Wed,  5 May 2021 10:22:53 +0100
Message-Id: <20210505092259.8202-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505092259.8202-1-alex.bennee@linaro.org>
References: <20210505092259.8202-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, minyihh@uci.edu,
 robhenry@microsoft.com, vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 mohamad.gebai@gmail.com, kuhn.chenqun@huawei.com,
 matheus.ferst@eldorado.org.br, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Reorder the function symbols that consistence with qemu-plugins.h

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210318185555.434-2-luoyonggang@gmail.com>
---
 plugins/qemu-plugins.symbols | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 4bdb381f48..a0ac1df62a 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -5,35 +5,34 @@
   qemu_plugin_register_vcpu_exit_cb;
   qemu_plugin_register_vcpu_idle_cb;
   qemu_plugin_register_vcpu_resume_cb;
-  qemu_plugin_register_vcpu_insn_exec_cb;
-  qemu_plugin_register_vcpu_insn_exec_inline;
-  qemu_plugin_register_vcpu_mem_cb;
-  qemu_plugin_register_vcpu_mem_haddr_cb;
-  qemu_plugin_register_vcpu_mem_inline;
-  qemu_plugin_ram_addr_from_host;
   qemu_plugin_register_vcpu_tb_trans_cb;
   qemu_plugin_register_vcpu_tb_exec_cb;
   qemu_plugin_register_vcpu_tb_exec_inline;
-  qemu_plugin_register_flush_cb;
-  qemu_plugin_register_vcpu_syscall_cb;
-  qemu_plugin_register_vcpu_syscall_ret_cb;
-  qemu_plugin_register_atexit_cb;
+  qemu_plugin_register_vcpu_insn_exec_cb;
+  qemu_plugin_register_vcpu_insn_exec_inline;
   qemu_plugin_tb_n_insns;
-  qemu_plugin_tb_get_insn;
   qemu_plugin_tb_vaddr;
+  qemu_plugin_tb_get_insn;
   qemu_plugin_insn_data;
   qemu_plugin_insn_size;
   qemu_plugin_insn_vaddr;
   qemu_plugin_insn_haddr;
-  qemu_plugin_insn_disas;
   qemu_plugin_mem_size_shift;
   qemu_plugin_mem_is_sign_extended;
   qemu_plugin_mem_is_big_endian;
   qemu_plugin_mem_is_store;
   qemu_plugin_get_hwaddr;
   qemu_plugin_hwaddr_is_io;
-  qemu_plugin_hwaddr_to_raddr;
+  qemu_plugin_hwaddr_phys_addr;
+  qemu_plugin_hwaddr_device_name;
+  qemu_plugin_register_vcpu_mem_cb;
+  qemu_plugin_register_vcpu_mem_inline;
+  qemu_plugin_register_vcpu_syscall_cb;
+  qemu_plugin_register_vcpu_syscall_ret_cb;
+  qemu_plugin_insn_disas;
   qemu_plugin_vcpu_for_each;
+  qemu_plugin_register_flush_cb;
+  qemu_plugin_register_atexit_cb;
   qemu_plugin_n_vcpus;
   qemu_plugin_n_max_vcpus;
   qemu_plugin_outs;
-- 
2.20.1


