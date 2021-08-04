Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C39A3DF922
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 03:06:02 +0200 (CEST)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB5M9-0005xs-2t
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 21:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mB5D0-0000YV-1P
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 20:56:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mB5Cy-0006mj-Ha
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 20:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628038592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2rBwStwU9epry9NfUlJenH68dTUg0XvUTrJOysL/lg=;
 b=PkS2wkEsMKuQnZYWo3TQjlLAP8jgSE997g32sIuOc2pkIY7anyMfZDvX46TUYXI1YGt6Ws
 +KPsREawMlZHix+ayMYZs08lEBwaFkIWSsTeI/9zAHKJjLU7VNryFszm3ZQFomuU/w6zsx
 vcRyK8L2a4R2LGlMShHcEdw/4EmObno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-xm4dd8c5OeC-D2DMmh-nMw-1; Tue, 03 Aug 2021 20:56:28 -0400
X-MC-Unique: xm4dd8c5OeC-D2DMmh-nMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B90231853028;
 Wed,  4 Aug 2021 00:56:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2758F5D9DC;
 Wed,  4 Aug 2021 00:56:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] docs/devel: create "Miscellaneous Topics" subsection
Date: Tue,  3 Aug 2021 20:56:21 -0400
Message-Id: <20210804005621.1577302-7-jsnow@redhat.com>
In-Reply-To: <20210804005621.1577302-1-jsnow@redhat.com>
References: <20210804005621.1577302-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Daniel Berrange <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hallmark of any truly great taxonomical reorganization: the bin of
leftover bits and pieces that didn't neatly fit elsewhere.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/devel/index.rst        |  9 +--------
 docs/devel/section-misc.rst | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 8 deletions(-)
 create mode 100644 docs/devel/section-misc.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index da579a7b666..ef14f3302e1 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -14,11 +14,4 @@ modifying QEMU's source code.
    section-testing-debugging
    section-tcg
    section-subsystems
-   control-flow-integrity
-   decodetree
-   s390-dasd-ipl
-   qom
-   block-coroutine-wrapper
-   multi-process
-   ebpf_rss
-   vfio-migration
+   section-misc
diff --git a/docs/devel/section-misc.rst b/docs/devel/section-misc.rst
new file mode 100644
index 00000000000..804852ff61c
--- /dev/null
+++ b/docs/devel/section-misc.rst
@@ -0,0 +1,15 @@
+Miscellaneous Topics
+====================
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   control-flow-integrity
+   decodetree
+   s390-dasd-ipl
+   qom
+   block-coroutine-wrapper
+   multi-process
+   ebpf_rss
+   vfio-migration
-- 
2.31.1


