Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB405284083
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 22:17:41 +0200 (CEST)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPWvU-0000N7-Ro
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 16:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWXh-0001hr-Lu
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:53:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWXf-0007Et-TN
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601927583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YDriVdbivoRMldDSaG/BJGjcmQgN9RnxVCGq0lWZb1s=;
 b=PKtiFF8ACZQAKRjHHES6sVDWy7NqDDC5AvIGZOU7Kmm0yA2gSjXVPs9wEKbteR+UCb9H2R
 z94YCOi8KjFFFufCaLx5e30g0yQqL+Jvq0K5XpU+cTDBGqHjKBTxDRnab5z4eDF/LKAqHN
 TesXlsipkD7YuPcHEUuzUWVc/a+jh6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-ec29VBr4PNSOryi4ywIUMg-1; Mon, 05 Oct 2020 15:53:00 -0400
X-MC-Unique: ec29VBr4PNSOryi4ywIUMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7389B1018F60
 for <qemu-devel@nongnu.org>; Mon,  5 Oct 2020 19:52:59 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 449215C1C4;
 Mon,  5 Oct 2020 19:52:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 35/36] qapi/visit.py: remove unused parameters from
 gen_visit_object
Date: Mon,  5 Oct 2020 15:51:57 -0400
Message-Id: <20201005195158.2348217-36-jsnow@redhat.com>
In-Reply-To: <20201005195158.2348217-1-jsnow@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And this fixes the pylint report for this file, so make sure we check
this in the future, too.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
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
index 4f11fd325b8..e54694e23db 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -250,7 +250,7 @@ def gen_visit_alternate(name, variants):
     return ret
 
 
-def gen_visit_object(name, base, members, variants):
+def gen_visit_object(name):
     return mcgen('''
 
 bool visit_type_%(c_name)s
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


