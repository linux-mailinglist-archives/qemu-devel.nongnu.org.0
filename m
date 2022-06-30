Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FDB560E84
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 03:04:11 +0200 (CEST)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ibJ-0008IF-Tn
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 21:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o6iZD-0006cJ-Kh
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 21:01:59 -0400
Received: from gw2.atmark-techno.com ([35.74.137.57]:40260)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o6iZ8-0006VU-Kp
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 21:01:58 -0400
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
 by gw2.atmark-techno.com (Postfix) with ESMTP id D086320D73
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 10:01:51 +0900 (JST)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id 5FFBC20D57
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 10:01:51 +0900 (JST)
Received: by mail-pl1-f199.google.com with SMTP id
 c16-20020a170902b69000b0016a71a49c0cso8485494pls.23
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 18:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IcaC2idNlr9EpLNjyFT+wDQbQ+dGuNWy1F/Un6xiP6U=;
 b=ETf2E6zNBsazfAqd0VatzoB0Ssgf/edkwrE3YigoIEzLMzW8RWGwxCMh7Zfu60CD5w
 UzckFRK8+q+LErHRXVnd/1Bn8f/xdEPvKjKue6vLsinJOfGVcItpWOPk5yaCgz76EJWZ
 qNlQ6TspIm2K+9DM0aU7Hxe1SBsuSysphI2rSTOpZMPmjw58G+H962zNXphtx5INf7DI
 g/iHlcRbJFpN96SislLdDMnQU9j4sH6biRn+u/SynEA0T8grslQnurOwmEcR+mc4MwZ1
 aVrWT2m/lAzs7iwYyQcUXnWG1CbEDLWtrvYtifdmLUXSuNqAQXxA4DVZGPfs8c7qbRmI
 va4A==
X-Gm-Message-State: AJIora8iwic3GR9m+N9/hZUl7CZmniHlGvL+YF5JAgG/Jv6AIafcJOS+
 /Z243JH4RPBCIGgsTNE51trTqoXhFBlyK9Sb/RJGs09tcWMtT3bCo5KGe1iUNhqAUH4cIEpnICt
 vS5f8DTcSQf4o1EVt
X-Received: by 2002:a63:4710:0:b0:410:ac39:831b with SMTP id
 u16-20020a634710000000b00410ac39831bmr5295659pga.395.1656550910216; 
 Wed, 29 Jun 2022 18:01:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v1xEhkjWJ8jrGwi9FFuefFu3kQovNoOmdpGeBFUovZH45iDF4Kb35Plq1v6pc+aUVq4AC12w==
X-Received: by 2002:a63:4710:0:b0:410:ac39:831b with SMTP id
 u16-20020a634710000000b00410ac39831bmr5295641pga.395.1656550909947; 
 Wed, 29 Jun 2022 18:01:49 -0700 (PDT)
Received: from pc-zest.atmarktech (162.198.187.35.bc.googleusercontent.com.
 [35.187.198.162]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170903234a00b0016b9b6d67a2sm2631462plh.155.2022.06.29.18.01.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Jun 2022 18:01:49 -0700 (PDT)
Received: from martinet by pc-zest.atmarktech with local (Exim 4.95)
 (envelope-from <martinet@pc-zest>) id 1o6iZ2-00AZHu-50;
 Thu, 30 Jun 2022 10:01:48 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Filipe Manana <fdmanana@kernel.org>,
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: [PATCH v2] io_uring: fix short read slow path
Date: Thu, 30 Jun 2022 10:01:37 +0900
Message-Id: <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

sqeq.off here is the offset to read within the disk image, so obviously
not 'nread' (the amount we just read), but as the author meant to write
its current value incremented by the amount we just read.

Normally recent versions of linux will not issue short reads,
but it can happen so we should fix this.

This lead to weird image corruptions when short read happened

Fixes: 6663a0a33764 ("block/io_uring: implements interfaces for io_uring")
Link: https://lkml.kernel.org/r/YrrFGO4A1jS0GI0G@atmark-techno.com
Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
v1 -> v2: also updated total_read to use += as suggested by Kevin,
thank you!

I've tested this quickly by making short reads "recursives", e.g. added
the following to luring_resubmit_short_read() after setting 'remaining':
    if (remaining > 4096) remaining -= 4096;

so when we ask for more we issue an extra short reads, making sure we go
through the two short reads path.
(Unfortunately I wasn't quite sure what to fiddle with to issue short
reads in the first place, I tried cutting one of the iovs short in
luring_do_submit() but I must not have been doing it properly as I ended
up with 0 return values which are handled by filling in with 0 (reads
after eof) and that didn't work well)

Anyway, this looks OK to me now.

Thanks,
Dominique

 block/io_uring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index d48e472e74cb..b238661740f5 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -89,7 +89,7 @@ static void luring_resubmit_short_read(LuringState *s, LuringAIOCB *luringcb,
     trace_luring_resubmit_short_read(s, luringcb, nread);
 
     /* Update read position */
-    luringcb->total_read = nread;
+    luringcb->total_read += nread;
     remaining = luringcb->qiov->size - luringcb->total_read;
 
     /* Shorten qiov */
@@ -103,7 +103,7 @@ static void luring_resubmit_short_read(LuringState *s, LuringAIOCB *luringcb,
                       remaining);
 
     /* Update sqe */
-    luringcb->sqeq.off = nread;
+    luringcb->sqeq.off += nread;
     luringcb->sqeq.addr = (__u64)(uintptr_t)luringcb->resubmit_qiov.iov;
     luringcb->sqeq.len = luringcb->resubmit_qiov.niov;
 
-- 
2.35.1


