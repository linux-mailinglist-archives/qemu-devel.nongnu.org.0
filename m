Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D93C68E5ED
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 03:13:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPZxU-0002jt-M7; Tue, 07 Feb 2023 21:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxS-0002jD-3j
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxQ-00041D-IW
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675822391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8zg1iv+8H84JUzE8gOFuJBHk5PZe5IabjqdnKiheT6E=;
 b=fxhNEsXclP5LaQrbEQxajKW+Za/+X1olwucPkyW2Tsxl0inPKI1oXsMYL1AOJ8tcSDU+qV
 PS8ZHJSvkht+NiL/xAsMmhm9Us3VVpiESZHPQf6GiAuvb3KMG8lAgvPIm3uNHjiLX3c0Ae
 qBl1d5sM3rEDXQCP/b2DkMOwe+kh+Cs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-UEp1KAWsN0266dezBUrLUw-1; Tue, 07 Feb 2023 21:13:08 -0500
X-MC-Unique: UEp1KAWsN0266dezBUrLUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46FDF1869B60;
 Wed,  8 Feb 2023 02:13:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1878B1121314;
 Wed,  8 Feb 2023 02:13:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 7/7] qapi: remove JSON value FIXME
Date: Tue,  7 Feb 2023 21:13:06 -0500
Message-Id: <20230208021306.870657-8-jsnow@redhat.com>
In-Reply-To: <20230208021306.870657-1-jsnow@redhat.com>
References: <20230208021306.870657-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

With the two major JSON-ish type hierarchies clarified for distinct
purposes; QAPIExpression for parsed expressions and JSONValue for
introspection data, remove this FIXME as no longer an action item.

In theory, it may be possible to define a completely agnostic
one-size-fits-all JSON type hierarchy that any other user could borrow -
in practice, it's tough to wrangle the differences between invariant,
covariant and contravariant types: input and output parameters demand
different properties of such a structure. As such, it's simply more
trouble than it's worth.

So, declare this "done enough for now".

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 315660e8671..556092f37b1 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -42,10 +42,6 @@
 _ExprValue = Union[List[object], Dict[str, object], str, bool]
 
 
-# FIXME: Consolidate and centralize definitions for _ExprValue and
-# JSONValue; currently scattered across several modules.
-
-
 # 3.6 workaround: can be removed when Python 3.7+ is our required version.
 if TYPE_CHECKING:
     _UserDict = UserDict[str, object]
-- 
2.39.0


