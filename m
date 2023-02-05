Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72E68AE44
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWfU-0007D2-Vt; Sat, 04 Feb 2023 23:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfT-0007B2-3y
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:19 -0500
Received: from esa4.hc2706-39.iphmx.com ([216.71.146.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfR-0006Ad-45
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:18 -0500
X-IronPort-RemoteIP: 209.85.222.197
X-IronPort-MID: 255542405
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ok+XNqNxtVglTIbvrR0blcFynXyQoLVcMsEvi/4bfWQNrUpw02FWm
 zQcDzyCOfvbMWamet4gao6290gCuJLVzNZhHgZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656CEmjslkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimEc3l48sfrZ80s15Kiq41v0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TEkrJNMhhoNtEk281+PGxk9
 f85dBYBR0XW7w626OrTpuhEg80iKIzyP9patCgxknfWCvEpRZ2FSKLPjTNa9G1o14YeQLCEP
 ZBfMGswBPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvjWOkFYtiOWF3Nz9ddeaYvVIoG+ki
 k3d+0riD0ggboOv1m/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4yl36KZrpRPtQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjFsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:ZNt+F6yRA+zg3aj8x7ePKrPw+r1zdoMgy1knxilNoNJuA6ilfq
 eV7YgmPHrP4gr5N0tQ/+xoVJPwI080sKQFmrX5Xo3SITUOxlHYVb2KhLGKq1aQeBEWtNQtr5
 uIG5IfNDSaNykcsS+V2njcL/8QhPOqyuSHv9v/8ltaZT1WSshbnnhE48WgfnGehjMqOXP0Lv
 ShD7J81kKdkL0sAaWGOkU=
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:15 -0500
Received: by mail-qk1-f197.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so5946639qkn.0
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+MVkEQ89PjxMWt3cPZo6y49kuSGlJ3CjWP9R/tF0z4=;
 b=KdH9C6FQI4J4Btng0il0O4ODdg9KZj93uG2EsNc5ndQ/sfJuP1SxIisgO7qLnMEaM0
 U/w/jHMb8/pjBHv4w4uEtfVIxyggbEo4u5TP82UoIh+5yif6GuWx6MDGE7W6vNiiypPv
 zG6WK8otw0Bouh+Wf5ANhBnovSYTmNI278bhOlN4qUT7/lXoi5rq0/PkYqbjazXng7Ha
 laFnWxryoLNCsrOSCvBpt24JTz8AUonUOuAgFzHJgHdFIaQp5mBmpR62ENQVOsLnfLnm
 iuAxpswoCo9kpfsDqjZ+RYkVT0loKur/8UlNjezNZ+oUWWoHNCdJS4WQy2wMD38FwKKB
 X4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+MVkEQ89PjxMWt3cPZo6y49kuSGlJ3CjWP9R/tF0z4=;
 b=jDviS5W4aZxAk3pvBaXbCi1Putjc5XfFfazvE+GuicdaMw4yU9mJF7cBQg5RnKm5P/
 c+PGP7uR18WZDLgf0L0dvUOGxSf+HErx9D3u6yoI/eEw4xEy+CHvxySuaT2/ajjun1ww
 Jy7pN3RUn5hFVBFZ8njW/GFOmT6XHW2f3n8N/zQ2b5ZEhyXEqe/H5bVYsP2AjNJ2DWaY
 yw1OFb8eQr+TLBwuXJmeJhIV0WewvRA6V2FopJ0+mpJDj6iFdY+HVraRW9A4zcF4T+lw
 sTauzuTpE43+uFiGUzjSHPBNcvuiQNsChDdaykaWNRJaxzsxcgfQUe5wv76XfQ5IlvXg
 /ksQ==
X-Gm-Message-State: AO0yUKWOm70H6O42aVqDrDfKmXGBB45ptz9hIa8D0c+EiSw/k/20anpP
 DVyEBX9MF48XKRPrOTCLA138U8gnn+8SJfv8jMYFNKA7z9dYRxcWfaJfNYEB6K6eWA+7/sRQjpo
 VJ4vDubQ2He4FMkAm+McwqyMVZWe5lg==
X-Received: by 2002:a05:622a:50d:b0:3b8:4fb1:c82a with SMTP id
 l13-20020a05622a050d00b003b84fb1c82amr27827878qtx.21.1675571413799; 
 Sat, 04 Feb 2023 20:30:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9eKH9ejeBGIX3PVWH5cUs70vK5KBnszMPvgeOglMB60D++AxXu5fsAwOM0to6KUADm47LCnQ==
X-Received: by 2002:a05:622a:50d:b0:3b8:4fb1:c82a with SMTP id
 l13-20020a05622a050d00b003b84fb1c82amr27827854qtx.21.1675571413542; 
 Sat, 04 Feb 2023 20:30:13 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 o6-20020ac85546000000b003b2ea9b76d0sm4665369qtr.34.2023.02.04.20.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:13 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 04/10] fuzz/generic-fuzz: add a limit on DMA bytes written
Date: Sat,  4 Feb 2023 23:29:45 -0500
Message-Id: <20230205042951.3570008-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.146.118; envelope-from=alxndr@bu.edu;
 helo=esa4.hc2706-39.iphmx.com
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

As we have repplaced fork-based fuzzing, with reboots - we can no longer
use a timeout+exit() to avoid slow inputs. Libfuzzer has its own timer
that it uses to catch slow inputs, however these timeouts are usually
seconds-minutes long: more than enough to bog-down the fuzzing process.
However, I found that slow inputs often attempt to fill overly large DMA
requests. Thus, we can mitigate most timeouts by setting a cap on the
total number of DMA bytes written by an input.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index c2e5642150..eab92cbc23 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -52,6 +52,7 @@ enum cmds {
 #define USEC_IN_SEC 1000000000
 
 #define MAX_DMA_FILL_SIZE 0x10000
+#define MAX_TOTAL_DMA_SIZE 0x10000000
 
 #define PCI_HOST_BRIDGE_CFG 0xcf8
 #define PCI_HOST_BRIDGE_DATA 0xcfc
@@ -64,6 +65,7 @@ typedef struct {
 static useconds_t timeout = DEFAULT_TIMEOUT_US;
 
 static bool qtest_log_enabled;
+size_t dma_bytes_written;
 
 MemoryRegion *sparse_mem_mr;
 
@@ -197,6 +199,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
      */
     if (dma_patterns->len == 0
         || len == 0
+        || dma_bytes_written > MAX_TOTAL_DMA_SIZE
         || (mr != current_machine->ram && mr != sparse_mem_mr)) {
         return;
     }
@@ -269,6 +272,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
                 fflush(stderr);
             }
             qtest_memwrite(qts_global, addr, buf, l);
+            dma_bytes_written += l;
         }
         len -= l;
         buf += l;
@@ -648,6 +652,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
 
     op_clear_dma_patterns(s, NULL, 0);
     pci_disabled = false;
+    dma_bytes_written = 0;
 
     QPCIBus *pcibus = qpci_new_pc(s, NULL);
     g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
-- 
2.39.0


