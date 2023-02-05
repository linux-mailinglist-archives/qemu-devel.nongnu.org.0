Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5468AE4A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWfX-0007EB-7G; Sat, 04 Feb 2023 23:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfU-0007Cz-El
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:20 -0500
Received: from esa10.hc2706-39.iphmx.com ([216.71.140.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfM-00069e-3M
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:20 -0500
X-IronPort-RemoteIP: 209.85.160.198
X-IronPort-MID: 258034569
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6GXu4qOPxhEne87vrR0blcFynXyQoLVcMsEvi/4bfWQNrUp23zEFx
 mJOXjyCb62MMWGmKNAkbIqw8B5S7JGHy9JnHQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656CEmjslkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimEc3l48sfrZ80s15Kiq41v0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE2q5eFkEbHNwkof90Rj5k8
 tUWMWkRR0XW7w626OrTpuhEg80iKIzyINpatCgxnXfWCvEpRZ2FSKLPjTNa9G1o14YeQLCHO
 ZJfMGs/BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvjiLl1AsjumF3Nz9VIeyZ5xyolyig
 3P68SPhBAkWF8TFxm/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4zZ36KZrpRztQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjFsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:F3ZrWKoS1QjAQ0XK3tG61HkaV5r9eYIsimQD101hICG9vPbo8/
 xG+85rqSMc7Qx6ZJhOo6HnBEDtewK/yXcx2/hrAV7AZniahILXFvAa0WKK+VSJcFycygce79
 YbT0EXMr3N5DNB/KHHCWeDYrMd6ejC2oyTwcnl81dRYTdDV5xAhj0JdTpz0XcbeOCFP/cE/V
 aniPav3wDQAUj/p/7VZ0U4Yw==
Received: from mail-qt1-f198.google.com ([209.85.160.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:08 -0500
Received: by mail-qt1-f198.google.com with SMTP id
 a24-20020ac84d98000000b003b9a4958f0cso4722498qtw.3
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J3QG4w7aUkJz/VVM7yxbH+XnZ4jL4LSh847zDwYOaRU=;
 b=nvYSB9AO+88pWlxVEVCWy6GeIPcmjq2xu2vRx9a6r3agpHbXkMTH7kwm3tnTDUfwpU
 HFWzcKK/d+F69LCVoory/YZunx+hB5cS9tIs5U88DJnojRV/n3k2POJ6j/lkmIxez58r
 yYCeYPTzolYak/k+uG9cbHo0d1bPqlFcZdus4nWwB0BabFaVy4kJJ2dK+cC4Ah2XliT1
 lorsGGSGryjkHqitMVY1NyK2cJN4iIOtd7+y73Dp5Vt1Nn/KNFBJOHwjN82UHPb38XMy
 /XJ9rwtlQPQ+moJTlWduRR++7Ju8ain+dwWJeDSNmJeGhMZlgzNk2VdUAn1CM+3lIyhm
 Q06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J3QG4w7aUkJz/VVM7yxbH+XnZ4jL4LSh847zDwYOaRU=;
 b=csd+3ZBxBNLX5ICjYTYE90tXWA6L/3a/k7XmFbHANc7YCx+xu1sIxbGLkOItKfHMtK
 UuHvuRYDxWjaX79eSqPOsKg67dr6CKsBdgn4EgahgwjJtSJa+6Ap5iahdexR/3ywSNyV
 8/4J28bMZ6YnvgosZtEs1398QtcI9bLOk4OAd1fpybsEqX6PieimgqFMmokew/ySkZFr
 llYPR6cYzyjkjxNKsF7kGwid28R0v2cbNfS412zkKZR7i4zAcD9Qtx+Z4SLQRZJBeIi2
 gVY6mVtQX7734ORSNbHgIbM7+sZLHcWYZYu92FRXUe5V396sf/Ur0rGSFk+CS8nx/USQ
 KWJg==
X-Gm-Message-State: AO0yUKV3BEo7khXbJt4a5RU9OmipwjXluEHOcSZnwp/Jf3GA3o2Gnyqf
 iVxNjFzGh9laGKXJ8m/5YiMGP7Rk9GVOmRMVbO37BwixECKnM+UWqw6gQ447I3Df01Z/u41zp/d
 /QEIf2LSlcFMJ+/8rgO45UgLK0On8Qg==
X-Received: by 2002:ac8:5f0f:0:b0:3b8:6ae9:b10c with SMTP id
 x15-20020ac85f0f000000b003b86ae9b10cmr29051792qta.3.1675571407894; 
 Sat, 04 Feb 2023 20:30:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZpaOQQIumsjj849uo4qFU1aJDzMekHDDyLHN4WTe+HyZH0N56kFyI5CyM4995maseKB+N2Q==
X-Received: by 2002:ac8:5f0f:0:b0:3b8:6ae9:b10c with SMTP id
 x15-20020ac85f0f000000b003b86ae9b10cmr29051774qta.3.1675571407616; 
 Sat, 04 Feb 2023 20:30:07 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 y25-20020ac83e99000000b003b86b5a07b3sm4581529qtf.90.2023.02.04.20.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:07 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 02/10] fuzz: add fuzz_reboot API
Date: Sat,  4 Feb 2023 23:29:43 -0500
Message-Id: <20230205042951.3570008-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.198; envelope-from=alxndr@bu.edu;
 helo=esa10.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

As we are converting most fuzzers to rely on reboots to reset state,
introduce an API to make sure reboots are invoked in a consistent
manner.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/fuzz.c | 6 ++++++
 tests/qtest/fuzz/fuzz.h | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index eb7520544b..c2d07a4c7e 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -51,6 +51,12 @@ void flush_events(QTestState *s)
     }
 }
 
+void fuzz_reboot(QTestState *s)
+{
+    qemu_system_reset(SHUTDOWN_CAUSE_GUEST_RESET);
+    main_loop_wait(true);
+}
+
 static QTestState *qtest_setup(void)
 {
     qtest_server_set_send_handler(&qtest_client_inproc_recv, &fuzz_qts);
diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
index 327c1c5a55..69e2b3877f 100644
--- a/tests/qtest/fuzz/fuzz.h
+++ b/tests/qtest/fuzz/fuzz.h
@@ -103,7 +103,7 @@ typedef struct FuzzTarget {
 } FuzzTarget;
 
 void flush_events(QTestState *);
-void reboot(QTestState *);
+void fuzz_reboot(QTestState *);
 
 /* Use the QTest ASCII protocol or call address_space API directly?*/
 void fuzz_qtest_set_serialize(bool option);
-- 
2.39.0


