Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517EA32F209
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:01:43 +0100 (CET)
Received: from localhost ([::1]:56084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIElh-0003HU-Vw
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE30-0006XN-TW
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:30 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2r-0007QL-MM
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id d11so2891704wrj.7
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cFirMclf9eSRM4MK4x6xqKJAImFHlSzQ7o0HXqeAb74=;
 b=syjgrDUlbYZVxO/J45feUjrtJrSnQpMpcbGt058Be1AoLaqEIhLTwORPL42+7VGqrw
 m9KkTmvVzvvZ0ZoF9jxzHYnzOAGy7v8Vov3gFw42tvQJgU5s8ec4228AEMexIIGOFX2i
 kvCWEqe9XtGWYLK1H4aHkqF9X0d8VEE/te9kJpkWlLpC++AKnhiZN5Bmbi9ky3SZcRf6
 Xg7WAKWFv7YR0QTqOsKheMbijt6nXfiXKx+Q63but1XfQgFrRqoFc4phJuE1nILnCnGa
 IHvMfsS3z1N71INPyng6zuKwRYUo0dIoR3iRjVUjLELSq8qr2VeUjUJr1wTqeyhdAgQP
 mhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cFirMclf9eSRM4MK4x6xqKJAImFHlSzQ7o0HXqeAb74=;
 b=RyjxkkLoNKQB1c0VKnXk3SfmT3YbnpPFNAZ6XHk1XfhnAMxEMROTWIEXsXn3WdnOYJ
 YOBe6zSQls7XvtuG3oct1UiI9hCnqHd1W/cmptG8Wxh2RixEMwcAXBdRH+59OCZIEt/f
 QxWSIFuJE35Xxdu3hf2y158UerlOlVqT70krtGrRu5yfP3pnWzwafIcnuhvMDDmHFSux
 5Gchxkn8z6D8TYd7D8tNZJVMVZyqAPzu5vN0lATeATExsElzweslZ/vMfptvZRChE3wA
 ip3lZT1QAPKWnUXL2Z94eX3cMEV/43TcA8ZrAKLxV/2tMkU3qHK4ZzK81H7lilvme9Uo
 Z8mQ==
X-Gm-Message-State: AOAM530lIvOfTKboVoV9GlLNjtImVfQX40F3QAsK0rEpe/yMvUSGNlZS
 UFr4lLeqwqV2xuemsYzXKN1jYOrz1exvmQ==
X-Google-Smtp-Source: ABdhPJz+iJ7e7BlfVe/450C1dapnyFiDHu6gy6UuBoWRkyhify+AKIHXZewUE8Yf5J+r/DV4lRqHIQ==
X-Received: by 2002:adf:a3d3:: with SMTP id m19mr10709383wrb.24.1614964518713; 
 Fri, 05 Mar 2021 09:15:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/49] sbsa-ref: add 'max' to list of allowed cpus
Date: Fri,  5 Mar 2021 17:14:28 +0000
Message-Id: <20210305171515.1038-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Let add 'max' cpu while work goes on adding newer CPU types than
Cortex-A72. This allows us to check SVE etc support.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Acked-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210216150122.3830863-3-marcin.juszkiewicz@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 276243d122f..88dfb2284c1 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -147,6 +147,7 @@ static const int sbsa_ref_irqmap[] = {
 static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("max"),
 };
 
 static bool cpu_type_valid(const char *cpu)
-- 
2.20.1


