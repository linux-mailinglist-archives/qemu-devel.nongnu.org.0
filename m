Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0405B0BCA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 19:50:45 +0200 (CEST)
Received: from localhost ([::1]:43596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVzCG-0006MT-AN
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 13:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1oVz85-00040b-Rn
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 13:46:25 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1oVz84-00068B-A6
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 13:46:25 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso19130984pjk.0
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 10:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=0RM4Sw/2uM7wKherlxRVeU2M3Po+2G0gvJfcqA9F1DM=;
 b=IzEPtPwNrIpvh9B10WYHpFDqCSbXzbPBhj9/cOObox3nKCjYJNsePmitV7bIz0+lxh
 VrEPfjW7R7CsBxjjlmc4+5H++nn9cXs39klBa/lfqeO5k5moMuTdlZblfGmwso5oYYs/
 VlkgJQ8CBjMu0Oq7u/uRr1PBTtoIchnwJSfWf349XDZY3sEMAQl2o0KLzpCvql8O8au5
 DUKJfrpYwhchGQYUa8sBvmmpmbNaqv+DvtDSX+4AEZH//114QGCmUywr5uolitpBo/W9
 eYNVRKziJlrc9PnBcoibok4qROVN3Q35OoRAMK2anYP5lqagOTGQEphkX9vTmJ1VfWkQ
 seGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=0RM4Sw/2uM7wKherlxRVeU2M3Po+2G0gvJfcqA9F1DM=;
 b=GpKaSEBpmR2T18XSScPC/2F3YU2kx2fBbB3hAVAa2D0G0MR5LwKxgtQ3/FROrPuhsY
 JRSoYyfTAfAP3e/yQvqN4goJdQivQgrzMGmg0k1invFuMFMxy8vAzl/aXIzMGzdWXOWP
 uAoRgJTGSXTG1WWRXmF6N2g2Wqqb9kn0CJHgL8hD4NVxu5r0LEc0C4wnsQPqFKpFDMP3
 KzbSzhM9VWE+qsP4aXvPQDTDyEGtQA5IbXKT3BZ13Tbs9J2h1fZJPlTUUGZ5WZqRPhyG
 HKwN89HMYNdn/kwXieU+dk9mi2RzlVXpHIlP3eFs3NRmuDchAz2iH0nCnhWTRAJfNE4c
 KTvQ==
X-Gm-Message-State: ACgBeo0DetSMV6fvbA7zCOj1ewvOk5aweg/XqvMbXkjoChPELVxZGl3H
 irCazLcUfYvKFbk+VrwuCPU=
X-Google-Smtp-Source: AA6agR7EQotSWwO+9JupFM91lhLGPTCt+2s8FyQ085NHZ/FpSLjk0DmXsYaw4ANKQeMkkzdRK5wq+g==
X-Received: by 2002:a17:902:ba8f:b0:175:42c1:61ce with SMTP id
 k15-20020a170902ba8f00b0017542c161cemr5250137pls.130.1662572782319; 
 Wed, 07 Sep 2022 10:46:22 -0700 (PDT)
Received: from thinkpad ([103.144.92.149]) by smtp.gmail.com with ESMTPSA id
 t6-20020a17090340c600b0016cf3f124e1sm1937067pld.234.2022.09.07.10.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 10:46:21 -0700 (PDT)
From: Jay Khandkar <jaykhandkar2002@gmail.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mst@redhat.com,
 Jay Khandkar <jaykhandkar2002@gmail.com>
Subject: [PATCH V2] hw/intc: Handle software disabling of APIC correctly
Date: Wed,  7 Sep 2022 23:14:11 +0530
Message-Id: <20220907174410.25180-1-jaykhandkar2002@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=jaykhandkar2002@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

When the local APIC is in a software disabled state, all local interrupt
sources must be masked and all attempts to unmask them should be
ignored. Currently, we don't do either. Fix this by handling it
correctly in apic_mem_write().

Signed-off-by: Jay Khandkar <jaykhandkar2002@gmail.com>
---
 hw/intc/apic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 3df11c34d6..be26b5c913 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -793,6 +793,11 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
         break;
     case 0x0f:
         s->spurious_vec = val & 0x1ff;
+        if (!(val & APIC_SPURIO_ENABLED)) {
+            for (int i = 0; i < APIC_LVT_NB; i++) {
+                s->lvt[i] |= APIC_LVT_MASKED;
+            }
+        }
         apic_update_irq(s);
         break;
     case 0x10 ... 0x17:
@@ -812,6 +817,9 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
     case 0x32 ... 0x37:
         {
             int n = index - 0x32;
+            if (!(s->spurious_vec & APIC_SPURIO_ENABLED)) {
+                val |= APIC_LVT_MASKED;
+            }
             s->lvt[n] = val;
             if (n == APIC_LVT_TIMER) {
                 apic_timer_update(s, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
-- 
2.37.3


