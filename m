Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8DC3BA0DB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:03:11 +0200 (CEST)
Received: from localhost ([::1]:45574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIp4-00024U-3f
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm3-0007XE-LG
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:03 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIly-0007dc-Sb
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:03 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso6319885wmj.4
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iGJQ8msv0c4qPlxkGc0kXqXXoB1jQ6nLw3c6yZ39hPU=;
 b=Dy0XAMYrK2iVgvqfHoH+KSzgi8h/UdR760Tw5XD8G+Bx0csAlKCOSBW8DOdJSk93iH
 AvG1hUv8zbVhai3LXtSbg+EP28n4v1owau/PcYSaU0xdqzepthhluWhw/6gTxWM3sbXz
 Zy8PsiUPonPyOVAiSNJHCm+FkksAIZVVdp4ylHJkkNZE9vRGRMF0/gp0LkHYWB+p/QTD
 HCJXt5qOzESRrlmjlxHDoVUKahDii1q9Gv/cQ0kQk9ZbN+7ifoCAtbSEIo8DqPjg2wiG
 jUuk2o+NSaejK/m9JUED5h/KeSkLwg39mUEHY9OeKqF5rkfa+kh+bIVezSzcwJsCpV5Y
 pq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iGJQ8msv0c4qPlxkGc0kXqXXoB1jQ6nLw3c6yZ39hPU=;
 b=VSi9Ezrr61MwomobN4MaRwfDIi1bDqmF/uCM1GoPj6TpFBazadxHLC7YUY9bpRMIhZ
 y7KPeYds75k93tKjdeKrnUoi21VdzmeWNMkDNGK1T00zsnkk34YiBxoV0xc0XqdL0ZLH
 D6a+yYqkAVDFj8fCsDUjg6aDUPh7ORd5Aop3dMSjDj4LHn7kOWZoLWWJOnWJdoic4WVN
 LsSNzPUdPDyUYxSPop0Tt0ko09xKQUU9BW8wQ2t9o4RretLPODsQPSAtqctLZMBrDxw9
 qHNkYyTlZFYjh56rDyRAZaO0EI1oeVJtY7Fa2mErkcYl7i6rGPRFRZKRw/Kp/JTzcZ7Q
 GVww==
X-Gm-Message-State: AOAM530+fricb4ltA7fd1D2KfhJv6oHiERVe9bLfnDS1uj6FuBbamS9r
 P8x/Rm337LQ0Qc3NfGUxdOSwB5ML1AJ6lmkC
X-Google-Smtp-Source: ABdhPJxsiSKk4uRT+LFDv5TnLiIP6BVzr5VTDdr6tEf18azQOaIy3y8BLWzrtAmDCtAmmON/4X3fnQ==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr5317887wma.126.1625230797631; 
 Fri, 02 Jul 2021 05:59:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.05.59.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:59:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/24] docs/system/arm: Add quanta-gbs-bmc reference
Date: Fri,  2 Jul 2021 13:59:32 +0100
Message-Id: <20210702125954.13247-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Patrick Venture <venture@google.com>

Add line item reference to quanta-gbs-bmc machine.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20210615192848.1065297-3-venture@google.com
[PMM: fixed underline Sphinx warning]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nuvoton.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index ca011bd4797..3cd2b2b18d8 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -1,5 +1,5 @@
-Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
-=====================================================
+Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
+================================================================
 
 The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
 designed to be used as Baseboard Management Controllers (BMCs) in various
@@ -18,6 +18,7 @@ segment. The following machines are based on this chip :
 The NPCM730 SoC has two Cortex-A9 cores and is targeted for Data Center and
 Hyperscale applications. The following machines are based on this chip :
 
+- ``quanta-gbs-bmc``    Quanta GBS server BMC
 - ``quanta-gsj``        Quanta GSJ server BMC
 
 There are also two more SoCs, NPCM710 and NPCM705, which are single-core
-- 
2.20.1


