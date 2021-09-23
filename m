Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8D841551B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 03:21:47 +0200 (CEST)
Received: from localhost ([::1]:48662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTDQo-0003Vx-Nr
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 21:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTD6w-0003aH-NW
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 21:01:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTD6t-00055t-09
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 21:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DP/m/CsuX4wNPpt8dVlGHJmgE1BMDsu8r/gT06hIFYE=;
 b=TPB2P9vGrM35Z9TpUYo11bx1rnwDiYX6FshLYfVo22zvgn9cvVrsxO7+wCYuiNAFR/M7RC
 xtcjdMZAUE5GGmryw5wtuAbqJaOy3KG7lteT/Ip/xtWA7YqFpzv14z8dFr7K/aEDueaiX7
 BE6g3BH7i/tRdxlkpL+VZuX4QsjBrrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-L2XMm9_VN4mZ9obH8SNaAQ-1; Wed, 22 Sep 2021 21:01:07 -0400
X-MC-Unique: L2XMm9_VN4mZ9obH8SNaAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59955362F9;
 Thu, 23 Sep 2021 01:01:06 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9039F177C0;
 Thu, 23 Sep 2021 01:01:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] docs/devel: create TCG subsection
Date: Wed, 22 Sep 2021 21:00:58 -0400
Message-Id: <20210923010101.4002759-5-jsnow@redhat.com>
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
 docs/devel/index.rst       |  6 +-----
 docs/devel/section-tcg.rst | 12 ++++++++++++
 2 files changed, 13 insertions(+), 5 deletions(-)
 create mode 100644 docs/devel/section-tcg.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 35a7de4d0a4..3ec699c8410 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -13,16 +13,12 @@ modifying QEMU's source code.
    section-community-governance
    section-development
    section-testing-debugging
+   section-tcg
    control-flow-integrity
    loads-stores
    memory
    migration
    atomics
-   decodetree
-   tcg
-   tcg-icount
-   multi-thread-tcg
-   tcg-plugins
    bitops
    ui
    reset
diff --git a/docs/devel/section-tcg.rst b/docs/devel/section-tcg.rst
new file mode 100644
index 00000000000..dec4ab984b6
--- /dev/null
+++ b/docs/devel/section-tcg.rst
@@ -0,0 +1,12 @@
+TCG - Tiny Code Generator
+=========================
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   tcg
+   tcg-icount
+   multi-thread-tcg
+   decodetree
+   tcg-plugins
-- 
2.31.1


