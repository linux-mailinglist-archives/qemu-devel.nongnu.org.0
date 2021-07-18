Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7361E3CC929
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:49:15 +0200 (CEST)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56EM-0006gS-GZ
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bh-0003jh-Ib
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Be-0003UU-6r
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so8725298wmc.2
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k+agdHsoXkyN24SO9Mrx4Wx8U5Esci/uwWZVnp/Afsc=;
 b=Yk7Ya+uTuwtaWxXC6mp1w3nW+Shh2ieUbyKztgt2HxSEAV3oWPPV0zgFGF4nc8DJ80
 H2yAiBXO60Zr/h8F7EBdH0iYj205emmThLw5NRudS3ciJnbkDmPCY00CuTZFyyBKEkCq
 LxRLyA12qdRwmeFqtsyf086a+K2f9lt1aTGo2/weKergYboj7oy9Jd4EivtDU4nIGRur
 0G8DHqw0XpN2Xxk3ByQBGYXhyM9r0E16PS/Vg9/GjpJ7oyro/qFJb9h+sO0s3Y+Spogm
 auuTJZJWa7kA4md5OMkJcwoiBRhjnVObOIuASGTcZhNTc/ZtuexoG6tVmnDyThhVy2y0
 gzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k+agdHsoXkyN24SO9Mrx4Wx8U5Esci/uwWZVnp/Afsc=;
 b=gjld2IqX1VtsELOBGyMVk6eP1yuiWBs9hi+Zxz/WTnWWa4O6uwQ7hcYxUlO2IFZLX8
 csYJ+AABtvQPBK52uTGKfH0u201U29R487WfOMh9uKLSfOCHYdAIX1Qdhy9j7QT3NjTN
 IRieXdK4G+vuHcGo54CWo00uMTQgvOAiOnFy6WduMPaPtLXdDARXs2HuR5kzdodAQGXy
 yKcUGjAR8RUAuorTw/eoAh4EEnZ0KZ3F5W+972L0C2SGtGnLIdPn5wdalxkhtgLwg73Q
 BR/3MlK2DIbXNfka1qwf/5C1ghJ+bgwL0dEtw9mAdG00+4jsbliWvqvjLzdw354N7V6V
 +yeA==
X-Gm-Message-State: AOAM532KkrPZeRkiq410SwXbm6Nq3DXn50Q7L1xr0VfQnwN/qNAxtVnR
 6Cl9+zdpaLPw4tlsHmg65r+1dEKfZxRbOQ==
X-Google-Smtp-Source: ABdhPJxQ8JtZcrzlMaFbr63HVhIXFv5U5hsMdaHCCTvobIFgPB5IrPWcRSVkUVgZd3sAc4ZwNd8qjw==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr20922888wmj.43.1626612385004; 
 Sun, 18 Jul 2021 05:46:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] docs: Fix documentation Copyright date
Date: Sun, 18 Jul 2021 13:46:11 +0100
Message-Id: <20210718124621.13395-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

In commit 6d8980a38fa we updated the copyright string we present to
the user in -version output, About dialogs, etc, but we forgot that
the Sphinx manuals have a separate copyright string setting.  Update
that one too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210705095547.15790-2-peter.maydell@linaro.org
---
 docs/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/conf.py b/docs/conf.py
index 42729e22bbe..ff6e92c6e2e 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -87,7 +87,7 @@
 
 # General information about the project.
 project = u'QEMU'
-copyright = u'2020, The QEMU Project Developers'
+copyright = u'2021, The QEMU Project Developers'
 author = u'The QEMU Project Developers'
 
 # The version info for the project you're documenting, acts as replacement for
-- 
2.20.1


