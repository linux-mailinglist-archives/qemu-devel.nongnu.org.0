Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EFE415507
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 03:10:51 +0200 (CEST)
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTDGE-0006MR-R5
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 21:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTD6u-0003WS-A1
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 21:01:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTD6s-00055N-7T
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 21:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3q8zXOzzNlR2XlWEZhypW6bNlU/FrpkhP4yHCioJ/o=;
 b=GHZ65YQabRymApY7HgcRemsuYNwczKZiYQ1b6Gb1o5guz/JEhlrWn9UVnWTe24cpdLMXQL
 orNhLe398MTNScnD+3GYrs0SPaumBcoQ3RiXHqVxTecq1o7DLI+Bm66rQLMCupfIGwdsqw
 3wJaVNxbSc/4aZ2ghoOEzm0qL8YQ+aA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-DiW9Y3wuPqSJoUG_VakaHg-1; Wed, 22 Sep 2021 21:01:08 -0400
X-MC-Unique: DiW9Y3wuPqSJoUG_VakaHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6726718D6A2A;
 Thu, 23 Sep 2021 01:01:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE23D177C0;
 Thu, 23 Sep 2021 01:01:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] docs/devel: create "Subsystem APIs" subsection
Date: Wed, 22 Sep 2021 21:00:59 -0400
Message-Id: <20210923010101.4002759-6-jsnow@redhat.com>
In-Reply-To: <20210923010101.4002759-1-jsnow@redhat.com>
References: <20210923010101.4002759-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/index.rst              | 10 +---------
 docs/devel/section-subsystems.rst | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)
 create mode 100644 docs/devel/section-subsystems.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 3ec699c8410..d6df483fce6 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -14,18 +14,10 @@ modifying QEMU's source code.
    section-development
    section-testing-debugging
    section-tcg
+   section-subsystems
    control-flow-integrity
-   loads-stores
-   memory
-   migration
-   atomics
-   bitops
-   ui
-   reset
    s390-dasd-ipl
-   clocks
    qom
-   modules
    block-coroutine-wrapper
    multi-process
    ebpf_rss
diff --git a/docs/devel/section-subsystems.rst b/docs/devel/section-subsystems.rst
new file mode 100644
index 00000000000..fbe21f85adf
--- /dev/null
+++ b/docs/devel/section-subsystems.rst
@@ -0,0 +1,16 @@
+Subsystem APIs
+==============
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   atomics
+   bitops
+   loads-stores
+   clocks
+   memory
+   ui
+   migration
+   reset
+   modules
-- 
2.31.1


