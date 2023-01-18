Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B96671ACA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:36:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6i4-0004K4-Jo; Wed, 18 Jan 2023 06:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6i2-0004Jc-PE
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6i1-0007V3-4c
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDqjNc8WEVBE25Q4gUqiP15M8HReLd2GfMd3Q5LAfdY=;
 b=Y495NH2KP5t+qnoFnPmoEM70p4AC8devnuwdTUx5C7YKmNIMOyueCgNg1VckMZjXy322ed
 Cb3a3UREHdoLVSADBwORxQB5GAzHy2LTmT4Ox5GqpdO+cPuikjtS5wiJK+tJd6Nh/WOp1L
 F3SKyWkKVgOief7vXyNz9jzRGsOl2eI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-VYgv9l1bO36v3A-wt8UojA-1; Wed, 18 Jan 2023 06:34:22 -0500
X-MC-Unique: VYgv9l1bO36v3A-wt8UojA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D4C8293248E;
 Wed, 18 Jan 2023 11:34:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44D31492B00;
 Wed, 18 Jan 2023 11:34:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@lwhsu.org>
Subject: [PULL 1/9] Upgrade all packages in the FreeBSD VMs to ensure the
 freshness
Date: Wed, 18 Jan 2023 12:34:10 +0100
Message-Id: <20230118113418.1650416-2-thuth@redhat.com>
In-Reply-To: <20230118113418.1650416-1-thuth@redhat.com>
References: <20230118113418.1650416-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Li-Wen Hsu <lwhsu@lwhsu.org>

This (hopefully) fixes the errors that we currently see in the
FreeBSD jobs in the gitlab CI:

 ld-elf.so.1: /usr/local/bin/bash: Undefined symbol "rl_set_timeout"

Signed-off-by: Li-Wen Hsu <lwhsu@lwhsu.org>
Message-Id: <CAKBkRUwxL1fkzwpK_2FXKGE31415JRAR8N09+O_ht8CNdfVAqQ@mail.gmail.com>
[thuth: Update subject and patch description]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/cirrus.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 785b163aa6..502dfd612c 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -53,7 +53,7 @@ x64-freebsd-12-build:
     CIRRUS_VM_IMAGE_NAME: freebsd-12-4
     CIRRUS_VM_CPUS: 8
     CIRRUS_VM_RAM: 8G
-    UPDATE_COMMAND: pkg update
+    UPDATE_COMMAND: pkg update; pkg upgrade -y
     INSTALL_COMMAND: pkg install -y
     TEST_TARGETS: check
 
@@ -66,7 +66,7 @@ x64-freebsd-13-build:
     CIRRUS_VM_IMAGE_NAME: freebsd-13-1
     CIRRUS_VM_CPUS: 8
     CIRRUS_VM_RAM: 8G
-    UPDATE_COMMAND: pkg update
+    UPDATE_COMMAND: pkg update; pkg upgrade -y
     INSTALL_COMMAND: pkg install -y
     TEST_TARGETS: check
 
-- 
2.31.1


