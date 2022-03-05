Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAD64CE7B4
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 00:36:06 +0100 (CET)
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQdwT-0006AO-Lg
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 18:36:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQdv3-0004iq-5w
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 18:34:37 -0500
Received: from [2607:f8b0:4864:20::533] (port=46648
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQdv1-0008Df-M5
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 18:34:36 -0500
Received: by mail-pg1-x533.google.com with SMTP id o23so10467979pgk.13
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 15:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Mae+MGp+fmN6Bmkdy8MME/MQE4g9EpYM1MAhDsNrhI=;
 b=CD20LUGiM40G/kpzMwA1sBHO+9ounB7urW84WAZa8g/IIkxuK/ZT50/pWTYEyXv9ej
 W+iVIb/cvsYxmTcNcu7kRz8ywH4wSeqjk3kHEQ7Z2C9ZoUdttlufCKAibXmB4S8lCsN7
 s+eu2e5CDPB9V0aEWNYUblLZCfA7kdPOIcphxlV8t7QUEEP0KrToTtYuBAtLjJcUrmv5
 1WPYnSveSyDeSCuIjVjIy6169VdOiln+GSYMAlg1+58OBYEruTwZc922cMFs3gMmZj/O
 G0WbXoizejSq3csfYcIqnXCnhgq029Y7YG96gU99SjDSBWS75fViextgO5e0cLoMA+bz
 NB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Mae+MGp+fmN6Bmkdy8MME/MQE4g9EpYM1MAhDsNrhI=;
 b=22k4pi4tQsBqfwOIJJYCEi2q8hSJRAjTemImOQ6r1pzFDHS62ewXqDphinweHogbbK
 dbdvfY1zQ/9/KQ1GBZQV9QQZSyL4EiUKnCNHdoPEC8d5We5sLfqmxO+SLUZ0fFRsO15D
 6AuR0ozTLL8cmP55lxbPtHL6WD9j3LhP/kiqFM1FO4RAM9M1Sz6N4Mf1gSblJhZQRcEW
 2pEbha3UVyLF5wFfqIuBHnSGmezPxOk31ytH4klCyFJFMri9PXt1l1FrMk1C0RnzTklO
 /4F67sxb6UQwdyBW3YJjtkeBoE4trDVJkVUTVE7rACQ6hgBtM4Ud1oG0YNG4RvAYvIbX
 q2eQ==
X-Gm-Message-State: AOAM532bYrf9O3/z0ODADXt5bsiW91BvDvYd1zWop5i7c8sJj+hnOgBC
 W7ma9gZFKJgMEJa6SUfUSbFNIrxX36s=
X-Google-Smtp-Source: ABdhPJxqPbyDp91ZGYo2NJ3BPJWPJpYibY98zxaApu7ZHSmZifDjI9zlY1fgKbk27dXhcAOQquABOQ==
X-Received: by 2002:a63:e60:0:b0:374:6620:f372 with SMTP id
 32-20020a630e60000000b003746620f372mr4242141pgo.557.1646523274311; 
 Sat, 05 Mar 2022 15:34:34 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 mu9-20020a17090b388900b001bef86b7d92sm11413693pjb.24.2022.03.05.15.34.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 05 Mar 2022 15:34:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] accel/tcg: Remove pointless CPUArchState casts
Date: Sun,  6 Mar 2022 00:34:14 +0100
Message-Id: <20220305233415.64627-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305233415.64627-1-philippe.mathieu.daude@gmail.com>
References: <20220305233415.64627-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c68270f794..c997c2e8e0 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -422,7 +422,7 @@ static void cpu_exec_exit(CPUState *cpu)
 
 void cpu_exec_step_atomic(CPUState *cpu)
 {
-    CPUArchState *env = (CPUArchState *)cpu->env_ptr;
+    CPUArchState *env = cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags, cflags;
@@ -532,7 +532,7 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     struct tb_desc desc;
     uint32_t h;
 
-    desc.env = (CPUArchState *)cpu->env_ptr;
+    desc.env = cpu->env_ptr;
     desc.cs_base = cs_base;
     desc.flags = flags;
     desc.cflags = cflags;
-- 
2.34.1


