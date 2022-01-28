Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835F749FDE9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:23:10 +0100 (CET)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDU1j-0006Od-SB
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:23:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDD-0002B2-Bq
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: from [2a00:1450:4864:20::336] (port=41518
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD4-0006Pn-1H
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:49 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so4325563wme.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iBHQOpZOmYstj+pi68lc9e07pXmprbTTnrIKiNAgDtE=;
 b=IdfcuW3YwNFIXhVrduoh/Ky5YbA/ilHhFasr+rnU4l62hgBwfQ/l/50BOQIuNPpkIt
 eS6Vfjz7adoEpNQFvS+gI/QRZZoCMwDm4KNwPvdZDq95xWx/qFntTyvrD2Bzq1XEBzU+
 ZERX52ca0k0cLuvOQgbqMzyjJ1AgBZbBdMiIwXXGi31A7ojrkiM6Jyp96nK+YELejgsf
 0lB5nunEk8EFRLhcQ0gbHFze2t0UzAcjTS+fWq/xE4Kd8oG+RBQxv/V110FMNTC7zOzD
 6kqyGxaselIy0fa+vKMvELhPIAwyksJb8gLx51QOHM0q22YkT0PKemJKF3g0Dll5TA8K
 SXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iBHQOpZOmYstj+pi68lc9e07pXmprbTTnrIKiNAgDtE=;
 b=vOE9BK/WTPSqhHLb/9MFe7VV/SO9usTxyEk+RNE70HYqXxToUddn8p3Dmd76v6oCkG
 mVICPCdD5dvBAsnelWRR0k8riv15U/AdUK27FqOHbvRYa+m5ZNYc694Rt9EhDwHrtguo
 aURH7fCdiKduLtdledZfOadqgpWOaMQyXm1+3Ep0Y8XRdKuoVe+vGGoEi2iSlid97NEC
 PaXi/XYp3mvrof7pNr/JXYspjGCqZ5tqBYLdAZ0MXDQVlASSXB2bzA1JXy9EeKxOejpS
 qVpnVDThcM2iXA6Y+/Ht+IoBfJ0PHx3zZx92XD7fU/8QcaYuyvhHCv/2j4B88wrhYRG+
 wdHQ==
X-Gm-Message-State: AOAM532XI7z7IuMi+QP98Y/KD84W3QjpP8yI3vc2vjEpJA/fkrnjULMS
 p2AZuwnpm1bifV8lvSH5CZDGYZjVGt9gEg==
X-Google-Smtp-Source: ABdhPJzBWyk/8Aei1AfBqG2S+TxBfp/RpXq1KpbPfdpepBshUEMbOIEaaE1+b9T7MP1ROUfJ7jfD7g==
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr7978756wmq.122.1643383830018; 
 Fri, 28 Jan 2022 07:30:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/32] MAINTAINERS: Add an entry for Xilinx Versal OSPI
Date: Fri, 28 Jan 2022 15:29:51 +0000
Message-Id: <20220128153009.2467560-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

List myself as maintainer for the Xilinx Versal OSPI controller.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220121161141.14389-11-francisco.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b3a4bcdf4..6797a270e4e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -958,6 +958,12 @@ F: hw/display/dpcd.c
 F: include/hw/display/dpcd.h
 F: docs/system/arm/xlnx-versal-virt.rst
 
+Xilinx Versal OSPI
+M: Francisco Iglesias <francisco.iglesias@xilinx.com>
+S: Maintained
+F: hw/ssi/xlnx-versal-ospi.c
+F: include/hw/ssi/xlnx-versal-ospi.h
+
 ARM ACPI Subsystem
 M: Shannon Zhao <shannon.zhaosl@gmail.com>
 L: qemu-arm@nongnu.org
-- 
2.25.1


