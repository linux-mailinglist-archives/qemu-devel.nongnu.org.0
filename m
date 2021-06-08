Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22BF39EAE1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:39:33 +0200 (CEST)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPmG-0003bF-Op
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPds-0000zS-Ng
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:52 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdp-0004Rf-5O
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112248; x=1654648248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eQVwOc8ytbfftrLprKiThHJ1CqPUA+jNF5dK8YSmbyg=;
 b=RIAkSxeKV5BaJsSSuKU+66MNVCUIEQHtAgS8E1SBliI57kZo6amoZSPo
 9vYPOiWNevJ1xEoS6A3IU61yqi/fekBymKnNXtdYbw4JPcRY/HAxXpb2V
 c8HiCs+Ocq9tZXTxe+NS4WM36ECl61F59yhoPznVBWW5eTf34Ey0/3BDT
 PLfaupI2B8HWRSjpV12IKqq6Y513nD1Bb/VDGXqpkktXZr8rmu6XNnHFJ
 M7kbHjtLVLCS4yIDCGAgCDQ+880gHei8jwE2DP/jo0/bfWkF8r7og6PPd
 Cu7ijBfWOwmaUyUuVSE8ABxdwQ+KPq1oUBaZDhJZiNsub3Gwtp3cUOtPE g==;
IronPort-SDR: keJQCsYQzhdpNWQJCxBYJWY3oYG7sxEStAwOS4rE/kUckntcImwDfOB4IllviSLgp8wrxjkcU/
 h3nWMgZFYOJjqpjqsMj75PimKG1agF6QegQhNG6Zueinwfr6/XGA6PY+79IH1eXl7vfTZYvhqW
 H8Cr1JTujwDp8SDN8Y+cQGFn0bzi1tNjFnFNwjpKgPqVUK9z8LDOrU1quaNf6I+Fz9XsjPvovp
 lie+41lcvKy6ICGBzxArqUo/kdhFSuJ9kQsUGEy25eA2Wm8R7Cee9hilKB1wF6ceJL2Bmsqawo
 oQM=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087372"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:48 +0800
IronPort-SDR: bpMO99Ye+wQrKJ20WcfGbKh2+anhxcv+lCSdqmX6Otv12r9xR3bIqbONbx+XIMowdw8gY/ES2v
 U8VSq+0HhkUYCZQFGFZX4zqw3/NEJe6chjrX5iv6T18z7yB+dL3JK1MyrWwQe2JFwYLXsWVvwz
 wxd/Nvv9WZUd+TJXnuZuk04t84c7sTwhdKKcJ1ZuIaG598vNTnSvSNb6AHpUPaQIHRJumQUZ6X
 Detl3YY84qf82v+ekf2i7RjsQ/oaHvAwEImy18NT5HS8bxAS6astyZrQZ3VKUWiIPFqema3vNj
 6Q5stIDqTI86WjG6s9BHxPt3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:54 -0700
IronPort-SDR: JpAOAhN6JDmCq2sbnSyRmsrcUQrQFLVjW3dI/BEojG+wlE8fcjCNDS0n/JCeS6skCENx9aMj5H
 hAP6OehivkoWeKp62jK6F/9l8w1JqUW7I8kDRqhw+7nvWuZBWNL3TsuyTaiehjFhec//uWYejK
 SHxx/mLdmzMle7uDeM2cF9mZVBRzDfVLyTeBueBco4A3KUk+PMi2OdDJyIpSyzSC4+W0hHhXn9
 psKXVL7GfRaCbfUQWQNegOmvshq3nAZFDWf2jjdA8WMBQ+9Qpjx8rebuUuzjI3Vkud5a4IigA5
 ewI=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:45 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 12/32] target/riscv: Remove unnecessary riscv_*_names[]
 declaration
Date: Tue,  8 Jun 2021 10:29:27 +1000
Message-Id: <20210608002947.1649775-13-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

riscv_excp_names[] and riscv_intr_names[] are only referenced by
target/riscv/cpu.c locally.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210514052435.2203156-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 --
 target/riscv/cpu.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0619b491a4..0b22b0a523 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -320,8 +320,6 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
 
 extern const char * const riscv_int_regnames[];
 extern const char * const riscv_fpr_regnames[];
-extern const char * const riscv_excp_names[];
-extern const char * const riscv_intr_names[];
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
 void riscv_cpu_do_interrupt(CPUState *cpu);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1f1cef1d6a..aa48bca830 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -51,7 +51,7 @@ const char * const riscv_fpr_regnames[] = {
   "f30/ft10", "f31/ft11"
 };
 
-const char * const riscv_excp_names[] = {
+static const char * const riscv_excp_names[] = {
     "misaligned_fetch",
     "fault_fetch",
     "illegal_instruction",
@@ -78,7 +78,7 @@ const char * const riscv_excp_names[] = {
     "guest_store_page_fault",
 };
 
-const char * const riscv_intr_names[] = {
+static const char * const riscv_intr_names[] = {
     "u_software",
     "s_software",
     "vs_software",
-- 
2.31.1


