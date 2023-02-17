Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C8F69A4A9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:10:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs4n-0001Vk-FU; Thu, 16 Feb 2023 23:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs4h-0001BL-FS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:10:20 -0500
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs4Y-0001BX-8Q
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:10:18 -0500
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 259423675
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:opFNHaCJa3k4rxVW/5fhw5YqxClBgxIJ4kV8jS/XYbTApG8r32QCy
 TMfXj+BPq7bZjSjeIt/boy1ph8GsZaEnIBiTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0hFaYDkpOs/jY8Ek24qyp0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPK6eVND14GPLcZxf51AWMXy
 vMfJSA0O0Xra+KemNpXS8Fpj8UnadDoZcYR4yAwiz7eCvkiTNbIRKCiCd1whm9hwJATW6yEP
 YxAOGoHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBqsjSJl1IujdABNvKLVtuFG5UPpX2i5
 WHg1E3gOxEWD8KAnG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkN+XNro/FjpAqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXwDokhYphAQaifIL
IronPort-HdrOrdr: A9a23:7D3arKPzwy2r08BcTl+jsMiBIKoaSvp037BL7S9MoHluGPBw+P
 rDoB12726StN9pYgBZpTniAse9qBHnhPpIyLALMbavVATrowKTTb2KhLGKqwEIfReOlNK1vp
 0QCpSWZuecMXFKyeb87QW1HpILxdmK973trf7Gpk0dKz1CWuVB6Ap0BgveOEtwWQVAGN4FBI
 ORj/A3wgaISDA2acm2CnRAcMPnzueqqLvWJT4AChIq5U2yr1qTmcXH+kijtSs2QndEybM6+W
 jKlEj468yYwpKG9iM=
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:44 -0500
Received: by mail-qk1-f198.google.com with SMTP id
 a198-20020ae9e8cf000000b007259083a3c8so2447510qkg.7
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lcDqOOean2B6Pwa7LPtUCmUmjISrrlgXRCUhMcVK7Y=;
 b=ghzsys43HCXEiPM4GG4k44WRTbKxRBUiWQg8ya1EylIjKx4RlgFrLIICV0RSFNR+bE
 NRwu+47s1unkgwRC5XGK6OjH14suLJNwRKqwEpSLk8taDHFb+sFxJakTt5bfC2xuDx7n
 Q53/YFgiLDi24TMm2ONLpNdzbhog2kXJFgRLYme4GZebfbUCy6P4zRgoyVpqdQHNnLe6
 3dxPhX5e2xXjyED6v4cy4huxtS6YSM1CeMT1J9yv4XHQKdxfqD0dvahn1vekWhBcPHko
 aflDXscH8zA2UfNCdO0m5FIshhmWUi9VpAQlubisPSYmdQKQQI31/Vf8JI7K8+n6pFHp
 P9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0lcDqOOean2B6Pwa7LPtUCmUmjISrrlgXRCUhMcVK7Y=;
 b=s3U2gpF+vpdXwz3ehWcoRXsU4W9VWTc+QIc7ry5CbKnRlnKahsQAL3TKLfrDTgtlfy
 SWYxIZzoTL+r3YbiS+sFsdhPQtHMRVkaq4AMX4b5RY1vseYI3AX3rqXXagTPnTKANsPm
 jv+VSEcCKd4oFz3kE2QGOFn+Tv0O4kPwE6PTwM9JKpsGXE6wTdI5zsTpsEl4P9vow0oN
 CgvrEtMqSuGnmq7j71VetLoT0CWuQUvgPFReGKmUA51mtCGw32NTNx369NS2gzapNGhS
 Qr3ROhDRt75siQIbcCcH06SMi/Ye9G/Vi4BzavIpD/27ZVbgtX+KPHze3V78NWKVSLyu
 loIA==
X-Gm-Message-State: AO0yUKW5DKXgCrJnAxJ+82B6H1k+LNoEFViDCGaBDq+9kmZrNp9js6sE
 2t+zgV6AVZP7rgE7+AbntMe5GtDdHsROjgt0XdZdEtK6zaaNELMPajgvpXsfuLzc+s08dF/fCNa
 r6mkJBaOXYd1zIILYV1ikHtL0lVNrAl3FzU3CAw==
X-Received: by 2002:a05:622a:181a:b0:3b9:f4a0:e600 with SMTP id
 t26-20020a05622a181a00b003b9f4a0e600mr12463517qtc.60.1676606983648; 
 Thu, 16 Feb 2023 20:09:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8FxQmftHtCj7hLlBE1S9FAfPWqOJOWqdH2CKcw6pBcWpN6Njy73FQwLvwehrh4Ibyq9toyZg==
X-Received: by 2002:a05:622a:181a:b0:3b9:f4a0:e600 with SMTP id
 t26-20020a05622a181a00b003b9f4a0e600mr12463496qtc.60.1676606983363; 
 Thu, 16 Feb 2023 20:09:43 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 x68-20020a379547000000b0073b692623c5sm2492214qkd.129.2023.02.16.20.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:42 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 06/10] fuzz/virtio-net: remove fork-based fuzzer
Date: Thu, 16 Feb 2023 23:08:51 -0500
Message-Id: <20230217040855.16873-7-alxndr@bu.edu>
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
 tests/qtest/fuzz/virtio_net_fuzz.c | 54 +++---------------------------
 1 file changed, 5 insertions(+), 49 deletions(-)

diff --git a/tests/qtest/fuzz/virtio_net_fuzz.c b/tests/qtest/fuzz/virtio_net_fuzz.c
index c2c15f07f0..e239875e3b 100644
--- a/tests/qtest/fuzz/virtio_net_fuzz.c
+++ b/tests/qtest/fuzz/virtio_net_fuzz.c
@@ -16,7 +16,6 @@
 #include "tests/qtest/libqtest.h"
 #include "tests/qtest/libqos/virtio-net.h"
 #include "fuzz.h"
-#include "fork_fuzz.h"
 #include "qos_fuzz.h"
 
 
@@ -115,36 +114,18 @@ static void virtio_net_fuzz_multi(QTestState *s,
     }
 }
 
-static void virtio_net_fork_fuzz(QTestState *s,
-        const unsigned char *Data, size_t Size)
-{
-    if (fork() == 0) {
-        virtio_net_fuzz_multi(s, Data, Size, false);
-        flush_events(s);
-        _Exit(0);
-    } else {
-        flush_events(s);
-        wait(NULL);
-    }
-}
 
-static void virtio_net_fork_fuzz_check_used(QTestState *s,
+static void virtio_net_fuzz_check_used(QTestState *s,
         const unsigned char *Data, size_t Size)
 {
-    if (fork() == 0) {
-        virtio_net_fuzz_multi(s, Data, Size, true);
-        flush_events(s);
-        _Exit(0);
-    } else {
-        flush_events(s);
-        wait(NULL);
-    }
+    virtio_net_fuzz_multi(s, Data, Size, true);
+    flush_events(s);
+    fuzz_reset(s);
 }
 
 static void virtio_net_pre_fuzz(QTestState *s)
 {
     qos_init_path(s);
-    counter_shm_init();
 }
 
 static void *virtio_net_test_setup_socket(GString *cmd_line, void *arg)
@@ -158,23 +139,8 @@ static void *virtio_net_test_setup_socket(GString *cmd_line, void *arg)
     return arg;
 }
 
-static void *virtio_net_test_setup_user(GString *cmd_line, void *arg)
-{
-    g_string_append_printf(cmd_line, " -netdev user,id=hs0 ");
-    return arg;
-}
-
 static void register_virtio_net_fuzz_targets(void)
 {
-    fuzz_add_qos_target(&(FuzzTarget){
-            .name = "virtio-net-socket",
-            .description = "Fuzz the virtio-net virtual queues. Fuzz incoming "
-            "traffic using the socket backend",
-            .pre_fuzz = &virtio_net_pre_fuzz,
-            .fuzz = virtio_net_fork_fuzz,},
-            "virtio-net",
-            &(QOSGraphTestOptions){.before = virtio_net_test_setup_socket}
-            );
 
     fuzz_add_qos_target(&(FuzzTarget){
             .name = "virtio-net-socket-check-used",
@@ -182,20 +148,10 @@ static void register_virtio_net_fuzz_targets(void)
             "descriptors to be used. Timeout may indicate improperly handled "
             "input",
             .pre_fuzz = &virtio_net_pre_fuzz,
-            .fuzz = virtio_net_fork_fuzz_check_used,},
+            .fuzz = virtio_net_fuzz_check_used,},
             "virtio-net",
             &(QOSGraphTestOptions){.before = virtio_net_test_setup_socket}
             );
-    fuzz_add_qos_target(&(FuzzTarget){
-            .name = "virtio-net-slirp",
-            .description = "Fuzz the virtio-net virtual queues with the slirp "
-            " backend. Warning: May result in network traffic emitted from the "
-            " process. Run in an isolated network environment.",
-            .pre_fuzz = &virtio_net_pre_fuzz,
-            .fuzz = virtio_net_fork_fuzz,},
-            "virtio-net",
-            &(QOSGraphTestOptions){.before = virtio_net_test_setup_user}
-            );
 }
 
 fuzz_target_init(register_virtio_net_fuzz_targets);
-- 
2.39.0


