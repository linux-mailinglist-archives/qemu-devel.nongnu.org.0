Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2249FDE5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:19:45 +0100 (CET)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTyS-0003lh-Ew
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:19:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDJ-0002Dc-NJ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:03 -0500
Received: from [2a00:1450:4864:20::42a] (port=37872
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDE-0006Pv-IV
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w11so11579064wra.4
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4IotcbgfgVJfdN6t+JQbwn7fCUsCHP2X7DpaVZ7V1H4=;
 b=HPnC4Etfk9GSloyjrfgzro4HQXVCZy9n2zWw2NOLDS0YAev4sN1vlTQUKDU0UJgJn2
 PMIXf5NcgTZ05RsnRuzNhEyg5GNMW7SL0aMwNtLe2c1sey2nDZJ/zkvQ5zwNNMUqdj/t
 g8lvab0QzB/JruQj4BK6SeWsz7M2OLa851yCOlQg3hbn7gc3zKKiaXCImT1Ox5N8pEWv
 D9Wj7+OB2MfntJwn34mfdnc2eXsK1vExPzzQzToqL0w3ksonunbVKpN853ncgR7c1TJi
 XlhU2UI2gae2GA10WCuGeMJ3cnsgs3MutW/QZCWBKN88Ftbn9i7Ffa1Jhr4IgxuGkjYu
 ejgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4IotcbgfgVJfdN6t+JQbwn7fCUsCHP2X7DpaVZ7V1H4=;
 b=bKJsTjtIJTJcXaKMroCtXgkcH75iNP4b9l1Xb6gdT66DfpMYXhKWGzNGvBHfrpmHf/
 a2WEIaiOzZvTIWdZKt8iLfxTo1fR9gEcUxl3cn60tyjdiF+syhGl5HbrucDKveQS8w8y
 e6e/AhYw0lzFk4kw6CFkW/aLCcKhWklBdQ3cWq3tsg5CPd7yHfyljcLkV5ApVhmZ6wSB
 vVMs4TFcQPzdJMpX5fdikQDpuKYvHedlb6JPL6z8kte+CkiIx5WrnMeGDveHbcffLvKD
 4QHFbyu9CaAnuVv9yEmrcEzCxEsBp9/iAK4AiIR/eXAIn4zdG/LPA84P4EtiBP4cYtBR
 cKMQ==
X-Gm-Message-State: AOAM531BwWWSaKpE3xjMqgDwDkK3j9uP6GtqUd+/bsbdtOCtky7bsQ8p
 +Klqw0wWl1SoHefxnoOKX0bGpHb71ls6IQ==
X-Google-Smtp-Source: ABdhPJyJCFFq25Mr1nE0xM04nRX97UKg/Ioz9eTr1DpoS466NNM103AHLDLzJMwnQpJ4nSc2WE6WHA==
X-Received: by 2002:a5d:6b48:: with SMTP id x8mr7673074wrw.86.1643383830684;
 Fri, 28 Jan 2022 07:30:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/32] MAINTAINERS: Remove myself (for raspi).
Date: Fri, 28 Jan 2022 15:29:52 +0000
Message-Id: <20220128153009.2467560-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

From: Andrew Baumann <Andrew.Baumann@microsoft.com>

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
Message-id: MW4PR21MB1940E8BB52F4053C943B1FCD9E219@MW4PR21MB1940.namprd21.prod.outlook.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6797a270e4e..b43344fa98c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -818,7 +818,6 @@ F: docs/system/arm/palm.rst
 
 Raspberry Pi
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Andrew Baumann <Andrew.Baumann@microsoft.com>
 R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
-- 
2.25.1


