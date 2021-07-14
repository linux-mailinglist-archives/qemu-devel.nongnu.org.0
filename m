Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA03C82A3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:19:11 +0200 (CEST)
Received: from localhost ([::1]:52572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3byw-00069P-La
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bwQ-0003v9-KO
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:16:35 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bwP-00060C-0a
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:16:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r11so2509938wro.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eU275eIDncObZjHRaiNqo7Ddn9Qlyx0gTFagr97HOAs=;
 b=I1ZYjiFwnauM34kxp3/WEvJV+hSASqXuj0mbZP95z1WbHa1QyHCX6jSvCaeiFzpA+N
 VhV9h2nqegS2jYlfOYsOh4Ehk+Hz28p/aOckPBLa2c48MDaecehN8Ij90/r/HHiy8prA
 m72Tk0thl1ic6uJwHLXTab9EsdKs0sRa8Fxg6kRmsgj4BVojqJ94+6giaMEsJNUGID2a
 D/yzdi506l0QM7ceSRSXP0CM2pJXpkxhafiP44A3dMJ5zBLLP1VG3tLRWgA5qQJvUJj3
 zRIjyZhTTy4p4DSjsmG5J1CBFYYmmLeEFp+0uttpbd5MyyvpRxQUdMxmEIukoxR6p2+q
 d9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eU275eIDncObZjHRaiNqo7Ddn9Qlyx0gTFagr97HOAs=;
 b=KZW4OzkLkHVEhH+vpcsUgJ8UieE2x9vQmCZiTTyEXUIcFw9oCSZLlO18gMC2aUE61A
 lS5ff766esuTQ8vsvd0/+ZCbxuF8z8fPnMqIWCIvgWx5dPjeYuiBaOPJhPh+NezvSOPf
 BMWyAw4kogelGUEaTWABIeezzuvHm2L57KNzIyPhzXPJsDgZU3hWG8KNMm/oJjdCBjf8
 T7Es6B6XsRJBYhyRrWeC4swQHBEs20hiGQHlHePWv5YdBPcMvXEjWSNVdE7zUOVlJiM3
 iN0E5B6dUkHvEM4sa9bIrgFEmdz8121iBp9VLfVoQqcTI0eYAK0fTPVf0+06rGGy3WER
 Y/+w==
X-Gm-Message-State: AOAM532snKE+giMcwa1LTT2uwjbnePOvh1uaXgGt4K5OPUU+Guqannx9
 jBdMmwHwcRnS5656gado1+s1hQ==
X-Google-Smtp-Source: ABdhPJwN5EVXqhNaiWaDQDgB+t4DsH7tMEFDboGX2kR4xZrV7CqS2LRJZrcs29PmNHxhEcuD/aESVQ==
X-Received: by 2002:adf:f085:: with SMTP id n5mr12085865wro.148.1626257791627; 
 Wed, 14 Jul 2021 03:16:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w15sm5349063wmi.3.2021.07.14.03.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 03:16:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B31261FF7E;
 Wed, 14 Jul 2021 11:16:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1] tcg/plugins: remove some stale entries from the
 symbol list
Date: Wed, 14 Jul 2021 11:16:23 +0100
Message-Id: <20210714101623.17046-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: minyihh@uci.edu, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The OSX linker is a lot fussier about these missing symbols.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/qemu-plugins.symbols | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 4bdb381f48..40b4ff3821 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -8,9 +8,7 @@
   qemu_plugin_register_vcpu_insn_exec_cb;
   qemu_plugin_register_vcpu_insn_exec_inline;
   qemu_plugin_register_vcpu_mem_cb;
-  qemu_plugin_register_vcpu_mem_haddr_cb;
   qemu_plugin_register_vcpu_mem_inline;
-  qemu_plugin_ram_addr_from_host;
   qemu_plugin_register_vcpu_tb_trans_cb;
   qemu_plugin_register_vcpu_tb_exec_cb;
   qemu_plugin_register_vcpu_tb_exec_inline;
@@ -32,7 +30,6 @@
   qemu_plugin_mem_is_store;
   qemu_plugin_get_hwaddr;
   qemu_plugin_hwaddr_is_io;
-  qemu_plugin_hwaddr_to_raddr;
   qemu_plugin_vcpu_for_each;
   qemu_plugin_n_vcpus;
   qemu_plugin_n_max_vcpus;
-- 
2.32.0.264.g75ae10bc75


