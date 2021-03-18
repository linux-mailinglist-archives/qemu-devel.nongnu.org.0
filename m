Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8171B340DA8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:59:52 +0100 (CET)
Received: from localhost ([::1]:34036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxs7-0001zN-Jj
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMxod-0007vf-79
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:56:15 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMxob-0002JN-Jp
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:56:14 -0400
Received: by mail-pf1-x431.google.com with SMTP id h3so4127491pfr.12
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xxZZ8Z9SsIU7VdGO3iSsl2kVjHmPi2TcIztXzkMIbLU=;
 b=iwixL6YfM6x9qIUPFiEhmCLf8YNVxILrl5NuohlDaNT6raYb0tM38wFobN/7lf8bRM
 hMsPJkXMnwccUUg8/slJuXkCpusCPlbq91vhn9MAzRSyu2PCsXkvquW8wghxINxhmJ8b
 1rRbxM/JLFA6MhAQfVH0/YsojRMZ5Q5vfhWcr04JKCiOmLCf94r0GM9v2efYKWP8u9lW
 LDdxzkp2G1kpmRNZpeP9zlQWOFf2u68sLhB0nXFs2Hg0uiKlhOdhBJLf73/Cym2TN3tD
 IBrY+7hmhIVb9yfkM57WkKj09GsH8+gegAUv9j4AIFl/jge5KdHueGDihib0jCJQ7hAP
 t2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xxZZ8Z9SsIU7VdGO3iSsl2kVjHmPi2TcIztXzkMIbLU=;
 b=UP+l6YmDVRBC8QFePYfmmsZIdbGhU/8AS4AndhbL6B53aOBU9jVQCf0MoISGAy6qjH
 aB5xM5xz5EGfQ0YVFWsVZuYsA3CLZpV+EUV2bDutgmsCvj+C/wVroJlpROibx0Vbi8+W
 /BdNL1HqAJ2mproWGCZcvKwt2nnSG4tQ3sCHpe7tqsvBLWqB8xzoBEsltNBjLp2k+7vV
 B924ln/iWZPNUk8WJ2n5PyzFdDIi8jqVT31DALIudWsYVmU+y1dlYa+T+efFMFFvni6O
 Jq8GbWTPo8Py7gTtCyw6Vz6qd8UU8v6aCoQcVPdpWO5vYdhgF98NVBmMhcdneYdq8mzG
 N6Uw==
X-Gm-Message-State: AOAM533KAj6KtdJk644mnPqvLvRFaagpdRDyaF88jjjG7aDJfN9/w1m9
 j9fKQdZm2BRrwobb3JK7wGk+28qAsQFCIw==
X-Google-Smtp-Source: ABdhPJxMQJN1n+wkIExFl+7QEqq8KEvtvvb4gejpFsQ60dmypai/svH37RA6EXzlu5ebuXfDzvsDLg==
X-Received: by 2002:a63:3193:: with SMTP id x141mr8100207pgx.329.1616093770593; 
 Thu, 18 Mar 2021 11:56:10 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id q66sm3274784pja.27.2021.03.18.11.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 11:56:10 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] plugins: Update qemu-plugins.symbols to match
 qemu-plugins.h
Date: Thu, 18 Mar 2021 18:55:54 +0000
Message-Id: <20210318185555.434-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210318185555.434-1-luoyonggang@gmail.com>
References: <20210318185555.434-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reorder the function symbols that consistence with qemu-plugins.h

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
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
2.29.2.windows.3


