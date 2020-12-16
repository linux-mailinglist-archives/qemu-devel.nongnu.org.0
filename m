Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F472DC20A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:20:50 +0100 (CET)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXfd-0000AK-SF
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpXbz-0005qt-Kx
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:17:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpXbx-0008HP-Tc
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608128221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bo7K7XPA/DHt2o4AY+QRZbrWjGyXfhKLVJ8ke+7CP7s=;
 b=QVtwQzpIqevsmmnLzEMIm6ZF3BRxnsesIEMFPPfzreAK75YSMw7AdEMFsapLvY3KD93z0/
 HFuXAjBW46vWy7+omhjwGFiaTw+p66un5Ebo6PjUyHDko4if4I9AWeJeeNWN4BK4ev7sHD
 DvN723X5KYpuYH4FsODgSZEZQohPQCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-q4U6Rn6dOpC4SKOh1m3kPA-1; Wed, 16 Dec 2020 09:16:57 -0500
X-MC-Unique: q4U6Rn6dOpC4SKOh1m3kPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60C3D87950D;
 Wed, 16 Dec 2020 14:16:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-177.ams2.redhat.com
 [10.36.115.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B4C260C9B;
 Wed, 16 Dec 2020 14:16:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: update for rename of CentOS8 PowerTools repo
Date: Wed, 16 Dec 2020 14:16:53 +0000
Message-Id: <20201216141653.213980-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was intentionally renamed recently to be all lowercase:

https://bugs.centos.org/view.php?id=17920
https://wiki.centos.org/Manuals/ReleaseNotes/CentOS8.2011#Yum_repo_file_and_repoid_changes

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---

This needs to be merged asap, as CI will break for anyone whose branch
triggers a rebuild of the centos container image.

eg current broken git master:

  https://gitlab.com/berrange/qemu/-/jobs/915852165

vs with this fix

  https://gitlab.com/berrange/qemu/-/jobs/915862731

 tests/docker/dockerfiles/centos8.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 54bc6d54cd..06b67962fd 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -31,6 +31,6 @@ ENV PACKAGES \
     zlib-devel
 
 RUN dnf install -y dnf-plugins-core && \
-  dnf config-manager --set-enabled PowerTools && \
+  dnf config-manager --set-enabled powertools && \
   dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.29.2


