Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF8134553E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:04:58 +0100 (CET)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWPh-0007FI-R6
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKY-0002JH-Py
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:38 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKV-0006tH-Le
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464775; x=1648000775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e0wPF4NnKArSDskGO9hzTzDQBAc+lSTe2SoOBIijAA0=;
 b=R2W9NqbrXyYvDm2kP4lDnPXqEsAv8Xiq3JjRGGcinWiHVlxMsyCaCW6P
 11hWHVkeCLUG6jVJF6L6JWpEBGz8OrGNjUr0A2L1QDMeWDzExv6Yfh3NM
 sN06unxHhvJtpo29BBDxEWfGUhK2GHPECCzk+y3ixUrTzu7SMYaZ4v3Eg
 COJGZmWWWVwBYOxH8KmARbY9fB3n1mmav8j/lVYumELXVk8hDHXNgFc7J
 5BTU+8lY57mb949hNF7QCstaxBEowAv4pK1Bnb4QO/zd9bgeI3t8QEmPd
 lsuh1bi0y+myZS+KlYR4TMAD+I2XRtiWTzqktjhD8WH46QQMSFFk+MyFZ Q==;
IronPort-SDR: u7MdztvPr9gOqc4HxCsHASM1FtysyC3WD8k4CFd/9AfTFkwoW/3qV1giDH0pCu8gp+WRvonFEX
 IQz3DsixC1eNLNGGKqFZx4CRbToXHRsHv74TxTGtXBF4E5a9xXxa0aHOSxeIlc6Cyi1vV3Gc5J
 8MIA6PhevK1PZnxBU/+Z1pevZ1YJPANwaUX4hP2p5hcsPaczWq9oe0WbYAjhbwTXTW0D3glO66
 6ca1yAd/Z5YW021h/qE8XoFONholRetE5Xk6+tVJ0uaCld4MrMMGo43H1tBCmYy58IHdngqYZK
 WiI=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707631"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:31 +0800
IronPort-SDR: rJLdzMbJJE+Wf4fuIRg+dyv98PA6hfy6bgbLQRkepqz6KyJr1imtqt9pky71Pxy4aU45lLsTT6
 9Oxn7UAmJeGr2P5hIarIjcQH7XdYod18HlU6ojZOVhHIldmVZ0Ks4esI5dX9f8+w/vrDVErOU/
 FL2ScA2goCbUFBXgpk66F3D5E9jI69h0VbVzSaRFXq3hU3ufQtQd5nSdbRgZUHkkv8a0OvEV9R
 YxDdpc3aljd6dU1SEVygGnJJed/RSFcTkmuCn/A8iicGPLKPLRQc4DfMjr9S1QbgWyWTbr/Rdb
 kDHlCbvMcPc8jTPOr9XGTVOV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:39 -0700
IronPort-SDR: 1LK2OHYgUu2kqKd9y8p8McKjtzq+/3peqbumZhoKgq2ar75n5c/+AUqTvt1vv73aM/mJ0MWSyx
 YXSUz1YZCFF3qdppkoT4XT40kKxFQ2PZlDsF0CCiyBfzTWInXBHqeGcWRsA/gYsLkZRzfH5WYf
 QYLXzlcAlUJmvUsQ37ae18OUKgOEvMVOuYtUwkxvdbggpzVV3//Sr2XaYfAg4JKvOlL+B5OemM
 qtBjz3cQ0AO6vMv+tDZ84mG+ECwFt0FfJt+Ywso0xcn07E0ECSDQeNZZ3vbIwZgYuzLm574MYO
 IkQ=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:31 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 04/16] target/riscv: add log of PMP permission checking
Date: Mon, 22 Mar 2021 21:57:44 -0400
Message-Id: <20210323015756.3168650-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Jim Shu <cwshu@andestech.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jim Shu <cwshu@andestech.com>

Like MMU translation, add qemu log of PMP permission checking for
debugging.

Signed-off-by: Jim Shu <cwshu@andestech.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1613916082-19528-3-git-send-email-cwshu@andestech.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index fa385594df..0515f9aec8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -794,6 +794,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             if (ret == TRANSLATE_SUCCESS) {
                 ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
                                                size, access_type, mode);
+
+                qemu_log_mask(CPU_LOG_MMU,
+                              "%s PMP address=" TARGET_FMT_plx " ret %d prot"
+                              " %d tlb_size " TARGET_FMT_lu "\n",
+                              __func__, pa, ret, prot_pmp, tlb_size);
+
                 prot &= prot_pmp;
             }
 
@@ -821,6 +827,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         if (ret == TRANSLATE_SUCCESS) {
             ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
                                            size, access_type, mode);
+
+            qemu_log_mask(CPU_LOG_MMU,
+                          "%s PMP address=" TARGET_FMT_plx " ret %d prot"
+                          " %d tlb_size " TARGET_FMT_lu "\n",
+                          __func__, pa, ret, prot_pmp, tlb_size);
+
             prot &= prot_pmp;
         }
     }
-- 
2.30.1


