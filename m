Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EABB4CB132
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:22:57 +0100 (CET)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWQy-0003NW-DH
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:22:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxr-0005rn-Uj
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:53 -0500
Received: from [2a00:1450:4864:20::431] (port=40931
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxq-0008P1-4n
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id n14so4683950wrq.7
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GGAK7LeYb7Sg1wWh/ohAGGWT9a5QRy3Af01VtMkcT+c=;
 b=Pvhb2gzlUtTu05nadRJS0ZJjs36rL+2f2Fhv3hUzbdJIA3vHFu7wUknJpeOzIrxlT2
 N4eyGdsUrtzTD/EoOO+Fe2E7bFHIxUrWH3Gcvm/GhDCsto3IL0DLA7IsVlSnAeUXTOin
 qm9wsRW1GBJ1ZteIp55OV5QtTlizguEWbOvXcqu0w1+evoqpkuFW1SlkO7JkdrqGbjfE
 fclo9qE6bBlKKZhRSm5CpL9Jk6fMhoQ8vaUoPbQp+DiQYBPSTX8WXgY6pfdcksO9vXvX
 jA42NnFhZbQJJnQi/egHSISZ8AqLXEJTtn76yHADOFSINduu5MLzgk0Ep7EfZsMcKdED
 6pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGAK7LeYb7Sg1wWh/ohAGGWT9a5QRy3Af01VtMkcT+c=;
 b=qFE6Vk1QaanChkgDqrXhrjyW363S/2hjLpCr15Ct0XjySBLsPsVWxGDeJdnWWTiDNM
 T067XkGzqIkYc6GLJ5ozzj/MVC3WkugaRjhl3VOX5kRZ5vIRtZi2NEd+nZCovN3EuExd
 9kxI/VZtdY1/GiZ9IINo3NsMLvpBYYJB8GYcDWx/VCw/wPf0SB29LORLRjB41zPf1VF1
 jShikK+egGc+n7iVqskO9WVEzGr502i62ZpKIpFGYbg1it3QZynwG7JPb4l8+ekLYupZ
 faE+3Ug3XXqoT5qlEDJOxOv1fD0JQJC3aKhIhk4nQ+VEhCFvEJiNutJtbZqr1jsWyde2
 oSRQ==
X-Gm-Message-State: AOAM5306diBANQQAld0V1Se14mgGvJhiPliJMesiyKMqS9QckJqccjfU
 /ZLvITmMJf4L+tVEeatQ3JpmBEIOZvCo1g==
X-Google-Smtp-Source: ABdhPJxSij4wqMFUTXQrEJzC933ZZEXeWP6uGSsXKI7tl/91MMs3pg51RZJgGZi42jgvS4VLggrjeg==
X-Received: by 2002:adf:8b58:0:b0:1f0:241e:9b51 with SMTP id
 v24-20020adf8b58000000b001f0241e9b51mr4874252wra.539.1646254368393; 
 Wed, 02 Mar 2022 12:52:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/26] target/arm: Extend arm_fi_to_lfsc to level -1
Date: Wed,  2 Mar 2022 20:52:22 +0000
Message-Id: <20220302205230.2122390-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

From: Richard Henderson <richard.henderson@linaro.org>

With FEAT_LPA2, rather than introducing translation level 4,
we introduce level -1, below the current level 0.  Extend
arm_fi_to_lfsc to handle these faults.

Assert that this new translation level does not leak into
fault types for which it is not defined, which allows some
masking of fi->level to be removed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3d3d41ba2b7..00af41d7925 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -462,28 +462,51 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_None:
         return 0;
     case ARMFault_AddressSize:
-        fsc = fi->level & 3;
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b101001;
+        } else {
+            fsc = fi->level;
+        }
         break;
     case ARMFault_AccessFlag:
-        fsc = (fi->level & 3) | (0x2 << 2);
+        assert(fi->level >= 0 && fi->level <= 3);
+        fsc = 0b001000 | fi->level;
         break;
     case ARMFault_Permission:
-        fsc = (fi->level & 3) | (0x3 << 2);
+        assert(fi->level >= 0 && fi->level <= 3);
+        fsc = 0b001100 | fi->level;
         break;
     case ARMFault_Translation:
-        fsc = (fi->level & 3) | (0x1 << 2);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b101011;
+        } else {
+            fsc = 0b000100 | fi->level;
+        }
         break;
     case ARMFault_SyncExternal:
         fsc = 0x10 | (fi->ea << 12);
         break;
     case ARMFault_SyncExternalOnWalk:
-        fsc = (fi->level & 3) | (0x5 << 2) | (fi->ea << 12);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b010011;
+        } else {
+            fsc = 0b010100 | fi->level;
+        }
+        fsc |= fi->ea << 12;
         break;
     case ARMFault_SyncParity:
         fsc = 0x18;
         break;
     case ARMFault_SyncParityOnWalk:
-        fsc = (fi->level & 3) | (0x7 << 2);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b011011;
+        } else {
+            fsc = 0b011100 | fi->level;
+        }
         break;
     case ARMFault_AsyncParity:
         fsc = 0x19;
-- 
2.25.1


