Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35B33F926
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:29:52 +0100 (CET)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbrb-0005fU-8O
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMbZv-00062L-Bl
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:11:35 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMbZt-00084j-JH
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:11:35 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 mz6-20020a17090b3786b02900c16cb41d63so1869080pjb.2
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 12:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xxZZ8Z9SsIU7VdGO3iSsl2kVjHmPi2TcIztXzkMIbLU=;
 b=Ubw8Vq/h34OL0PXXhZ7+w5lZ8SUTxXp8w12c6frtAnJ7MO4+8+NTI4p2HN0xQ9xiOm
 /0FhhN6CI7JF+gOXXjKDM5iNc4F1B3wwg0AzJG0ZWAij0zRuVhW/yByjq041AbCLdCW/
 e9x3B7SKOIEvqJ8F56xFX+kXcCkIS83/9nNzMDXwTaH71B0csYDgC3xIAPePMFuxFJGL
 7/iLwD0Gq87Dbu2WyTVU7JDNK8ivL5Fn8NLl2+4TOaQk1hajjJSSWbZafBn5Ph0pYm2X
 xt6t2MLNg+6XcwaKiCuJ2JK/OxJeOb6vImZtNG7Ew638PNq9dm1Rf/cIq7TUdjRbaEH8
 wCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xxZZ8Z9SsIU7VdGO3iSsl2kVjHmPi2TcIztXzkMIbLU=;
 b=dUig1XZa07OM/pUomIUKBSZ/+qljNBnj0DGBENpA9TRfuza8WxZYH2bK5z0C56URhx
 3MWKc7PJstS9I+aoAEnqYMMqRNWwklXDxhug8ON76ExV0mYoKv9a0cDpMMwvVdVRtFF3
 h6PduVmPmM/eqwNmusL6lXli1COATA6ZNP9fMGsmcJEpoK3lyZ8GbMSV14swt0PaqYf7
 P53c2S149Zw3HHQdHJGZbkTwDqmrdZ45oogMwfGtI08i47oBD+7UThc2KLockhvSChIc
 3q5mnWldrZoMCjYqsCYcRuGg1JcGlvKGOYMgpdTB/qE58N17djHmjEtB8cIj+zfuBSQU
 ly4w==
X-Gm-Message-State: AOAM532fSfuGPFSr+8S4hoVgG1n/Gqf+Ux4bwtFTNwwBIwzwJBq3xP6g
 Hb7Nzm8/m8mFkR1mvhbGldnjaELgpofUlw==
X-Google-Smtp-Source: ABdhPJwV4CRLdDR8skXq6AD2w2ifLgrPlesHfYbv8O57wckwqBS07Imrirw5byXDltTe+oTRjjpokA==
X-Received: by 2002:a17:902:d4cc:b029:e4:9cd9:f189 with SMTP id
 o12-20020a170902d4ccb02900e49cd9f189mr6014754plg.53.1616008290581; 
 Wed, 17 Mar 2021 12:11:30 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id i20sm19077870pgg.65.2021.03.17.12.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 12:11:30 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] plugins: Update qemu-plugins.symbols to match
 qemu-plugins.h
Date: Wed, 17 Mar 2021 19:11:14 +0000
Message-Id: <20210317191115.1445-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210317191115.1445-1-luoyonggang@gmail.com>
References: <20210317191115.1445-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1036.google.com
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


