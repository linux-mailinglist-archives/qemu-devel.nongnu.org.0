Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE68380E6B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:48:58 +0200 (CEST)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhazh-0000p0-Qn
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajf-0000P1-Ku
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajS-0001CX-LA
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arvcnQzgZQvew+2zUEiV45b8RFU1l0LveJO1P9lFnsw=;
 b=aQJDBrpXeOueDqziNaTh/WLQr6nMSP1SWt5XBMRQZDo6HYmhFpPAl75ZsrEDB62ZI+yRdq
 +VL3C9CsJQHhq0txs30cW47ubV7AgCw469dtviqHJEKkFCTY6naopbyKOpSOd3xsDcHb8G
 lKyLEJbo+s+4cvCpZHj4gy7SDPuvS20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-7BHlY9prMcq4Sr7cTVh91Q-1; Fri, 14 May 2021 12:32:01 -0400
X-MC-Unique: 7BHlY9prMcq4Sr7cTVh91Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F757801817;
 Fri, 14 May 2021 16:32:00 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AB8F19D9B;
 Fri, 14 May 2021 16:31:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/14] qapi: spelling fix (addtional)
Date: Fri, 14 May 2021 18:31:14 +0200
Message-Id: <20210514163124.251741-5-kwolf@redhat.com>
In-Reply-To: <20210514163124.251741-1-kwolf@redhat.com>
References: <20210514163124.251741-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Tokarev <mjt@tls.msk.ru>

Fixes: 3d0d3c30ae3a259bff176f85a3efa2d0816695af
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Message-Id: <20210508093315.393274-1-mjt@msgid.tls.msk.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index cd0e76d564..40d70c434a 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -251,8 +251,8 @@
 #
 # @max_queue_size: the maximum number of packets to keep in the queue for
 #                  comparing with incoming packets from @secondary_in.  If the
-#                  queue is full and addtional packets are received, the
-#                  addtional packets are dropped. (default: 1024)
+#                  queue is full and additional packets are received, the
+#                  additional packets are dropped. (default: 1024)
 #
 # @vnet_hdr_support: if true, vnet header support is enabled (default: false)
 #
-- 
2.30.2


