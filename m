Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948DC2FB478
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:45:36 +0100 (CET)
Received: from localhost ([::1]:50790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mdr-0001lP-Lc
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVZ-0008Jn-M0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:01 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVY-0003Vt-3C
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:01 -0500
Received: by mail-wr1-f47.google.com with SMTP id 6so11547764wri.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lp8e+6CNq3PfO/lG5V1bR2jAbjEfRw8uEWg2058AyFU=;
 b=klIV5NYmQwkloh4SynoEb6Wz2DZCAbMYn6tMgGuRZRxnWZqLsYfd0qqbylq84y0NC0
 tZkmwR5HQafKC0fMnsxdi3DI7KzgfT6MZtKuYgGkqd7W19m0JJz1BS/f813JGQ9Qmwmu
 Us/qHtriOyp9eKNO16Nf/vROPwd+Q2DAvaMywsQHXUWFhL2dC9unhMcK9c44Toow580K
 PyYdtylG7q3BUozIgj/V3CLysJKSXUYcmUtrPgnCdWHabZMAe1LH2jMg3HdUndV4Xdx0
 7A5HrbQYY/pLTAwIxtygXQDuPriR/DOAGDw0MljpOluKrZ5scpTbiqfNuay1qSknhKsq
 RWhg==
X-Gm-Message-State: AOAM531u3e3Nk/Uw3gE8omne3cCYM02pgB18Zet7iIq5Cu7uOqWOriQ4
 V6uUwtZDfQ5hexQMa9I3wYV38B/+vbc=
X-Google-Smtp-Source: ABdhPJxjGcXowrZlsbQpIwzmvS7XjGkgESMuy3ZucjlqqyHpw6f+tDtJBY4hxnXhpiomnX9RtBAn2g==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr3165700wru.291.1611045418609; 
 Tue, 19 Jan 2021 00:36:58 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:58 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/11] hw/m68k/next-cube: Remove unused fields from NeXTState
Date: Tue, 19 Jan 2021 09:36:15 +0100
Message-Id: <20210119083617.6337-10-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.221.47; envelope-from=th.huth@gmail.com;
 helo=mail-wr1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The fields scsi_irq, scsi_dma, scsi_reset and fd_irq in
NeXTState are all unused, except in commented out
"this should do something like this" code. Remove the
unused fields. As and when the functionality that might
use them is added, we can put in the correct kind of
wiring (which might or might not need to be a qemu_irq,
but which in any case will need to be in the NeXTPC
device, not in NeXTState).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210115201206.17347-10-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/next-cube.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 57f9e9f837..1f6a2d58a1 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -74,10 +74,6 @@ struct NeXTState {
     MachineState parent;
 
     next_dma dma[10];
-    qemu_irq *scsi_irq;
-    qemu_irq scsi_dma;
-    qemu_irq scsi_reset;
-    qemu_irq *fd_irq;
 };
 
 #define TYPE_NEXT_PC "next-pc"
-- 
2.29.2


