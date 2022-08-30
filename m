Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426545A6C86
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 20:45:09 +0200 (CEST)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6EW-0004je-4e
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 14:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AF-0007YP-Iv
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A7-00056K-00
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GmB8527m6m+HrFNsniK8Egq7qFStJT9+sCAjNHyNRg=;
 b=Pp1HzstGKQNSgaqVmBFG0t2DwIH4PQV1L0956MxCqfj9bJgnsb7Yc9D6VAhtkgr6nRgNnb
 T0TElPKMyTC/yHAiCUExFuEyQgJsN2JBRPfaJM02bOKw+13uqUlDP4CcvoyIz7tIF5U5rr
 q0HLy4n3o02lQ2lc0TpznLjLAjaOKRg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-XVihjxIuPXeP_Jf48oGtrQ-1; Tue, 30 Aug 2022 14:40:27 -0400
X-MC-Unique: XVihjxIuPXeP_Jf48oGtrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B7101C05AA8;
 Tue, 30 Aug 2022 18:40:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3621E1415117;
 Tue, 30 Aug 2022 18:40:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 07/23] tests/qtest: Build e1000e-test for posix only
Date: Tue, 30 Aug 2022 20:39:56 +0200
Message-Id: <20220830184012.77978-8-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
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

From: Bin Meng <bin.meng@windriver.com>

The whole e1000e-test test case relies on socketpair() which does
not exist on win32.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220824094029.1634519-17-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index be4b30dea2..9d0f82bf1c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -239,7 +239,6 @@ qos_test_ss.add(
   'adm1272-test.c',
   'ds1338-test.c',
   'e1000-test.c',
-  'e1000e-test.c',
   'eepro100-test.c',
   'es1370-test.c',
   'ipoctal232-test.c',
@@ -267,6 +266,9 @@ qos_test_ss.add(
   'virtio-iommu-test.c',
   'vmxnet3-test.c',
 )
+if config_host.has_key('CONFIG_POSIX')
+  qos_test_ss.add(files('e1000e-test.c'))
+endif
 if have_virtfs
   qos_test_ss.add(files('virtio-9p-test.c'))
 endif
-- 
2.31.1


