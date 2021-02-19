Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C5631FC20
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:38:18 +0100 (CET)
Received: from localhost ([::1]:47308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7rF-0006Fr-3n
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD76Q-0004or-Sh
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:49:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD76N-0004ja-Qo
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613746191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJsuE+XY10A55L2ra06E5BJAIiWIFCTpd7myuOY+Ogk=;
 b=TnY/2Di2WJm06dd9cWHfm4fqQYKCGzzPm2hAWwDqn3+MP2Ek5tXSZiTDzeYqQnXB6ZWnPw
 gTEZ+QEHd1sjMPQ5BQYMSvZ6kPJlw3gVjJJa2R8v2hJfvFYGxEQSj2CToTx5ezX+19NrOX
 HabTaufCjnN8CxmoLWV9AUK/8fh37xA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-SOs_vSv6P7KbM2aUMkrrug-1; Fri, 19 Feb 2021 09:49:44 -0500
X-MC-Unique: SOs_vSv6P7KbM2aUMkrrug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D77B4107ACC7;
 Fri, 19 Feb 2021 14:49:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A88425D723;
 Fri, 19 Feb 2021 14:49:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 874D4112F00E; Fri, 19 Feb 2021 15:49:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/18] qapi/introspect.py: set _gen_tree's default ifcond
 argument to ()
Date: Fri, 19 Feb 2021 15:49:39 +0100
Message-Id: <20210219144939.604488-19-armbru@redhat.com>
In-Reply-To: <20210219144939.604488-1-armbru@redhat.com>
References: <20210219144939.604488-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

We don't need to create an empty, mutable list to pass to _gen_tree;
since it is now typed as a Sequence, we can use the empty tuple as a
default and omit the argument.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-19-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index d0b0fd19ed..9a348ca2e5 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -254,7 +254,7 @@ const QLitObject %(c_name)s = %(c_string)s;
         return [Annotated(f.name, f.ifcond) for f in features]
 
     def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
-                  ifcond: Sequence[str],
+                  ifcond: Sequence[str] = (),
                   features: Sequence[QAPISchemaFeature] = ()) -> None:
         """
         Build and append a SchemaInfo object to self._trees.
@@ -302,7 +302,7 @@ const QLitObject %(c_name)s = %(c_string)s;
 
     def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
                            json_type: str) -> None:
-        self._gen_tree(name, 'builtin', {'json-type': json_type}, [])
+        self._gen_tree(name, 'builtin', {'json-type': json_type})
 
     def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
                         ifcond: Sequence[str],
-- 
2.26.2


