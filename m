Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478FA3839D6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:29:29 +0200 (CEST)
Received: from localhost ([::1]:52862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig7U-0008Lv-Cr
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyp-0001mt-SV
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:32 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifye-0002AQ-Ts
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id q5so7054414wrs.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=laBTRAnhUqYkkWxlzGzSELGQ267uzqchU3TV+3waw3g=;
 b=Kt7lxjfhIBrfiH3KTPAODzXItNhwVOQwVfMCnoGv76PcVzxAQJWzCctWAq02rghu+f
 R2bSvco/nzvIcDkRV3t0Z1KrYmJZ++aCs6U9+ajZpsqW86oWLMu88SE0g0D5sdyfuVnb
 3nQXWkx5E+PLJn3c4FX/4u2OD5hNFf15E3EVV3JH3LL2PV1djTTeCW7L0MEKNLlc7h/t
 nYgpLBxqIQbvub4SQfzVmAVBTZtuZIHKAQw+O2IjH4xY5Mky624pzE6PpIWhB8W67V4C
 oguo0YRdr0T4iOaUsz35IGHVoSiB/PJ6yjteRdtHnIlMPMX3QNNdLuOfxIzlRJ2tdM8V
 HRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=laBTRAnhUqYkkWxlzGzSELGQ267uzqchU3TV+3waw3g=;
 b=aFWGNxmeQgrIQRqtnm+c0Szx8MgpyyBkm8PPPta0TxFAsquMVFrktieAWe4+94G/W2
 nPpIKtFqgIRA2MU4mbfffpoC/Umrm1pfRwjzoAk9S/ay9N0suyfjMmx3OVON5HwXP+HU
 /ksOFgPdm9yjsKSJAJiutXPVoreGIh7iR9z9j44nnqXTQy2tJS56DB70MRNMmvk4m/f+
 oUi3t+asvagHNrwlhv4zOSSStlMGcOnsaz6HoSDy4lhxsPtcrhAoIUbmjFhckko2on9Z
 3Z6jQzlOJgnongFekKzT89D//D2+HNiRNJaQ8E+/3RWfVC41Dv6MXJJmIwGhMe7+M065
 AuBA==
X-Gm-Message-State: AOAM530J9p3nU/Bvl/bmZsxMKfIw32veqlyC9EbMsIzleLYOWR3UjS57
 OahwkXgo+HXZyLFD6LAgnIO6Cg==
X-Google-Smtp-Source: ABdhPJyI2PhjgaqdPWhlONptt2ojiklYxgWkSRpbS6ARFa5WMbXy8zMD0UMz1F16EXsfITJqIEE5vg==
X-Received: by 2002:adf:e991:: with SMTP id h17mr538534wrm.265.1621268419094; 
 Mon, 17 May 2021 09:20:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s18sm7551429wra.80.2021.05.17.09.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A47221FFAF;
 Mon, 17 May 2021 17:10:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 26/29] plugins: Update qemu-plugins.symbols to match
 qemu-plugins.h
Date: Mon, 17 May 2021 17:10:19 +0100
Message-Id: <20210517161022.13984-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Reorder the function symbols that consistence with qemu-plugins.h

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210318185555.434-2-luoyonggang@gmail.com>
Message-Id: <20210505092259.8202-2-alex.bennee@linaro.org>

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


