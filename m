Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE5F3395FD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:16:31 +0100 (CET)
Received: from localhost ([::1]:36686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmKs-0003Ml-FR
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWF-0007PH-UQ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWE-0000el-5R
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615569849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LI3EYlAVDfFNpaO5JjLNuRxJcyz1W2/SQ1KKdE+U64k=;
 b=KGNjdEyxyhZVMq2puye7iKeREiINX2CLzROcGxHp5xgroIkwbZBGq4mM8DjXkYqegpV7xy
 xH9KUNH3GPz9lCq0rOiUjgVl5cBvBKWz4r+BhkAWju5oPa8l2f737OjR4DhDrfqF5VdCWp
 p5Wn+Zc7YB6/uW3oI2Q5LvvdjRh11eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-J3_uUCQ2P46syJVP-CvjnQ-1; Fri, 12 Mar 2021 12:24:07 -0500
X-MC-Unique: J3_uUCQ2P46syJVP-CvjnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6EFA1084C8C;
 Fri, 12 Mar 2021 17:24:05 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C63F519744;
 Fri, 12 Mar 2021 17:24:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/9] gitlab-ci.yml: Add some missing dependencies to the jobs
Date: Fri, 12 Mar 2021 18:23:51 +0100
Message-Id: <20210312172356.968219-5-thuth@redhat.com>
In-Reply-To: <20210312172356.968219-1-thuth@redhat.com>
References: <20210312172356.968219-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's make sure that all jobs have proper "needs:" statements so that
they can start as soon as possible, without having to wait for the
previous pipeline stage to finish.

Message-Id: <20210311142211.1547864-3-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 871ea45a5f..a98f5674d6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -432,6 +432,8 @@ build-user-plugins:
 
 build-user-centos7:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-centos7-container
   variables:
     IMAGE: centos7
     CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
@@ -461,6 +463,8 @@ clang-system:
 
 clang-user:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
@@ -470,6 +474,8 @@ clang-user:
 
 tsan-build:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10 --disable-docs
@@ -507,6 +513,8 @@ check-deprecated:
 # gprof/gcov are GCC features
 gprof-gcov:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-gprof --enable-gcov
-- 
2.27.0


