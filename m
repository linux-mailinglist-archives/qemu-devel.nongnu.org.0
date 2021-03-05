Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A1132F1ED
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:56:03 +0100 (CET)
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEgE-0004QH-1E
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2z-0006Th-4P
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:29 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2r-0007PV-Lb
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:28 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d15so2899823wrv.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L4V8LK5YCgw/g+Fp/5WNXSYxAUHVILlCT+nflReBoes=;
 b=iibM8rnB34SN2+NeZheC6E8MCmH0ndO5HhshRzBlQyufz676DqStBnSvCAJFpOwDKl
 +XGSkT47ASZlY9/64KAiwTHE40V9QSSHg6DjnRjHhpEhW52pCtskOXjZIM7V7t4HWgDF
 DhVtu5iiY6bNQjlz+aHtLik8O5JGksyFkschwUJh8hcQWk6jG3DXWQFcqjPaUbpX+N89
 BIqAXhWEGIwZTIYm80FOlWOkCeGqSlscXs1wyzCS7iXbIpwncbmP/jbDIPryacFvVxXl
 pOeF+ChvpFrw92Puk5zQ++keZ4WcHf0RMzmNPSpQU/0epzJKvre10nTdkcM9RqVJcuwE
 kXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4V8LK5YCgw/g+Fp/5WNXSYxAUHVILlCT+nflReBoes=;
 b=qr67AUwThNXS3c3z4TA1QN+inTFw5SKjETLN+jAanefVxw0qBjkbUGKcA9SjVIlReo
 Kg9JREDvM2HqQQv8YsN+rslwT9JxbUYRaYSa4uaAmFfI+n+acMTRQPmpq7+DDxulwk3W
 jh6F3b6sMoi6aDuwK0Tw2052BrHmA0q5ibbqZ3Ua/6vGwkpaLoC90asiQ4J8QEZheAw6
 wFY6aIqE9js3aFsApXoULb0JLkoN4iBafea15P9UAXUQhad5htXTs3H33LoKXbuHxHw7
 dR5sEH9aLA40bWqJodDGQZI7KoqKOyX+aBpNnWiL3Wr8elVFSSHkBbn11/5MsqfwlLAU
 bzJg==
X-Gm-Message-State: AOAM531dFyYHjID40+nfA60C7HaXwdnIXIUPt++3fcYXWXwB+J53xBkO
 p7bDlD/BlBIuVe4g1q5yOrTgt03cVkJZoA==
X-Google-Smtp-Source: ABdhPJz7bLgl3m76gb/eTZw69rPq5JfxIiwEmlCIM/FnnFxvhNd95SN+BZxYNKLAZ69FgLDWtx9Iig==
X-Received: by 2002:a05:6000:181b:: with SMTP id
 m27mr10649266wrh.363.1614964518114; 
 Fri, 05 Mar 2021 09:15:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/49] sbsa-ref: remove cortex-a53 from list of supported cpus
Date: Fri,  5 Mar 2021 17:14:27 +0000
Message-Id: <20210305171515.1038-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Cortex-A53 supports 40bits of address space. sbsa-ref's memory starts
above this limit.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Leif Lindholm <leif@nuviainc.com>
Message-id: 20210216150122.3830863-2-marcin.juszkiewicz@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9f707351531..276243d122f 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -145,7 +145,6 @@ static const int sbsa_ref_irqmap[] = {
 };
 
 static const char * const valid_cpus[] = {
-    ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
 };
-- 
2.20.1


