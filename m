Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB4E28AA78
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 22:41:20 +0200 (CEST)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRi9f-00086v-TP
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 16:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kRi6F-0002ng-Mq
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 16:37:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kRi6E-0005bl-0M
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 16:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602448665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeY7imNTlzyA8qZI2q/5+3WkBmAybf/f5KVeNklE1XM=;
 b=K9taYZpN5y0CX72mik41Q/SgZQEaMKNQoliwxln6q07EncVg5Ro1vxpVKJzq32WVQ7P2nT
 YSSbRnMj4Emr5J0QhyoB6U3y28ZdL/1KgRTxTQyoEDwp3qg5GnN7+nIXFIOI2aeL63DmQ3
 7dvoE1A88W2rlgly4CgV79CozI93vXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-ew21iFf0NUmw6x9cUr-yAw-1; Sun, 11 Oct 2020 16:37:43 -0400
X-MC-Unique: ew21iFf0NUmw6x9cUr-yAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABC31185A0C0
 for <qemu-devel@nongnu.org>; Sun, 11 Oct 2020 20:37:42 +0000 (UTC)
Received: from localhost (unknown [10.36.110.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 718F26EF66;
 Sun, 11 Oct 2020 20:37:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PoCv2 14/15] travis: add Rust
Date: Mon, 12 Oct 2020 00:35:12 +0400
Message-Id: <20201011203513.1621355-15-marcandre.lureau@redhat.com>
In-Reply-To: <20201011203513.1621355-1-marcandre.lureau@redhat.com>
References: <20201011203513.1621355-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 16:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .travis.yml | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 1054ec5d29..b2835316bc 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -23,6 +23,8 @@ addons:
   apt:
     packages:
       # Build dependencies
+      - cargo
+      - rustc
       - libaio-dev
       - libattr1-dev
       - libbrlapi-dev
@@ -71,7 +73,7 @@ env:
   global:
     - SRC_DIR=".."
     - BUILD_DIR="build"
-    - BASE_CONFIG="--disable-docs --disable-tools"
+    - BASE_CONFIG="--disable-docs --disable-tools --with-rust"
     - TEST_BUILD_CMD=""
     - TEST_CMD="make check V=1"
     # This is broadly a list of "mainline" softmmu targets which have support across the major distros
@@ -258,6 +260,8 @@ jobs:
             # Extra toolchains
             - gcc-9
             - g++-9
+            - cargo
+            - rustc
             # Build dependencies
             - libaio-dev
             - libattr1-dev
@@ -325,6 +329,8 @@ jobs:
       dist: focal
       addons:
         apt_packages:
+          - cargo
+          - rustc
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
@@ -358,6 +364,8 @@ jobs:
       dist: focal
       addons:
         apt_packages:
+          - cargo
+          - rustc
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
@@ -390,6 +398,8 @@ jobs:
       dist: bionic
       addons:
         apt_packages:
+          - cargo
+          - rustc
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
@@ -432,6 +442,8 @@ jobs:
       dist: bionic
       addons:
         apt_packages:
+          - cargo
+          - rustc
           - libaio-dev
           - libattr1-dev
           - libcap-ng-dev
@@ -461,6 +473,8 @@ jobs:
       dist: bionic
       addons:
         apt_packages:
+          - cargo
+          - rustc
           - libgcrypt20-dev
           - libgnutls28-dev
       env:
@@ -472,6 +486,8 @@ jobs:
       compiler: clang
       addons:
         apt_packages:
+          - cargo
+          - rustc
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
-- 
2.28.0


