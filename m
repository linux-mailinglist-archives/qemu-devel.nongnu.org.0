Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0353C41550E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 03:16:22 +0200 (CEST)
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTDLZ-00064a-1f
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 21:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTD6t-0003WM-9q
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 21:01:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTD6q-00053h-6l
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 21:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwJruLBN30rXp3VgQR14SSgBdw4JdceEKKDJFqXQfxo=;
 b=UE/zy8MLSPKjoBY9cilYTuvfeB+p5BCwajhGdJLxCtuBj55tK4IjfkyUuHQcCuSyFNnTch
 o2ajWiy3yhU3xwYM4dTkdsoWi8ejrB2ZrzBxP4wy/Rod68hxABrqQzu09Dfu0YDtWT5mPz
 4GIoTa3FNBJo4wNP93ZH1MRQlkKVwqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-5f9h2_TDNOuPKYTrNpuEtQ-1; Wed, 22 Sep 2021 21:01:04 -0400
X-MC-Unique: 5f9h2_TDNOuPKYTrNpuEtQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8891F1084683;
 Thu, 23 Sep 2021 01:01:03 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0D87177C0;
 Thu, 23 Sep 2021 01:01:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] docs/devel: create "Community & Governance" subsection
Date: Wed, 22 Sep 2021 21:00:55 -0400
Message-Id: <20210923010101.4002759-2-jsnow@redhat.com>
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

Plonk the Code of Conduct and Conflict Resolution Policy guides into a
new "Community & Governance" subsection.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/index.rst                        | 3 +--
 docs/devel/section-community-governance.rst | 9 +++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 docs/devel/section-community-governance.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index f95df10b3eb..b5cb57124d3 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -10,8 +10,7 @@ modifying QEMU's source code.
    :maxdepth: 2
    :includehidden:
 
-   code-of-conduct
-   conflict-resolution
+   section-community-governance
    build-system
    style
    kconfig
diff --git a/docs/devel/section-community-governance.rst b/docs/devel/section-community-governance.rst
new file mode 100644
index 00000000000..2c7e07257d1
--- /dev/null
+++ b/docs/devel/section-community-governance.rst
@@ -0,0 +1,9 @@
+Community & Governance
+======================
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   code-of-conduct
+   conflict-resolution
-- 
2.31.1


