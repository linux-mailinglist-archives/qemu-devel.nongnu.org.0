Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF30400D96
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:58:05 +0200 (CEST)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfXw-0007Wo-Tz
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfVu-0005Nb-Ag
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:55:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfVs-0007NZ-Se
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:55:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so2189832wmn.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8Jx1m6Bv2t518ZIG2TWOXwbWEoTAme9VK7NQaY4YX8=;
 b=pRLwYMGvYgm/K8oXON2CF751FZXzXwrdAtLKSL52ET56e83kf59D+iskzYkRCkJozp
 Th355l9Z2Xp9KsaXzGM/TytSumIDd0dW3lY4bNagbNLqKAycjKWEgG8OBzLN9Lvet/t6
 tg9qyece9RrcuGDm7l7bnJ3bLqhoc8G4fOCZXegJGo/AxPLm5s72awulOeSwCaCTOpmo
 MDrQmOBhs4jq/6Ip8gXFDgRhOByDNKgBVM6uVegY9Mt2wuUGGquvkmlAGqVkJOwV28hB
 YLtgJHHDhh/MpGO7HHvq/Vd4Y15s71GlDDHOxMACtiBXnQBTFrWXT87oD+Pmi3DbuTpW
 i41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l8Jx1m6Bv2t518ZIG2TWOXwbWEoTAme9VK7NQaY4YX8=;
 b=aHk4A6bRzw+HXKT39fwa7Jp2EjO7BwfC6u+o5mLSD+Daz+wMMuCUAgmZvwPBPXb0PK
 XB28JgDsW6eylQGq7B0WwNTKW/96cqQX9/KrOcPsCqnxu2M6auhsnBZpyTZpGD3LikCs
 25n043qIbmBAzuutlREY5Cpw3RDeFV/F2fLrAVJpEpyoQvPwY7TjMg7XCBBCgrlivvRS
 ys0BAhQE7Xvo/IeKdfAyGG7Ql96R/5jhQTDGBvzprT04F+Z/BqYqAwdjKmuyKgALu9qr
 1PCHvvhoRLRgCcBmlFj69FfoFYSU1N8+FCK2U2g8g9WKBqp95//wW/y7sA3igaP/V8nY
 AEfQ==
X-Gm-Message-State: AOAM531H6PJ/wnbMXVqOOBVcXnx2TjTmeUyYzWGtngY75pheBPRj740D
 HjnE6aYPxzkj2NF3JL/HO8Gad0cjCc8=
X-Google-Smtp-Source: ABdhPJzA77sCaaWBppdNkvw3E/RyModmRCPDDjqWkuwSF8cMTF2aN9qibXy3FA/YUjlORRC0+Kw8mQ==
X-Received: by 2002:a7b:c212:: with SMTP id x18mr4770089wmi.115.1630799755347; 
 Sat, 04 Sep 2021 16:55:55 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id c9sm3385529wrf.77.2021.09.04.16.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:55:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/24] target/i386: Restrict sysemu-only fpu_helper helpers
Date: Sun,  5 Sep 2021 01:55:20 +0200
Message-Id: <20210904235542.1092641-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict some sysemu-only fpu_helper helpers (see commit
83a3d9c7402: "i386: separate fpu_helper sysemu-only parts").

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c50d3ab4f1..c241bc183d2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1833,11 +1833,14 @@ void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 int cpu_get_pic_interrupt(CPUX86State *s);
+
+#ifndef CONFIG_USER_ONLY
 /* MSDOS compatibility mode FPU exception support */
 void x86_register_ferr_irq(qemu_irq irq);
 void fpu_check_raise_ferr_irq(CPUX86State *s);
 void cpu_set_ignne(void);
 void cpu_clear_ignne(void);
+#endif
 
 /* mpx_helper.c */
 void cpu_sync_bndcs_hflags(CPUX86State *env);
-- 
2.31.1


