Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8A331D77C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 11:26:50 +0100 (CET)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCK2j-0007AB-9p
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 05:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCK1h-0006kU-Q0
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:25:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCK1e-0007uf-PK
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:25:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613557538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZlecxFyY5k7D21cYrkc8u9H96DVfhuwHgUf5To2yYdc=;
 b=XcmHlGFzs2a2mXrJtHuh6jXAbnPfS7EiiRmg+WGhPuLSBApxNGCV+EyYs7gBIFqjvuoz7I
 jif7Ptl7eip5lmv7ZgGA0RQIUbVOpoD0efkw7T0aK3QQ2yxqfl5VH/tkjHE37DFRFV23ha
 cEG79gb/1Tp2YffxzOzi2iXyQSa13lA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-ba4NfkyGPiuQ_u2vwSxDSw-1; Wed, 17 Feb 2021 05:25:35 -0500
X-MC-Unique: ba4NfkyGPiuQ_u2vwSxDSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FC59192D78A;
 Wed, 17 Feb 2021 10:25:34 +0000 (UTC)
Received: from thuth.com (ovpn-112-116.ams2.redhat.com [10.36.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EEF819D6C;
 Wed, 17 Feb 2021 10:25:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] travis.yml: Limit simultaneous jobs to 3
Date: Wed, 17 Feb 2021 11:25:31 +0100
Message-Id: <20210217102531.1441557-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though the host machines that run the Travis CI jobs have
quite a lot of CPUs (e.g. nproc in an aarch64 job reports 32), the
containers on Travis are still limited to 2 vCPUs according to:

 https://docs.travis-ci.com/user/reference/overview/#approx-boot-time

So we do not gain much when compiling with a job number based on
the output of "getconf _NPROCESSORS_ONLN" - quite the contrary, the
aarch64 containers are currently aborting quite often since they
are running out of memory. Thus let's rather use a fixed number
like 3 in the jobs here, so that e.g. two threads can actively run
while a third one might be waiting for I/O operations to complete.
This should hopefully fix the out-of-memory failures in the aarch64
CI jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 See also this URL for the explanation of the 32 vs 2 CPUs on aarch64:
 https://travis-ci.community/t/nproc-reports-32-cores-on-arm64/5851

 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index fc27fd6330..cc39a447e8 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -88,7 +88,7 @@ git:
 # Common first phase for all steps
 before_install:
   - if command -v ccache ; then ccache --zero-stats ; fi
-  - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
+  - export JOBS=3
   - echo "=== Using ${JOBS} simultaneous jobs ==="
 
 # Configure step - may be overridden
-- 
2.27.0


