Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E330F64
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 15:57:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWi1z-0000XY-Go
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 09:57:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWhoz-0007f9-CK
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWhoy-0000dS-Cv
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:43:49 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWhoy-0000d4-7w
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:43:48 -0400
Received: by mail-oi1-x243.google.com with SMTP id b21so3779943oic.8
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gloJ+8rW9WKJEh40VUZKHrYM42QYGddhU2f4AmbnBwc=;
	b=Da9ocMcqfejffvZ8qQs6Vvo3EvWTNoXWSXGD5WSK5tKY1gLgIQOv4spkds7Owo4gWZ
	1Ui7/dRFCQWaEe2BROm+xmOClmmDI9GEjvjcDu4PwQxFrQ3otLo97jvnWAFYTfDS+XyQ
	aaE/rzh7ROWMvg1ZgaV8BjAA7jMm0GiIuZtAu0+vo8tHNWidx92He9GLkhmutdBhTGvV
	NU3GAIh7MdYJuZ7oZxqiJB6QkzrioeHktRZhEjD1/xQYiQ/KGETVMCeRvvkvhATjBnxY
	JX3JM0+Tj/sRIvB+ofRtNS9QuHX08yFVeDQMSVgl5Bf1LOsoe/DtgvNZlXc7roWIHeLc
	48uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gloJ+8rW9WKJEh40VUZKHrYM42QYGddhU2f4AmbnBwc=;
	b=i03kpPe/EYD5mswFcCEaclRfYGYVePTUi83h4D96pDys3pBVsobq0PjsHLlj7Ar+ru
	8AXH8wvRkwYuaCr1HHswU8hEwtxup0g3ehWGnBN9E6fpvc3zs1kPo0nhjwmK8xttijFF
	qQbKyqNWLJxW3X2pzsVINAln36LUhmPZao7vLMfw1bwk0neOpwEnWsdFnvr7+IF3Kw5A
	KEAe1sAR+WuRM4o7dIa+WVmdtf9LF1OVYZOXhfd/FNq0gszdzD20dQpIkQazOWqd1cem
	S3DsTWPzWRcy71CV0Vv3JPD5Z0I3VXeqrB98FYKuYT1aAO4QYXF1bOnaX6toeYNDlLNJ
	sq7g==
X-Gm-Message-State: APjAAAVW6pWoempaCNC0K5qbtZ3YUuiEdSriJMtsOlz5p+4Xux+SXrQX
	xqXSDHKlNoSH28gfpnDOcXzIsrsIO+llOw==
X-Google-Smtp-Source: APXvYqxg5L/A1CIlmssLiA5HB2gO6J+3+y4U+kPtzy/wDWbQ30Nx8CSz6KCvbQlBWT991KGfZd3/lQ==
X-Received: by 2002:aca:e50d:: with SMTP id c13mr2212055oih.42.1559310227471; 
	Fri, 31 May 2019 06:43:47 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168]) by smtp.gmail.com with ESMTPSA id
	r23sm2391176otg.49.2019.05.31.06.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 06:43:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 08:43:12 -0500
Message-Id: <20190531134315.4109-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531134315.4109-1-richard.henderson@linaro.org>
References: <20190531134315.4109-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: [Qemu-devel] [PATCH v16 20/23] target/rx: Use prt_ldmi for XCHG_mr
 disassembly
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: philmd@redhat.com, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that the ld == 3 case handled by prt_ldmi is decoded as
XCHG_rr and cannot appear here.

Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/disas.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/rx/disas.c b/target/rx/disas.c
index 515b365528..db10385fd0 100644
--- a/target/rx/disas.c
+++ b/target/rx/disas.c
@@ -366,13 +366,7 @@ static bool trans_XCHG_rr(DisasContext *ctx, arg_XCHG_rr *a)
 /* xchg dsp[rs].<mi>,rd */
 static bool trans_XCHG_mr(DisasContext *ctx, arg_XCHG_mr *a)
 {
-    static const char msize[][4] = {
-        "b", "w", "l", "ub", "uw",
-    };
-    char dsp[8];
-
-    rx_index_addr(ctx, dsp, a->ld, a->mi);
-    prt("xchg\t%s[r%d].%s, r%d", dsp, a->rs, msize[a->mi], a->rd);
+    prt_ldmi(ctx, "xchg", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
-- 
2.17.1


