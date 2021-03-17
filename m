Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF69A33EF4A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:09:32 +0100 (CET)
Received: from localhost ([::1]:45064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMU3P-0008OM-QR
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMTzU-000646-9v
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMTzS-0007uH-GP
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615979125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCX8ariETwOOFiRmdr4pdZc8KBnyGZb10N8Ewro7MGk=;
 b=jEjHkXcqfqwBkZvFTjzHCx2s/y9s5CkDb5tBAsRTA2dHxQueu7IK7vPvMy0+SY5ecxGnLk
 OdfDhPQl20e6D7gYHLMYgYE6GRWZgCOocwZAD1Ibb14nj/r1tIhKHxa0a9WTYpuURoSmYy
 tqc1RJ13ivUVhc7tO57SYjz+dWP/OkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-mfJm0mnYN9SV4uTsvPSgCg-1; Wed, 17 Mar 2021 07:05:21 -0400
X-MC-Unique: mfJm0mnYN9SV4uTsvPSgCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A965D911E3;
 Wed, 17 Mar 2021 11:05:20 +0000 (UTC)
Received: from thuth.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F070C50FAF;
 Wed, 17 Mar 2021 11:05:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH 2/2] cirrus.yml: Update the FreeBSD task to version 12.2
Date: Wed, 17 Mar 2021 12:05:12 +0100
Message-Id: <20210317110512.583747-3-thuth@redhat.com>
In-Reply-To: <20210317110512.583747-1-thuth@redhat.com>
References: <20210317110512.583747-1-thuth@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD version 12.1 is out of service now, and the task in the
Cirrus-CI is failing. Update to 12.2 to get it working again.
Unfortunately, there is a bug in libtasn1 that triggers with the
new version of Clang that is used there (see this thread for details:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00739.html ),
so we have to disable gnutls for now to make it work again. We can
enable it later again once libtasn1 has been fixed in FreeBSD.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .cirrus.yml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index bc40a0550d..af118a5a74 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -3,7 +3,7 @@ env:
 
 freebsd_12_task:
   freebsd_instance:
-    image_family: freebsd-12-1
+    image_family: freebsd-12-2
     cpu: 8
     memory: 8G
   install_script:
@@ -13,7 +13,8 @@ freebsd_12_task:
   script:
     - mkdir build
     - cd build
-    - ../configure --enable-werror || { cat config.log meson-logs/meson-log.txt; exit 1; }
+    - ../configure --enable-werror --disable-gnutls
+      || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake -j$(sysctl -n hw.ncpu) check V=1
 
-- 
2.27.0


