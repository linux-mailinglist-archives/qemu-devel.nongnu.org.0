Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F77BF7833
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 16:58:36 +0100 (CET)
Received: from localhost ([::1]:54284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUC5L-0002rx-81
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 10:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iUC30-0001A1-Rf
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:56:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iUC2z-0007pI-PM
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:56:10 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40888)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iUC2z-0007p0-Jc
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:56:09 -0500
Received: by mail-wm1-x332.google.com with SMTP id f3so13707073wmc.5
 for <qemu-devel@nongnu.org>; Mon, 11 Nov 2019 07:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=REMnX+2x23NiXL7Q08ldBQTb6K5qxaPpwmomMZezfiU=;
 b=i7TddB5KvxiNQ+MyYWi2TeIbEuaz3JU0K00t7q3WvC5XZQu7UPLsXRX+xHsA7cdeYP
 v3ML/p8lAMzPmH7CZQ6XZmFqdHMtEzCq/BesorqvXeRsqyYYy5YCiNLCQiOu0lq3T29u
 weuqtji2ATTzn4JDPx3Lcz1ZNO5wIqim1YqVBQvAviUq+c6ZctPsyhEDpWK9Z5sjiBo/
 0cM8cFUu000MH0N73QeXf5OPcA9121aAXBu9zOubFcUXReiq/mOhEewwkaxnk+hOgB60
 +RyBs31bTCNIUEhuUGl0BwKNRpGZhC7vLXli6Kel/Qa29q3N1NcnDl+bmrQ1P8wpsoeN
 l1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=REMnX+2x23NiXL7Q08ldBQTb6K5qxaPpwmomMZezfiU=;
 b=MJhh1dCiw4Kfm0E4s4YPvIdyZeanxIS2vyZlV/diqsHzB9pMzzBV4VQMWAJQio8HcQ
 4JiHo1DDU++agxyk/ForHHFg5cmP1NczR6DK1WnkLG1MyrnBzg3IzadzOdnGzCtvoZ7S
 TmKV72BDtBf3QVlJ5e7vn5Mp+cQtdPsPkBcaDYg0cmDkoBuiaVC7W0wwlmS9dUSlN4C/
 q19mdDl5clGkKaoMdOpboF2lE6mUVu9MzCR/WCn9Pxqa7SivMwXq38Scg2bPd3zEtDSW
 N6lupGIfE+rN/k8DAcAyi4F7iThiQmxxpSi3dDJNEm3KLk+xpd8stGkbmBoDdwbDf+vu
 6IZA==
X-Gm-Message-State: APjAAAWM5rt/EsEtYcTXuzykCOrG8WZ4U7QJF+FPu9joRQSeQUaIu6sg
 8SXTXmsnSTVADzuSB9zuzFBwWvaGwPV/DA==
X-Google-Smtp-Source: APXvYqyiK3iCC/aDf3G27kRfwTdVl0gdCr8OjSmUhiTsNOsgHCXAnePMRWW+RL+OWVIlWfvS9LG98w==
X-Received: by 2002:a05:600c:214b:: with SMTP id
 v11mr22088101wml.149.1573487768353; 
 Mon, 11 Nov 2019 07:56:08 -0800 (PST)
Received: from localhost.localdomain
 (199.red-79-149-206.dynamicip.rima-tde.net. [79.149.206.199])
 by smtp.gmail.com with ESMTPSA id f19sm30023156wrf.23.2019.11.11.07.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 07:56:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] tcg/ppc/tcg-target.opc.h: Add copyright/license
Date: Mon, 11 Nov 2019 16:55:50 +0100
Message-Id: <20191111155551.13885-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191111155551.13885-1-richard.henderson@linaro.org>
References: <20191111155551.13885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Add the copyright/license boilerplate for tcg/i386/tcg-target.opc.h.
This file has had only two commits, 4b06c216826b7e4 and
d9897efa1fd3174ec, both by a Linaro engineer.
The license is MIT, since that's what the rest of tcg/ppc/ is.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20191025155848.17362-4-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.opc.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tcg/ppc/tcg-target.opc.h b/tcg/ppc/tcg-target.opc.h
index db24a11987..1373f77e82 100644
--- a/tcg/ppc/tcg-target.opc.h
+++ b/tcg/ppc/tcg-target.opc.h
@@ -1,4 +1,24 @@
 /*
+ * Copyright (c) 2019 Linaro Limited
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ *
  * Target-specific opcodes for host vector expansion.  These will be
  * emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
  * consider these to be UNSPEC with names.
-- 
2.17.1


