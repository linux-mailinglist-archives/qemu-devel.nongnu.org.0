Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC301A10C3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 17:56:25 +0200 (CEST)
Received: from localhost ([::1]:49744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLqaO-0002r0-RG
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 11:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43733)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jLqVj-0003gS-G8
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jLqVi-0004Qc-I9
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35332)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jLqVi-0004Pu-B7
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:34 -0400
Received: by mail-wm1-x32e.google.com with SMTP id r26so2381427wmh.0
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 08:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtMP8ceKEL32RxJnzf/04PfZMF0AhqQhuzU8HQYfCC8=;
 b=LUi2JkXAP2knRV0g2mRSbykVlLamWHHX/kbUWBV/mEN7jTEPFQiyYyKpVEeK7YCdf6
 grn7xRdEYs6MdplFoMz7H+XWCnEfxEEARuEuEpCj16HUhxQEcX18zgAfk1wxXWFYUMfV
 05+icVClCIgaZEljagw9i3iolyowYBEs17ml+8JV4okd4RUMIUWQDb4NMFqzfGw3R9+P
 hWRLGheQqO+Q5fL+dT2P+bPoCoZGudokuLKzMF2CpmkWAojG5xlUI3Sy9KPd09dawu4y
 QYVIaAi5LPMWOjifGhXw7tAensV1ic5tzOc965UKIz5QEnsrc8C0niOOG5V3pVCpf8vo
 yb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtMP8ceKEL32RxJnzf/04PfZMF0AhqQhuzU8HQYfCC8=;
 b=MazbOi4uiYggiHaixLIHWEL5Q2JQacUv7F4ox+mQPM+z/0z2gYm86gStVNsMn+b1+r
 E7cnIJ7jQqzf91xm0UHUI52bL6qxPb34rGAl0I8AkkjfyKUVqgAV/Y8GP1GH90G2SIgE
 fVQCPE2RfPR5V9ixyjeDUXIIYpTntq/6utmNd+a+tQUdPgcR2ZY4NTQKqbpROzCuW/Jg
 7Kf5cMnu/4r0hHPuJlEbLiuHmRar+VQgRVa5sBTBWCliDCybM+Tv2THNBku3D5x9EkKq
 j0UYCfcYAitHkb98/WVFR31cJbS5MJhEGaLjHpkXQEqoeUVFmJRrgIGq8YSOVV23n+HH
 enUA==
X-Gm-Message-State: AGi0PuYDLR36Ho3bmQ8+/xOnqSvIvA16AxSed2nzYWKdHZWFDhp0QzFn
 0IzkAEA62w90GJpdSMzZHdg2L4mHJl4=
X-Google-Smtp-Source: APiQypLIuKFGNbkZC5FAL/L47KW6gQV7nBfU1FLVoPfcLdfke0Cj3DYzS7sgitjVMcAQ+EsuOJ/t5Q==
X-Received: by 2002:a1c:1fca:: with SMTP id f193mr2935310wmf.5.1586274693285; 
 Tue, 07 Apr 2020 08:51:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w15sm21898416wra.25.2020.04.07.08.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 08:51:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1F491FF96;
 Tue,  7 Apr 2020 16:51:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/13] softfloat: Fix BAD_SHIFT from normalizeFloatx80Subnormal
Date: Tue,  7 Apr 2020 16:51:13 +0100
Message-Id: <20200407155118.20139-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200407155118.20139-1-alex.bennee@linaro.org>
References: <20200407155118.20139-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32e
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

All other calls to normalize*Subnormal detect zero input before
the call -- this is the only outlier.  This case can happen with
+0.0 + +0.0 = +0.0 or -0.0 + -0.0 = -0.0, so return a zero of
the correct sign.

Reported-by: Coverity (CID 1421991)
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200327232042.10008-1-richard.henderson@linaro.org>
Message-Id: <20200403191150.863-8-alex.bennee@linaro.org>

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 301ce3b537b..ae6ba718540 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5856,6 +5856,9 @@ static floatx80 addFloatx80Sigs(floatx80 a, floatx80 b, flag zSign,
         zSig1 = 0;
         zSig0 = aSig + bSig;
         if ( aExp == 0 ) {
+            if (zSig0 == 0) {
+                return packFloatx80(zSign, 0, 0);
+            }
             normalizeFloatx80Subnormal( zSig0, &zExp, &zSig0 );
             goto roundAndPack;
         }
-- 
2.20.1


