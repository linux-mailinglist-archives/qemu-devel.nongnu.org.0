Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C74B2D0D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:37:14 +0100 (CET)
Received: from localhost ([::1]:53190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIanA-0006mJ-8b
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:37:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nIakL-0004FA-Jv; Fri, 11 Feb 2022 13:34:17 -0500
Received: from [2607:f8b0:4864:20::22c] (port=38879
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nIakJ-00046V-DS; Fri, 11 Feb 2022 13:34:17 -0500
Received: by mail-oi1-x22c.google.com with SMTP id u13so10526858oie.5;
 Fri, 11 Feb 2022 10:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GpJuGvr7mh5zyLB3hjnj75ImlfXDY9lwn6KVAYwwpKs=;
 b=KsQElMC5DVO7/TjaYzWTZaqJBZxNjY4xByinJeHNIyOyYl9+TGIq55pCFywykXzsrx
 qtEN2KE9WYL3RnWhRDwlofoRS0QKXgLrzKnOzaJZ1lB0+UiZsl/oFWvBN1D3Vt9XQ+KM
 +WrDJziiHPNjxWGKDsPFA+EOMsf1uxDzamNbYkhJD/1sYKfMuuRE2/OTwBmFRqWYPkRg
 vXNTmpKIAh0aJqAkVKLq77WwP1qRnPXTtsCyuvtitQ0IoGPxPMEly8kScST11qpBjDYX
 AbA7TFbUV9KQsGb9U1TgojHJMCYwsoo+s+3hOLQxUjniY9UOdenD2Ij3oKmdVNvinsbt
 StwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GpJuGvr7mh5zyLB3hjnj75ImlfXDY9lwn6KVAYwwpKs=;
 b=5Vk9EBOUikKRF2S7niY7F4KhTBLjk6I+3096AGnKNp+/Et+naIiBVOxFlYz8oUhjTO
 y5xNzXYigwzNtHAmokbCcwKdgoUOD3ZNSlLuTvQcIsmz3pDUBMVgI90e5erz5bl3fZaI
 K/177sRpcSmFxqJtV+b4QCAz6dMOm1jXRYDnwiXmymtYe8n/gzdqzaHyu16S25qa3Gn3
 VAU4bW1NJcWUSFFn4j6+wWZ+4hagQWxAxjY5atO1VNP2loNW+w8xmEiHEEC0o6cb3SSg
 Yu1WBzJxmJRurWvVaYnuvQqfbqOFxq8M1wY7wsJWN4qynLzuhIo6BcuAitmKAuMdKU0g
 fjMg==
X-Gm-Message-State: AOAM533TKcZVkA5Ab1VoV+R4J7855tmGbLKa3wmKR1suW4oaZLp5rdyK
 exk45fJpOFVHcIe/aUC6T+IOUQ1rJhs=
X-Google-Smtp-Source: ABdhPJzcX3oEUhaGLaTf/Lp98hSsO3+sVTnEKgrfTM8IPDm5gLhHcKXmhzvoW4C9UTZOwwJgJHxtpQ==
X-Received: by 2002:a05:6808:148e:: with SMTP id
 e14mr855318oiw.180.1644604453898; 
 Fri, 11 Feb 2022 10:34:13 -0800 (PST)
Received: from rekt.COMFAST ([191.205.140.35])
 by smtp.gmail.com with ESMTPSA id t22sm10008145oiw.2.2022.02.11.10.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 10:34:13 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 1/4] target/ppc: fix indent of function parameters
Date: Fri, 11 Feb 2022 15:33:51 -0300
Message-Id: <20220211183354.563602-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211183354.563602-1-danielhb413@gmail.com>
References: <20220211183354.563602-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix indentation of powerpc_set_excp_state() and ppc_excp_apply_ail()
parameters.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c107953dec..8a49a4ab90 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -265,9 +265,9 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
  * +--------------------------------------------------------------------+
  */
 static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
-                                      target_ulong msr,
-                                      target_ulong *new_msr,
-                                      target_ulong *vector)
+                               target_ulong msr,
+                               target_ulong *new_msr,
+                               target_ulong *vector)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = &cpu->env;
@@ -362,7 +362,7 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
 }
 
 static void powerpc_set_excp_state(PowerPCCPU *cpu,
-                                          target_ulong vector, target_ulong msr)
+                                   target_ulong vector, target_ulong msr)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
-- 
2.34.1


