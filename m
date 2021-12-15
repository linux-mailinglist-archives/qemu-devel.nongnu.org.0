Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53520475770
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:11:47 +0100 (CET)
Received: from localhost ([::1]:41542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSCI-00013q-Dr
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:11:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiW-0006gP-Vg
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:01 -0500
Received: from [2a00:1450:4864:20::42d] (port=43845
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiQ-0008PW-6J
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:40:59 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v11so37332136wrw.10
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UBBDqlYIm8PMy/t/5ZURYCoEvCyggC0aUTjUZpv2NTw=;
 b=m+HatviBv1aRGYETezXyn8O5LOWkFDstvb2Mi35WtmNKcV0XG+/+TNv9eAsz7FS8Pw
 qdAxG8Sy30qURJTimbtwOBUk1QT8C9rI/dSz0c3UT+8lwGFyK5ObncQInFGQorUOga9q
 Zf7ypCdWHnxCLJ6fhFSqQCKZLUpVwMoJ5R0dFw/SleR3q9ar8ROouwhRNiXgNMEXT+mJ
 h0sXW2zAUjqrJprWzEt0CVq1QIekNL7xdMvkKIx6hXg2OyiAmpn3u7qbt9rEneM8szX8
 7Va8Zsm3Es9vi4rcH1HWehAYL8xc4aop9cWrJaHNSETG75/rLa3YIRfDD3uLs0Hu4YEZ
 bTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UBBDqlYIm8PMy/t/5ZURYCoEvCyggC0aUTjUZpv2NTw=;
 b=nn1I2VruIV4zqcyykyrPpPmsCNDvkCH1T4m+PIk0tc+ackMuPKQWJBBnE7zQL9Krki
 w0Zm/I6PDg5ev7mCS7mgh4p+zgosZI1YZTMnj/SwtCbNQzphEE7tCpvLFpm0Ona6hzW+
 B2D+wZi/rPGLdgnAdl8rWtb3cPet3VKaOZE6fNenIOnPjwTgsc/Vzew2nTtk7wlHZ8O6
 kgat2Ssb5GugaQZvLkEmN0L/kDOFBmbbxPe4Pa9dswTd2NC6qvuDQ1pWlFbBJd/wFCSk
 KdvA0sLU/tywOXJCAPWmW88OAm0tG3k51tLiB8U8I0y5PvUUfMyG1sBUpZ45iO0PbyBk
 YfAA==
X-Gm-Message-State: AOAM533XevLbqZXeT5UfAgtpgX9PV/VQySsRexvSMT/PqY6yPepFgHrp
 OCA5EUlZe+9CJJ2ldBJsaMeFuIO3w3KihQ==
X-Google-Smtp-Source: ABdhPJz1yegV7M2aO9Nism/Gni86Ejm1wlGqjormS47iPSRcqlUM6fipNqqCaWzW1iwaT10xWzH0cg==
X-Received: by 2002:a5d:4646:: with SMTP id j6mr3700848wrs.485.1639564852906; 
 Wed, 15 Dec 2021 02:40:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/33] docs: aspeed: Update OpenBMC image URL
Date: Wed, 15 Dec 2021 10:40:19 +0000
Message-Id: <20211215104049.2030475-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Joel Stanley <joel@jms.id.au>

This is the latest URL for the OpenBMC CI. The old URL still works, but
redirects.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Message-id: 20211117065752.330632-3-joel@jms.id.au
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/aspeed.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 41a9bd5608e..b87697fcf0b 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -82,7 +82,7 @@ The Aspeed machines can be started using the ``-kernel`` option to
 load a Linux kernel or from a firmware. Images can be downloaded from
 the OpenBMC jenkins :
 
-   https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/distro=ubuntu,label=docker-builder
+   https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/
 
 or directly from the OpenBMC GitHub release repository :
 
-- 
2.25.1


