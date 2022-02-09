Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88C54AFFEC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:14:04 +0100 (CET)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvDv-0000Lz-Rx
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:14:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHux6-0006pb-8v
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:40 -0500
Received: from [2607:f8b0:4864:20::62b] (port=40835
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHux4-0008KE-QR
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:39 -0500
Received: by mail-pl1-x62b.google.com with SMTP id y17so118023plg.7
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hu/2sOEbBpz0/sX5QV4yZJ1C9HjhgzwNFmB8BQHvM8g=;
 b=HvG2aSghO6X2pzrGOVRPcfK2H4Qembhth/Ote3Kxd1fTEfQMAY0wnEEJE7WgYNMVeb
 v67LATICW0AIVhQLn33EHuIjg3T82QlFD0NsnWlfqjXfzYqaoLLN/GjGGtmbp0S92NMy
 wRxpjHvd2S6ukVanPYYfGeV5j4lhSGBx2w7z2cnD6yRfHvdpl50YIv/E6w8RZYhgUAom
 sAUzCBeAOqM+rA5Q/1J36kjmo+oGag8BZh62fLBhd7wjamra4kGCgnuzmpiWdK5e2Y91
 Z3jDc3uAID0iLfV7aMPX/njxcG3pUNmoMLpcOsPdgND+fSYV58enSnDFMMMCXDzL+mxa
 dACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Hu/2sOEbBpz0/sX5QV4yZJ1C9HjhgzwNFmB8BQHvM8g=;
 b=tHPTMXzNQ30TQfYLqgPuFLoyQEv+KS+AlaFbwnr5QGbQR6a2GZMyXKTuWqi7HCuNQO
 Z9Zy+NoI9h367Y3mNA4qRME3hfzNQKRLDy5SkHaEWSaNzT14ysDyM3aycSBNV6c7Yuq4
 OvJidxgyhyJX71+WtFJZn7pL+L2rhgZ/riMIvDXfDRwKaK9TLc4QEVtNDMbz0QOeEKD4
 6hekrU8mYGcfUa7cmuD77xVYdVsKwNyDyOgCnUH/3XOJIpz6GwsJS2MjrdPAtEGjm99d
 6D2LQeHlaEfmpYzC7FQV+KZ1+0inhb3+mtnBcafLl2THp1hDQErHSrCfwPEBwIjFjOV4
 rVjA==
X-Gm-Message-State: AOAM530JsOx0U+gl34NdzNfqwqd6dHjEQl9StmCT1J7g2WeC65kpXzmB
 uSsj7Ct/R/NLQVF85WF8XkqjDlPC4iM=
X-Google-Smtp-Source: ABdhPJwD38u5ofTxXfrUmgBE9VWk4/7acag9izwb4XSHs94WGoLDkc3FIUgEgFZeABMHLBQWNLO1Vg==
X-Received: by 2002:a17:902:7109:: with SMTP id
 a9mr4620029pll.170.1644443797491; 
 Wed, 09 Feb 2022 13:56:37 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s17sm19987467pfk.156.2022.02.09.13.56.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:56:37 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 13/15] hw/mips: Restrict MIPSCPU type to target/ code
Date: Wed,  9 Feb 2022 22:54:44 +0100
Message-Id: <20220209215446.58402-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/mips/cpudevs.h | 6 ++----
 target/mips/cpu-qom.h     | 2 --
 target/mips/cpu.h         | 4 ++--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/hw/mips/cpudevs.h b/include/hw/mips/cpudevs.h
index f7c9728fa9..6065932b0e 100644
--- a/include/hw/mips/cpudevs.h
+++ b/include/hw/mips/cpudevs.h
@@ -1,14 +1,12 @@
 #ifndef HW_MIPS_CPUDEVS_H
 #define HW_MIPS_CPUDEVS_H
 
-#include "target/mips/cpu-qom.h"
-
 /* Definitions for MIPS CPU internal devices.  */
 
 /* mips_int.c */
-void cpu_mips_irq_init_cpu(MIPSCPU *cpu);
+void cpu_mips_irq_init_cpu(ArchCPU *cpu);
 
 /* mips_timer.c */
-void cpu_mips_clock_init(MIPSCPU *cpu);
+void cpu_mips_clock_init(ArchCPU *cpu);
 
 #endif
diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index 41f3d01a80..666084b09e 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -29,8 +29,6 @@
 #define TYPE_MIPS_CPU "mips-cpu"
 #endif
 
-typedef struct ArchCPU MIPSCPU;
-
 OBJECT_DECLARE_TYPE(ArchCPU, MIPSCPUClass,
                     MIPS_CPU)
 
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 09e98f64de..4aa95d0ce1 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1171,7 +1171,7 @@ typedef struct CPUArchState {
  *
  * A MIPS CPU.
  */
-struct ArchCPU {
+typedef struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -1187,7 +1187,7 @@ struct ArchCPU {
      * pipeline clock of the processor, not the issue width of the processor.
      */
     unsigned cp0_count_rate;
-};
+} MIPSCPU;
 
 
 void mips_cpu_list(void);
-- 
2.34.1


