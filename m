Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B386283FF3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 21:59:05 +0200 (CEST)
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPWdU-0000KS-8n
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 15:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWWm-00085c-SN
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWWk-00075S-5O
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601927525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=joEwYvZXqHddGSMyTfIajUr87bTrmv/TWHAqflVz3w4=;
 b=Bci+aHz+dLni8kgauUtXDP6yf8P227NKP869m98aIWK7kzPb9swpmjFA2UeiroSvvkwsRM
 bpdINg96W/LQZ2SdQRDnWAkWtU6JGc6Pt1m7oyrMe6fkwnXWFqlyolZhVvum2gIjT7aCqh
 dI61wzzeKXjfOmfXa+GT8BwCtcwkE3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-QiDvIg-yMWOphBwwhLK-KQ-1; Mon, 05 Oct 2020 15:52:01 -0400
X-MC-Unique: QiDvIg-yMWOphBwwhLK-KQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5523873084
 for <qemu-devel@nongnu.org>; Mon,  5 Oct 2020 19:52:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A1025C1BD;
 Mon,  5 Oct 2020 19:52:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/36] qapi: modify docstrings to be sphinx-compatible
Date: Mon,  5 Oct 2020 15:51:24 -0400
Message-Id: <20201005195158.2348217-3-jsnow@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A precise style guide and a package-wide overhaul is forthcoming pending
further discussion and consensus. At present, we are avoiding obvious
errors that cause sphinx documentation build problems.

A preliminary style guide is loosely based on PEP 257 and Sphinx
Autodoc. It is chosen for interoperability with our existing Sphinx
framework, and because it has loose recognition in the Pycharm IDE.

- Use Triple-double quotes (""").
- Opening and closing quotes appear on their own lines for multi-line docs.
- A single-sentence summary should be the first line of the docstring.
- A blank line follows.
- Further prose, if needed, is written next and can be multiple paragraphs,
  contain RST markup, etc.
- The :param x: desc, :returns: desc, and :raises z: desc info fields follow.
- Additional examples, diagrams, or other metadata follows below.

See also:

https://www.python.org/dev/peps/pep-0257/
https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#info-field-lists
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py    | 6 ++++--
 scripts/qapi/parser.py | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

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
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 9d1a3e2eea9..31bc2e6dca9 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -381,6 +381,7 @@ def append(self, line):
 
         The way that the line is dealt with depends on which part of
         the documentation we're parsing right now:
+
         * The body section: ._append_line is ._append_body_line
         * An argument section: ._append_line is ._append_args_line
         * A features section: ._append_line is ._append_features_line
-- 
2.26.2


