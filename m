Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674B15A6D04
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:22:17 +0200 (CEST)
Received: from localhost ([::1]:35510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6oR-0005Fg-TS
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AN-0007dF-Ar
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AL-0005C1-Vc
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Om4MeDDkSqrDhGMfpIdriBJTAstKXo0ldBq8uXRLRBo=;
 b=TxLmEsXqU4uXaUWovM7heE4UcTwZeVBW6ojRH8GdHzwMulnyx0cVZ+YzrHf1MeWgf9dOyD
 DAzTgNJiKvJhxSNq7ZzEEfuwwRUBTv7buLzpxHN9QSuIEWxBuirvNZepNrQx5iY/ZUGCrZ
 Bodfgvid3BYHi9Y5UuWgVCpVKjRrnCg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-7RAMXL2MPXGRjTCQ9FfyRQ-1; Tue, 30 Aug 2022 14:40:47 -0400
X-MC-Unique: 7RAMXL2MPXGRjTCQ9FfyRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BFEE185A7BA;
 Tue, 30 Aug 2022 18:40:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 583581410DD5;
 Tue, 30 Aug 2022 18:40:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 19/23] tests/avocado: Fix trivial typo
Date: Tue, 30 Aug 2022 20:40:08 +0200
Message-Id: <20220830184012.77978-20-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The intention was likely to use "intend" instead of "indent" here.

Message-Id: <20220824080926.568935-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 3b5b8e7f2d..5f1d3e551c 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -518,7 +518,7 @@ def default_kernel_params(self):
 class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
     """Facilitates having a cloud-image Linux based available.
 
-    For tests that indent to interact with guests, this is a better choice
+    For tests that intend to interact with guests, this is a better choice
     to start with than the more vanilla `QemuSystemTest` class.
     """
 
-- 
2.31.1


