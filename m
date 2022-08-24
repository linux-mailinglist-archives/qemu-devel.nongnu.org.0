Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911F659F854
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:05:20 +0200 (CEST)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQoCE-0006rU-Ia
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmui-0004OZ-Sg
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:11 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuh-0001ft-Co
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:08 -0400
Received: by mail-pf1-x433.google.com with SMTP id y127so13000933pfy.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=u98oOh2RZJczW5UAcqsVUjAFpgf7KCCG68fKfAs85dg=;
 b=ADokp7IbBe6sNqDoaeIH5+IGs35wZ6xDjqAdtOZhmV+TEBqYAtJRKETCLPwUC7xS//
 MRlX21bpUa5fQynBeS/tGiK2Tg38i9ge/+egam5S2VOHkGILfg4sk5AmqFf6QG2KOHuz
 QFQKYn8rQ4dhsvCuEvU1ErLig8pRIqaQZshJJ9AUG4xiFYxfutcL41zwD7TkiQhIVnEJ
 xahE2swvNzOEljkje5qOhJfd4vBaaC2IbnyxzjeDsqR7JGtDPVZLDETrmpPU4ehwWL5k
 4HeSuftdKqjcjSa1J0ZDfecpDmU7xXR0+oiCXJjAe5sSJyVR7I8DarI+vSSzWGjLWyhR
 iC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=u98oOh2RZJczW5UAcqsVUjAFpgf7KCCG68fKfAs85dg=;
 b=IHXJFICynPem4fglxMzSwNz9FOrJi6IchCfvh9NA3nzcON1v9pVStA/HwyGh0jK+Ph
 sBqb+skjmArXv8kXbfjNmDvrUdu8ZSH5Sr3SyXFQMU9ooQW8jckEHHpfXkWeoRpNM1Cc
 eMbDyW8qMbdto9yV55oKi8NnbWsn9mQAf39JL4gCWX6jJ6c+JiR3WBz1RaCj2RIm5I9l
 hh4oU1y7CdaMoP4qMCpSRIHn4ivfcOf3+m37FD03W3vQ+awBPq2JuaSVz6qs6LprtMdJ
 C+YQ+bifCGWL3XZiBy5SV3W39dU0mbmlS8luTXLyoRDDIQgFLxUNqRyUDOPC9b5mhXjI
 rBwA==
X-Gm-Message-State: ACgBeo2zjiP1cjsAmoSRvXWV+6Scuh2iNR5vqaquHzjPPEBCSZs1mxjo
 q6dYrnCLf4tu1spoNvXdv37as9o8hMo=
X-Google-Smtp-Source: AA6agR7npptidhh5bxOO7LDgFmActNzUSNI0cpOBCLF05bODydPEdxRuPELPaHebGnwhhn60AgymUg==
X-Received: by 2002:a63:3509:0:b0:42b:15a6:8267 with SMTP id
 c9-20020a633509000000b0042b15a68267mr2453122pga.570.1661334185942; 
 Wed, 24 Aug 2022 02:43:05 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:05 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 35/51] tests/qtest: device-plug-test: Reverse the usage of
 double/single quotes
Date: Wed, 24 Aug 2022 17:40:13 +0800
Message-Id: <20220824094029.1634519-36-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

The usage of double/single quotes in test_pci_unplug_json_request()
should be reversed to work on both win32 and non-win32 platforms:

- The value of -device parameter needs to be surrounded by "" as
  Windows does not drop '' when passing it to QEMU which causes
  QEMU command line option parser failure.
- The JSON key/value pairs need to be surrounded by '' to make the
  JSON parser happy on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/device-plug-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 2e3137843e..a1fb99c8ff 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -95,7 +95,7 @@ static void test_pci_unplug_json_request(void)
     }
 
     QTestState *qtest = qtest_initf(
-        "%s -device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'",
+        "%s -device \"{'driver': 'virtio-mouse-pci', 'id': 'dev0'}\"",
         machine_addition);
 
     /*
-- 
2.34.1


