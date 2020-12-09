Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84122D3F38
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:54:36 +0100 (CET)
Received: from localhost ([::1]:39310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwB9-0001yh-Qd
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw5x-0005Gd-57
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw5v-0007NK-HZ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607507350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/qWs1Z6ZkEtGQwG8bSn3zDqKPVce7JiQfJ+2CXkB+g=;
 b=R4IJVNBwGEYvxs6hXPtaULsnII3JMN53V1/2j+5TMmOaI9YO/RuGbRe991i1qzhFnl2ixj
 YR0XV0MNSO9Ci1bAcUXSquFaexDFZd3Ze2olIEtESk+OKL89iHyQoPoc990SumWi6TWSlq
 3t9xGaCjUbqY9dK/NTjErjP+u1msfeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-ijgo2MmwOzeEjpk-dOhm1g-1; Wed, 09 Dec 2020 04:49:08 -0500
X-MC-Unique: ijgo2MmwOzeEjpk-dOhm1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E533A1927804;
 Wed,  9 Dec 2020 09:49:07 +0000 (UTC)
Received: from thuth.com (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F7855C234;
 Wed,  9 Dec 2020 09:49:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/13] gitlab-ci: Add KVM s390x cross-build jobs
Date: Wed,  9 Dec 2020 10:48:47 +0100
Message-Id: <20201209094856.17788-5-thuth@redhat.com>
In-Reply-To: <20201209094856.17788-1-thuth@redhat.com>
References: <20201209094856.17788-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Cross-build s390x target with only KVM accelerator enabled.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201207131503.3858889-5-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index b59516301f..51896bbc9f 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,4 +1,3 @@
-
 .cross_system_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
@@ -120,6 +119,12 @@ cross-s390x-user:
   variables:
     IMAGE: debian-s390x-cross
 
+cross-s390x-kvm-only:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-s390x-cross
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
+
 cross-win32-system:
   extends: .cross_system_build_job
   variables:
-- 
2.18.4


