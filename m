Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344A2443610
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:53:11 +0100 (CET)
Received: from localhost ([::1]:41082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyuE-0006N8-50
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhyns-0004m1-Vz
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhynr-0004mQ-II
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635878795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sb+JrgSSp9WAPQnhdMXztmNWnmaSMiyfNN+rpG9Ac2w=;
 b=ITvCXkfB/ueJOrBIuK/oh/NxNqMXxXwlvbfsz2j75aHfKswdG9skYQ5ID4G7CeaS9AheA0
 zLB047Xq8VHjgzXXj4l2q2pVKMCbKxSGCVz52I6xr9ldQy24ulEzm6xYFx/EMXZlZ4obVD
 Ea5qu12/hoY55LTacBSq2/6EM2Bl7m0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-IO3zarywPr6HtKTOBFc7oA-1; Tue, 02 Nov 2021 14:46:34 -0400
X-MC-Unique: IO3zarywPr6HtKTOBFc7oA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E79F8799E0;
 Tue,  2 Nov 2021 18:46:32 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA28C19C79;
 Tue,  2 Nov 2021 18:46:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/4] docs/sphinx: change default role to "any"
Date: Tue,  2 Nov 2021 14:44:00 -0400
Message-Id: <20211102184400.1168508-5-jsnow@redhat.com>
In-Reply-To: <20211102184400.1168508-1-jsnow@redhat.com>
References: <20211102184400.1168508-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Alexander Bulekov <alxndr@bu.edu>, Eric Blake <eblake@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This interprets single-backtick syntax in all of our Sphinx docs as a
cross-reference to *something*, including Python symbols.

From here on out, new uses of `backticks` will cause a build failure if
the target cannot be referenced.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/conf.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/conf.py b/docs/conf.py
index ff6e92c6e2..4d9f56601f 100644
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


