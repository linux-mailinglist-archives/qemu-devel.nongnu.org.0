Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1379249FCF9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:39:14 +0100 (CET)
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTLE-0008OH-Rq
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:39:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD5-0002Ad-QN
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:52 -0500
Received: from [2a00:1450:4864:20::42d] (port=33702
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTCy-0006Of-94
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e8so11669227wrc.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZNnZDqeQIZsXjI5eh6hH5Tfs41f7lyoF3ePnV7zlOMg=;
 b=smNfrSSGt1dyqMkIop5Ca7nzsMvB+xJV+YlApFQO8tHYWLzoIHbhiCUFsei0/i+MrH
 XkVHWSYOMcRv0DL6lq1/3bY5p11TMi7JSO3G5BGJ4D9z5LU14E81XrK0WYMKQEyhpExT
 tfsFxX907zuNSL3XZarX//AIb78l6LqJwbiI6zvWopcFRoaatAy0ecvHMQPyDKSQPg7F
 bVxVNOmIgzD02kzdBffwLxm1oJ74cgCO2WvVzMsf1WAC1RtxTdY2jyQLHt5hVcIfFkT/
 1kMODicXaAeb7g9QT1UCSAc8/8McKoN4asTjevG/tSpG43LzZllLcgvX9uJB24Ft4owY
 Gpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZNnZDqeQIZsXjI5eh6hH5Tfs41f7lyoF3ePnV7zlOMg=;
 b=BEUQxpThvnQWqpbJODVq4yAixCz3H8PM7oJHCK4yiaAdnc+acv6Cf/+D2xNqZCBl6H
 6MCWR2fad5EN0cPqQvYjVXoC3jWfzL110kzk+PAFMMeScDLlEMLN9uzBR1zFkr7FxdRu
 JLE1h/ww2v9PeE/trhvMF9ltSS0tmRMSfRcOfq9bS5BQ0tqYh8r+4vKlmpuMHqJCFrjp
 JpzM0k/LtMfQhfFfSYoM/ti4ZLu50WwVxg8yd/DJKDtEPEPd6NJhMBjAh/mh5pEnqOwF
 SeWZswlwuCypfZklPB+GFV2LpLmUi7YKfVroE3IbKR+5NaHnD/c5Xo5i9XY+GDmZXY3X
 3fjw==
X-Gm-Message-State: AOAM530CtGiYZb1KUwnI/QPayi6aPdmrUIYcfl363aFF27oVZCf0U5cm
 j41P5Wc5pxpZyqT6FRNGzBjvZNPecVPgrA==
X-Google-Smtp-Source: ABdhPJxq47GcOgWmv6eRpZfQMLYGxOVk20Obdd9vDFNrTB1U2+BqJ6uB/RASrQ3OoE45wpDNGO9bIA==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr7894139wry.585.1643383824223; 
 Fri, 28 Jan 2022 07:30:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/32] include/hw/dma/xlnx_csu_dma: Add in missing includes in
 the header
Date: Fri, 28 Jan 2022 15:29:45 +0000
Message-Id: <20220128153009.2467560-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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

From: Francisco Iglesias <francisco.iglesias@xilinx.com>

Add in the missing includes in the header for being able to build the DMA
model when reusing it.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20220121161141.14389-5-francisco.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/dma/xlnx_csu_dma.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 9e9dc551e99..28806628b10 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -21,6 +21,11 @@
 #ifndef XLNX_CSU_DMA_H
 #define XLNX_CSU_DMA_H
 
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "hw/ptimer.h"
+#include "hw/stream.h"
+
 #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
 
 #define XLNX_CSU_DMA_R_MAX (0x2c / 4)
-- 
2.25.1


