Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE856D1497
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:02:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39J-0003DQ-ME; Thu, 30 Mar 2023 21:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <39zAmZAcKChoAECBE386EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--komlodi.bounces.google.com>)
 id 1pi39G-0003Ca-Cr
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:46 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <39zAmZAcKChoAECBE386EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--komlodi.bounces.google.com>)
 id 1pi39E-0006ak-R8
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:46 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 e8-20020a17090a118800b0023d35ae431eso6451063pja.8
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224503;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=AZsj2vydlw7mk9QHWSB9x4ES09S7xgBJDZMjBvkZxZw=;
 b=Qp9t8wQsxgKhL9aUaOJeSBGeLiyBeW6cU9nKajR8VrQ/p0i6gmGNLDufRbr7YCUvve
 6OAVztFE1cuRBF6qabTp1jg8infZKrUhzKF12/k7x2idIkSCTgP9x88Z0kBSjqM5jbxu
 mBgabLN/8ctsQ5c2StPxSyEqbMMBh1jYr78svZJ7xwz3+rFCnEcW/Ja5qcOXxxzKqeu8
 dZNQ/h8T9P7R/hD8lTru3YJo3ErXN/IS5F/BS6qDkna/VVWsB9DmPPFuYvZGEYifd5AJ
 UaMCcYraN4HCIlJ0p/pg72egVo/Wbw0TwzLQmI26Uxm0oIm6/TAF7Osa1WefOtQxBAf2
 PgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224503;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AZsj2vydlw7mk9QHWSB9x4ES09S7xgBJDZMjBvkZxZw=;
 b=vcdCr5Pi7jO7Qka+fNX0Gfe44+c1axyiins/4iJumHmBhaWKATFuVLauI5RbxQyKee
 e1Ch+Sh6Hz3Iti34oXOaVctxIXtmCPIj1SN7+xJjrKEAz2U9vq4oMiNwVseJKWz4GZrV
 8DcTML9plCLCBNsZcmcGGcOCU+SRGcZ7eNq5sw6tEz+p7kqdE7lHxaodf4FJDKTwoflX
 Fwt9eUZ6vk2XwaHVz3yFccFcV7vnxEMq/psqlkkJWTGcpe4zcaPs+JQaPWPnRqa3T1Nv
 WzOr2xAyXYWcnN7VzsW3f2CLEpcAT/Is723vrOX1Nh++Kmq+f/2hocQSK4LDVJK854xm
 ZrIw==
X-Gm-Message-State: AAQBX9cdRF9/Ms+eD+0HJpE2QEsoWHj/gyqiScqpgoJXjJg0BW5uEZoX
 gKyVk24w1r3Bk7jUSVa36YE674XTqLDem4Zg0GHEhrocvLNs/d099X5llHhvqOZpOToK8N1/BBf
 +WCd1VaTOGWSbvU/9knTEBnjtVn34drEsvZQdZmnoSeIogaGT6H3QnlYC3JdaMB8=
X-Google-Smtp-Source: AKy350ZV4ik+pdcMtdbO43eYqD8ZjMKcpieFJP4ROqeSo3ZXmF4qLiyoJ6M4rSZ93pS6qnUO+5KLqwc9KQxh
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:902:dac9:b0:1a2:1c7:1c1f with SMTP id
 q9-20020a170902dac900b001a201c71c1fmr9786616plx.7.1680224503353; Thu, 30 Mar
 2023 18:01:43 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:21 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-7-komlodi@google.com>
Subject: [PATCH 06/16] hw/i3c/aspeed_i3c: Treat more registers as read-as-zero
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=39zAmZAcKChoAECBE386EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--komlodi.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RESET_CTRL and INTR_FORCE are write-only.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/aspeed_i3c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index 6f514bef5e..79715f462d 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -420,7 +420,10 @@ static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
     uint64_t value;
 
     switch (addr) {
+    /* RAZ */
     case R_COMMAND_QUEUE_PORT:
+    case R_RESET_CTRL:
+    case R_INTR_FORCE:
         value = 0;
         break;
     default:
-- 
2.40.0.348.gf938b09366-goog


