Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B78141550B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 03:13:24 +0200 (CEST)
Received: from localhost ([::1]:35230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTDIh-0002Yh-5F
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 21:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTD6v-0003YL-Sy
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 21:01:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTD6t-00055v-1a
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 21:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YK0qxNE1IN1ZUcqKWI86Rj1WOi2dsKZAX+2imlVYpEw=;
 b=N7ueeP4ShySVFD2tkiEi2dxrbVFwksgKm5GnMH7tY7MFOkGRWrBOsxCwCD5vjqnzgytYcE
 f6o/ieoR5RPDxrXfsIo26k3ObjvjOquSBhxcuJuxzNHNtd9tL4iRyaZcSlx8V/rl8qFFsH
 kEWIMpR3gQ24DAZt8ElkK4MX5COg6LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-URF0IxEGMeCd_VC9feiQlw-1; Wed, 22 Sep 2021 21:01:09 -0400
X-MC-Unique: URF0IxEGMeCd_VC9feiQlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D15C1084683;
 Thu, 23 Sep 2021 01:01:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93047177C0;
 Thu, 23 Sep 2021 01:01:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] docs/devel: create "QEMU API" section
Date: Wed, 22 Sep 2021 21:01:00 -0400
Message-Id: <20210923010101.4002759-7-jsnow@redhat.com>
In-Reply-To: <20210923010101.4002759-1-jsnow@redhat.com>
References: <20210923010101.4002759-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/index.rst       |  4 +---
 docs/devel/section-api.rst | 10 ++++++++++
 2 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 docs/devel/section-api.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index d6df483fce6..449b09b75b8 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -13,14 +13,12 @@ modifying QEMU's source code.
    section-community-governance
    section-development
    section-testing-debugging
+   section-api
    section-tcg
    section-subsystems
    control-flow-integrity
    s390-dasd-ipl
-   qom
    block-coroutine-wrapper
    multi-process
    ebpf_rss
    vfio-migration
-   qapi-code-gen
-   writing-qmp-commands
diff --git a/docs/devel/section-api.rst b/docs/devel/section-api.rst
new file mode 100644
index 00000000000..d62b614fe3d
--- /dev/null
+++ b/docs/devel/section-api.rst
@@ -0,0 +1,10 @@
+QEMU API
+========
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   qapi-code-gen
+   writing-qmp-commands
+   qom
-- 
2.31.1


