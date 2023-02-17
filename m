Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0456669A4A6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs40-0000h3-LN; Thu, 16 Feb 2023 23:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs3z-0000gt-1d
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:35 -0500
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs3x-00018A-BS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:34 -0500
X-IronPort-RemoteIP: 209.85.222.197
X-IronPort-MID: 259143700
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mmhE16PsNIiaqnzvrR0blcFynXyQoLVcMsEvi/4bfWQNrUpw0GEGz
 mQaCDzSa/mJMGf1LoxwbYXkpxkA75bTnNFnSQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimEc3l48sfrZ80s15aqq41v0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE7+gxNx01H6Qi2udHJV5Wz
 fEZIwsjR0XW7w626OrTpuhEg80iKIzyP9patCgxknfWCvEpRZ2FSKLPjTNa9G1o14YeQLCEP
 ZBfMGswBPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvjmKkFcuiOCF3Nz9c/mzXJtso3Shl
 FnqxXS6HDcXM+6Exm/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4yl36KZrpRPtQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjFsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:VnU3h60bCT15fKQ9KqbnHwqjBIQkLtp133Aq2lEZdPUzSKClfq
 GV88jzsCWetN9/Yh8dcLy7WZVoOEm9yXct2/hzAV7BZniDhILYFvAB0WKK+VSJcUDDH4VmpM
 JdmsZFeaTNJGk/ocHm4BSpV/YMqeP3iJxAXN2uqEuFmzsaDZ1d0w==
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:29 -0500
Received: by mail-qk1-f197.google.com with SMTP id
 x17-20020a05620a449100b00731b7a45b7fso2444889qkp.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u0m8IRd5HUAsJwALkkiImpFwlZOeqx0IrYfsdq7gRSE=;
 b=VP+hspw8te09TndjPqUDcJqdgGgMZ8vn0lYyEHqDV+QAKA0QQ5MXOcmJ4xswg49cIj
 NKoklJHtaaSh4fb3MmaiYBkf1i0+fFHFpc0tCg54WYow8FTKu9ymUVXqIh2PSl9p/vxS
 pphJm3O967jpQ0+fQcdnVSI7395km+FoM2pLQ2aPmZgPClV4WONYCDLjRCWUH5zWSMJx
 wFzuF0a0M19yhREtivm2oPUTvB1FPibq/Yu+qkTGkzv/N+Yu8RL0QtsX9YtFnGva9eTC
 qypccNSGo6a6QrZIWkUoAhtDMLhLZaSQ2paBUtzie5ANB/YrePnEIlTAR+jdpyfIdDPi
 qR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u0m8IRd5HUAsJwALkkiImpFwlZOeqx0IrYfsdq7gRSE=;
 b=39pKZT5DtpUpN56CDAt2gAPTGpFLvrp+j0LZpodKztP6djqfs/8MX9rkELCVS+zLvP
 RVqcp354Ae1mDHUiUtIlkQG6gJb1BG9sMFnbOARJonlCYh3TrNApzmQMFPzuIPDucRmy
 PSl5tuDiyJFSqu19BUZzpkuMqMTJ/kKW3aMsUOrHtU1zYRfGDScDyTMeypmRgZVB8MkX
 WadA9eVtTz76DF5676yVjwz3bGKgVyUt1yJawNmSP7wFOxMMa99hqbozosvCaQs/IXOO
 97xMHeyu7IyOPHky80qyy/F4GGPRksCzJBRPMxnt8x62jNf6YLgtD7kQqnxBm32WTHfk
 XoGw==
X-Gm-Message-State: AO0yUKV8Ieym1S3NcMWNei95HEWH9WJfXTFT/XLNrbwSt1wP38PkqwX7
 +zVI3b2Wkp9FZGFqylp/rG5efbFKe0BXrHdKHFdUXeH90Qk92c1itp1DZoczVGB4fF7LSK9yQCY
 E01P/3+NnTy+HaCz1HHisS+5vf95M55iIOIw+Qw==
X-Received: by 2002:a05:622a:5c9:b0:3bc:d0de:6adf with SMTP id
 d9-20020a05622a05c900b003bcd0de6adfmr13811770qtb.31.1676606969490; 
 Thu, 16 Feb 2023 20:09:29 -0800 (PST)
X-Google-Smtp-Source: AK7set8s9zEmT7Z44abaDKf0Yyv0eTlxoPp1zPvhw6D5ElUs21dNRLrQQ4/VW2p3Rx0tXhPKWPUHXA==
X-Received: by 2002:a05:622a:5c9:b0:3bc:d0de:6adf with SMTP id
 d9-20020a05622a05c900b003bcd0de6adfmr13811755qtb.31.1676606969225; 
 Thu, 16 Feb 2023 20:09:29 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 d64-20020a37b443000000b0073b69922cfesm2530525qkf.85.2023.02.16.20.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:28 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 02/10] fuzz: add fuzz_reset API
Date: Thu, 16 Feb 2023 23:08:47 -0500
Message-Id: <20230217040855.16873-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217040855.16873-1-alxndr@bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index eb7520544b..3bedb81b32 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -51,6 +51,12 @@ void flush_events(QTestState *s)
     }
 }
 
+void fuzz_reset(QTestState *s)
+{
+    qemu_system_reset(SHUTDOWN_CAUSE_GUEST_RESET);
+    main_loop_wait(true);
+}
+
 static QTestState *qtest_setup(void)
 {
     qtest_server_set_send_handler(&qtest_client_inproc_recv, &fuzz_qts);
diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
index 327c1c5a55..21d1362d65 100644
--- a/tests/qtest/fuzz/fuzz.h
+++ b/tests/qtest/fuzz/fuzz.h
@@ -103,7 +103,7 @@ typedef struct FuzzTarget {
 } FuzzTarget;
 
 void flush_events(QTestState *);
-void reboot(QTestState *);
+void fuzz_reset(QTestState *);
 
 /* Use the QTest ASCII protocol or call address_space API directly?*/
 void fuzz_qtest_set_serialize(bool option);
-- 
2.39.0


