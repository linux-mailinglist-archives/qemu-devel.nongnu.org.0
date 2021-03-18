Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DCE340AC7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:59:30 +0100 (CET)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvzd-0001G8-E0
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMvYE-0004DF-ME
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:31:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMvY9-0008Lj-T7
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616085064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g7L9GMY2HcsaUWzF8s+6BY+fQhOs3++iw+ETiElTCQw=;
 b=C/S/pvEz8fWWxDc5oT6Pn3IDxu8xS3z9HpsSQc9QL6oudm/bRMgfBQ8DFP/hjE6em+LwCU
 Rq9xRtg43Z2PpEhV/ieCllwHWyAD8Kyipjm4yWDCrCC25wbmNFAP/7W/7SXhW05TUyHRvE
 41NAh32V/XWdm6NF6XzQL5D3kyzaZqQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-aX8d_7D8N3mj3CRBAzsQ7A-1; Thu, 18 Mar 2021 12:31:03 -0400
X-MC-Unique: aX8d_7D8N3mj3CRBAzsQ7A-1
Received: by mail-wr1-f71.google.com with SMTP id h30so20406258wrh.10
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g7L9GMY2HcsaUWzF8s+6BY+fQhOs3++iw+ETiElTCQw=;
 b=AMJ3TqPEodl8ovvOHyVyez7TBFXC2nfpqnCc9MhatM4+twDCL3Tm8txi7nTfZZPlNw
 +RDzSiBQ4dM9h6OwpfLjErq1ZgRUshv5+VcWf6XLybenCapMocW49R+tQpDS4zTg7b13
 toxrkF0eFTHgz1gUcF4/uBcLAlVoOE1ostjV7F0tycr+OvvrKUtAkdnOlZITmuQRDk2b
 3FGMWojrTFxrCwoiAoP3ww28hBx2A3Ysj2QHaMX6GOSxMuKoHDYrLXPRjUzJMsq2Ty37
 t6z4oiJBCL1nEzOAxH4KAdaYWd5dQ9+qO1hF7C2HqYSIbbiYpH+qE+K8MaSoscXU7p8p
 8RPQ==
X-Gm-Message-State: AOAM533v5bEA+rpyVDhBYQKHeVBhsLRvuLxIoOYqYJ0jmr32YTtV+TP1
 UW9aJ7cLB6Ib8Q2eFRycFuriJZOWcs1G8BVLH9WoggNjtjUgs8Ux7l8ocXTppVkxi07cJnA8HkP
 y3DlyQWbgt+190Z/i8+jRT8PSGGvAzLdWCWX4DtvYQRK1MyrYteGVmSGUPhJ/m3Q+
X-Received: by 2002:adf:f4c1:: with SMTP id h1mr104579wrp.71.1616085061655;
 Thu, 18 Mar 2021 09:31:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypR47qWii4QXGI2uZ31pat3JCFe6i7hpAwkbI/EuVtQ2UTuwJ+MdIzb49LIjcuk/AtTI0tLw==
X-Received: by 2002:adf:f4c1:: with SMTP id h1mr104549wrp.71.1616085061398;
 Thu, 18 Mar 2021 09:31:01 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a131sm2914121wmc.48.2021.03.18.09.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 09:31:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.0 v3] hw/intc/i8259: Refactor pic_read_irq() to avoid
 uninitialized variable
Date: Thu, 18 Mar 2021 17:30:59 +0100
Message-Id: <20210318163059.3686596-1-philmd@redhat.com>
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
Since v2:
- Remove pic_intack() call (Zoltan)
---
 hw/intc/i8259.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 344fd04db14..cc4e21ffec0 100644
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
@@ -189,20 +191,18 @@ int pic_read_irq(DeviceState *d)
                 irq2 = 7;
             }
             intno = slave_pic->irq_base + irq2;
+            pic_intack(s, irq);
+            irq = irq2 + 8;
         } else {
             intno = s->irq_base + irq;
+            pic_intack(s, irq);
         }
-        pic_intack(s, irq);
     } else {
         /* spurious IRQ on host controller */
         irq = 7;
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


