Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F5F545BAD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 07:30:37 +0200 (CEST)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzXED-0002Nt-1l
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 01:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWy6-0003V0-4n
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:14:01 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWy4-0007dx-QB
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:13:57 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso1216885pjk.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 22:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5i5gw+GzDy6oIAhwH3Fhk1p6YRw/876cMv2LfmHXtpg=;
 b=hjkfhwk1h5c1zh+qGVvWEuCpfifl+1bE6VOB9nyIikLSH0Rj8XXHl8WuAmL3cwio7V
 Zv0zQZRryp+dn8Qt23qJjvISR2L7Orxk5zexSSFXtk6E7eIu/Uc/l3Q8t00fgWPSwzGs
 c/ILxCYD6U+cIPyFvilXhCZ1wdgbtCVc4P4h28m/rD7RIbISUuv+7g0LFhPW0JwdobER
 anj1pIf0+34DGiIrVszTkTaasNY7s6Wb7JwxSws1z39gjK4T6ZYWNDIUT3iZSKSyKYc1
 lNloeg41qpD5yiusJFc8WQfzuQboplcF+wql2cyRBY1C7BMFSHgnG4eqyFIfzvNUlknr
 vq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5i5gw+GzDy6oIAhwH3Fhk1p6YRw/876cMv2LfmHXtpg=;
 b=0qTXMwHf4DYh49bCgpoU0kLJf5uoFix4D9HwTXwVx8r1+HDkI2y9kB0RLqoph45C5F
 kKhw2OFQ8lYmHcj+xCIifp/Ni4ZOPMhSeEZWJYfjQz6ncQ1jFDH97oqsDwqbVEd3cObB
 TsRF0fjUpd+/Pr4oSsnLO2Ns8fQ8ZGRpo1vzi1g1lr7gxdOuPOlGXipqJyAeLZH5IcPo
 zca6fN9Q/jpfTIQO0bNSS46JPgYVxYE84PBfGd+yC79/G6EmQr4UDL8mG1rBVImIuVAe
 8+8BRZACNP47fiTOHmX3tQw9j0KK6dwKvrSLKqEO+tM6joltRhZu/9oV3uZt06DSaEMx
 h/tw==
X-Gm-Message-State: AOAM530/EbaG+PrhRNS5fws4yLE63zhVAo+Ols1ZXgixOgNKTw57zPDB
 PJEnIpJkaX5RzwcFyphOhU4gW8A11ShNHg==
X-Google-Smtp-Source: ABdhPJwDPNjTXOEsiEH3Gz3XRwI3TCm44PvdbqBoGcEVIxPQmiQFNgOz14YSq6q1ubQ6Gjxt1gzqFA==
X-Received: by 2002:a17:902:f54b:b0:163:e2fd:10a5 with SMTP id
 h11-20020a170902f54b00b00163e2fd10a5mr43770351plf.28.1654838035093; 
 Thu, 09 Jun 2022 22:13:55 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:13:54 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 7/9] target/riscv: debug: Check VU/VS modes for type 2 trigger
Date: Fri, 10 Jun 2022 13:13:24 +0800
Message-Id: <20220610051328.7078-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610051328.7078-1-frank.chang@sifive.com>
References: <20220610051328.7078-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

Type 2 trigger cannot be fired in VU/VS modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/debug.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index ab23566113..ce9ff15d75 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -457,6 +457,11 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
 
             switch (trigger_type) {
             case TRIGGER_TYPE_AD_MATCH:
+                /* type 2 trigger cannot be fired in VU/VS mode */
+                if (riscv_cpu_virt_enabled(env)) {
+                    return false;
+                }
+
                 ctrl = env->tdata1[i];
                 pc = env->tdata2[i];
 
@@ -492,6 +497,11 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
         switch (trigger_type) {
         case TRIGGER_TYPE_AD_MATCH:
+            /* type 2 trigger cannot be fired in VU/VS mode */
+            if (riscv_cpu_virt_enabled(env)) {
+                return false;
+            }
+
             ctrl = env->tdata1[i];
             addr = env->tdata2[i];
             flags = 0;
-- 
2.36.1


