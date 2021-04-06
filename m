Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E75E355408
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:36:02 +0200 (CEST)
Received: from localhost ([::1]:47356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTkw5-00041k-D3
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTknn-0005AE-Fy
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:28 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTkn5-0005oV-Hg
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:25 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso9214477wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BYKj7J054b8SN4HG90SqNpzGjVv+DUotzg8W421Gheo=;
 b=gVosqMZbAG3/8T+5wVJHmwo2cAKUXR/bI97Hn9xYK/xKgFN8bpY80qRtuo+vuiut9u
 bgqdF0FYb3STvEVErnozlNX+00mwNz/QfLWwnumzsIXv9KHISAb9gVUlHDZz5SmwNof4
 qjrnGhgj/XeYOEBZPArjoF7bIvs0Sk+Rla4pKffPuJA+82PbTE21QwEjYLQ/YynPt15m
 UAWAEA/2BxbzSevNkUl4KMSXHE6sOshjgOLd/Xxn8rerGwQj2hRgjs43rccsxzlHuiIV
 0PyIKZQt0lzINjDZaEhRkgBDcfTTGap+j+K3ke22BJsehFnuKvrya29JyCmKX7RBpCBz
 pTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BYKj7J054b8SN4HG90SqNpzGjVv+DUotzg8W421Gheo=;
 b=VpazVmh3zSx12nrLITIofqh5eSBxsyN15LnFGTGnWJy2stRpMQ0LD12NxAvaap9b/e
 bKYy8fq5qDmQB25KtFfMMY+ZTNiOwBj1vy6LPATcwDQDq6VfqIiOybBGHEaeVVg6FJnt
 LL3PEflWIzBARzU4+WTWaVcHbbP83LDei9ZOPjSEu3uNGliVeoZqlWeWf4/TLPOk4IVa
 I5+as2rWO8X3uPH2kkFsyUZIZynKDFlIpUZ5PY6YMc60ryCRCqTLiBwxGSoBAQybBWxQ
 GR6wZWG9d/QN3/dgpfl60z8klCRWoKYMjb5HRRiWvEOkXzAx9TidmODX8S3mLSbdnE+s
 i30w==
X-Gm-Message-State: AOAM533aRSzyCDFHirnH+yroorMhRonsbf02XFqOeHcLJFEBsu2TZd19
 1ezDfj5IPvX96A5GU4PVg8GniLveLy9ykmfC
X-Google-Smtp-Source: ABdhPJzzzNZAx2nmgUy5zFeXBaA6hl4E8P4Q8ClREPbIcJJnoIxQC3Jg1Q5fJKYrSoFioNwewoIskg==
X-Received: by 2002:a1c:7519:: with SMTP id o25mr3817915wmc.35.1617712002028; 
 Tue, 06 Apr 2021 05:26:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l6sm31160252wrt.56.2021.04.06.05.26.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 05:26:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] Remove myself as i.mx31 maintainer
Date: Tue,  6 Apr 2021 13:26:35 +0100
Message-Id: <20210406122635.28268-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406122635.28268-1-peter.maydell@linaro.org>
References: <20210406122635.28268-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Chubb, Peter (Data61, Eveleigh)" <Peter.Chubb@data61.csiro.au>

Remove Peter Chubb as i/MX31 maintainer.

I'm leaving my current job and will no longer have access to the
hardware to test or maintain this port.

Signed-off-by: Peter Chubb <peter.chubb@data61.csiro.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69003cdc3c9..58f342108e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -688,7 +688,6 @@ F: include/hw/misc/imx25_ccm.h
 F: include/hw/watchdog/wdt_imx2.h
 
 i.MX31 (kzm)
-M: Peter Chubb <peter.chubb@nicta.com.au>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
-- 
2.20.1


