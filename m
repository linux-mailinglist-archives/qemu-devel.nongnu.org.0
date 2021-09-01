Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A890F3FD87E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:12:42 +0200 (CEST)
Received: from localhost ([::1]:44490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOAb-0006Xm-P5
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcZ-0007Cr-0X
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:32 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcR-0005xv-Ul
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id q11so3716033wrr.9
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Q5pqQLnCswODdqUl/t5tCfNALYIC/vCIVqmbDLDjpMY=;
 b=p9rUr7x7EZTUy51D0lHJrH2nJfz7zadRGrGs3kTVGco3aeCIp6HLiflY7ZZzvMJajN
 ZQ4zKhW70KXZUFv1/ALnj3qTG/SIh4JG0fiO//qK5DjoQ2tjM4rH69cUR0UQvKQEm5UN
 39OliiJHZBTPa/nSO/+cLejyQc80uN8ggoR/JPp5xV5hEQSlANP8ascZ8PNNEl4dn9bo
 thvfYt+RzweIlpUH04kCDn7temCnzmnlUA79SocGmF5sg4MqWK2TNANS/PXvo1d8ygWY
 Hdzckq+MBVnuCTkJjKa9qC8IWyDcT9ZTmZCEd65ZADJHPWhqXpgulXEzv9q2Xp1IDCYe
 sM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5pqQLnCswODdqUl/t5tCfNALYIC/vCIVqmbDLDjpMY=;
 b=fYA8T6GjL1f0GO20RGJ3qpC36PctPbr7N0wqWJkAqVpdoJr7KSze+6Us3cydcwfKxg
 Jp3e9U3m+OKoKuDpgiHrafkKXt6yBdUpnfVwJMxgL2xzf/2nX3nnS8SVHa6V/uQz4Udr
 tZPvHsyvWShapkwHxXFeEEEng7B1m4fO+4EiHrLZT1+XU5gsJseXW+CHJTV35HOvLtq8
 2uvMpGYT5MHXj4blVFn2xUmXQFW6g5N5Pu3XP9j41dEMOcZhFXQRdk6wRRdKK5rlwnbB
 2TuKlZExazRDAsVRTP1u01aL+n4/Q7VGnGE/q4anIUWDmj3wj7lMfkK7R4HJ0f7C3ojp
 uU8A==
X-Gm-Message-State: AOAM5338dAKepTedoY4hfutfAoziN0oQ+wf0G8/v2xyV5hljpVp3/KLn
 +VSr7YPhYEQ+tEVGfib6RYIhGcVptDawdw==
X-Google-Smtp-Source: ABdhPJzNWU/XfsHd08nrd1nX1HyaywrS4pB4KwUzG26uEB5LKBWIetuRTze7uUE6cXvrCFk2Nsr+Eg==
X-Received: by 2002:adf:e809:: with SMTP id o9mr36901324wrm.425.1630492642585; 
 Wed, 01 Sep 2021 03:37:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/51] hw/arm/stm32vldiscovery: Delete trailing blank line
Date: Wed,  1 Sep 2021 11:36:42 +0100
Message-Id: <20210901103653.13435-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Delete the trailing blank line at the end of the source file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-15-peter.maydell@linaro.org
---
 hw/arm/stm32vldiscovery.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index 07e401a818d..9b79004703b 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -65,4 +65,3 @@ static void stm32vldiscovery_machine_init(MachineClass *mc)
 }
 
 DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
-
-- 
2.20.1


