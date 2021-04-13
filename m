Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FE035E393
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:14:38 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLgS-0004lX-T6
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaX-0006ND-8w
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaR-0006w1-34
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so11011168wma.3
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5ISJxGiSEndrQPbaMd1tRW88KFlIeWIQwxD419HUNGo=;
 b=qhbhKrJY7mePxxUGTOJ/zvpsXCMkA03r9BorTj11FUiQDxq5KOllgGmcs6vtYHWpkX
 o7kG+y/AbN3OEbZhNh/wIC/5/ykZypwgfDPNpwP/yg+sEnkPTCTQ/8KIAuF+5z4HMC50
 77X+4fqh3lXkZOQzqLkTV9attckN789b5iG0RQvIsM1js5u190NscsM3c7PI/+n/uJsk
 3BFbY9QdOP44MZBpE/hnRReNfbxdpSZTgvKKKf+qSKitFZhGHmJPOgHW5FagE/1vo6qw
 Sb4FVW4Z/nd39zsX8waLkwLXFOUIzV454Vp6kjhSkFu9PxOeuG8zj+HI9b+8NmJwYhW2
 Xa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ISJxGiSEndrQPbaMd1tRW88KFlIeWIQwxD419HUNGo=;
 b=LKuayd5D/jszOU08LsmiShSYaSXnCV+cJn97JJzixht7mgvLwTX/9tnCHNTatPEzGy
 zGdIJUd3volAmY40iEOPzNK7ZmWrev9xZzDhx3oeDvkDeqOUihsrIsvJdZDDsBPfaQ7f
 0RNoPH+MdNvIvdyL5/gBJKYYI2LAeS+V+ef7SqstuvuS0R7s2EXTff/sKCfn4wDB/ghw
 uiSLH1LHY+4zjVLXYPDQccNiiwI/Hl08+B5CK0G2zvnzZKib820Vf7wsegfyjfdPKfxK
 9339t/kCtVc1pArZZ7RIxITwpKWcGpwXirYAi2rzY9Zh2qPhORPl0DuMB09UrwcvUH4m
 9AmQ==
X-Gm-Message-State: AOAM532u0pmUAQUfO9XHCxyZZnxh16RgXD4aAzvzR/VR7NypUAMAy7/o
 AsCbM31kDMzSOF0VpPBJYX2wcsNNi8I5gbmq
X-Google-Smtp-Source: ABdhPJzyj7ZwGYif+Ov0wXGawfd/nrlmcJ9sO80Bf3hfFQHqq4+rbX0BfSO/r7BXTtVDYBofKawKcw==
X-Received: by 2002:a7b:c204:: with SMTP id x4mr753841wmi.136.1618330100224;
 Tue, 13 Apr 2021 09:08:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/13] target/arm: Delete unused typedef
Date: Tue, 13 Apr 2021 17:07:56 +0100
Message-Id: <20210413160759.5917-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

The VFPGenFixPointFn typedef is unused; delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5eece97584d..7439c56d34b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -69,8 +69,6 @@ static const char * const regnames[] =
 /* Function prototypes for gen_ functions calling Neon helpers.  */
 typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
                                  TCGv_i32, TCGv_i32);
-/* Function prototypes for gen_ functions for fix point conversions */
-typedef void VFPGenFixPointFn(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_ptr);
 
 /* initialize TCG globals.  */
 void arm_translate_init(void)
-- 
2.20.1


