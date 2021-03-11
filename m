Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6039E337596
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:25:31 +0100 (CET)
Received: from localhost ([::1]:58030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMFm-0005Zg-Fm
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKMD2-0001Wj-QO
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:22:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKMCs-0003eB-EQ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615472548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S9eBmACwUvf9vGJ/lh2JWBvpGjJJy2fw/+a9vthz3AE=;
 b=DkQSznk5lFOJYXU8n2z5NJVCI3PWYWRBh3WVYjsQk8heXrWLlQh46BFNlLb+ynaYBS+sb1
 OUtLdl87rTtAV9q2jeaiPoyx9FQaKawoXj1lecnlgFauwXLsmPUCV3Vqu15ip+hmoepuF5
 8jid6efSJ8ldAVV5+gV9oCJqshVGk8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-6P1rhaPJOaeoGP9ONxKQCw-1; Thu, 11 Mar 2021 09:22:26 -0500
X-MC-Unique: 6P1rhaPJOaeoGP9ONxKQCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 525DC18D6A32;
 Thu, 11 Mar 2021 14:22:25 +0000 (UTC)
Received: from thuth.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC1232B16E;
 Thu, 11 Mar 2021 14:22:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/4] gitlab-ci.yml: Add some missing dependencies to the jobs
Date: Thu, 11 Mar 2021 15:22:09 +0100
Message-Id: <20210311142211.1547864-3-thuth@redhat.com>
In-Reply-To: <20210311142211.1547864-1-thuth@redhat.com>
References: <20210311142211.1547864-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's make sure that all jobs have proper "needs:" statements so that
they can start as soon as possible, without having to wait for the
previous pipeline stage to finish.

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


