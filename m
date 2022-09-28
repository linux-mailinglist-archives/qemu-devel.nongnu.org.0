Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6495ED880
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:11:58 +0200 (CEST)
Received: from localhost ([::1]:51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odT6j-0004yI-JS
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLt-00012O-AC
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLr-0008VQ-FD
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NzLTNtj1QpJ9n1/eExxjBSPKEbT7n5YpjTjN2RWiNFs=;
 b=Zzoa1Q0DO+vCXVxJs0oziRyL/yK18YeJd7wRQ9x9ILKoZfATvK9J7uhZMQzl3k/7rTu22g
 OF1U0teL8AuHtoqwq2GfeBj4a742qJm4etRq9PQRqbHnC5DfFwoqw/69q8+h/+zrLcWEvZ
 PoARNXhxw8RC4CidWkSnQIzgFbaEkns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-YBDkhqwHPUSIA4ozGPkWMA-1; Wed, 28 Sep 2022 03:19:23 -0400
X-MC-Unique: YBDkhqwHPUSIA4ozGPkWMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17083185A79C;
 Wed, 28 Sep 2022 07:19:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCA2740C83D9;
 Wed, 28 Sep 2022 07:19:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PULL 20/37] tests/qtest: libqtest: Adapt global_qtest declaration
 for win32
Date: Wed, 28 Sep 2022 09:18:26 +0200
Message-Id: <20220928071843.1468323-21-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Commit dd2107497275 ("tests/libqtest: Use libqtest-single.h in tests that require global_qtest")
moved global_qtest to libqtest-single.h, by declaring global_qtest
attribute to be common and weak.

This trick unfortunately does not work on Windows, and building
qtest test cases results in multiple definition errors of the weak
symbol global_qtest, as Windows PE does not have the concept of
the so-called weak symbol like ELF in the *nix world.

However Windows does provide a trick to declare a variable to be
a common symbol, via __declspec(selectany) [1]. It does not provide
the "strong override weak" effect but we don't need it in our use
case anyway. So let's use it for win32.

[1] https://docs.microsoft.com/en-us/cpp/cpp/selectany

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220925113032.1949844-33-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest-single.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
index 4e7d0ae1dc..851724cbcb 100644
--- a/tests/qtest/libqtest-single.h
+++ b/tests/qtest/libqtest-single.h
@@ -13,7 +13,11 @@
 
 #include "libqtest.h"
 
+#ifndef _WIN32
 QTestState *global_qtest __attribute__((common, weak));
+#else
+__declspec(selectany) QTestState *global_qtest;
+#endif
 
 /**
  * qtest_start:
-- 
2.31.1


