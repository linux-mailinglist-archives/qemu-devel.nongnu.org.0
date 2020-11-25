Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126362C3D51
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:11:12 +0100 (CET)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khrlX-00029R-1c
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khrjM-00080a-EP
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:08:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khrjK-0003TV-Oz
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606298934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=al6H++3zUEjGIG8qVSO39K/S1Yku6SF0SEQjSENo0I4=;
 b=d0dgaCkkAfP9kNUlqQJ3sU9clebNVHVEz75X8MhkItB7aY6tL96Vh3c3w0yONWYrPXiNCG
 bw4aIGnWkExiqkU9gyXW5LHExmzsGZROPWZFiiH/ORXn4AdQM5y3BltM9pV+1Dw3GnGt7S
 YFnzqzdrpAQlT3jiITjbKi4B64srROg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-aaN3gar7NMO8xIKBaZZm4w-1; Wed, 25 Nov 2020 05:08:52 -0500
X-MC-Unique: aaN3gar7NMO8xIKBaZZm4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1111803F4B
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 10:08:51 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D488F4D;
 Wed, 25 Nov 2020 10:08:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] .gitlab-ci: add build-libvhost-user
Date: Wed, 25 Nov 2020 14:06:40 +0400
Message-Id: <20201125100640.366523-9-marcandre.lureau@redhat.com>
In-Reply-To: <20201125100640.366523-1-marcandre.lureau@redhat.com>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .gitlab-ci.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b1..e517506c35 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -455,6 +455,17 @@ check-dco:
   variables:
     GIT_DEPTH: 1000
 
+build-libvhost-user:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
+  before_script:
+    - dnf install -y meson ninja-build
+  script:
+    - mkdir subprojects/libvhost-user/build
+    - cd subprojects/libvhost-user/build
+    - meson
+    - ninja
+
 pages:
   image: $CI_REGISTRY_IMAGE/qemu/ubuntu2004:latest
   stage: test
-- 
2.29.0


