Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A505601D9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:06:26 +0200 (CEST)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6YKl-0002tw-4J
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o6Pes-0003aq-Th
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 00:50:36 -0400
Received: from gw2.atmark-techno.com ([35.74.137.57]:49998)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o6Peo-0008Qg-4F
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 00:50:32 -0400
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
 by gw2.atmark-techno.com (Postfix) with ESMTP id 9BA2320D6E
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 13:50:25 +0900 (JST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id 5635A20D6E
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 13:50:25 +0900 (JST)
Received: by mail-pj1-f69.google.com with SMTP id
 gi2-20020a17090b110200b001ecad6feb7cso9113417pjb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 21:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0i1/tj7hoep7JbVDSWi6eqWKpvtn7ufuE0103oPspzo=;
 b=A3WA6x3i18e6JobgfrOkcvZeqClY6LRR3zjS7RFDM9xmnIopukYxKe5u143IB6HH9u
 nswl1pDSJEgrkFUQ4XQS+BIfQ/4y+AqQAvA8UnYQV7idYs2ST7dGGPYHpFbE8t1uGHFu
 nQYonuSTklkSuKbgEQNFS55ESa35rxclKMsdUqt5Va843GDu0zqBm6wl8HAoxnkyXQG3
 0VWb7hTLXbW2Rke42pQtqGindJ+1STSl6uQTYBtfcSvz9WEYFyjHOnarjKglU+II74Ta
 19fRTNQp5IFH1vBeWQj6pyx1EVBk7Xikufvqp1hmG6pbas/d0CsJ1nXTg3Bc8rgEMwEi
 Q3uA==
X-Gm-Message-State: AJIora/EeBiDWCNl0kGvge7e8/1yvL7Bc0AW0a0w7Xp8TqWLsPGz95ci
 IJg38kHYb9ccS3X2LBMh0abzEFmCiwlSCq71xMNHDKJ4AQofa80ckMD9MP6eqqdb+txlrLHG477
 jocZsiA/Qu88BRTyz
X-Received: by 2002:a63:904b:0:b0:40d:1d01:39aa with SMTP id
 a72-20020a63904b000000b0040d1d0139aamr1374581pge.68.1656478224298; 
 Tue, 28 Jun 2022 21:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tsXv/9+hgMYZMlB2F1xlBChwLb+boG3pb0OlYlvN/Ynaw/ec3icURd7dkhDSe3L0ZcopWhhQ==
X-Received: by 2002:a63:904b:0:b0:40d:1d01:39aa with SMTP id
 a72-20020a63904b000000b0040d1d0139aamr1374563pge.68.1656478223983; 
 Tue, 28 Jun 2022 21:50:23 -0700 (PDT)
Received: from pc-zest.atmarktech (117.209.187.35.bc.googleusercontent.com.
 [35.187.209.117]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a056a00439000b00525442ac579sm10272324pfb.212.2022.06.28.21.50.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jun 2022 21:50:23 -0700 (PDT)
Received: from martinet by pc-zest.atmarktech with local (Exim 4.95)
 (envelope-from <martinet@pc-zest>) id 1o6Peg-008NvO-Fn;
 Wed, 29 Jun 2022 13:50:22 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: qemu-devel@nongnu.org
Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: [PATCH] io_uring: fix short read slow path corruptions
Date: Wed, 29 Jun 2022 13:49:58 +0900
Message-Id: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=35.74.137.57;
 envelope-from=dominique.martinet@atmark-techno.com; helo=gw2.atmark-techno.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Jun 2022 09:53:09 -0400
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

sqeq.off here is the offset to read within the disk image, so obviously
not 'nread' (the amount we just read), but as the author meant to write
its current value incremented by the amount we just read.

Normally recent versions of linux will not issue short reads,
but apparently btrfs with O_DIRECT (cache=none) does.

This lead to weird image corruptions when short read happened

Fixes: 6663a0a33764 ("block/io_uring: implements interfaces for io_uring")
Link: https://lkml.kernel.org/r/YrrFGO4A1jS0GI0G@atmark-techno.com
Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---

I just spent a couple of days on this bug, will follow up with kernel to
see if we can also not get rid of the short read but perhaps a warning
should be added the first time we get a short read, as it's not supposed
to happen?
Well, slow path now seems to work (at least my VM now boots fine), but
if the code clearly states it should never be used I assume there might
be other bugs laying there as it's not tested... That this one was easy
enough to spot once I noticed the short reads was its only grace...

Thanks!

 block/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index d48e472e74cb..d58aff9615ce 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -103,7 +103,7 @@ static void luring_resubmit_short_read(LuringState *s, LuringAIOCB *luringcb,
                       remaining);
 
     /* Update sqe */
-    luringcb->sqeq.off = nread;
+    luringcb->sqeq.off += nread;
     luringcb->sqeq.addr = (__u64)(uintptr_t)luringcb->resubmit_qiov.iov;
     luringcb->sqeq.len = luringcb->resubmit_qiov.niov;
 
-- 
2.35.1


