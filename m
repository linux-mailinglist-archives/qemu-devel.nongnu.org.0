Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282554BD8AB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:49:17 +0100 (CET)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5Jk-0003R9-92
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:49:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zL-0007xx-2p
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:11 -0500
Received: from [2a00:1450:4864:20::335] (port=37401
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zJ-0000zm-Gk
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:10 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p14-20020a05600c1d8e00b0037f881182a8so899809wms.2
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ohvqOffcepW7CtlFg3ZQ+s1HR00RGP932N5zAI3tYFM=;
 b=K64WrwKYAlEvYlJaxl9/Xft/Nwcwpd4Y4yk6dj/MrJaKpqHGI1FF6kTVdqGS3Un7DK
 ILkF3U/9V0MwXNzJBX6CiLaIx7J/W5LLvNNhG2pew+/+36kUPtNx+tfktnYL7ZhRjfNc
 G/l9dYchBpssbtR9AbA9KR28F5xAfoSxiWZ5XLUtgXgLQNnRfELjM5QrUblHffkLn36E
 cBzaa+9mGiOXy39iKa5t6OklqlPNPfpOOI4V82bESTxLn3D3ux1QobSi+M9lzaw64oyN
 E12HrTAsom8B1L9CiZgboGEGu1l6fhYk36eBEB5zrMSMzapHpZNtmskAP38R4pueyEOK
 ciIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ohvqOffcepW7CtlFg3ZQ+s1HR00RGP932N5zAI3tYFM=;
 b=ClDsx64GEqdoG36K20jDYVF5v382tNJBNlB5uuB1hyYhrAFdnkdho8PDfqhul+rb4K
 3lKLv5aC8Bi4TJ7jFN0WIZRg8SiuVY5nZQbwMSfOxwLIjTs9cidF8nWtZag+EgfULSvX
 +MVMVXzTigA5qVsJYVaFuXL4dPOGNI1+00NELWmnAZNKnXTOn1dR1aSuidZdBCRtlt6p
 eSQH8RT67Sp2I1rgp0eqozx4SU/ZQ7jQ4wcpdEEbqYr1hmdCl3lerLF1l9Nd+QoM5DKP
 HtM/+CPacPkH+x3e8JPUicIJlfoewQOpLdOFCRtOw0PhJEm4s+gETP14HxLbmUf+2V6M
 Zs+g==
X-Gm-Message-State: AOAM533zX+iasDcQcuTDMfhfsGESPD2bj30+zETRaLpvoiuqtjMRCJs2
 axml+YD+/0du5Pa43e8kMkMBAg6uQlq2BA==
X-Google-Smtp-Source: ABdhPJy5vI0FeXFmtRF9pj4egFf7b8ovxN3vZ/pEqxn5pu61+/2f4Z33YNyaGOf0JgNmQuJsDZSf8g==
X-Received: by 2002:a05:600c:1f15:b0:34f:e3cc:334b with SMTP id
 bd21-20020a05600c1f1500b0034fe3cc334bmr17301331wmb.0.1645435687668; 
 Mon, 21 Feb 2022 01:28:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/26] checkpatch: Ensure that TypeInfos are const
Date: Mon, 21 Feb 2022 09:27:40 +0000
Message-Id: <20220221092800.404870-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Now that all static TypeInfo instances are declared const, prevent that
new non-const instances are created.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220117145805.173070-3-shentey@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5e501110601..ddd8148d87e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2882,6 +2882,7 @@ sub process {
 				SCSIBusInfo|
 				SCSIReqOps|
 				Spice[A-Z][a-zA-Z0-9]*Interface|
+				TypeInfo|
 				USBDesc[A-Z][a-zA-Z0-9]*|
 				VhostOps|
 				VMStateDescription|
-- 
2.25.1


