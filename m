Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5856022B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:14:20 +0200 (CEST)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6YSR-0004p4-Fs
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o6QAk-0000t1-OC
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 01:23:30 -0400
Received: from gw2.atmark-techno.com ([35.74.137.57]:52074)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o6QAi-0008I3-7N
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 01:23:30 -0400
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
 by gw2.atmark-techno.com (Postfix) with ESMTP id 29E2920D74
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 14:23:26 +0900 (JST)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id D5ADE20D6F
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 14:23:25 +0900 (JST)
Received: by mail-pg1-f199.google.com with SMTP id
 w191-20020a6382c8000000b0040c9dc669ccso7621501pgd.16
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 22:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ok7fjt2HLtzyiFZgn7jXCpK5ic4APvLuEpwIqATpV5A=;
 b=Iw62e6Wc917QiZBt3Rrtn3k3u3/t+YTClYkvQBaVO1f2Cs3UbvyYpwjeAM51tISeWh
 BmzPknromc4J+/CTX9Oat9Rm8NXigCpmye7giOyG/yOVEVtQk8V4IK8v5fLfrCxD1sZs
 QcB+WUzlWLB7iQaXwDfjVQjLJpODIpfQc5byrAaWFmwsD1ZAE2wWCVZqVdafZ3WSHIpn
 Trc4TudHoIrwUvRWWgUSLROWdGMPyA2nRb5bPSY1CyJBITjAutEVxYhrtVdYTfUnDjsT
 lpLS3ug622FzZKrsfF+CO5dUZG7LEoBPmbTAvcNq8eNEGCtAwZLRcXE9m88wJRLrH6AU
 6dsQ==
X-Gm-Message-State: AJIora88nqAOSCNOtotBWXXxd+hgYPwFCvP75K02vXEEx2PeFxo3Mn+Q
 msDiL8LKDQPDlU6S7oqSfYPkknhTNHh+aWi+s0FuBVss5u24Xg6LrmBasDWeknsBTRLvv3nIiIR
 WJSSZvJwiczeNXfuT
X-Received: by 2002:a63:340d:0:b0:40c:f9c1:c82e with SMTP id
 b13-20020a63340d000000b0040cf9c1c82emr1472879pga.251.1656480204683; 
 Tue, 28 Jun 2022 22:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1teWOM+42Tvchp1LwndENU9NruVCUKZt//Mv68Dx+WF7tFVf/MLU6eJYCO6sdt6drwmgJ1Cug==
X-Received: by 2002:a63:340d:0:b0:40c:f9c1:c82e with SMTP id
 b13-20020a63340d000000b0040cf9c1c82emr1472851pga.251.1656480204356; 
 Tue, 28 Jun 2022 22:23:24 -0700 (PDT)
Received: from pc-zest.atmarktech (126.88.200.35.bc.googleusercontent.com.
 [35.200.88.126]) by smtp.gmail.com with ESMTPSA id
 f5-20020aa79d85000000b005187431876fsm10425306pfq.180.2022.06.28.22.23.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jun 2022 22:23:24 -0700 (PDT)
Received: from martinet by pc-zest.atmarktech with local (Exim 4.95)
 (envelope-from <martinet@pc-zest>) id 1o6QAc-008SxV-OO;
 Wed, 29 Jun 2022 14:23:22 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: [PATCH] io_uring: fix short read slow path corruptions
Date: Wed, 29 Jun 2022 14:23:16 +0900
Message-Id: <20220629052316.2017896-1-dominique.martinet@atmark-techno.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=35.74.137.57;
 envelope-from=dominique.martinet@atmark-techno.com; helo=gw2.atmark-techno.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Jun 2022 09:53:10 -0400
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
Forgive the double mail if it gets to you twice: I missed Ccs on the first
try, I should have known better...

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


