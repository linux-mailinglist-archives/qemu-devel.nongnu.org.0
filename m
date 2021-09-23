Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DCF41652F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:25:07 +0200 (CEST)
Received: from localhost ([::1]:36528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTP8-0006dW-1c
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTTMu-0004WQ-3s
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTTMs-0008H5-Iv
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632421365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJrlyCQXbfxzRA7UvRnyOqNkXc54xFR30J98bJ/t9R8=;
 b=ZDiGZedKiJ5VdIb31+MFoYg7v3QqxdQmRJJcZiAgwVMdxNSrqQLewqFwxtPjMmeb2mHcIJ
 pvpX1amxYtHn9VmTQmWL1/jIof7ssTSMigCzxMcrf5VLlvr41CyMDlhyJK3puIzwIZ8IaD
 vNMQwG4lNBBwHrJ70yg1+rl2VZFyD2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-H5yODgc0OBGYAYs1IuDPZA-1; Thu, 23 Sep 2021 14:22:44 -0400
X-MC-Unique: H5yODgc0OBGYAYs1IuDPZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0318F1842154;
 Thu, 23 Sep 2021 18:22:43 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7368C5BAE0;
 Thu, 23 Sep 2021 18:22:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] docs/sphinx: change default role to "any"
Date: Thu, 23 Sep 2021 14:22:04 -0400
Message-Id: <20210923182204.4187601-3-jsnow@redhat.com>
In-Reply-To: <20210923182204.4187601-1-jsnow@redhat.com>
References: <20210923182204.4187601-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, John Snow <jsnow@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This interprets single-backtick syntax in all of our Sphinx docs as a
cross-reference to *something*, including Python symbols.

From here on out, new uses of `backticks` will cause a build failure if
the target cannot be referenced.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/conf.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/conf.py b/docs/conf.py
index ff6e92c6e2e..4d9f56601fc 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -85,6 +85,11 @@
 # The master toctree document.
 master_doc = 'index'
 
+# Interpret `single-backticks` to be a cross-reference to any kind of
+# referenceable object. Unresolvable or ambiguous references will emit a
+# warning at build time.
+default_role = 'any'
+
 # General information about the project.
 project = u'QEMU'
 copyright = u'2021, The QEMU Project Developers'
-- 
2.31.1


