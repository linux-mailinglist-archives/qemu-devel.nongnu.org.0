Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9BA3E5C80
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:05:44 +0200 (CEST)
Received: from localhost ([::1]:59968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSNz-0000jr-6T
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSMf-0008Ag-7Z
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSMd-0008WV-Qz
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628604259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2IUjQ/6dAu1qS0Wj8AWGOpYN6AKTnJEGQTgIrw790IY=;
 b=EcYLecmBWVeLwBz683oDB05A2552W/t8pnD6ykUDf7iOH0fhhhlBM6XEAyQi2aHvaPQ0KY
 IWpuy1it4cqaPN1pmiLTy5vy+yeqvk9LrKxYpkTb8vve+bh915/3K+XRAEbHpwxkIahSzu
 HkKarHNq4avwMVR2I/q7ehycqEtQfu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-NmaA6dmeO8qWxg9kxhy9Vw-1; Tue, 10 Aug 2021 10:04:16 -0400
X-MC-Unique: NmaA6dmeO8qWxg9kxhy9Vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEA8687D541;
 Tue, 10 Aug 2021 14:04:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78FA127CB4;
 Tue, 10 Aug 2021 14:04:14 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2] MAINTAINERS: Name and email address change
Date: Tue, 10 Aug 2021 16:04:11 +0200
Message-Id: <20210810140411.173369-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have changed my name and email address.  Update the MAINTAINERS file
to match, and .mailmap in case anyone wants to send me an email because
of some past commit I authored.  (As suggested by Philippe, I put the
.mailmap line into the "preferred name forms" section, considering it
counts as a git author config change.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
v2: .mailmap update
---
 .mailmap    | 1 +
 MAINTAINERS | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index 082ff893ab..f029d1c21f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -100,6 +100,7 @@ Gautham R. Shenoy <ego@linux.vnet.ibm.com>
 Gonglei (Arei) <arei.gonglei@huawei.com>
 Guang Wang <wang.guang55@zte.com.cn>
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
+Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
 Hervé Poussineau <hpoussin@reactos.org>
 Jakub Jermář <jakub@jermar.eu>
 Jakub Jermář <jakub.jermar@kernkonzept.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 37b1a8e442..694973ed23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2270,7 +2270,7 @@ F: tests/qtest/fuzz-sb16-test.c
 
 Block layer core
 M: Kevin Wolf <kwolf@redhat.com>
-M: Max Reitz <mreitz@redhat.com>
+M: Hanna Reitz <hreitz@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block*
@@ -3265,7 +3265,7 @@ F: stubs/io_uring.c
 
 qcow2
 M: Kevin Wolf <kwolf@redhat.com>
-M: Max Reitz <mreitz@redhat.com>
+M: Hanna Reitz <hreitz@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/qcow2*
@@ -3279,7 +3279,7 @@ F: block/qcow.c
 
 blkdebug
 M: Kevin Wolf <kwolf@redhat.com>
-M: Max Reitz <mreitz@redhat.com>
+M: Hanna Reitz <hreitz@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/blkdebug.c
@@ -3314,7 +3314,7 @@ F: tests/qtest/vhost-user-blk-test.c
 F: util/vhost-user-server.c
 
 FUSE block device exports
-M: Max Reitz <mreitz@redhat.com>
+M: Hanna Reitz <hreitz@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/export/fuse.c
-- 
2.31.1


