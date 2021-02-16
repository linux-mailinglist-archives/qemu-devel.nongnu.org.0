Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A141B31C615
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 05:58:39 +0100 (CET)
Received: from localhost ([::1]:35928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBsRa-0007iz-Ly
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 23:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQN-000696-BZ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQL-0007lX-Gb
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613451440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEWS1m/vgfkM9TwFeLdNOe19IoEc1Df3xEFtS/xlU/s=;
 b=h/+e0VKTWicu090XPRkd1hJcFoZHz9NAL7cUuqpQYKZXSk4Zu5ziCC60q38IvV2ASsEotd
 /WyhuXy4zUShcTr9eZ7BdWCgoZOf71c5XUclEPmWiBriJLFSWP4bQtcBJehomrWfn0m4+s
 wMpQvSvK8u1aPkttYNemgixa6bgkdEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-VRYHR1ZDMaW1li7RkBLabg-1; Mon, 15 Feb 2021 23:57:18 -0500
X-MC-Unique: VRYHR1ZDMaW1li7RkBLabg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE8C31005501;
 Tue, 16 Feb 2021 04:57:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-129.rdu2.redhat.com
 [10.10.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5092D1F0;
 Tue, 16 Feb 2021 04:57:16 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/9] virtiofs_submounts.py test: Note on vmlinuz param
Date: Mon, 15 Feb 2021 23:56:58 -0500
Message-Id: <20210216045705.9590-3-crosa@redhat.com>
In-Reply-To: <20210216045705.9590-1-crosa@redhat.com>
References: <20210216045705.9590-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

From the cancel message, it is not entirely clear why this parameter is
mandatory now, or that it will be optional in the future.  Add such a
more detailed explanation as a comment in the test source file.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210212151649.252440-1-mreitz@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/virtiofs_submounts.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 949ca87a837..9a69b6b17bc 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -228,6 +228,18 @@ def live_cleanup(self):
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
2.26.2


