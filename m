Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7384F37D103
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:51:16 +0200 (CEST)
Received: from localhost ([::1]:56284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgt0m-0008LB-9Q
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgstT-0003Lm-WF
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgstS-0006jm-EO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620841413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R86zZcc7FRpHnU0QoCyv8eJWQ5iCxrcTg+rbTtfI/LE=;
 b=X7yfWqqznC1WyWRfr/nESh5rTiWKBV6HwHmo/b84jukPgm74nfAvBywwGDuDeilPV5ofMj
 Y2uTr87EOrZEg4fhvaTjE+24iLTP1bFQRCkgtVfvwIeGalGQDSvnZwhzVejMa/urmL1UAF
 LRQuKdR8NHHhnXozMoHEyfg4CTshiY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-Pry91UY8PlCA_NmJYqYfZw-1; Wed, 12 May 2021 13:43:31 -0400
X-MC-Unique: Pry91UY8PlCA_NmJYqYfZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC92C101371D;
 Wed, 12 May 2021 17:43:30 +0000 (UTC)
Received: from localhost (ovpn-114-121.ams2.redhat.com [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98F7260CC6;
 Wed, 12 May 2021 17:43:30 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 4/4] iotests/297: Cover tests/
Date: Wed, 12 May 2021 19:43:18 +0200
Message-Id: <20210512174318.59466-5-mreitz@redhat.com>
In-Reply-To: <20210512174318.59466-1-mreitz@redhat.com>
References: <20210512174318.59466-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

297 so far does not check the named tests, which reside in the tests/
directory (i.e. full path tests/qemu-iotests/tests).  Fix it.

Thanks to the previous two commits, all named tests pass its scrutiny,
so we do not have to add anything to SKIP_FILES.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/297 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index e3244d40a0..ce0e82e279 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -55,8 +55,9 @@ def is_python_file(filename):
 
 
 def run_linters():
-    files = [filename for filename in (set(os.listdir('.')) - set(SKIP_FILES))
-             if is_python_file(filename)]
+    named_tests = [f'tests/{entry}' for entry in os.listdir('tests')]
+    check_tests = set(os.listdir('.') + named_tests) - set(SKIP_FILES)
+    files = [filename for filename in check_tests if is_python_file(filename)]
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
-- 
2.31.1


