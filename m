Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746F23CEAB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 20:55:04 +0200 (CEST)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3OZ5-0005Mg-IR
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 14:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3OYK-0004si-Gr
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 14:54:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30775
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3OYI-0002Ms-3Y
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 14:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596653652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=/GUn8fcsEi9RDhhxXz/ShIcjf41mu/Zon+Ud/Yu+ZQc=;
 b=XSRvKwUpsGIJ+66wpFw1vX3REYUjmzmdtKTe4O7jsYf2UdRBvfJMifImfpOAmi3UKSB2Av
 68iT5ZbmUdPTgymLhdKNMQ4j/AB4xHXBuid1mBXsnJxMYmmGN4Cz8NUv1eIIf8Zpe/xyXm
 7Ide9Xld1VBWuwaYSINpSLr0kj7o1fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Ur6OF0XPOi-ROCu5sytvVQ-1; Wed, 05 Aug 2020 14:54:08 -0400
X-MC-Unique: Ur6OF0XPOi-ROCu5sytvVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9D991932480;
 Wed,  5 Aug 2020 18:54:07 +0000 (UTC)
Received: from thuth.com (ovpn-112-142.ams2.redhat.com [10.36.112.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C8127B910;
 Wed,  5 Aug 2020 18:54:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH] travis.yml: Drop the default softmmu builds
Date: Wed,  5 Aug 2020 20:54:03 +0200
Message-Id: <20200805185403.15227-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 12:04:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The total runtime of all Travis jobs is very long and we are testing
all softmmu targets in the gitlab-CI already - so we can speed up the
Travis testing a little bit by not testing the softmmu targets here
anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Well, ok, we do not test all the softmmu targets on gitlab-CI with
 that same ancient version of Ubuntu ... but do we still care about
 testing all softmmut targets on Ubuntu Xenial at all? ... at least
 according to our support policy, we do not care about Xenial anymore.

 .travis.yml | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 6695c0620f..18290bc51d 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -123,20 +123,6 @@ jobs:
         - CONFIG="--disable-system --static"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
-
-    # we split the system builds as it takes a while to build them all
-    - name: "GCC (main-softmmu)"
-      env:
-        - CONFIG="--disable-user --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-
-
-    - name: "GCC (other-softmmu)"
-      env:
-       - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-
-
     # Just build tools and run minimal unit and softfloat checks
     - name: "GCC check-softfloat (user)"
       env:
-- 
2.18.1


