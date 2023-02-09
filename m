Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE8D6910AC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 19:49:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQBxn-0007Ul-Tg; Thu, 09 Feb 2023 13:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQBxl-0007Th-O0
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 13:48:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQBxj-0005UJ-MC
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 13:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675968483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQdky+ci5Ugx5VR59SLUfrFns5xzrdxgWm0UxWx2L7c=;
 b=Wgwtkz5G5Gf/fJOf6iDpAVsuwsSE/TbM940sxp00FZSBLzyLJ0GzUgTCAPKd+EkTpXb3qt
 ko2OJQn3XOB7VeZW/1avD05wXXLbcwoIwYx3QTk/knn94+sEuAmGtzc3913mBc5az52eUP
 KnLysjB5g1oj8XoDaQOnB4Cj/PhUeGA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-DX5VsO2dObWgifqhS83Ocg-1; Thu, 09 Feb 2023 13:48:01 -0500
X-MC-Unique: DX5VsO2dObWgifqhS83Ocg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2BC938123A5;
 Thu,  9 Feb 2023 18:48:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D3F4492C3E;
 Thu,  9 Feb 2023 18:48:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v3 7/7] qapi: remove JSON value FIXME
Date: Thu,  9 Feb 2023 13:47:58 -0500
Message-Id: <20230209184758.1017863-8-jsnow@redhat.com>
In-Reply-To: <20230209184758.1017863-1-jsnow@redhat.com>
References: <20230209184758.1017863-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
index c165bd3912c..b5afdd703e7 100644
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


