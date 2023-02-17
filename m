Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB469A4A8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:10:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs4p-0001hw-GA; Thu, 16 Feb 2023 23:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs4i-0001Hz-IP
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:10:20 -0500
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs4f-0001CO-Ga
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:10:20 -0500
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 259423688
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/k5S86B4j44RVhVW/5fhw5YqxClBgxIJ4kV8jS/XYbTApDlz12FSn
 zAbWziDbqqCNzejf9FzOY208kxT6sSEztJiTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0hFaYDkpOs/jY8Ek24qyp0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFP8/uxUDkcEOrECoN5cI3sS3
 NwWIzACO0Xra+KemNpXS8Fpj8UnadDoZcYR4yAwiz7eCvkiTNbIRKCiCd1whm9hwJATW6yEP
 YxAOGoHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBqsjSJl1IhgNABNvLUWtOhWdRnvn/Bu
 1rE3HygGQ05bdWmnG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkN+XNro/FjpAqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXwDokhYphAQaifIL
IronPort-HdrOrdr: A9a23:+oIzj6q/91yQ7T6EwidG5KgaV5r9eYIsimQD101hICG9vPbo8/
 xG+85rqSMc7Qx6ZJhOo6HnBEDtewK/yXcx2/hrAV7AZniahILXFvAa0WKK+VSJcFycygce79
 YbT0EXMr3N5DNB/KHHCWeDYrMd6ejC2oyTwcnl81dRYTdDV5xAhj0JdTpz0XcbeOCFP/cE/V
 aniPav3wDQAUj/p/7VZ0U4Yw==
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:51 -0500
Received: by mail-qk1-f198.google.com with SMTP id
 x14-20020a05620a14ae00b0072f7f0f356bso2453158qkj.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PAaI03fXa/LDgvfkr7+SODyHcwEOPlKcrbifwWxogs=;
 b=CPmCfvPxxhTPSF6YYzmOJ8HtJeHERYgh7BDllE0/g+FJQxkUmPcU7TlUpjlO2NjAhx
 soopPsYtHa15ozTGx7LYCm9edwIhOpvmpv8wVvnG/iSkWnE/BUbbwYsk2ColkHUOrWxq
 ZPgG/txT31OnLfxqNq4uYrIq7BPbWSuNMq2M8j84vQEJ4gLZufaKUe+W7XrXTB8M8iQP
 JIRfmWAC81e0kt/4WoP8uciocQXM5UOyZ1QTyYzZn1mcZw77qbO/8Ijp72TbSQNTKkww
 kyEiotCoO5A+XLlqyEWMyASMwhBib80OJqm+obfM0IddTZm0TL6bqDKCjkCyJByAE9Hq
 8deQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4PAaI03fXa/LDgvfkr7+SODyHcwEOPlKcrbifwWxogs=;
 b=Okkd7Oyse2PooWB/3yyrRroIFCtHARVxXJiurJFz4j9MSIse5NVR9Tvwn0bQCZ0wTQ
 XpoVUxj68TxUtSsP09i2WHZ8efGfU0W9O6n+6afmMuKFfDwKa/oBUerhzE77r9c/i99J
 JItE5F0zwJDeULZmlvVV6ieI15Tmki0cpubtHbQRnKmjmb5KS4ZfTckfQq/Oc/4pkHB2
 nhUWnHs4YV0K3qlh8cH2LiGZhYysqTFLEiNWtMVDIzUORsO+G2KIPMP9M8s/W+kvWSAa
 vseEqSCrC8gWGUmCnbh4cqW9deNYI7M1OMIIl+q5CiAcWN6QN68vMDNsY1hlv0eGpWSx
 xeaw==
X-Gm-Message-State: AO0yUKXcIaNe0r7HSebmKyAOQLBaes8481NnSwE890W6RpnvPHfHtMTa
 VszmEUrsNIPOonkknlRgbYMff/69qA1kQcMof+N0dKyaGQz4oqI9jClLn25mkvlsv637y65VLgQ
 28KHptct1OZSBZgndASWhr+bDgefB9voxepeVsw==
X-Received: by 2002:a05:622a:43:b0:3b8:6a41:c329 with SMTP id
 y3-20020a05622a004300b003b86a41c329mr14227013qtw.21.1676606990883; 
 Thu, 16 Feb 2023 20:09:50 -0800 (PST)
X-Google-Smtp-Source: AK7set99eFVMWA2GiNppfox4bzSp+36UXS5j8Ogn2uXptmaMC4EpaXhb1KFbXQNgSpSwcZ40dmY55Q==
X-Received: by 2002:a05:622a:43:b0:3b8:6a41:c329 with SMTP id
 y3-20020a05622a004300b003b86a41c329mr14226996qtw.21.1676606990629; 
 Thu, 16 Feb 2023 20:09:50 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 v14-20020ac8748e000000b003a81eef14efsm2562801qtq.45.2023.02.16.20.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:50 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 08/10] fuzz/i440fx: remove fork-based fuzzer
Date: Thu, 16 Feb 2023 23:08:53 -0500
Message-Id: <20230217040855.16873-9-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217040855.16873-1-alxndr@bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/i440fx_fuzz.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/tests/qtest/fuzz/i440fx_fuzz.c b/tests/qtest/fuzz/i440fx_fuzz.c
index b17fc725df..155fe018f8 100644
--- a/tests/qtest/fuzz/i440fx_fuzz.c
+++ b/tests/qtest/fuzz/i440fx_fuzz.c
@@ -18,7 +18,6 @@
 #include "tests/qtest/libqos/pci-pc.h"
 #include "fuzz.h"
 #include "qos_fuzz.h"
-#include "fork_fuzz.h"
 
 
 #define I440FX_PCI_HOST_BRIDGE_CFG 0xcf8
@@ -89,6 +88,7 @@ static void i440fx_fuzz_qtest(QTestState *s,
                               size_t Size)
 {
     ioport_fuzz_qtest(s, Data, Size);
+    fuzz_reset(s);
 }
 
 static void pciconfig_fuzz_qos(QTestState *s, QPCIBus *bus,
@@ -145,17 +145,6 @@ static void i440fx_fuzz_qos(QTestState *s,
     pciconfig_fuzz_qos(s, bus, Data, Size);
 }
 
-static void i440fx_fuzz_qos_fork(QTestState *s,
-        const unsigned char *Data, size_t Size) {
-    if (fork() == 0) {
-        i440fx_fuzz_qos(s, Data, Size);
-        _Exit(0);
-    } else {
-        flush_events(s);
-        wait(NULL);
-    }
-}
-
 static const char *i440fx_qtest_argv = TARGET_NAME " -machine accel=qtest"
                                        " -m 0 -display none";
 static GString *i440fx_argv(FuzzTarget *t)
@@ -163,10 +152,6 @@ static GString *i440fx_argv(FuzzTarget *t)
     return g_string_new(i440fx_qtest_argv);
 }
 
-static void fork_init(void)
-{
-    counter_shm_init();
-}
 
 static void register_pci_fuzz_targets(void)
 {
@@ -178,16 +163,6 @@ static void register_pci_fuzz_targets(void)
                 .get_init_cmdline = i440fx_argv,
                 .fuzz = i440fx_fuzz_qtest});
 
-    /* Uses libqos and forks to prevent state leakage */
-    fuzz_add_qos_target(&(FuzzTarget){
-                .name = "i440fx-qos-fork-fuzz",
-                .description = "Fuzz the i440fx using raw qtest commands and "
-                               "rebooting after each run",
-                .pre_vm_init = &fork_init,
-                .fuzz = i440fx_fuzz_qos_fork,},
-                "i440FX-pcihost",
-                &(QOSGraphTestOptions){}
-                );
 
     /*
      * Uses libqos. Doesn't do anything to reset state. Note that if we were to
-- 
2.39.0


