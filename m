Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D552BB83B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:21:34 +0100 (CET)
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDqX-0006TS-53
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDeg-00033i-6K
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:19 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDee-0003rj-5E
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:17 -0500
Received: by mail-wr1-x432.google.com with SMTP id j7so11722296wrp.3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KhtgoDZLQcdddctuxNL94IkH0wF2YFhr3cZ6vXZZOCw=;
 b=qZvs/x6nBVrRxKs1ouIF7QLnwzfY+AqXYDxxTQuu0d+3mFSGWgUw9LL/L4UsqPMZs2
 CZsJypLK1xP/2MUyYyGGtWhKD1DsXIzu9OjQpEihi/l+038l6CoMx3mJkbkWN3xyJXhy
 pAaaAlKy8/p7D/CbJQHaHBf29qOFOCGM8pzcmiWaqtMFFGtdlCgk7n7dtQNuyD/oh9vN
 x4phKyJAr80dnvnZwXzF3L/kCvmMC2w4NBEYQOD0oiEdpdzIQaFnqX23O2EHsBT7/Q8f
 ZzE2N1ynKNVP0mf6+qtmUEcTRvw9oPUtCmyeNoAB/xj8gyx+n5YUhVGrWPx7inVe3AMI
 8ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KhtgoDZLQcdddctuxNL94IkH0wF2YFhr3cZ6vXZZOCw=;
 b=oJSQtEiwvGMtvXzaI3JLFvbHNhSEz4IzJUJ2kGc8cDM5W+eKl8VQBA/llRAaYv/i9E
 pBa7QQKXlDal9Dejqgy11GAc1JDeLRLRCPlSUgsFWe5Ll1Y3Hx0yBmUO3HmRs2NENuyZ
 vb0cwCM/jmUXD0I4h7sLJuXoVM6WypDetHgP2FejsWRswUOOvEUMCED08i3JhAc++2+U
 dhICqilxQEmAya/Z5pwAkr5rs0WYjswwJmjqMuQiC3Am+iLwTNYDEbcgV0oe/X1ZbBUB
 HoTh4BFHWnq3s3BCpNGl8sbZTB/QjykWluVgO5xl8xZBXQsH378/KfZ1qyASd2qYiJjz
 7SvA==
X-Gm-Message-State: AOAM5327uGo7djfJRWdBpKTYvaYSL3yd0zayOW4YxPCFde7+ZTaOQhrY
 N2Iz8C9gAs/IbZt71EYxV0MlU2y539I=
X-Google-Smtp-Source: ABdhPJwX/ZV+AsLlpM4QaMIYzXa525D4B2c0R9LTzBsC1lNUJbQOZiT0K9gBDhq4mXIadRas3XBH2A==
X-Received: by 2002:a5d:618b:: with SMTP id j11mr17738280wru.161.1605906553317; 
 Fri, 20 Nov 2020 13:09:13 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f16sm6335737wrp.66.2020.11.20.13.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:09:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/26] target/mips: Rename dsp_helper.c as
 mod-mips-dsp_helper.c
Date: Fri, 20 Nov 2020 22:08:23 +0100
Message-Id: <20201120210844.2625602-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'MIPS DSP' is defined as a Module by MIPS, rename it as
mod-mips-dsp_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/{dsp_helper.c => mod-mips-dsp_helper.c} | 0
 target/mips/meson.build                             | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename target/mips/{dsp_helper.c => mod-mips-dsp_helper.c} (100%)

diff --git a/target/mips/dsp_helper.c b/target/mips/mod-mips-dsp_helper.c
similarity index 100%
rename from target/mips/dsp_helper.c
rename to target/mips/mod-mips-dsp_helper.c
diff --git a/target/mips/meson.build b/target/mips/meson.build
index f2b1b599abc..cc4677d94dc 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,12 +1,12 @@
 mips_ss = ss.source_set()
 mips_ss.add(files(
   'cpu.c',
-  'dsp_helper.c',
   'fpu_helper.c',
   'gdbstub.c',
   'helper.c',
   'lmmi_helper.c',
   'op_helper.c',
+  'mod-mips-dsp_helper.c',
   'mod-mips-msa_helper.c',
 
   'translate.c',
-- 
2.26.2


