Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ACA65D1BE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 12:47:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2Dl-00062q-IB; Wed, 04 Jan 2023 06:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD2Dj-00062E-8W
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 06:46:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD2Dh-0001eO-9p
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 06:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672832768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+l5tUXKmzvTbBVmphtKr+qKKmiRdZjFnkwvImz+OtHI=;
 b=LfDb6nMPLx7csmDVVp30co2AKQBAqfTYLZSo1mQe51ZUw6D9WEIH7F4YOEWTKl/j5xmGLa
 pAjgpLZ4UYzP8TE7BdrKtv3Lg9wyl4z0qZqA3UFZYPAYHAFhNKwAqSGNHnwEuURdrMk9Mo
 kkPZ8BSiMGb+Ot8D72QAw9dX47kRdgw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-KFnYdLLeMauW4i6SPckfOA-1; Wed, 04 Jan 2023 06:46:05 -0500
X-MC-Unique: KFnYdLLeMauW4i6SPckfOA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED7BC858F09;
 Wed,  4 Jan 2023 11:46:04 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3251492B06;
 Wed,  4 Jan 2023 11:46:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org,
	Alberto Garcia <berto@igalia.com>
Subject: [PATCH] tests/qemu-iotests/312: Mark "quorum" as required driver
Date: Wed,  4 Jan 2023 12:46:01 +0100
Message-Id: <20230104114601.269351-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

"quorum" is required by iotest 312 - if it is not compiled into the
QEMU binary, the test fails. Thus list "quorum" as required driver
so that the test gets skipped in case it is not available.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/312 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/312 b/tests/qemu-iotests/312
index 4139745f0e..0d9ea09a31 100755
--- a/tests/qemu-iotests/312
+++ b/tests/qemu-iotests/312
@@ -52,6 +52,7 @@ _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
 _unsupported_imgopts cluster_size data_file
+_require_drivers quorum
 
 echo
 echo '### Create all images' # three source (quorum), one destination
-- 
2.31.1


