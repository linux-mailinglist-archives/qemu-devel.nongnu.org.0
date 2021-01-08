Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B0E2EF7BB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:53:57 +0100 (CET)
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwtY-0004ED-3M
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrg-00024g-Jd
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:00 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrd-0000t8-TV
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:00 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 91so9969585wrj.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E6mZPiQraiTh4Bg0YyL1OAnwyrTn4m3pw4jIvmfgdr8=;
 b=OJtJfz2cno5qxT9BC/EfF1BoMXPJV/wgmu3AliPwQcl5NOwQ8v19EwpX0Rw2IWjnza
 D9akoSh28WwyLxMt1qbJKIKD1rswYXBddIaeQoojzGjJ3mcafi/p191MezPgw/pqpnMy
 aqhVOf6cfgwB5I5vZKCcRMmJb6XFOotPYV21BrOrE1l3arg0OMltz7uSzp3xwmIzuheC
 FMOihFoj4osKVy7PbkJViSUB264+2WlqBPH8n5iWfyx8eDpmmjTPUSAwCZgEjxALZJYJ
 QqLt1UJ+6soELKCmN14DDMe5nu7sZeqczdkgOJ1yZafAR8R17mMLop+MLJx2A0jcUByS
 bcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E6mZPiQraiTh4Bg0YyL1OAnwyrTn4m3pw4jIvmfgdr8=;
 b=avvv6dO+E/L8v/yuTRosN4n3mu0fRqWTxpY4zN6SVEvPOyrlLrjUIucVDWDNoNIWob
 Mb3cRG462ke5mMzUvPRJF5SrDPmc8r7qTte0hj9mjkIMO0EsnCCwmL2M8KQUtIgjjRFW
 4Nb9qF7r51t8meAHBPV/UMho+7DFbCa7VdJYLoie84QFdfcjH4am104lqjUSlYu9xfcw
 cJ6aOCyeKa4PmodHd9nnz/ue+MlRsbVY3Xq07wyw96Ze5o3LTtnVd30UwJsjLU+nRDlC
 ilIypIhqWfO1UXzWiVPxVeg/isV8wDMD2KLrb4pp1J+8FR673MxmmCj3IzcZ2eQ76oEe
 4rIg==
X-Gm-Message-State: AOAM533laiZoRdq7mLXf/+eiMmz7tzFvy6s+4p1DwEev23/z2visZ+ur
 lHxD4UXTu7dCdQOMeB4t24NjhTIVWk7q23ATQ2aRGwpOJ2mgC4eKdYDI2EJdEiDqb0XXswAQChU
 czGUwmwQAkW80lILzVT+5y6tInKBW4c4qiX1JWknTAlDjbUhkc7dM7nlEUf+KFmTtmeTb7g==
X-Google-Smtp-Source: ABdhPJxloU63I2rkd2m8M+5YYjgCB64+oQ5QRSDFapKBOcG26ZuE+fJxXbu/dy3V7mHlVF7lUiWHew==
X-Received: by 2002:adf:f6cc:: with SMTP id y12mr4967155wrp.35.1610131916364; 
 Fri, 08 Jan 2021 10:51:56 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:55 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] target/arm: fix typo in cpu.h ID_AA64PFR1 field name
Date: Fri,  8 Jan 2021 18:51:49 +0000
Message-Id: <20210108185154.8108-2-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SBSS -> SSBS

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..5e3cf77ec7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1883,7 +1883,7 @@ FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
-FIELD(ID_AA64PFR1, SBSS, 4, 4)
+FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
 
-- 
2.20.1


