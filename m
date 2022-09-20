Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B8C5BE432
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:14:31 +0200 (CEST)
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabCu-0003e7-92
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaaN1-0002Ek-11
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:20:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaaMy-00029F-3q
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663669247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7uHps3Thjn5xYZ28emrVBs1Vu+A0RPVOfk+x+1E5wUE=;
 b=R9b919c2KduThbFKEXEOpt7NR2Ku4lLvn1jVY1cQEw6E2tsz7ksvZLMfFBewHpWi7BbTil
 558oxgLq+vpCrUI1SJLv7iw74MgmordCfHiF7MaEORXm9mwakFpKC0YjOKcWi997To7Hgk
 qo6VWHfWKoVtyrsRsS51L5pUCj+iZ8M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-AqS_A-YrMdS6g9ps1X242w-1; Tue, 20 Sep 2022 06:20:45 -0400
X-MC-Unique: AqS_A-YrMdS6g9ps1X242w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2379729ABA3A;
 Tue, 20 Sep 2022 10:20:45 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D46881400C39;
 Tue, 20 Sep 2022 10:20:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brad Smith <brad@comstyle.com>, qemu-trivial@nongnu.org
Subject: [PATCH] gitlab-ci: Update the FreeBSD 13 job from 13.0 to 13.1
Date: Tue, 20 Sep 2022 12:20:41 +0200
Message-Id: <20220920102041.45067-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FreeBSD 13 job in our CI started failing since the python port
stopped working after 13.1 has been released. Thus update our CI
job to FreeBSD 13.1 to get it working again.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 609c364308..d70da61248 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -63,7 +63,7 @@ x64-freebsd-13-build:
     NAME: freebsd-13
     CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
     CIRRUS_VM_IMAGE_SELECTOR: image_family
-    CIRRUS_VM_IMAGE_NAME: freebsd-13-0
+    CIRRUS_VM_IMAGE_NAME: freebsd-13-1
     CIRRUS_VM_CPUS: 8
     CIRRUS_VM_RAM: 8G
     UPDATE_COMMAND: pkg update
-- 
2.31.1


