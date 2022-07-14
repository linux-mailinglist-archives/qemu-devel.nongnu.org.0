Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B245747D1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:09:28 +0200 (CEST)
Received: from localhost ([::1]:55314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBuqd-0002N9-CS
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujn-0004yS-3j
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujj-0005tC-CV
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/StMYsUR3T7ZIFnX+3IHWI68Ox7ds1R1I5k3Oio9zwQ=;
 b=cxVfnkisZZGdP+x+k0+NWrLObKjNL1Ec+EGAYSnlgGJYCZBMAE3lI6NCqeTFl0Cz3ELG8W
 ITLzb0v51swMratuFZBgDHKrTYbCSG20wBD8oh4M5I7QNgmqPIYCu8mEuaQYPNjQULrZgt
 EbVkRsZbIjivri2+1hGEp0RxkTtsLPI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-6C24Zz1INLqFRZx7LYWQYQ-1; Thu, 14 Jul 2022 05:02:17 -0400
X-MC-Unique: 6C24Zz1INLqFRZx7LYWQYQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 z5-20020a05640235c500b0043ae18edeeeso1109052edc.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/StMYsUR3T7ZIFnX+3IHWI68Ox7ds1R1I5k3Oio9zwQ=;
 b=uMhdn8C1EQnq5Z1TAGOEKqwf5qk7YlvOE9+JgjLLYunS116ddNDiWA5kZ0YND02xkn
 mvU4EHlJ8+0tiH3AIOhq0KUb38a6SoMEAIwaKSC7RL7+f9/MnmUwBj2q+WUTB5qEKBjr
 UaHUWjyYl2lfOmRjKuDxH+wO7cSBW5m1i0qBjLBNnUzN7l+u7zyfvrXpy9tE6zgG+L/W
 ZSXjghsZkZCVSRgRIBYrQQPYr3WrIXbnEpDbtDCex70v9iqgTHLIfTtZMB5I6QqcrRpR
 W4JgpAryFoQ58Cb1G0TIiDAZqDBeqYS5qXaw6fnvwjYeRlxxf24DZJu5QPz40/ag7VDj
 ZXhQ==
X-Gm-Message-State: AJIora8Ufuaf5anpcSyTYUS+Z7uwpE3Yya1JKnEGD1WiH8IF3XTXhHLo
 RGdnN/rryrdT99ljXHrPFq5nGHcmDTc8MID9bzKZw/LdI5eI8WT9LSOs03G+12teFANpVuF3rtb
 iKy0a5AUY7Kn2KMFJPRZ/iRrKKKAwv0NSSG9Ae9oLxXDqYNDPLWdSJddy1/rHzCE74hc=
X-Received: by 2002:a17:907:2855:b0:72b:700e:21eb with SMTP id
 el21-20020a170907285500b0072b700e21ebmr7730060ejc.270.1657789335971; 
 Thu, 14 Jul 2022 02:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ukoh8+chckfjRMfXdK0zR1Mxxt7xqvPraXUcDR+hbEP858NgtYwm+NzKKaTddGPmiBngZPcQ==
X-Received: by 2002:a17:907:2855:b0:72b:700e:21eb with SMTP id
 el21-20020a170907285500b0072b700e21ebmr7730033ejc.270.1657789335672; 
 Thu, 14 Jul 2022 02:02:15 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 m20-20020a170906721400b0071cbc7487e0sm452770ejk.71.2022.07.14.02.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 01/20] scsi/lsi53c895a: really fix use-after-free in
 lsi_do_msgout (CVE-2022-0216)
Date: Thu, 14 Jul 2022 11:01:52 +0200
Message-Id: <20220714090211.304305-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Mauro Matteo Cascella <mcascell@redhat.com>

Set current_req to NULL, not current_req->req, to prevent reusing a free'd
buffer in case of repeated SCSI cancel requests.  Also apply the fix to
CLEAR QUEUE and BUS DEVICE RESET messages as well, since they also cancel
the request.

Thanks to Alexander Bulekov for providing a reproducer.

Fixes: CVE-2022-0216
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/lsi53c895a.c               |  3 +-
 tests/qtest/fuzz-lsi53c895a-test.c | 76 ++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 99ea42d49b..ad5f5e5f39 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1030,7 +1030,7 @@ static void lsi_do_msgout(LSIState *s)
             trace_lsi_do_msgout_abort(current_tag);
             if (current_req && current_req->req) {
                 scsi_req_cancel(current_req->req);
-                current_req->req = NULL;
+                current_req = NULL;
             }
             lsi_disconnect(s);
             break;
@@ -1056,6 +1056,7 @@ static void lsi_do_msgout(LSIState *s)
             /* clear the current I/O process */
             if (s->current) {
                 scsi_req_cancel(s->current->req);
+                current_req = NULL;
             }
 
             /* As the current implemented devices scsi_disk and scsi_generic
diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index 2e8e67859e..b23d3ecf45 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -8,6 +8,79 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
+/*
+ * This used to trigger a UAF in lsi_do_msgout()
+ * https://gitlab.com/qemu-project/qemu/-/issues/972
+ */
+static void test_lsi_do_msgout_cancel_req(void)
+{
+    QTestState *s;
+
+    if (sizeof(void *) == 4) {
+        g_test_skip("memory size too big for 32-bit build");
+        return;
+    }
+
+    s = qtest_init("-M q35 -m 4G -display none -nodefaults "
+                   "-device lsi53c895a,id=scsi "
+                   "-device scsi-hd,drive=disk0 "
+                   "-drive file=null-co://,id=disk0,if=none,format=raw");
+
+    qtest_outl(s, 0xcf8, 0x80000810);
+    qtest_outl(s, 0xcf8, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80000810);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_outl(s, 0xcf8, 0x80000810);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80000804);
+    qtest_outw(s, 0xcfc, 0x05);
+    qtest_writeb(s, 0x69736c10, 0x08);
+    qtest_writeb(s, 0x69736c13, 0x58);
+    qtest_writeb(s, 0x69736c1a, 0x01);
+    qtest_writeb(s, 0x69736c1b, 0x06);
+    qtest_writeb(s, 0x69736c22, 0x01);
+    qtest_writeb(s, 0x69736c23, 0x07);
+    qtest_writeb(s, 0x69736c2b, 0x02);
+    qtest_writeb(s, 0x69736c48, 0x08);
+    qtest_writeb(s, 0x69736c4b, 0x58);
+    qtest_writeb(s, 0x69736c52, 0x04);
+    qtest_writeb(s, 0x69736c53, 0x06);
+    qtest_writeb(s, 0x69736c5b, 0x02);
+    qtest_outl(s, 0xc02d, 0x697300);
+    qtest_writeb(s, 0x5a554662, 0x01);
+    qtest_writeb(s, 0x5a554663, 0x07);
+    qtest_writeb(s, 0x5a55466a, 0x10);
+    qtest_writeb(s, 0x5a55466b, 0x22);
+    qtest_writeb(s, 0x5a55466c, 0x5a);
+    qtest_writeb(s, 0x5a55466d, 0x5a);
+    qtest_writeb(s, 0x5a55466e, 0x34);
+    qtest_writeb(s, 0x5a55466f, 0x5a);
+    qtest_writeb(s, 0x5a345a5a, 0x77);
+    qtest_writeb(s, 0x5a345a5b, 0x55);
+    qtest_writeb(s, 0x5a345a5c, 0x51);
+    qtest_writeb(s, 0x5a345a5d, 0x27);
+    qtest_writeb(s, 0x27515577, 0x41);
+    qtest_outl(s, 0xc02d, 0x5a5500);
+    qtest_writeb(s, 0x364001d0, 0x08);
+    qtest_writeb(s, 0x364001d3, 0x58);
+    qtest_writeb(s, 0x364001da, 0x01);
+    qtest_writeb(s, 0x364001db, 0x26);
+    qtest_writeb(s, 0x364001dc, 0x0d);
+    qtest_writeb(s, 0x364001dd, 0xae);
+    qtest_writeb(s, 0x364001de, 0x41);
+    qtest_writeb(s, 0x364001df, 0x5a);
+    qtest_writeb(s, 0x5a41ae0d, 0xf8);
+    qtest_writeb(s, 0x5a41ae0e, 0x36);
+    qtest_writeb(s, 0x5a41ae0f, 0xd7);
+    qtest_writeb(s, 0x5a41ae10, 0x36);
+    qtest_writeb(s, 0x36d736f8, 0x0c);
+    qtest_writeb(s, 0x36d736f9, 0x80);
+    qtest_writeb(s, 0x36d736fa, 0x0d);
+    qtest_outl(s, 0xc02d, 0x364000);
+
+    qtest_quit(s);
+}
+
 /*
  * This used to trigger the assert in lsi_do_dma()
  * https://bugs.launchpad.net/qemu/+bug/697510
@@ -44,5 +117,8 @@ int main(int argc, char **argv)
     qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
                    test_lsi_do_dma_empty_queue);
 
+    qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
+                   test_lsi_do_msgout_cancel_req);
+
     return g_test_run();
 }
-- 
2.36.1



