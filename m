Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801257CB3F
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 19:59:05 +0200 (CEST)
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsssS-00042Y-NS
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 13:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42701)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hssrC-00027Q-Hr
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hssrB-0002ju-G7
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:46 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:36009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hssrB-0002jg-CJ
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:45 -0400
Received: by mail-yw1-xc41.google.com with SMTP id x67so23938905ywd.3
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 10:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3o9+fX6bvmdlKvFXmYUA/ZwiB71cbVH3l+l/0w4LH1I=;
 b=Hwn7uUBs86nuFt0WVbvYSjlxyaZ6qJw/NyRfavwoBdNM5xRKUPMwck1guY2p2yhl+s
 Iocu+fffFy3TnlDnarJOYUmwbwZAMyWziqrGI3+p0eOnLnp5x3zgqSoBYzA7vIydJkAU
 rpakzkD2vexeZMWbBb0UD0NOw2Io7ccWgCoye9y4F8EyfdytkvSwNfiXpw+kOb48VncD
 KNaYnmxmJ2Z0bIXyqVo3TeV9lv5oNY6FN/zLiWjMy76cBAnYw1mt1iGF/DSdWriDuoY+
 lMGgTd6po51tH9Fh64Wr0oWle0A4dTfQ4E9wb6lHY0XxEjrULBOGeFAFwZbZw7IIWhSz
 MS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3o9+fX6bvmdlKvFXmYUA/ZwiB71cbVH3l+l/0w4LH1I=;
 b=mqTMfBP3W8bubQ00YHPP9Q7Z4dLzdvGNOUFJVRK0fq0RGo9j7/lJxwss7c0wMQPR+P
 +g3AcHuDxDtOV94rTsA4oG9dKl5p6UYRFazSDJz2SkPlbaCaWpfuKDY+yK7pHX7lgZSp
 bO6ojshywdO8Aukn9lMjrAzPhONwwZZFwViTEJ7Kd4dvUWT8qR6JYubfyoby6Of/gHcm
 HR0GFI2f5M0M9L8YMt7l2RjwY70Cd+Cp4+pGM5l17bnlZOiK8kkVfT9rkr2Nk/5KKW6Q
 kynDttxitq9AEEUIY/w1t0dJ6vPZQ51Pn/cgTQmNsbVMUjGVsmOdqktzZqsC1xPKGv77
 R0VA==
X-Gm-Message-State: APjAAAXozU79w5gnfiDqgv3xU7w5hoQCySNQWKanwYjwbd6okWPawhFi
 kHVkufcQePSpYG+DRBllW0dRvrnk
X-Google-Smtp-Source: APXvYqyPA5+yYg28FuH3h+1x3OlAq0sMCeUFymkRkd6Rnz+CRV7hlQ2QTvo6dv6tNwxMESyuNxln9A==
X-Received: by 2002:a81:7805:: with SMTP id t5mr79579965ywc.312.1564595864806; 
 Wed, 31 Jul 2019 10:57:44 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id 206sm16077696ywk.44.2019.07.31.10.57.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:57:44 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 13:56:47 -0400
Message-Id: <20190731175702.4916-8-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175702.4916-1-jan.bobek@gmail.com>
References: <20190731175702.4916-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
Subject: [Qemu-devel] [RFC PATCH v1 07/22] target/i386: add vector register
 file alignment constraints
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jan Bobek <jan.bobek@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gvec operations require that all vectors be aligned on 16-byte
boundary; make sure the MM/XMM/YMM/ZMM register file is aligned as
neccessary.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8b3dc5533e..cb407b86ba 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1199,9 +1199,9 @@ typedef struct CPUX86State {
     float_status mmx_status; /* for 3DNow! float ops */
     float_status sse_status;
     uint32_t mxcsr;
-    ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32];
-    ZMMReg xmm_t0;
-    MMXReg mmx_t0;
+    ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32] QEMU_ALIGNED(16);
+    ZMMReg xmm_t0 QEMU_ALIGNED(16);
+    MMXReg mmx_t0 QEMU_ALIGNED(8);
 
     XMMReg ymmh_regs[CPU_NB_REGS];
 
-- 
2.20.1


