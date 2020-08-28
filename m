Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452C1255C69
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 16:28:11 +0200 (CEST)
Received: from localhost ([::1]:60816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBfMP-0007sf-Te
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 10:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBfEl-0000t2-Lx
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 10:20:15 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBfEj-00058c-Qb
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 10:20:15 -0400
Received: by mail-pg1-x52d.google.com with SMTP id g29so534630pgl.2
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vc1/n0PAMq2ruFSCbPStrg/chGbNzuC4FGRX/oeXBs0=;
 b=S6NGo0a0sieHctCC3tEG5fiBBTlbXnSxQ4tenDBNY+QSrY/SZv6Ke7GxbvKjDUF25l
 Wq3sx2UHCxsP8QbBsLkLhBo4afxFB1o1lEmX3iECSQkvG9lBMZXRiN5R1oTe6L/SohPh
 P02pS5XlSm0ACpOQSIOv+FCG2TmNfs+47ffY/O38tUpQE9Ke5e5euYdn7mNLLHPcp34o
 LG90JUxi01dPhWTE2U4mtbKZu4oRCO6EIiG+vsqvkg+yk1yypX+xU+EF5hsEgBOPF/wJ
 bo0iYohdfXOnZOinxC+MuAz/bR+84ig4kPo62e0Z0Xjv60zaEZL3nTyGGfFdZT6qWoKG
 Pp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vc1/n0PAMq2ruFSCbPStrg/chGbNzuC4FGRX/oeXBs0=;
 b=G4K8tlrTRKGi9hWgKhDQt6jNrX4fMsNc02yd59vfAOirGRlHgtEZcoCNlo3EvOqvuL
 4SVKHB+poRhRtGaAkretY81uvbMXMY7oOwjLbEjqo//PNsrDRjIChgXeWGA5+dy4d87s
 89QAcVsatcwR90uuN30q3rriNfBRM2jqxWOonu7LovSxyuor/4GZXtfkRjVPiOxAEEtf
 h3q9rs+zQuCSPo4P+kZOt+mmr1jIF9Oxq5AY/9qPFamUI3pDuGCcfqt0zcrEtKRbPriq
 nwmpDA3ChQvEwGoyTc20HpzW9AYKyQBAh5DWLadqzar/dKpY0Y57G7OJ4WfgXvNb+qxB
 DQRg==
X-Gm-Message-State: AOAM5312gJ3ykI1YPq2cmyxGjA0Th7GsYRYzojyvFFN3LyRsb2lxBIBa
 R+E7sWwa8GyX+h5rO9ir95s5G684R5X95Q==
X-Google-Smtp-Source: ABdhPJyJhMRyqa25YBiWfCEnecEZWIKDXuTH4iAlyvZKk4QpDJzk+1/2ImQWynsrlpbLxD4U/g74og==
X-Received: by 2002:a62:3486:: with SMTP id b128mr1476921pfa.98.1598624412057; 
 Fri, 28 Aug 2020 07:20:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j3sm1403080pjw.23.2020.08.28.07.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 07:20:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/76] target/microblaze: Remove DISAS_GNU
Date: Fri, 28 Aug 2020 07:18:44 -0700
Message-Id: <20200828141929.77854-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828141929.77854-1-richard.henderson@linaro.org>
References: <20200828141929.77854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is never used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a90e56a17f..6757720776 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -34,7 +34,6 @@
 #include "exec/log.h"
 
 
-#define DISAS_GNU 1
 #define DISAS_MB 1
 #if DISAS_MB
 #  define LOG_DIS(...) qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__)
-- 
2.25.1


