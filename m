Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5B7697258
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 01:01:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS5E2-0006G2-OX; Tue, 14 Feb 2023 19:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pS5Dg-0006CQ-IF
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 19:00:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pS5Da-00076D-TZ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 19:00:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676419214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CG7Jd9irv5mfHFW1vJoqmAQGxlo39EUymhFyZQg6FpE=;
 b=RhuSzAfR65J+caXjS51ClnBNOb5Kr7ApTTrtIldRzlsWL0A1BaUaFB/4uwJKMlcnRd/c51
 l870jcBCHqzWjHF/NMEbtPCrLTSqOhIGnUW0TMKzzXaNnU1e5dC8btNkEygQ/IeoqaAnCf
 u0Y8TOK9E6UwXQ2BLclADQXZU5BgG1o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-F1Wz1JPcN9-6iN3topP7Ew-1; Tue, 14 Feb 2023 19:00:12 -0500
X-MC-Unique: F1Wz1JPcN9-6iN3topP7Ew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D10D1C068CA;
 Wed, 15 Feb 2023 00:00:12 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 404812166B26;
 Wed, 15 Feb 2023 00:00:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v4 3/6] qapi: Add minor typing workaround for 3.6
Date: Tue, 14 Feb 2023 19:00:08 -0500
Message-Id: <20230215000011.1725012-4-jsnow@redhat.com>
In-Reply-To: <20230215000011.1725012-1-jsnow@redhat.com>
References: <20230215000011.1725012-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Pylint under 3.6 does not believe that Collection is subscriptable at
runtime. It is, making this a Pylint
bug. https://github.com/PyCQA/pylint/issues/2377

They closed it as fixed, but that doesn't seem to be true as of Pylint
2.13.9, the latest version you can install under Python 3.6. 2.13.9 was
released 2022-05-13, about seven months after the bug was closed.

The least-annoying fix here is to just use the more specific type
Sequence, only because it seems to work in 3.6.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 5a1782b57ea..8701351fdfc 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -33,11 +33,11 @@
 
 import re
 from typing import (
-    Collection,
     Dict,
     Iterable,
     List,
     Optional,
+    Sequence,
     Union,
     cast,
 )
@@ -195,8 +195,8 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
 def check_keys(value: _JSONObject,
                info: QAPISourceInfo,
                source: str,
-               required: Collection[str],
-               optional: Collection[str]) -> None:
+               required: Sequence[str],
+               optional: Sequence[str]) -> None:
     """
     Ensure that a dict has a specific set of keys.
 
-- 
2.39.0


