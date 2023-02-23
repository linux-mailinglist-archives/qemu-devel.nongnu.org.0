Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352696A088A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:24:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAdW-00030K-QL; Thu, 23 Feb 2023 07:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdT-00030C-KD
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdS-0003zd-5n
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677155021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSqE7IZwMPjeZ8A1bxMdfnSECyu7I43VbnKR+si8cwY=;
 b=NdNa0XJL2vp6s1tGF086easY+JmelzCc4XQqXsaMr8XkQyhXqbOLXUtpCSEOsNb+R819gJ
 PZNvmVjcTraxI+0oZqO2JrTAYCHHsRFJfkHRUTf6BobdctdglOcg4P5E5SZs7B9Etkmu0k
 dCwhk8q5AxUeA0iFIRWIjQcjShWvOVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-tTKwuelpN2GC1c5BDZ0EqQ-1; Thu, 23 Feb 2023 07:23:30 -0500
X-MC-Unique: tTKwuelpN2GC1c5BDZ0EqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11929857A89;
 Thu, 23 Feb 2023 12:23:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3956440D9;
 Thu, 23 Feb 2023 12:23:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 97B6A21E6A28; Thu, 23 Feb 2023 13:23:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	John Snow <jsnow@redhat.com>
Subject: [PULL 8/8] qapi: remove JSON value FIXME
Date: Thu, 23 Feb 2023 13:23:27 +0100
Message-Id: <20230223122327.1920247-9-armbru@redhat.com>
In-Reply-To: <20230223122327.1920247-1-armbru@redhat.com>
References: <20230223122327.1920247-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

From: John Snow <jsnow@redhat.com>

With the two major JSON-ish type hierarchies clarified for distinct
purposes; QAPIExpression for parsed expressions and JSONValue for
introspection data, remove this FIXME as no longer an action item.

A third JSON-y data type, _ExprValue, is not meant to represent JSON in
the abstract but rather only the possible legal return values from a
single function, get_expr(). It isn't appropriate to attempt to merge it
with either of the above two types.

In theory, it may be possible to define a completely agnostic
one-size-fits-all JSON type hierarchy that any other user could borrow -
in practice, it's tough to wrangle the differences between invariant,
covariant and contravariant types: input and output parameters demand
different properties of such a structure.

However, QAPIExpression serves to authoritatively type user input to the
QAPI parser, while JSONValue serves to authoritatively type qapi
generator *output* to be served back to client users at runtime via
QMP. The AST for these two types are different and cannot be wholly
merged into a unified syntax.

They could, in theory, share some JSON primitive definitions. In
practice, this is currently more trouble than it's worth with mypy's
current expressive power. As such, declare this "done enough for now".

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20230215000011.1725012-7-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index d570086e1a..878f90b458 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -42,10 +42,6 @@
 _ExprValue = Union[List[object], Dict[str, object], str, bool]
 
 
-# FIXME: Consolidate and centralize definitions for _ExprValue and
-# JSONValue; currently scattered across several modules.
-
-
 class QAPIExpression(Dict[str, object]):
     # pylint: disable=too-few-public-methods
     def __init__(self,
-- 
2.39.0


