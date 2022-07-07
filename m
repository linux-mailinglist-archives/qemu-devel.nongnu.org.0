Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90E569909
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 06:14:40 +0200 (CEST)
Received: from localhost ([::1]:49380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9IuV-0001GZ-QB
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 00:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9Ije-0003eQ-4a
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9IjZ-0008DQ-Mr
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657166598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=en+iqPqKmiYmVVeQ+kRktypDrRuF7A46+deZSmk4yVc=;
 b=faN+kdVa+q6XatJ/+ugQZ8cqORs49ytJUieElet0I+kDjJ034kogMn9slrD14Us/5XQv7T
 0XVRqTJr83LwT5S2bRQW7Ec21dJOVUuiP317yw/AnSbnm1adhLDJYQSBMIAvjqh0IaQSF/
 qyGwYoDx8qdRqFYxzZz1W3JL6DGYCI4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-rxIi8A1LOo-kTLPZgVM37w-1; Thu, 07 Jul 2022 00:03:14 -0400
X-MC-Unique: rxIi8A1LOo-kTLPZgVM37w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4705D811E76;
 Thu,  7 Jul 2022 04:03:14 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8F8B18ECC;
 Thu,  7 Jul 2022 04:03:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v3 05/13] tests/vm: update sha256sum for ubuntu.aarch64
Date: Thu,  7 Jul 2022 00:03:02 -0400
Message-Id: <20220707040310.4163682-6-jsnow@redhat.com>
In-Reply-To: <20220707040310.4163682-1-jsnow@redhat.com>
References: <20220707040310.4163682-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This checksum changes weekly; use a fixed point image and update the
checksum so we don't have to re-download it quite so much.

Note: Just like the centos.aarch64 test, this test currently seems very
flaky when run as a TCG test.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/ubuntu.aarch64 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
index b291945a7e9..fc9c2ce22ff 100755
--- a/tests/vm/ubuntu.aarch64
+++ b/tests/vm/ubuntu.aarch64
@@ -32,9 +32,13 @@ DEFAULT_CONFIG = {
 class UbuntuAarch64VM(ubuntuvm.UbuntuVM):
     name = "ubuntu.aarch64"
     arch = "aarch64"
+    # NOTE: The Ubuntu 18.04 cloud images are updated weekly. The
+    # release below has been chosen as the latest at time of writing.
+    # Using the rolling latest release means the SHA will be wrong
+    # within a week.
     image_name = "ubuntu-18.04-server-cloudimg-arm64.img"
-    image_link = "https://cloud-images.ubuntu.com/releases/18.04/release/" + image_name
-    image_sha256="0fdcba761965735a8a903d8b88df8e47f156f48715c00508e4315c506d7d3cb1"
+    image_link = "https://cloud-images.ubuntu.com/releases/bionic/release-20220610/" + image_name
+    image_sha256="0eacc5142238788365576b15f1d0b6f23dda6d3e545ee22f5306af7bd6ec47bd"
     BUILD_SCRIPT = """
         set -e;
         cd $(mktemp -d);
-- 
2.34.3


