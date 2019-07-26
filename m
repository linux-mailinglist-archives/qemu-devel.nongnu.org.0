Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ABE76C7C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 17:20:43 +0200 (CEST)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hr21S-0002Qf-1i
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 11:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hr20k-0000ld-QP
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 11:20:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hr20j-0006v2-AM
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 11:19:58 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37231)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hr20j-0006sK-2Q
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 11:19:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n9so29755678wrr.4
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=T/xJHFrQoJ4wgCuUOjNgn0AYtE8Gq7pDtEMvN4Sp0P4=;
 b=pL+dJWWDO8lSq/SXLv2N5NtGOC3c4Uf04s1lDZjWUJJaCiP2zGoiqpaL/SC4l2g5vY
 ITP52zeWDOQ7CiJFsubb9Euteuh4aZj91isGqLzv9cOUL1T2npE88Ij7HuAEFbYTPpmC
 EZdwb38m57hzQS8ZM1ciDZJ296aJTMK33iTkNgQDayD+I6v/QqFaeSnB2ZnHGsUOvjM7
 0kv05HhABn9dLf1FNuvO8FNkLYOwyeCKVxzkAg1KwxQ67w93wZwLY8V4ar+aQFBkhAPo
 N5Mbm1B2mZvlI2pn4W+fFWCcMei4fWSS62UK5Iu+P2t5GSHWfmC6tR6wj/UXiOPAY3HX
 L+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T/xJHFrQoJ4wgCuUOjNgn0AYtE8Gq7pDtEMvN4Sp0P4=;
 b=d4tOwZuVm6wspFs3eROucuVXpXs0Cer/xVtmNBTsPXG/vsDRnVOWkvGyHPrJRYPu2R
 qcZACSJ1N6Q9Cat/5X/52FasXoNIwi1a9GnaYD8F+MhZA6b96+MpwFh1SuqOz0xBR0O7
 KJOXMcoSPuTOJFaKDdBR/AEpfRsXq25zj2ldcL98Jbvtw1lk8SwAnvVx5XFFcvmq6jYd
 EyX2iG81k2FLOl6BEIJpfhaH1NrBw8XjvpxdM/L972vRqem89umCmtNRVi4d2eiu6Oyq
 y25SvwI+OonbPPJVfaxNfE1XjV//694cF37HWyDRW3u2E2W2QpaZVBd3rpYU3SiDnMMp
 BCsg==
X-Gm-Message-State: APjAAAU5Aj0mBV+rLb3jhEO0av+bxy5+FTKFWAqLGzIgDSj+V1DmRhpk
 ugIhdYnswHSisC8eeZqj7h8bu+aykM1ufQ==
X-Google-Smtp-Source: APXvYqxEq3otlCLAUDxob5yEP3gYI1a3UfpbOojkOTATUHI3OCwW4SILIiCdlH/rPdbRVhcvTn+qcw==
X-Received: by 2002:a5d:4041:: with SMTP id w1mr91050824wrp.199.1564154395815; 
 Fri, 26 Jul 2019 08:19:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v16sm32746844wrn.28.2019.07.26.08.19.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 08:19:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 16:19:48 +0100
Message-Id: <20190726151952.1932-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726151952.1932-1-peter.maydell@linaro.org>
References: <20190726151952.1932-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
Subject: [Qemu-devel] [PULL 1/5] pl330: fix vmstate description
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

From: Damien Hedde <damien.hedde@greensocs.com>

Fix the pl330 main and queue vmstate description.
There were missing POINTER flags causing crashes during
incoming migration because:
+ PL330State chan field is a pointer to an array
+ PL330Queue queue field is a pointer to an array

Also bump corresponding vmsd version numbers.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-id: 20190724143553.21557-1-damien.hedde@greensocs.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/pl330.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 58df965a468..a56a3e77713 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -218,11 +218,12 @@ typedef struct PL330Queue {
 
 static const VMStateDescription vmstate_pl330_queue = {
     .name = "pl330_queue",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
-        VMSTATE_STRUCT_VARRAY_UINT32(queue, PL330Queue, queue_size, 1,
-                                 vmstate_pl330_queue_entry, PL330QueueEntry),
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(queue, PL330Queue, queue_size,
+                                             vmstate_pl330_queue_entry,
+                                             PL330QueueEntry),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -278,12 +279,12 @@ struct PL330State {
 
 static const VMStateDescription vmstate_pl330 = {
     .name = "pl330",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(manager, PL330State, 0, vmstate_pl330_chan, PL330Chan),
-        VMSTATE_STRUCT_VARRAY_UINT32(chan, PL330State, num_chnls, 0,
-                                     vmstate_pl330_chan, PL330Chan),
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(chan, PL330State, num_chnls,
+                                             vmstate_pl330_chan, PL330Chan),
         VMSTATE_VBUFFER_UINT32(lo_seqn, PL330State, 1, NULL, num_chnls),
         VMSTATE_VBUFFER_UINT32(hi_seqn, PL330State, 1, NULL, num_chnls),
         VMSTATE_STRUCT(fifo, PL330State, 0, vmstate_pl330_fifo, PL330Fifo),
-- 
2.20.1


