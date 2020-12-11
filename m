Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82AF2D7CD7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:28:35 +0100 (CET)
Received: from localhost ([::1]:52198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmDa-0002iR-Ci
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlv2-0004Do-4o
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluU-0002Eg-FT
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6yUMGjkIw1U8jlbVVitY/0E/gdBSqbl/+tWD2FZ6RI=;
 b=EK90os/WE9lWxV+N269Ltjt5ou0x3GWQh4EO9yqW2yOWNvnv79yt9bnoijTwPUcYYKrcAb
 OR4kIsjqv11qMyeNS+PZCk3wktUC2E6hvPXjR8vwqEfMqECEO3Tlf3h4XsRYICEpq6gmxQ
 T9FAv33E7oLMQQ9U2Ex535m0CwZfywI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-tdwwJ-YFPv-UUkoIVkFYMw-1; Fri, 11 Dec 2020 12:08:45 -0500
X-MC-Unique: tdwwJ-YFPv-UUkoIVkFYMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5FA08015D0;
 Fri, 11 Dec 2020 17:08:43 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D50EE5D6A8;
 Fri, 11 Dec 2020 17:08:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/34] iotests/287: Clean up subshell test image
Date: Fri, 11 Dec 2020 18:07:57 +0100
Message-Id: <20201211170812.228643-20-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Max Reitz <mreitz@redhat.com>

287 creates an image in a subshell (thanks to the pipe) to see whether
that is possible with compression_type=zstd.  If _make_test_img were to
modify any global state, this global state would then be lost before we
could cleanup the image.

When using FUSE as the test protocol, this global state is important, so
clean up the image before the state is lost.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201027190600.192171-16-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/287 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/287 b/tests/qemu-iotests/287
index f98a4cadc1..036cc09e82 100755
--- a/tests/qemu-iotests/287
+++ b/tests/qemu-iotests/287
@@ -51,8 +51,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 CLUSTER_SIZE=65536
 
 # Check if we can run this test.
-if IMGOPTS='compression_type=zstd' _make_test_img 64M |
-    grep "Invalid parameter 'zstd'"; then
+output=$(_make_test_img -o 'compression_type=zstd' 64M; _cleanup_test_img)
+if echo "$output" | grep -q "Invalid parameter 'zstd'"; then
     _notrun "ZSTD is disabled"
 fi
 
-- 
2.29.2


