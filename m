Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E28F2D59B5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:52:59 +0100 (CET)
Received: from localhost ([::1]:41800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKVG-00059O-2M
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQj-0001JT-6y
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:18 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:32926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQY-0006zm-Pt
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:16 -0500
Received: by mail-wm1-x329.google.com with SMTP id w206so2616817wma.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9tFafGIE7yPElctByswhUwlCG6jiOLsjyVbWG7y68lI=;
 b=w2a6bXLOynnXplGzwbbdCVezoca1IyI8eliLn+8zdHyXT8ysP68wYZUGWCGu4iSgdn
 iuCrC10NuRfjGRAvbZElmJbHHHtXOXmm1dlmSbk97wMkIwuNTkSJEHMslrCr31LdfgHL
 DIPOWrmtdULJutcnsuW26xtpCE0LEl9SgR6T0d2AOFZ7tdr8rEMcqtcA1mxjHQJggFHy
 x//AzR+iRfWayyCumix8wiu2r84dQiMqycH6Wwq6AavhFKAI3fM6+irJ6mw92DrteL+O
 /33eMjnQoukuyzgROR8F9XU+qbYwlkXqoyMLBXxAGwanB2ZoQ0LYEyPgkbGS7B/s5De7
 po7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9tFafGIE7yPElctByswhUwlCG6jiOLsjyVbWG7y68lI=;
 b=MNIcCiOWZoNSsDcytdhJk2tMI5skenHCWGkmmPuHIdyhN/S6BAPYjU1YuYkdw7YmKU
 JvsAM8OATvesNoz3J5MB9UlepYbDkXlOto7G6RaK0vYpnqU8DpSjyr8l1h7QIjb+T++3
 0gt4f79qQzze85c1pkUKuV014BkSUvszRbSnxZp+/Ywg/gl3KnpYgMierW8Dxh+WPxT3
 ayK6hpl5bhEwFRLn1/ItXi32JpyLC0moXhmJyQ5uxamCg8zncftjdBEO4YljkFw8MWRE
 RHtZRB90SktxV36Lhp/ceKGAZasiZ9bGLDrqcSiB+lHyMohpteVE7lt1pZ/qz1JQ0Fnu
 /+uQ==
X-Gm-Message-State: AOAM53002sMjmHQnHHuDldncoTdSm9s8zPmO3eAkWibTA/O4ZP6ZpAmA
 gwSbEDWq2trCjH7fbEP7txjxNh1ttqNcqg==
X-Google-Smtp-Source: ABdhPJzJYIVn8bZ7oMRmc6L3O3/hJXHOweh4bRGJogFstzpudeeZpo6SWFqQp8xa9+CmhrbLe6nG+g==
X-Received: by 2002:a1c:7f81:: with SMTP id a123mr7871367wmd.6.1607600885404; 
 Thu, 10 Dec 2020 03:48:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/36] MAINTAINERS: Add maintainer entry for Xilinx ZynqMP CAN
 controller
Date: Thu, 10 Dec 2020 11:47:25 +0000
Message-Id: <20201210114756.16501-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Message-id: 1605728926-352690-5-git-send-email-fnu.vikram@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41b..a83416d54c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1563,6 +1563,14 @@ F: hw/net/opencores_eth.c
 
 Devices
 -------
+Xilinx CAN
+M: Vikram Garhwal <fnu.vikram@xilinx.com>
+M: Francisco Iglesias <francisco.iglesias@xilinx.com>
+S: Maintained
+F: hw/net/can/xlnx-*
+F: include/hw/net/xlnx-*
+F: tests/qtest/xlnx-can-test*
+
 EDU
 M: Jiri Slaby <jslaby@suse.cz>
 S: Maintained
-- 
2.20.1


