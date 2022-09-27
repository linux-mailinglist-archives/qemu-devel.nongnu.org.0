Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169665EC504
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:54:55 +0200 (CEST)
Received: from localhost ([::1]:35742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odB2y-0003of-Ns
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1od9HH-0006m0-OL
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:01:33 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:37500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1od9HG-00085c-37
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:01:31 -0400
Received: by mail-lf1-x134.google.com with SMTP id k10so15353558lfm.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 05:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=wu5NZw4GYTu2UuCzrqMkUw7w/wvt4rVM3nGtb/ZJPO4=;
 b=QWjsVpYvu+sho+Q8PA4NRW9U8HBvcYREfJ8eK10Zll3cqUGlgojPIHgJZid148ak3H
 M58OMlPHknCdvZB1+1GhCOq2vq618vhy3gVm/6zXc70s8i2XqPwrzymKu5Aa630ThR2J
 nak1LpNHYawvP5xHfNIDqopTkDk37lj7Hc80oTgGPznxE/0TRqlugyMS+NlIEGvQ8qXO
 WQiKMGjYaoE8H8TAO9KCu5BsuVpaD9xhtJ4cMV/0MLqQJlgt23F+Dx787FoOenhogZLB
 JuJGL9ZfIfyI7IKtadxfBgQNPNgjDmSdUAJQFqXcMqiZJjEjmdADL78rTtLQZb1Triuo
 eQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=wu5NZw4GYTu2UuCzrqMkUw7w/wvt4rVM3nGtb/ZJPO4=;
 b=jhYH95bgqBHK7XgpmoT8yCY9P8ZSp/WJdm8tPaUrFVwh4k7Od9l71jam/1scmXnPLr
 F5ck5c9gLULEWEl9Bw2CTTqSk9wrfuS/6wFsrBcmj4ec96NdbqfUBBfhX36z0DhcVeRQ
 VCWSB8mvTzyNQUTzRt9OFoDp8hJqYnOU/yKQTdm4ayBWyE4NewvyVkRPuk+YJzgD8997
 L7KZeZWOmB3I89QKNotL3caQI8YWBulOuv3ht/mycZv932ur2zuugiA97Ek7W14KC45y
 aGv1x5v95SlKI6AFxfnfMe452XgooYrHGGO3GdzdpKQylruE+WfRmqeFepM+ndnpAaTM
 0bYA==
X-Gm-Message-State: ACrzQf2xotL+uBqawq+XBz8tIeBmd8mZf+YRXUu0X8RzWZdpJ8S6xibM
 pVzHlSIK/q7Oy3AnUYfbm8abBA==
X-Google-Smtp-Source: AMsMyM6t+ojzIR0J22p3kUBdKi6FxBZsovgdFXkdzH2B+AawN42jTcAYCd5zj9kc/HJWrE9SuABA8Q==
X-Received: by 2002:a05:6512:39d1:b0:49f:6084:4414 with SMTP id
 k17-20020a05651239d100b0049f60844414mr11744973lfu.195.1664280086220; 
 Tue, 27 Sep 2022 05:01:26 -0700 (PDT)
Received: from jerome-XPS-13-9310.localdomain (82-64-249-211.subs.proxad.net.
 [82.64.249.211]) by smtp.gmail.com with ESMTPSA id
 t18-20020a192d52000000b004917a30c82bsm143543lft.153.2022.09.27.05.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 05:01:25 -0700 (PDT)
From: Jerome Forissier <jerome.forissier@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH] target/arm: mark SP_EL1 with ARM_CP_EL3_NO_EL2_KEEP
Date: Tue, 27 Sep 2022 14:00:58 +0200
Message-Id: <20220927120058.670901-1-jerome.forissier@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=jerome.forissier@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SP_EL1 must be kept when EL3 is present but EL2 is not. Therefore mark
it with ARM_CP_EL3_NO_EL2_KEEP.

Fixes: 696ba3771894 ("target/arm: Handle cpreg registration for missing EL")
Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a..328d252a84 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4971,7 +4971,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, sp_el[0]) },
     { .name = "SP_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_ALIAS,
+      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_KEEP,
       .fieldoffset = offsetof(CPUARMState, sp_el[1]) },
     { .name = "SPSel", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,
-- 
2.34.1


