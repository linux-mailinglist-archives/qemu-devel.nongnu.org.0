Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B376B6412D1
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 01:54:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1Gmo-0002cJ-1o; Fri, 02 Dec 2022 19:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1Gml-0002aW-GH
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 19:53:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1GmN-0004CQ-JV
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 19:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670028795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zHSlhWlBwUF+a/rA8eBDG2LpMGFTK4nNLcX5d1ZUSE=;
 b=dB2DZJGMQGvZ6SBcMATz3SfPZz/mwbvHdh2u0yJ2Uf5C2G2Hcp/BdOZSW6P/hx4CR3Hsml
 t8xxOdj2Gykkdh1HLzEhJlYewf8yXh6RFfdFmqSrC9LYpBCIbX5Ldw4S8J1g6jUUZcyk4q
 WevB84MHzHrjxPBfI4aeQRo4jckxqNA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-40Zc8q9gMT2daE3hoN9hGg-1; Fri, 02 Dec 2022 19:53:12 -0500
X-MC-Unique: 40Zc8q9gMT2daE3hoN9hGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE90380452A;
 Sat,  3 Dec 2022 00:53:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 524C140C955A;
 Sat,  3 Dec 2022 00:52:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH 2/3] iotests/check: Fix typing for sys.exit() value
Date: Fri,  2 Dec 2022 19:52:33 -0500
Message-Id: <20221203005234.620788-3-jsnow@redhat.com>
In-Reply-To: <20221203005234.620788-1-jsnow@redhat.com>
References: <20221203005234.620788-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 75de1b4691e..9bdda1394e7 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -159,7 +159,7 @@ if __name__ == '__main__':
         if not tests:
             raise ValueError('No tests selected')
     except ValueError as e:
-        sys.exit(e)
+        sys.exit(str(e))
 
     if args.dry_run:
         print('\n'.join(tests))
-- 
2.38.1


