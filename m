Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA12DCACD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 03:05:22 +0100 (CET)
Received: from localhost ([::1]:54130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpifR-0007Yj-H1
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 21:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUT-0004AG-R6
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:54:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUS-0006KL-3O
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:54:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJ9IYkcUet9X5jxo9RQKcovqVr2pXoL0iYTwcE9VwJM=;
 b=Hwz9f3qphc1B5VBSs2f5NxTpKc9Z9RxFRfQaP/eDDidtPv9yoixfbYMk1Piq70GEpOfL4o
 bk8RfuTEfbHGfDDW3U3UsP4Or8u+rpBs6+r8Mwam0RYZKAF1ph2dl44x/YUv8GvutVOFe6
 jfIJlOB3ljBvjzNgXke2CZv83M3DfKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-BjDQ5Ca8Mj-yb7KVO8kYbA-1; Wed, 16 Dec 2020 20:53:57 -0500
X-MC-Unique: BjDQ5Ca8Mj-yb7KVO8kYbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA585800D55
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:53:56 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24F0760CE1;
 Thu, 17 Dec 2020 01:53:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 13/13] qapi/introspect.py: Add docstring to _tree_to_qlit
Date: Wed, 16 Dec 2020 20:53:43 -0500
Message-Id: <20201217015343.196279-14-jsnow@redhat.com>
In-Reply-To: <20201217015343.196279-1-jsnow@redhat.com>
References: <20201217015343.196279-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 428397a6954..8d5b8513fc8 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -1,10 +1,11 @@
 """
 QAPI introspection generator
 
-Copyright (C) 2015-2018 Red Hat, Inc.
+Copyright (C) 2015-2020 Red Hat, Inc.
 
 Authors:
  Markus Armbruster <armbru@redhat.com>
+ John Snow <jsnow@redhat.com>
 
 This work is licensed under the terms of the GNU GPL, version 2.
 See the COPYING file in the top-level directory.
@@ -96,6 +97,13 @@ def __init__(self, value: _NodeT, ifcond: Iterable[str],
 def _tree_to_qlit(obj: TreeValue,
                   level: int = 0,
                   suppress_first_indent: bool = False) -> str:
+    """
+    Convert the type tree into a QLIT C string, recursively.
+
+    :param obj: The value to convert.
+    :param level: The indentation level for this particular value.
+    :param suppress_first_indent: True for dict value children.
+    """
 
     def indent(level: int) -> str:
         return level * 4 * ' '
-- 
2.26.2


