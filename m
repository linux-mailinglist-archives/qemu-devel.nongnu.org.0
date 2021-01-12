Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C42F2BD3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:54:28 +0100 (CET)
Received: from localhost ([::1]:40738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGNf-0007Kj-DN
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAA-0002i6-38
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:30 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9w-0006vg-9f
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:25 -0500
Received: by mail-pj1-x102f.google.com with SMTP id b5so1306463pjk.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dti7koq9DQcuH5xVI8JF2UeD8QDeQp2eVQLoYkRGiyc=;
 b=N8yb8GUJIGVWoVjbJ66nqrIlGy6rvVVXK/TqU5KKPfH36R4WggJn8gCu8c/GrhlyUG
 C+9mOyJ3r6iZVsSQ94zKh2KnmqoSMhD2JSWrYfoYYaaw2txFiCucfSQcwVmR7RUPjoiY
 lrCUMhUXwsmF1MROKQBWOYOlQSWnGanEa03ZAHS/8Z8QbOxb5hcIfg87EC3zEORCOF91
 zg/v9r7D6MrBFSNKZTAYPFpbXhz9wGlOOzdgBOKl5++2+2k4HDzohkyplHBjEDwRZRQY
 fC3yU1s4zNmRKhal0+jqpbnBoCLaoJMvigHP2whtCJbT0JczflugXCsPPbdr/eT4kSJC
 ZWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dti7koq9DQcuH5xVI8JF2UeD8QDeQp2eVQLoYkRGiyc=;
 b=B34SHHqTPR2DK5MNYJ9/a4w4yY8qYGUdYau+0UvWVPNpsrRvxrK6P883osbVtydSRI
 OWs0CvHFrxe4e5zdXJBvAT6gAXC6RZoHeH6yPZka8FPxd29qT6YYZq/7Q4QxujSkGDeR
 7QZp/O9MnjC/nP0u7g/nKRPKIj0he1L/OX5ca7MGMJH1XV04ETpCpyZpGJPs7o57QMZv
 uPF3TnqihnA3OPnlDwysLAhe+aEC4BfNQH6QzawtvoSJOtg+PCXyWbgp7/DmFnAKcI11
 YZQb4wB1ByNApq+mWf+MNlYLxWZqjvm7dKX2VdsW7uWS2Cd0GOVz4YLY7WQfvVO+Wvdk
 S71Q==
X-Gm-Message-State: AOAM532ADqfTB8qnRzKbok/4ehS5QDUe5ouos64Ih+gVQBnS85xP05DC
 CfUOH9sLODVJcmDPbOAx9IfruCS2lri1Ryqr
X-Google-Smtp-Source: ABdhPJzkgVBwjnK+JHKWGDTZ/oiwtdYtCwxXCUT9vFYZwWSYNY1hlv+spVmLRm9wyD/NEYoYn3EWfA==
X-Received: by 2002:a17:902:d351:b029:db:d63d:d0e with SMTP id
 l17-20020a170902d351b02900dbd63d0d0emr4372011plk.75.1610444413893; 
 Tue, 12 Jan 2021 01:40:13 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 04/72] target/riscv: rvv-1.0: add sstatus VS field
Date: Tue, 12 Jan 2021 17:38:38 +0800
Message-Id: <20210112093950.17530-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 82c48b7b9be..8edf81692e6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -414,6 +414,7 @@
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 50862df9e82..a70a78386da 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -448,7 +448,7 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
-- 
2.17.1


