Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264940CC54
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:07:22 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZJY-0006P3-2M
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6c-0006RQ-UK
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6a-0006pO-TG
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lkOkeoxp19pmD7HeGfldqA9NqC7NzqGhqxfyK41gAp4=;
 b=Vq0C2Og8CdotwZHDn2RkblZr2AO3KKymU8twGNVEIga1+9+iHSpmCX454mgHbNzMdcPsyQ
 I/MMt+SLUOuZ325RBepU+Yc2Q8ZI2oIiB1lZRadbm20X9ipojff+1tNRdTALAP4eSIWyH4
 w9i+LE5+UnjOaBm7Hrgdd3JJ1hkgA/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-6rzER8G8NXKF_OLsnfC95g-1; Wed, 15 Sep 2021 13:53:51 -0400
X-MC-Unique: 6rzER8G8NXKF_OLsnfC95g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF8911084684;
 Wed, 15 Sep 2021 17:53:50 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57BE25C1C5;
 Wed, 15 Sep 2021 17:53:50 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/32] iotests/297: Cover tests/
Date: Wed, 15 Sep 2021 19:53:00 +0200
Message-Id: <20210915175318.853225-15-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

297 so far does not check the named tests, which reside in the tests/
directory (i.e. full path tests/qemu-iotests/tests).  Fix it.

Thanks to the previous two commits, all named tests pass its scrutiny,
so we do not have to add anything to SKIP_FILES.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210902094017.32902-6-hreitz@redhat.com>
---
 tests/qemu-iotests/297 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index a0c0cf9e5d..b04cba5366 100755
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


