Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E849E28E436
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 18:17:58 +0200 (CEST)
Received: from localhost ([::1]:43630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSjTR-00019S-ST
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 12:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSjBk-0004u9-LU
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 11:59:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSjBZ-00010J-BZ
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 11:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602691168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+CY1sHnrvso4O/aGPEZOoKUho8+gm/1sZCae1y4g1c=;
 b=Wuv3HiCVQ8lzhGoYgWMU/8cLHKWBvty8tCMEpAQ7JRafLoT1ArxorpcdMB/eSL2bhX0bRX
 3BiGvBRS05TYwTpyobjmoZDKKyb2x6N3VbCSkUV7mN3uBcyPMJmRQlnw/GS/89Ztgaburr
 bhsCa88fU5MHumKpMoKGdjBuQvzk+JY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-HJ52pVRiOWiu9vPGiQHzaw-1; Wed, 14 Oct 2020 11:59:24 -0400
X-MC-Unique: HJ52pVRiOWiu9vPGiQHzaw-1
Received: by mail-wr1-f69.google.com with SMTP id f11so1537594wro.15
 for <qemu-devel@nongnu.org>; Wed, 14 Oct 2020 08:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+CY1sHnrvso4O/aGPEZOoKUho8+gm/1sZCae1y4g1c=;
 b=Rr/ZB9rmzIjbKAFhqvEdUrkthJaMTRnySBqQoSzYmU0e2yTvKn8S/UaejAzoSBG0Ht
 MqtFu5pKoguoh6ZMapk08+/fLoCCK5F9UAKx1B/yDDk2xkKb4UOrjDYBbKpgONlC4nHm
 2inPNLKrV+IoRIsCIy+9iqY6/oC2UdOnfqu6IRTSDi7KJsCPJQlGyg2aLWjSzCN7ktbV
 26Fhqz8KGY+yMr1ixrV/DI/SfYx1esYrDrHm72EX2QASkxS7Q5/JAoNHG0ESROsOtphf
 ThJTSL/FP4VuadXsg7zMTAexA18TbhG4pOTSLOKexzpFjqcvnPw9eKmNRe4fo3hn7l2n
 KfLA==
X-Gm-Message-State: AOAM5328n7BQNs3f6y6/UbQup9dUb6P/cuDVhlhREKOrs1ZcTMuwYCQX
 /2yjFtt0snDMG3jKxfmd35sKWtb1IzIgG40UQMBcyn0HLrTHCbB5XcaHUOsrxqdrDBB5yBu1vdB
 7vPq7Xdx0aOSVJi0=
X-Received: by 2002:a05:600c:2144:: with SMTP id
 v4mr110680wml.172.1602691162634; 
 Wed, 14 Oct 2020 08:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb8NE/Don2naHAFdAZNdX9CrlkYcoDtTq/mU0sA5Zw2NiSxEvBkUgqL9rDk2GjVE/oltEDAA==
X-Received: by 2002:a05:600c:2144:: with SMTP id
 v4mr110667wml.172.1602691162464; 
 Wed, 14 Oct 2020 08:59:22 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id s2sm63940wmf.45.2020.10.14.08.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 08:59:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/15] block/nvme: Report warning with warn_report()
Date: Wed, 14 Oct 2020 17:58:09 +0200
Message-Id: <20201014155810.102841-15-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014155810.102841-1-philmd@redhat.com>
References: <20201014155810.102841-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 01:12:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of displaying warning on stderr, use warn_report()
which also displays it on the monitor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index ea5180d8a27..4d2b7fdf4f4 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -390,8 +390,8 @@ static bool nvme_process_completion(NVMeQueuePair *q)
         }
         cid = le16_to_cpu(c->cid);
         if (cid == 0 || cid > NVME_QUEUE_SIZE) {
-            fprintf(stderr, "Unexpected CID in completion queue: %" PRIu32 "\n",
-                    cid);
+            warn_report("NVMe: Unexpected CID in completion queue: %"PRIu32", "
+                        "queue size: %u", cid, NVME_QUEUE_SIZE);
             continue;
         }
         trace_nvme_complete_command(s, q->index, cid);
-- 
2.26.2


