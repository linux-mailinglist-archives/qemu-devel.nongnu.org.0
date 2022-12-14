Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A4864C6E6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:13:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Oi8-0007i1-MM; Wed, 14 Dec 2022 05:10:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Oi1-0007eO-H9
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohz-0001Ed-Q9
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVnT1VrWL1s4Tq0qu4AsVdR7OETcvF0vUizJcuFBx3o=;
 b=Nm6uP4aN3Fyp4Y2MVtsmayv+roZ5t7YM5SBuXIL4OcB6/91aauYu/2TqLDcifwTYF2R9Od
 b7lwoAlx15htC2QZ9bG8ZHqNiNDUwRLKWIj1pTahB4w/JoCuva6UYOzZtMk+NOfLLly2z0
 sQCGL3rsUhUtgIbXHAAjehOBNZrtUVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-8WyiDp1ENJ6MsmKbVbDK1A-1; Wed, 14 Dec 2022 05:09:44 -0500
X-MC-Unique: 8WyiDp1ENJ6MsmKbVbDK1A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FCA5857A89;
 Wed, 14 Dec 2022 10:09:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DEEB492C14;
 Wed, 14 Dec 2022 10:09:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 20/23] FreeBSD: Upgrade to 12.4 release
Date: Wed, 14 Dec 2022 11:09:08 +0100
Message-Id: <20221214100911.165291-21-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Brad Smith <brad@comstyle.com>

Upgrade to 12.4 release

Signed-off-by: Brad Smith <brad@comstyle.com>
Message-Id: <Y5GJpW/1s+NEah98@humpty.home.comstyle.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/cirrus.yml | 2 +-
 tests/vm/freebsd        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 634a73a742..785b163aa6 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -50,7 +50,7 @@ x64-freebsd-12-build:
     NAME: freebsd-12
     CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
     CIRRUS_VM_IMAGE_SELECTOR: image_family
-    CIRRUS_VM_IMAGE_NAME: freebsd-12-3
+    CIRRUS_VM_IMAGE_NAME: freebsd-12-4
     CIRRUS_VM_CPUS: 8
     CIRRUS_VM_RAM: 8G
     UPDATE_COMMAND: pkg update
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index d6ff4461ba..ba2ba23d24 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):
     name = "freebsd"
     arch = "x86_64"
 
-    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz"
-    csum = "36dd0de50f1fe5f0a88e181e94657656de26fb64254412f74e80e128e8b938b4"
+    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.4/FreeBSD-12.4-RELEASE-amd64-disc1.iso.xz"
+    csum = "1dcf6446e31bf3f81b582e9aba3319a258c29a937a2af6138ee4b181ed719a87"
     size = "20G"
     pkgs = [
         # build tools
-- 
2.31.1


