Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647DF5ED967
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:47:36 +0200 (CEST)
Received: from localhost ([::1]:41438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTfD-0005CK-D8
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRMM-0001EK-Ig
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRMK-00009u-SD
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hra87o8UVtUzNTwCxIUYrCnAaY3HBPraaZ79GxQLksQ=;
 b=R+xNVcCuf7wcbEHSkeq6KR2PoUSg6rWG1mrFV3ZT8TB+W622ivYrLs5Roc0/2G6v9Ye/A2
 Ho3TiI7Ik2KwGNJ5AqMuAAdbEwh+6/E6iGK8aGup8lMrF/l2CKM5jm0lZV2B2lREcVGAdr
 aKI8QwS6WAd5oiNH7twSBjsknrpTVac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-TySussQ1MRumGaL5z-6HcA-1; Wed, 28 Sep 2022 03:19:52 -0400
X-MC-Unique: TySussQ1MRumGaL5z-6HcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43770811E87;
 Wed, 28 Sep 2022 07:19:52 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EDD440C83BB;
 Wed, 28 Sep 2022 07:19:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 37/37] docs/devel: testing: Document writing portable test cases
Date: Wed, 28 Sep 2022 09:18:43 +0200
Message-Id: <20220928071843.1468323-38-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Update the best practices of how to write portable test cases that
can be built and run successfully on both Linux and Windows hosts.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220927110632.1973965-55-bmeng.cn@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/testing.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index aea5b42356..fbb98faabe 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -81,6 +81,36 @@ QTest cases can be executed with
 
    make check-qtest
 
+Writing portable test cases
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Both unit tests and qtests can run on POSIX hosts as well as Windows hosts.
+Care must be taken when writing portable test cases that can be built and run
+successfully on various hosts. The following list shows some best practices:
+
+* Use portable APIs from glib whenever necessary, e.g.: g_setenv(),
+  g_mkdtemp(), g_mkdir().
+* Avoid using hardcoded /tmp for temporary file directory.
+  Use g_get_tmp_dir() instead.
+* Bear in mind that Windows has different special string representation for
+  stdin/stdout/stderr and null devices. For example if your test case uses
+  "/dev/fd/2" and "/dev/null" on Linux, remember to use "2" and "nul" on
+  Windows instead. Also IO redirection does not work on Windows, so avoid
+  using "2>nul" whenever necessary.
+* If your test cases uses the blkdebug feature, use relative path to pass
+  the config and image file paths in the command line as Windows absolute
+  path contains the delimiter ":" which will confuse the blkdebug parser.
+* Use double quotes in your extra QEMU commmand line in your test cases
+  instead of single quotes, as Windows does not drop single quotes when
+  passing the command line to QEMU.
+* Windows opens a file in text mode by default, while a POSIX compliant
+  implementation treats text files and binary files the same. So if your
+  test cases opens a file to write some data and later wants to compare the
+  written data with the original one, be sure to pass the letter 'b' as
+  part of the mode string to fopen(), or O_BINARY flag for the open() call.
+* If a certain test case can only run on POSIX or Linux hosts, use a proper
+  #ifdef in the codes. If the whole test suite cannot run on Windows, disable
+  the build in the meson.build file.
+
 QAPI schema tests
 ~~~~~~~~~~~~~~~~~
 
-- 
2.31.1


