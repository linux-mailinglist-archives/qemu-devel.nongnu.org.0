Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615604D8A55
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:03:44 +0100 (CET)
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTo6g-0006B3-S3
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:03:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nTo5V-0004zg-TZ
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:02:29 -0400
Received: from [2607:f8b0:4864:20::102c] (port=38650
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nTo5U-0002gs-AH
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:02:29 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 mm23-20020a17090b359700b001bfceefd8c6so11894984pjb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J3/8O87yVSTt2TCGmM30YT3kHNVtSTe8sBec46vnAWg=;
 b=Cibhgge/x01mfx+BDj2YgnvR9hd4CD/lVjGbV6QrGCotvfego/448qoeBZiMS8l/cc
 Jwoo8D9PFIOIh5/8ef3RZ/NmK9B7H50Gcfq2Lo4Dr5pGIHgdZr4g3GtXRT5ecEHVbNvY
 7l2qQLXUAxLBK6zlCSXPFhRKSOUILz7XYcgTmeWwRHZbhqH3yNvLpQeGmz91MuqpLB7R
 GxnbODi4lvm/lNDHwCmFYGYYHYG+tfRIDobOyFTo0mZa7FvdD2rl2lBA5bql3lANoM8Q
 Zd3Y0dpOwxaxBBwjUoNUhDKvHc8/9qsICU7/XOx0gxgVmuSskctt95W+sz8gr0/fE8h/
 O4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J3/8O87yVSTt2TCGmM30YT3kHNVtSTe8sBec46vnAWg=;
 b=2CbnScGtvNldXhK5GxW09tP2pTUjMcTTvr/XGUUQT9QUaYFpRAjYIpRV5+u8ahHs0C
 LZx2DCmWyfb0HXS5kWqg46xmHhJoOxt6Idm+7XCzRqCvmYewKQYXjME3PMpuLyAaPjMA
 m7H13075kL861cVajdhWBGiWXfTSf4ZJcp6vW0uQ4/InSkhKf57UhwOrDPVJNqE4xQ3a
 jy05iNM/EA3UvPbHbjp7p5KJufAmDcDjFQ5teQnUzYeSsUnjOa6cxcVXAh5Bd1ISAZPK
 383nR81oautqFfP0FgUc2gg0pzi2jCr7AYbedw/QGlx06/AVMGw9Vih1yejnabh4ZJHw
 FFBA==
X-Gm-Message-State: AOAM531At8GBXaVk/w9z+srVwBajZ8jm8Hq0RzjKaiwRdEMssOONexHH
 uxXrz0VTo7MBERwRjtGr9cYsKk51ENCBRA==
X-Google-Smtp-Source: ABdhPJzBYEBv3WI6QMM4CF8USS/MbPFGNAWeKyjwgR4cLEfRB72nCVOq43pbezwyBeXIL72QT+emDw==
X-Received: by 2002:a17:902:b597:b0:151:e24e:a61e with SMTP id
 a23-20020a170902b59700b00151e24ea61emr24609750pls.66.1647277346480; 
 Mon, 14 Mar 2022 10:02:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
 by smtp.gmail.com with ESMTPSA id
 y34-20020a056a00182200b004f71c56a7e8sm21290122pfa.213.2022.03.14.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 10:02:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ppc: Include asm/ptrace.h for pt_regs struct definition
Date: Mon, 14 Mar 2022 10:02:23 -0700
Message-Id: <20220314170223.554679-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=raj.khem@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Khem Raj <raj.khem@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes
../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: incomplete definition of type 'struct pt_regs'
    return uc->uc_mcontext.regs->nip;
           ~~~~~~~~~~~~~~~~~~~~^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/include/host/ppc/host-signal.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/include/host/ppc/host-signal.h
index b80384d135..43ee2eee3b 100644
--- a/linux-user/include/host/ppc/host-signal.h
+++ b/linux-user/include/host/ppc/host-signal.h
@@ -11,6 +11,10 @@
 #ifndef PPC_HOST_SIGNAL_H
 #define PPC_HOST_SIGNAL_H
 
+#if defined(__powerpc__)
+#include <asm/ptrace.h>
+#endif
+
 /* The third argument to a SA_SIGINFO handler is ucontext_t. */
 typedef ucontext_t host_sigcontext;
 
-- 
2.35.1


