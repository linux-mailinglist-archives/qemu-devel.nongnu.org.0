Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2AA288F29
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 18:48:30 +0200 (CEST)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvZF-0004yZ-S8
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 12:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv4Z-0004V8-OL
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv4W-0003Ml-Bo
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602260203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdn05DNwF+o4+GQORBUXpIfhhHZKPHGKMbVPTrsDm7Q=;
 b=hL6nqcKiWS3OdNAELp6VaWAEucWVzw4ibH7uwex4HSv7/vabWeK3SZzClvXM/uvTJedasD
 yk5Xet0U+ksqrWeYtD6eztD8CFBOyn41DHdKGSxcLcns7Zh/Z9uxTg3yJ82xsgyvyvQxEJ
 IJ1lTEgcgB/qHRnDvkSfAhZczv3+HCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-5NoNN2_hOv2lPRWOTRjPgw-1; Fri, 09 Oct 2020 12:16:41 -0400
X-MC-Unique: 5NoNN2_hOv2lPRWOTRjPgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5BC3802B75;
 Fri,  9 Oct 2020 16:16:40 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-203.rdu2.redhat.com [10.10.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D228119936;
 Fri,  9 Oct 2020 16:16:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 35/36] qapi/visit.py: remove unused parameters from
 gen_visit_object
Date: Fri,  9 Oct 2020 12:15:57 -0400
Message-Id: <20201009161558.107041-36-jsnow@redhat.com>
In-Reply-To: <20201009161558.107041-1-jsnow@redhat.com>
References: <20201009161558.107041-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And this fixes the pylint report for this file, so make sure we check
this in the future, too.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/qapi/pylintrc | 1 -
 scripts/qapi/visit.py | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index b3c4cf46dbf..b9e077a1642 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -6,7 +6,6 @@ ignore-patterns=error.py,
                 expr.py,
                 parser.py,
                 schema.py,
-                visit.py,
 
 
 [MESSAGES CONTROL]
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index e00f2a09d75..8699e5c09c6 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -250,7 +250,7 @@ def gen_visit_alternate(name, variants):
     return ret
 
 
-def gen_visit_object(name, base, members, variants):
+def gen_visit_object(name):
     return mcgen('''
 
 bool visit_type_%(c_name)s(Visitor *v, const char *name,
@@ -343,7 +343,7 @@ def visit_object_type(self, name, info, ifcond, features,
             if not name.startswith('q_'):
                 # only explicit types need an allocating visit
                 self._genh.add(gen_visit_decl(name))
-                self._genc.add(gen_visit_object(name, base, members, variants))
+                self._genc.add(gen_visit_object(name))
 
     def visit_alternate_type(self, name, info, ifcond, features, variants):
         with ifcontext(ifcond, self._genh, self._genc):
-- 
2.26.2


