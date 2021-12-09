Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D48146F22F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 18:36:51 +0100 (CET)
Received: from localhost ([::1]:35100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNLe-0007k7-5x
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 12:36:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvNJk-0006Ss-7n
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:34:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvNJh-0002zk-1n
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639071287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q1Tn0RH5SwNwHH26yUyNxxW01V1zi/eXOeSkph+RTwU=;
 b=YvPGCWs8ctF5/P632pL5jZW33N80wDYI57cf33hSZARhdSoZVg4bmKxi9dDBwIltdJirf8
 0RLmHyVeS2CEQQVtFyTxpkuM4JxFoDjL0BmRa+Lrwy05SmKb1q+UU8xA8Xg3pr/JW9uAVm
 wEpiXjTdjlleqQ5dckDrTO8ae0oJXuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-yBEpPH0VPBaWZcLodzqeLw-1; Thu, 09 Dec 2021 12:34:44 -0500
X-MC-Unique: yBEpPH0VPBaWZcLodzqeLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 121451023F68;
 Thu,  9 Dec 2021 17:34:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93E5845D7B;
 Thu,  9 Dec 2021 17:34:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts: Explain the difference between linux-headers and
 standard-headers
Date: Thu,  9 Dec 2021 18:34:31 +0100
Message-Id: <20211209173431.172710-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you don't know it, it's hard to figure out the difference between
the linux-headers folder and the include/standard-headers folder.
So let's add a short explanation to clarify the difference.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/update-linux-headers.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index fea4d6eb65..96c7daef94 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -9,6 +9,13 @@
 #
 # This work is licensed under the terms of the GNU GPL version 2.
 # See the COPYING file in the top-level directory.
+#
+# The script will copy the headers into two target folder:
+#
+# - linux-headers/ for file that are required for compiling on a Linux host
+#
+# - include/standard-headers/ for files that are used for guest device emulation
+#
 
 tmpdir=$(mktemp -d)
 linux="$1"
-- 
2.27.0


