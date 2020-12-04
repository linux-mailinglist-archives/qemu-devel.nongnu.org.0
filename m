Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C82CF6BE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:29:27 +0100 (CET)
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJZs-0004Nl-QL
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJXP-0002dR-A1
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:51 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:41050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJXL-0007zl-7x
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:49 -0500
Received: by mail-ej1-x643.google.com with SMTP id ce23so7130445ejb.8
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 14:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iBDSNPx6upyqlkELqBQhoWx867Jz/cWDyzTe3RAU9b8=;
 b=b9qV7og8yhStX9J0BYu/dFxAg3Q00NrrtbTgwPJSmdFVAdlb8nL+ycjlG/rD+1kEgO
 ELHB/U2AdUTnsyK5NbJa3BVcAY0AbAz3u8TmsWYHu26R6AUxlZNJnXP9ZAGsXfWs7ApK
 hTIdBbJIot6gafxr0ynz0afrtAuFfAjExVHCPPB/bewPWOJAYBdxSiJL8dx3wXIDgwEp
 2U3jPUJuFNyiAZABFZEMCSDXpJg3XEEciXCs8BEOmILRnQgJWWLRqxkjhBVJkVvhhi+3
 Ptl6Zxw8lx3LoCuKAjJbIoaI9jzbYzen8c/oalDo1VLxC45qiA3gMGU0wGZ+siduALw4
 rVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iBDSNPx6upyqlkELqBQhoWx867Jz/cWDyzTe3RAU9b8=;
 b=rlvLFdnaU9dC4RYGROBYB+8TSvVhlBF3gjuP/JenEzhhD1bxgAO9Y13HgjHoRXFVi7
 1Xqx95ha7r+4zzPMecsKwB2lpCV7hOk8WZDwLSTQoF74iImRo2gKWi3M6DVGlq5FKQLR
 a2qoodFtVau8iH6L5JvjVixXg5+L1L4KDZ87uh0C0teLXzeWkgWko1y+1lTYSGAr+fLl
 eyS/jLrTLrGm7jcYqgOK93Q6C6gtHjBea+Rfg1Gi3gKAf6S7kU0DKiFrT6PumbJemdqM
 Xwt6wiB/bXHgS5jUP5RecSd/xV1CsMHF4VzMw/f4mACXFchwz+v4jA1GggP50p9qtAwb
 ng/g==
X-Gm-Message-State: AOAM53368O602XKfBdm6uJOk7LkAWBrireTmpBPtJLmocqjLkbAxV87v
 kLv4FjUJn8KL40ww3xCRG6leAhi05Mc=
X-Google-Smtp-Source: ABdhPJwc1o2SYoyGu68hmhbMc66POYC/AVJbKYqnFbpf+OyVPmtQmtC03igKeaaO6yPxqhosqZFNKA==
X-Received: by 2002:a17:906:d19b:: with SMTP id
 c27mr9420847ejz.234.1607120806010; 
 Fri, 04 Dec 2020 14:26:46 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id u5sm4278374edp.5.2020.12.04.14.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 14:26:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/mips/malta: Do not initialize MT registers if MT ASE
 absent
Date: Fri,  4 Dec 2020 23:26:21 +0100
Message-Id: <20201204222622.2743175-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204222622.2743175-1-f4bug@amsat.org>
References: <20201204222622.2743175-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not initialize MT-related config register if the MT ASE
is not present.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9d1a3b50b7a..350b92b4d79 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1134,8 +1134,10 @@ static void malta_mips_config(MIPSCPU *cpu)
     CPUMIPSState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
-    env->mvp->CP0_MVPConf0 |= ((smp_cpus - 1) << CP0MVPC0_PVPE) |
+    if (ase_mt_available(env)) {
+        env->mvp->CP0_MVPConf0 |= ((smp_cpus - 1) << CP0MVPC0_PVPE) |
                          ((smp_cpus * cs->nr_threads - 1) << CP0MVPC0_PTC);
+    }
 }
 
 static void main_cpu_reset(void *opaque)
-- 
2.26.2


