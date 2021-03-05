Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A84C32F22E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:10:16 +0100 (CET)
Received: from localhost ([::1]:56818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEtz-00077y-F7
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3F-0006nR-Al
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2y-0007UO-RU
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n22so2103909wmc.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+FcdgO7wR6ZyZs1bTLfEQvEn7Xz/mn6HsEDhBloa3QU=;
 b=hTX9i75p4PlcHOhTS/jQ3pJS0fp0t53B6XX+agJJ5VpK4iRCojbJOsUX+JK2tJGlG3
 BPu9dkaysYCZJsaosqKQRJy8e46lJEBhgc2x5hP52/r3mkLgzuasxYcpdlYKLGnACCoX
 o4WokRMRvb4u4hFPNaWXhb13o/n8Y5Z5meGa4uK9T4iXt9gnmGJqZy0KqnaNw962qvGB
 fSt3pyNmUa/Z+OANy/u+3uPIdbPPpqCloeH4nd69OWFEFmRlyM1Dz0fsPeJTxeBn3XXv
 2KkrfwjQD544SCww2bmr/f81/hyqpK3d27RmYTLIIAavnflHG0p+FIbHtSJBxSKl3QG7
 OpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+FcdgO7wR6ZyZs1bTLfEQvEn7Xz/mn6HsEDhBloa3QU=;
 b=HA9QqW8TdjMXTu67SBK5J/tIkkPhnrphgNjiqq/3Q4h3hB8GB8Xsw2OLEi/tt1wZom
 arGm0MonlIHWuERG5bQEHiy6CtjfMrDbc1yJMXTBY2jsemccxzAsVhpP5yEsRbqDyhUa
 v7huyR22+9xydQpROKGfYlGq0gdRMPYz2SF4wRvSNfF70uvd2oQl6MZpNKzq4b1G9h7v
 uRBYzAI00MdAtMQEBa7D3ZByWeDZdBz66OxrupINiwiEwjb+vRKiLclvPpVnfPh3ntL2
 sYLIpGMWJ7h49TLugszf4l7H27bTMHQVQAb1iTtScd1Q+caEYnIXOgIQLMmJQVFImPX3
 jMXQ==
X-Gm-Message-State: AOAM5327051xTw2j2Z3ySva2ryoOAh8F4JJFt0xvRMlOb3vbJk+yLIeT
 9qs/1X/rDoK7d+13DSv3Mcu7jJ8jKqqwvA==
X-Google-Smtp-Source: ABdhPJyVW5gh67rEA0xc0HMDpCnzaxk0bczawV/v7AE2VwPjUYXb2jX96VktH/IJkFQ9qfvFgVDRJg==
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr10007901wmc.74.1614964524862; 
 Fri, 05 Mar 2021 09:15:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/49] hw/arm/xlnx-zynqmp: Remove obsolete 'has_rpu' property
Date: Fri,  5 Mar 2021 17:14:35 +0000
Message-Id: <20210305171515.1038-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We hint the 'has_rpu' property is no longer required since commit
6908ec448b4 ("xlnx-zynqmp: Properly support the smp command line
option") which was released in QEMU v2.11.0.

Beside, this device is marked 'user_creatable = false', so the
only thing that could be setting the property is the board code
that creates the device.

Since the property is not user-facing, we can remove it without
going through the deprecation process.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210219144350.1979905-1-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h | 2 --
 hw/arm/xlnx-zynqmp.c         | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 6f45387a173..0678b419a23 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -115,8 +115,6 @@ struct XlnxZynqMPState {
     bool secure;
     /* Has the ARM Virtualization extensions?  */
     bool virt;
-    /* Has the RPU subsystem?  */
-    bool has_rpu;
 
     /* CAN bus. */
     CanBusState *canbus[XLNX_ZYNQMP_NUM_CAN];
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 881847255b4..46030c1ef81 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -443,11 +443,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (s->has_rpu) {
-        info_report("The 'has_rpu' property is no longer required, to use the "
-                    "RPUs just use -smp 6.");
-    }
-
     xlnx_zynqmp_create_rpu(ms, s, boot_cpu, &err);
     if (err) {
         error_propagate(errp, err);
@@ -646,7 +641,6 @@ static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
     DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
     DEFINE_PROP_BOOL("virtualization", XlnxZynqMPState, virt, false),
-    DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
     DEFINE_PROP_LINK("ddr-ram", XlnxZynqMPState, ddr_ram, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_LINK("canbus0", XlnxZynqMPState, canbus[0], TYPE_CAN_BUS,
-- 
2.20.1


