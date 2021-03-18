Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9AB3409DA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:16:16 +0100 (CET)
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvJn-0003Fg-9z
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMvDg-00078p-Ix
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMvDf-0005Ek-2q
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616083794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0ILZwEmglVjVyYz5F4sj1LV2EThGiB2LjCTP+JRuw5I=;
 b=QfjocBqv+kqjv1k/hEB51Z7jtulhvcJl3QiCf7RLCJRKvH68Rr8eB33U6jFBEYzXsPj2A5
 6BN0wdwBPxHpvnL8blt+Q3kQMfWcYzkagj5+xrcYxAxSp2oti9apzcI0cJVDs9bPOSQCHx
 6mywkdvMCDYTIV6v0o780BgC+6PhErk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-LXKNjwiBOB6o02fGYVICjg-1; Thu, 18 Mar 2021 12:09:52 -0400
X-MC-Unique: LXKNjwiBOB6o02fGYVICjg-1
Received: by mail-wr1-f70.google.com with SMTP id m23so15307890wrh.7
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ILZwEmglVjVyYz5F4sj1LV2EThGiB2LjCTP+JRuw5I=;
 b=sxiVvtLP3O6h1EZCN5O//zgEFDU5TwtVLnU+3kZwnEUyRMKs4vgpqJUeLdOAAFYDty
 8r9ZaFPVwXqTNwl7TXnu6Cjg6nArhHwv9nZw/09ALi6Fm9Xm7UEM1lj49IBdp1InkK69
 4w1gfsKXR1t7YRHDbozs+tnfND+mnrxuCnauZHVqrjMJRpDZD/VHkmg8TxfgkBZHnHzJ
 frajwkYO/QzPfYW6RXDBgGZgzYdJxfRmVkgBU/Sxs/8whfrBBCJp0wChBLW/DmFXxHnS
 YJq2KNwvNv5KeHeeAgDy6Yo9psC/C79LqPtxdwXasnVJ69/yOO97GUIpfiJbREkD/aGJ
 s85w==
X-Gm-Message-State: AOAM530NPui4vgKtuhg6il+fRzRVip6vhTNVdSnYqYyg50OTTlxXJXa4
 jSkfml9vILU31dS5KpCc8PTSOQ4uRoYm2XvLK8iP1LkdYy4BtZ4BuRGQ+zSbP5nlkTSubU1aFKo
 OTuA3nmyoZI7wXql6nTHbW8dpWiRzkmy7LGk/Grv0xqalW6qJyBNK7HTf/JJVC+Bn
X-Received: by 2002:a05:600c:608:: with SMTP id o8mr58217wmm.42.1616083791307; 
 Thu, 18 Mar 2021 09:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8u5/G9jA+DMAJoSKxSGQfXY0OiGITPc8ggYoNhR6OMDW+jvw84D0Hzq0Z5z1qypBU7qEIDA==
X-Received: by 2002:a05:600c:608:: with SMTP id o8mr58193wmm.42.1616083791087; 
 Thu, 18 Mar 2021 09:09:51 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u17sm3401540wrw.51.2021.03.18.09.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 09:09:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.0 v2] hw/intc/i8259: Refactor pic_read_irq() to avoid
 uninitialized variable
Date: Thu, 18 Mar 2021 17:09:49 +0100
Message-Id: <20210318160949.3681463-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some compiler versions are smart enough to detect a potentially
uninitialized variable, but are not smart enough to detect that this
cannot happen due to the code flow:

../hw/intc/i8259.c: In function ‘pic_read_irq’:
../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
   203 |         irq = irq2 + 8;
       |         ~~~~^~~~~~~~~~

Restrict irq2 variable use to the inner statement.

Fixes: 78ef2b6989f ("i8259: Reorder intack in pic_read_irq")
Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Supersedes: <20210318154738.27094-1-borntraeger@de.ibm.com>
---
 hw/intc/i8259.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 344fd04db14..52c039c6c03 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -176,10 +176,12 @@ static void pic_intack(PICCommonState *s, int irq)
 int pic_read_irq(DeviceState *d)
 {
     PICCommonState *s = PIC_COMMON(d);
-    int irq, irq2, intno;
+    int irq, intno;
 
     irq = pic_get_irq(s);
     if (irq >= 0) {
+        int irq2;
+
         if (irq == 2) {
             irq2 = pic_get_irq(slave_pic);
             if (irq2 >= 0) {
@@ -189,8 +191,11 @@ int pic_read_irq(DeviceState *d)
                 irq2 = 7;
             }
             intno = slave_pic->irq_base + irq2;
+            pic_intack(s, irq);
+            irq = irq2 + 8;
         } else {
             intno = s->irq_base + irq;
+            pic_intack(s, irq);
         }
         pic_intack(s, irq);
     } else {
@@ -199,10 +204,6 @@ int pic_read_irq(DeviceState *d)
         intno = s->irq_base + irq;
     }
 
-    if (irq == 2) {
-        irq = irq2 + 8;
-    }
-
 #ifdef DEBUG_IRQ_LATENCY
     printf("IRQ%d latency=%0.3fus\n",
            irq,
-- 
2.26.2


