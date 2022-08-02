Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C6587D48
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:41:16 +0200 (CEST)
Received: from localhost ([::1]:50866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIs95-0000hl-27
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs66-0003aL-R3
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs63-0002aM-AK
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659447486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSCc8JrQwHHwaeq4p87pF8gldcnzauUQUjvusAVhgnA=;
 b=KlNza/QhJBYKyWSLIeajU2enL/X22ntRa5C0HaKZOi2itUwsSDbUG/opH1QL57kgo4ZWem
 UD3NFSjj8xyUIuSR/8EApgNIcoZgzLORdrw3nINLu3DeVMfrcEb0xPdUAS0DOcnbJ/P1gX
 NojqbMXovdfoGYXAsDGhhmAby7Hj7dM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-eoMgy9OTNqCGBeOPLr1yCg-1; Tue, 02 Aug 2022 09:38:03 -0400
X-MC-Unique: eoMgy9OTNqCGBeOPLr1yCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 197DF280D211;
 Tue,  2 Aug 2022 13:38:03 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 598E22166B2A;
 Tue,  2 Aug 2022 13:38:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 1/7] block/io_uring: add missing include file
Date: Tue,  2 Aug 2022 15:37:51 +0200
Message-Id: <20220802133757.138016-2-kwolf@redhat.com>
In-Reply-To: <20220802133757.138016-1-kwolf@redhat.com>
References: <20220802133757.138016-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Jinhao Fan <fanjinhao21s@ict.ac.cn>

The commit "Use io_uring_register_ring_fd() to skip fd operations" uses
warn_report but did not include the header file "qemu/error-report.h".
This causes "error: implicit declaration of function ‘warn_report’".
Include this header file.

Fixes: e2848bc574 ("Use io_uring_register_ring_fd() to skip fd operations")
Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Message-Id: <20220721065645.577404-1-fanjinhao21s@ict.ac.cn>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io_uring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/io_uring.c b/block/io_uring.c
index f8a19fd97f..a1760152e0 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include <liburing.h>
 #include "block/aio.h"
+#include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "block/block.h"
 #include "block/raw-aio.h"
-- 
2.35.3


