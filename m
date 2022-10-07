Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192B5F77A5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:47:35 +0200 (CEST)
Received: from localhost ([::1]:49218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglpG-0006J7-7w
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuA-0005TM-Hl
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogku8-0003Dc-5R
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xI4l/yIadiPT+cZ44G1USrI4MwhpfqEZxdmf7qcc/Ew=;
 b=BF7/+coJqskniO9Vs2/eoB8ZBTKeF0f+wF+gUOfGPwRhbu7nX/Sy1WKrZrto0aZbAx9dm4
 sNvb3LElO77RWh9Ah8XcM9+3yUkN+kH7i/gy8D65VjJ7tH+It9bNGUZfLsTb3jvc2OU252
 7to+bZoKHUzfMux+QXbxbJBhfOxQQfw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-HtqKMpXkMSaiGJDTpMdH1Q-1; Fri, 07 Oct 2022 06:48:28 -0400
X-MC-Unique: HtqKMpXkMSaiGJDTpMdH1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 187462A59555;
 Fri,  7 Oct 2022 10:48:28 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57691200BC6D;
 Fri,  7 Oct 2022 10:48:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 28/50] quorum: Remove unnecessary forward declaration
Date: Fri,  7 Oct 2022 12:47:30 +0200
Message-Id: <20221007104752.141361-29-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221006122607.162769-1-kwolf@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/quorum.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/block/quorum.c b/block/quorum.c
index 970f63d9f9..f9e6539ceb 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -232,8 +232,6 @@ static bool quorum_has_too_much_io_failed(QuorumAIOCB *acb)
     return false;
 }
 
-static int read_fifo_child(QuorumAIOCB *acb);
-
 static void quorum_copy_qiov(QEMUIOVector *dest, QEMUIOVector *source)
 {
     int i;
-- 
2.37.3


