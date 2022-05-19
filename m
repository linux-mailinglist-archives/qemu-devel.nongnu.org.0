Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A552DBA3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:47:28 +0200 (CEST)
Received: from localhost ([::1]:49956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkFD-0007xK-2j
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5H-0006LF-1U
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5F-0000qV-GV
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id k26so3287566wms.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oBDjhrpGMhR2z79//kfK50qDWOF/ekZ8L6UpCnRNBpM=;
 b=DDU44fJ6lK5Ug8qYN5ULQt7qcoz5+U4ylK/XKZf0/S5BJCXAZjlyaPl9//JNso+WbP
 9WfBRwmnDddNxqeJxg3EF8hbb3A47WeLtpXkCVaCMfrqRcA9wd/CEPG9LmZfzn40bUwa
 3ydsvxzHWRtpJJi0gGoxxC6ZZSBSOH42I3f9EXNxQ6xpRfdHxbaaZWbYknIt3sTn7mps
 FYQrWXOveRtBH82SATKeL/NwLx+BrvNwxBVvcMakmyou7fmAMcfDXobCy67EmfTy4fJC
 aFqxL04MrNiTsL3U44qWik/gIMCUeEOHDUu6kaJh57+dGp7y2J4028ZB9+/y5BfjBRaI
 4uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oBDjhrpGMhR2z79//kfK50qDWOF/ekZ8L6UpCnRNBpM=;
 b=jw9cYbsKp9uL5GmOALxjH1g0wC6yk9O7p0YjF/KRC9CmZVxF9AI4UnHQN6vo9mI94x
 H3m+VeppX00jGntQgcoU1bKHIV+qicFe9Cw0XFwbNxELbviO7R3HamydCHTQTx7MY6H1
 m+u7w6x/cxkYim5TgtpBINMnS30hCHogjJo3MAiSJvsTO+jXW3XMDsoat1s49BJzKrAW
 FKRXkGZa/RLG8I3+kC9sKE/UZVIlaywGzaHpirJ9xhhhdCcLpr36bMSs3+VtyCjC424P
 GDAHjNh/nCC2DE0W0EOE8IG2VvagX13uTOJ9Xbf8KPEG/okdpSC9b8BOStw2601IzaKl
 EwwQ==
X-Gm-Message-State: AOAM532A9GcVq2xW8nbYGYCHnAeD2aYCo4/qEY/2eejK+Cy+Q17B+793
 rjA4UHIRZi0gZQpOVkqiV0hGI1ie5RaLAg==
X-Google-Smtp-Source: ABdhPJx2IMeOfMtY9np3IiRhXvzgzDZB9k+l0P64C0qYXlxfB5XZlMjwyO6V3Ib9dhhmdi6H8q0fqw==
X-Received: by 2002:a05:600c:4f52:b0:394:61af:a168 with SMTP id
 m18-20020a05600c4f5200b0039461afa168mr5277158wmq.114.1652981828542; 
 Thu, 19 May 2022 10:37:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/22] hw/arm/virt: Drop #size-cells and #address-cells from
 gpio-keys dtb node
Date: Thu, 19 May 2022 18:36:47 +0100
Message-Id: <20220519173651.399295-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The virt board generates a gpio-keys node in the dtb, but it
incorrectly gives this node #size-cells and #address-cells
properties. If you dump the dtb with 'machine dumpdtb=file.dtb'
and run it through dtc, dtc will warn about this:

Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Remove the bogus properties.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220513131316.4081539-3-peter.maydell@linaro.org
---
 hw/arm/virt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 587e885a98c..097238faa7a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -925,8 +925,6 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
 
     qemu_fdt_add_subnode(fdt, "/gpio-keys");
     qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
-    qemu_fdt_setprop_cell(fdt, "/gpio-keys", "#size-cells", 0);
-    qemu_fdt_setprop_cell(fdt, "/gpio-keys", "#address-cells", 1);
 
     qemu_fdt_add_subnode(fdt, "/gpio-keys/poweroff");
     qemu_fdt_setprop_string(fdt, "/gpio-keys/poweroff",
-- 
2.25.1


