Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E74A4CD1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:13:01 +0100 (CET)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEaEe-0002BW-9m
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:13:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6g-0001Uj-Ho
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6e-0007Rr-P1
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643648684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1AdQxXYwk5AHMGM0F/kmPdGc3RiSlXfSLnXvYCVVMcQ=;
 b=SkB6HjeKiBDe84C92Nh+pn8UAHDTOFQZ/4c+Hu+yBeEjB82nu04hRXSgspLNGuLYdOnUUl
 43ZNSG3pguUKma7913AUhq9tuObI3F/YqZ2QP861WR6Wla+ml201hY81GoMP1PCp8iGzrd
 XIcdhM6jVl1e6AxJ0dD7SOQWt9qa+sk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-cJgcu5JLPUenijQs9zkQ7g-1; Mon, 31 Jan 2022 12:04:36 -0500
X-MC-Unique: cJgcu5JLPUenijQs9zkQ7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 497C18144E9;
 Mon, 31 Jan 2022 17:04:31 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8092610A48D5;
 Mon, 31 Jan 2022 17:04:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/5] docs: Only mention ssh in the man page when available
Date: Mon, 31 Jan 2022 18:04:09 +0100
Message-Id: <20220131170411.125198-4-kwolf@redhat.com>
In-Reply-To: <20220131170411.125198-1-kwolf@redhat.com>
References: <20220131170411.125198-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 timao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If libssh is disabled in the build, the man page shouldn't contain
information on how to use the ssh block driver.

This patch is best viewed with whitespace changes ignored.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/system/device-url-syntax.rst.inc | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/docs/system/device-url-syntax.rst.inc b/docs/system/device-url-syntax.rst.inc
index c882bce418..84a8145292 100644
--- a/docs/system/device-url-syntax.rst.inc
+++ b/docs/system/device-url-syntax.rst.inc
@@ -74,18 +74,20 @@ special URL syntax.
 
       |qemu_system| --drive file=nbd:unix:/tmp/nbd-socket
 
-``SSH``
-   QEMU supports SSH (Secure Shell) access to remote disks.
+.. only:: not DISABLE_LIBSSH
 
-   Examples:
+    ``SSH``
+       QEMU supports SSH (Secure Shell) access to remote disks.
 
-   .. parsed-literal::
+       Examples:
+
+       .. parsed-literal::
 
-      |qemu_system| -drive file=ssh://user@host/path/to/disk.img
-      |qemu_system| -drive file.driver=ssh,file.user=user,file.host=host,file.port=22,file.path=/path/to/disk.img
+          |qemu_system| -drive file=ssh://user@host/path/to/disk.img
+          |qemu_system| -drive file.driver=ssh,file.user=user,file.host=host,file.port=22,file.path=/path/to/disk.img
 
-   Currently authentication must be done using ssh-agent. Other
-   authentication methods may be supported in future.
+       Currently authentication must be done using ssh-agent. Other
+       authentication methods may be supported in future.
 
 ``GlusterFS``
    GlusterFS is a user space distributed file system. QEMU supports the
-- 
2.31.1


