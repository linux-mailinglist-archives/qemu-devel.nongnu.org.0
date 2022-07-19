Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623C5793F3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:17:52 +0200 (CEST)
Received: from localhost ([::1]:52662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhUN-0007fl-9H
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHQ-0002Ci-CN
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHO-0002zA-SE
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6tWijDM9K8IU9bc3MVI7tXseygBp+Hs+39wbY2dCmdc=;
 b=O6y0tmYQJUqQOY8Lm8JR4zb4TcPF6TGa6ZFD0emOCqpzW7Y8bajkiihM3YqCkei1CckwX/
 IF4M8+1paKr1ve4eLEqqn4wNakrA0F72s21Hl36xQqvdfNTFeZDTAPkD9jZEuAPETZMAGl
 Mh57o5nDeODhyYBqmgikldysLmEue3g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-_bVde8hmMgSr6eLwQ9llJQ-1; Tue, 19 Jul 2022 03:04:23 -0400
X-MC-Unique: _bVde8hmMgSr6eLwQ9llJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A64C6380670D;
 Tue, 19 Jul 2022 07:04:22 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E948E40CF8E5;
 Tue, 19 Jul 2022 07:04:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 09/14] tests/vm: Remove docker cross-compile test from CentOS VM
Date: Tue, 19 Jul 2022 09:04:07 +0200
Message-Id: <20220719070412.16757-10-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: John Snow <jsnow@redhat.com>

The fedora container has since been split apart, so there's no suitable
nearby target that would support "test-mingw" as it requires both x32
and x64 support -- so either fedora-cross-win32 nor fedora-cross-win64
would be truly suitable.

Just remove this test as superfluous with our current CI infrastructure.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220708153503.18864-10-jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/centos | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/vm/centos b/tests/vm/centos
index 3a527c47b3..097a9ca14d 100755
--- a/tests/vm/centos
+++ b/tests/vm/centos
@@ -28,7 +28,6 @@ class CentosVM(basevm.BaseVM):
         tar -xf $SRC_ARCHIVE;
         make docker-test-block@centos8 {verbose} J={jobs} NETWORK=1;
         make docker-test-quick@centos8 {verbose} J={jobs} NETWORK=1;
-        make docker-test-mingw@fedora  {verbose} J={jobs} NETWORK=1;
     """
 
     def build_image(self, img):
-- 
2.31.1


