Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7C243C137
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:17:20 +0200 (CEST)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaNL-0006sg-9n
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaKd-0004ZZ-RO
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:14:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaKb-0003gt-Uk
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:14:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id v127so1323367wme.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 21:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6p9wgcKfR0t2hwbkxjequxw5eKglvbzU5WuQXJcXH+I=;
 b=F7rlS3R9ulW7DpCxVf/F0g2SV04h0ojmcyMHYDcUD1Y1gGq+PDrBLBp2S2HkpQNZR4
 3NNDgeo0pRiWBQOit28kN2bnlXJ8aSVYlfFG37Ub6jbqqNwtRv5YhWYyt5qEpmRrK/nK
 NE/Is4LFyKQmcxASCvw+vbj1OOezhhCOLaucoDdreRimMqQB1sUjPW6eBFiIm+sK8GCX
 YNQS2fKyW/v/cGTPSnflmGpGLiFeUrXzdc++w+U/lSm0RVO0QFsWAeofaKET7ainvvx/
 UG9FVdcPyb0UFfVHNheesupzUvZFZLx70y6/xlpbx+0L3iBJwcwFEJ0NxMaKTUgsgTRt
 xh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6p9wgcKfR0t2hwbkxjequxw5eKglvbzU5WuQXJcXH+I=;
 b=y2NAOzDWmHognfIhl8NGE7oLzg1U47EtpzsK7xHzFGqGsepstMGzV2lvPOZgk93spE
 pMR27/l0vIDK23aK53LUmOam2nZe5XV6W9pz1379Oh9eXrm+BGK9LYAH7W8DXcP0vVjJ
 boSbHPyETr54Aj5kajGL/0Ht6JNwISljY2ogexFYdPQKfOeJqlncAj1jic0l5XSiXHR4
 Pf6g3uUbVESVu9m7CDV9O130YnIxDg9uPBd7vE5xLoMepILQDjAkPQS836PSUE4Mpx5R
 i1sxvFZfSEYZ2YM1YHnaVTbukufCqcEZ3PnAS81RitqhvmXSqzZEaCrj2Vn4WGwODWSU
 g54w==
X-Gm-Message-State: AOAM533LphONoQfTxC65O0xWH9AJTRqcKn/Jul6v945fB66Aj/3M0n9w
 wT+B4H8LSKQ+i/JhUq2OQ3N0+70LYuQ=
X-Google-Smtp-Source: ABdhPJys/i+IUV2kwCmW0F2NSjMylBmbZffJpZHt+V8mxn8tdgN6BL+764AuUDtLyx9QG2ZWjHe4HQ==
X-Received: by 2002:a1c:29c2:: with SMTP id p185mr3144618wmp.43.1635308068632; 
 Tue, 26 Oct 2021 21:14:28 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x7sm2090678wmi.43.2021.10.26.21.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:14:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] MAINTAINERS: Add entries to cover MIPS CPS / GIC
 hardware
Date: Wed, 27 Oct 2021 06:14:14 +0200
Message-Id: <20211027041416.1237433-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027041416.1237433-1-f4bug@amsat.org>
References: <20211027041416.1237433-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIPS CPS and GIC models are unrelated to the TCG frontend.
Move them as new sections under the 'Devices' group.

Cc: Paul Burton <paulburton@kernel.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5369fe2a129..62a37aa94b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -239,14 +239,8 @@ F: target/mips/
 F: configs/devices/mips*/*
 F: disas/mips.c
 F: docs/system/cpu-models-mips.rst.inc
-F: hw/intc/mips_gic.c
 F: hw/mips/
-F: hw/misc/mips_*
-F: hw/timer/mips_gictimer.c
-F: include/hw/intc/mips_gic.h
 F: include/hw/mips/
-F: include/hw/misc/mips_*
-F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 
 MIPS TCG CPUs (nanoMIPS ISA)
@@ -2270,6 +2264,20 @@ S: Odd Fixes
 F: hw/intc/openpic.c
 F: include/hw/ppc/openpic.h
 
+MIPS CPS
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Odd Fixes
+F: hw/misc/mips_*
+F: include/hw/misc/mips_*
+
+MIPS GIC
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Odd Fixes
+F: hw/intc/mips_gic.c
+F: hw/timer/mips_gictimer.c
+F: include/hw/intc/mips_gic.h
+F: include/hw/timer/mips_gictimer.h
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.31.1


