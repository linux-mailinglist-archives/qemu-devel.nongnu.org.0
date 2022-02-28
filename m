Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9C14C6EC0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:59:35 +0100 (CET)
Received: from localhost ([::1]:38740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgYo-0005jx-SZ
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:59:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg67-0007cJ-Bb
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:29:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg65-00034r-7D
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646054992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NKeO5MbXyeixS8/WrnRXHNfuj6sldQKi9w7Wf4haCV0=;
 b=cHtTvLbFGO3fjdfuCnUzm3qfEGVsK9rLrI3Svm8sgWUw1WwyUEJpvH8M7nKdtUHRACji0C
 BIdQJitltOXtuXpUIuoPxEZaHbJUDABSV67GVdcUXgbWfHMeR/9laawGNdLLi9ePWKFrm0
 CDVM2Ug5T/ehBIcHNkT4LzrXNp/WqGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-kFg56ybrNJiu-8W7LLjGVA-1; Mon, 28 Feb 2022 08:29:49 -0500
X-MC-Unique: kFg56ybrNJiu-8W7LLjGVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57EC31091DA1;
 Mon, 28 Feb 2022 13:29:48 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66A737A3F3;
 Mon, 28 Feb 2022 13:29:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] travis.yml: Update the s390x jobs to Ubuntu Focal
Date: Mon, 28 Feb 2022 14:29:33 +0100
Message-Id: <20220228132936.1411176-4-thuth@redhat.com>
In-Reply-To: <20220228132936.1411176-1-thuth@redhat.com>
References: <20220228132936.1411176-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU will soon drop the support for Ubuntu 18.04, so let's update
the Travis jobs that were still using this version to 20.04 instead.

While we're at it, also remove an obsolete comment about Ubuntu
Xenial being the default for our Travis jobs.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220221153423.1028465-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 41010ebe6b..c3c8048842 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -1,6 +1,3 @@
-# The current Travis default is a VM based 16.04 Xenial on GCE
-# Additional builds with specific requirements for a full VM need to
-# be added as additional matrix: entries later on
 os: linux
 dist: focal
 language: c
@@ -190,7 +187,7 @@ jobs:
 
     - name: "[s390x] GCC check-tcg"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libaio-dev
@@ -233,7 +230,7 @@ jobs:
 
     - name: "[s390x] GCC (other-softmmu)"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libaio-dev
@@ -263,10 +260,11 @@ jobs:
 
     - name: "[s390x] GCC (user)"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libgcrypt20-dev
+          - libglib2.0-dev
           - libgnutls28-dev
           - ninja-build
       env:
@@ -274,7 +272,7 @@ jobs:
 
     - name: "[s390x] Clang (disable-tcg)"
       arch: s390x
-      dist: bionic
+      dist: focal
       compiler: clang
       addons:
         apt_packages:
-- 
2.27.0


