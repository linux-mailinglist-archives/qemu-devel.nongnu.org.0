Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405E7437AA4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 18:11:41 +0200 (CEST)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdx8u-0005w6-9o
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 12:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mdx4f-00031m-J9
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:07:18 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:33319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mdx4Z-0004lk-6D
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:07:14 -0400
Received: by mail-lf1-x129.google.com with SMTP id j21so10262334lfe.0
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Ul02qr83p0UCQN00dY8EGmXSFR8bKuehRSmvwndXbGs=;
 b=LZ9CJLSOIETbB2nYmaRM4k/Ob5fGdkokpNr64TZr6vU546gxoladtfqhyWFTLjjg9Y
 MW03Sb1AeKliU/4fZ0PcJXyDzLArG8WlS3YgxRdxp5jsbx5lAveN60s5ynasM7ZiM8J1
 UZHYOFBTFj7Nhrr9+tTr7HpIGrJEb/TK3l+dehTOfI/CFaBFK66pcJmmjeogOOkjRzay
 lKEOgGARjTX/r550HtkpV8BmqddgPiy/970np5G7W+qb3W1Y2Q4I1BBYU2tUKPTA8cPm
 Ik2E2zmZn8+UGhKxf3yKR3H7psSP59+VeAOmNttLkTRiJ1RWmFGmOwkYNYIriy2636bF
 GlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Ul02qr83p0UCQN00dY8EGmXSFR8bKuehRSmvwndXbGs=;
 b=Cr17ED2eDBirqyvnQVEFkZG0hooDFoO9sJBUrCM7nnu3hpALFTYAgSsydk9CvJ9NGH
 yNLyIu03p5uHV8nPw0BQRv/Ia23MxEBrtMtsGFCaVoFzAtpxt9jMH7vhNWlPcPx3mAWs
 lKariuXK53ZjQEq+OgIcIEvCtYXVWk79fKAW56xa1aYqW9zEDm4UDLTiOtjba4tmZDXp
 3WDjTmGzEujfIfk1ER6B3UN2VLT76cdK4YuNuo2B66cTbJvnfM0LlilDPjSBqCghxsDz
 PfIdCvKJ8gZKr17/eInUIJY/NudM8FtHaqVYWVNvszjtILPdeZ7N8Io2hECe4NxUsJUA
 j+ug==
X-Gm-Message-State: AOAM533gU0EtR/adSd4XxtwesJ7L34Ksni02aICvPGS1uVQzPLuEORaE
 GU/MmURCkGI97BA8Jl1gA/TIT3V30+TQlg==
X-Google-Smtp-Source: ABdhPJxPEgge5mMpkvIwpKHl4B6k6uhp6Nz9dHBcOP4WOBrnV74cpSuGzBqoTfCC860oLIaP0QYrNA==
X-Received: by 2002:a05:6512:3a92:: with SMTP id
 q18mr563916lfu.198.1634918829491; 
 Fri, 22 Oct 2021 09:07:09 -0700 (PDT)
Received: from pc-System-Product-Name.intra.ispras.ru ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id d19sm769200lfa.271.2021.10.22.09.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 09:07:09 -0700 (PDT)
From: NDNF <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] src/plugins: sorted list
Date: Fri, 22 Oct 2021 19:07:03 +0300
Message-Id: <163491882316.304355.6955215012706902188.stgit@pc-System-Product-Name>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
References: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: arkadiy.ivanov@ispras.ru, alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The list is sorted to make it easier to find missing characters

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
---
 plugins/qemu-plugins.symbols |   52 +++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 4bdb381f48..688db92773 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -1,40 +1,40 @@
 {
-  qemu_plugin_uninstall;
-  qemu_plugin_reset;
-  qemu_plugin_register_vcpu_init_cb;
+  qemu_plugin_get_hwaddr;
+  qemu_plugin_hwaddr_is_io;
+  qemu_plugin_hwaddr_to_raddr;
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
+  qemu_plugin_ram_addr_from_host;
+  qemu_plugin_register_atexit_cb;
+  qemu_plugin_register_flush_cb;
   qemu_plugin_register_vcpu_exit_cb;
   qemu_plugin_register_vcpu_idle_cb;
-  qemu_plugin_register_vcpu_resume_cb;
+  qemu_plugin_register_vcpu_init_cb;
   qemu_plugin_register_vcpu_insn_exec_cb;
   qemu_plugin_register_vcpu_insn_exec_inline;
   qemu_plugin_register_vcpu_mem_cb;
   qemu_plugin_register_vcpu_mem_haddr_cb;
   qemu_plugin_register_vcpu_mem_inline;
-  qemu_plugin_ram_addr_from_host;
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
-  qemu_plugin_hwaddr_to_raddr;
+  qemu_plugin_uninstall;
   qemu_plugin_vcpu_for_each;
-  qemu_plugin_n_vcpus;
-  qemu_plugin_n_max_vcpus;
-  qemu_plugin_outs;
 };


