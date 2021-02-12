Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A831A169
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 16:20:07 +0100 (CET)
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAaEo-0003Dp-GM
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 10:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAaBy-0001E3-JQ
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:17:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAaBv-0001Yg-F6
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:17:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613143026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KbFW5lPA+1ceZrFwOreaWsvu1w7897Toio583LBcDZQ=;
 b=ANZ4LXBF8ZIrwNH7iH30fP3WW0Jc1b4hNb2VAw1WwvdbXw8TPmNAYd2ujfDH+3SWjLUuW/
 oRx3F4zPOeq0E30tXTZgul3f+V2ipRGP0kNIUBqw8MzMb4f0OVRaWPm/VW3TZYvQhnocj1
 rJ8vZH7GpkWb79Qpj1gmEEbVv5ijzEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-8ymeB0BcP6eaDIseNWyWjA-1; Fri, 12 Feb 2021 10:16:55 -0500
X-MC-Unique: 8ymeB0BcP6eaDIseNWyWjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5648BBBEE3;
 Fri, 12 Feb 2021 15:16:54 +0000 (UTC)
Received: from localhost (ovpn-113-15.ams2.redhat.com [10.36.113.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11E985D6AB;
 Fri, 12 Feb 2021 15:16:50 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtiofs_submounts.py test: Note on vmlinuz param
Date: Fri, 12 Feb 2021 16:16:49 +0100
Message-Id: <20210212151649.252440-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From the cancel message, it is not entirely clear why this parameter is
mandatory now, or that it will be optional in the future.  Add such a
more detailed explanation as a comment in the test source file.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
I’ve uploaded a build of Linux 5.10 here:
  https://xanclic.moe/linux-5.10

But I’ve decided against mentioning it in this new comment or the cancel
message, because, well, it’s my private server and I have limited
bandwidth.
---
 tests/acceptance/virtiofs_submounts.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 949ca87a83..9a69b6b17b 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -228,6 +228,18 @@ class VirtiofsSubmountsTest(BootLinux):
     def setUp(self):
         vmlinuz = self.params.get('vmlinuz')
         if vmlinuz is None:
+            """
+            The Linux kernel supports FUSE auto-submounts only as of 5.10.
+            boot_linux.py currently provides Fedora 31, whose kernel is too
+            old, so this test cannot pass with the on-image kernel (you are
+            welcome to try, hence the option to force such a test with
+            -p vmlinuz='').  Therefore, for now the user must provide a
+            sufficiently new custom kernel, or effectively explicitly
+            request failure with -p vmlinuz=''.
+            Once an image with a sufficiently new kernel is available
+            (probably Fedora 34), we can make -p vmlinuz='' the default, so
+            that this parameter no longer needs to be specified.
+            """
             self.cancel('vmlinuz parameter not set; you must point it to a '
                         'Linux kernel binary to test (to run this test with ' \
                         'the on-image kernel, set it to an empty string)')
-- 
2.29.2


