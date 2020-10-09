Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D0288EE1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 18:29:55 +0200 (CEST)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvHG-00045V-Ne
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 12:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv42-0003o0-FP
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv40-0003EM-Jp
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602260168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ksAvwBgTkP36TK2l/cDDZbXxzNHg6nzwET102AvLoQY=;
 b=akcaVvdqWOWOYqKgEKZ9z5MuC+6v5sf2ux1oJ6/ljaPzCjhhtkNK3yuPh0ZI3RLQ9hwlfE
 RCSB26zwUFCHtc3+UN8/0Tdt/iHG0Ho71hDyuNSiVoq7CrXhwXTvwucwKXrf0gflQ7nONO
 klv6g/4hgZbJf1PzBk2QOFTlHxsUWJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-JGXXNCjUP3--7hoXXaxryQ-1; Fri, 09 Oct 2020 12:16:05 -0400
X-MC-Unique: JGXXNCjUP3--7hoXXaxryQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D49381019627;
 Fri,  9 Oct 2020 16:16:04 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-203.rdu2.redhat.com [10.10.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B249638A;
 Fri,  9 Oct 2020 16:16:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/36] qapi: modify docstrings to be sphinx-compatible
Date: Fri,  9 Oct 2020 12:15:24 -0400
Message-Id: <20201009161558.107041-3-jsnow@redhat.com>
In-Reply-To: <20201009161558.107041-1-jsnow@redhat.com>
References: <20201009161558.107041-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A precise style guide and a package-wide overhaul is forthcoming pending
further discussion and consensus. For now, merely avoid obvious errors
that cause Sphinx documentation build problems, using a style loosely
based on PEP 257 and Sphinx Autodoc. It is chosen for interoperability
with our existing Sphinx framework, and because it has loose recognition
in the Pycharm IDE.

See also:

https://www.python.org/dev/peps/pep-0257/
https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#info-field-lists
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index ca66c82b5b8..dc7b94aa115 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -154,9 +154,11 @@ def _bottom(self):
 
 @contextmanager
 def ifcontext(ifcond, *args):
-    """A 'with' statement context manager to wrap with start_if()/end_if()
+    """
+    A with-statement context manager that wraps with `start_if()` / `end_if()`.
 
-    *args: any number of QAPIGenCCode
+    :param ifcond: A list of conditionals, passed to `start_if()`.
+    :param args: any number of `QAPIGenCCode`.
 
     Example::
 
-- 
2.26.2


