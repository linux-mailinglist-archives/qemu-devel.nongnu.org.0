Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D2E27DF86
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 06:34:21 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNToq-0001ot-N0
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 00:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTmk-0008TJ-Q8
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTmj-0000Vo-1S
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:10 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601440328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwUoWUmRacLg2zG5qLUKkAetcFwgJmdQOVGwiC+iwD8=;
 b=gTkTS6sRU/TheXaB7LUKX5kW63r6SP1B5GXTVpeZak7Ker5+Vz+ijJuZtpKqpK5Qe5rFgN
 L+yntzv02Ax+E5eIaT7Udu2qV3kITsIzn8nDtbZVVdtUodJ5KPECdNMvcqgUeyi6XYbMVN
 XI99Tl9Iw2rMKXClZUYVx+k7kJP2iyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-iCWyBGcpObyblmV48izxgw-1; Wed, 30 Sep 2020 00:32:01 -0400
X-MC-Unique: iCWyBGcpObyblmV48izxgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87FDB1DE06;
 Wed, 30 Sep 2020 04:32:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B4307BE42;
 Wed, 30 Sep 2020 04:31:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/46] qapi: modify docstrings to be sphinx-compatible
Date: Wed, 30 Sep 2020 00:31:08 -0400
Message-Id: <20200930043150.1454766-5-jsnow@redhat.com>
In-Reply-To: <20200930043150.1454766-1-jsnow@redhat.com>
References: <20200930043150.1454766-1-jsnow@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I did not say "sphinx beautiful", just "sphinx compatible". They will
not throw errors when parsed and interpreted as ReST.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py    | 6 ++++--
 scripts/qapi/parser.py | 9 +++++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index ca66c82b5b8..fc19b2aeb9b 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -154,9 +154,11 @@ def _bottom(self):
 
 @contextmanager
 def ifcontext(ifcond, *args):
-    """A 'with' statement context manager to wrap with start_if()/end_if()
+    """
+    A 'with' statement context manager that wraps with `start_if` and `end_if`.
 
-    *args: any number of QAPIGenCCode
+    :param ifcond: List of conditionals
+    :param args: any number of `QAPIGenCCode`.
 
     Example::
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 9d1a3e2eea9..02983979965 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -381,10 +381,11 @@ def append(self, line):
 
         The way that the line is dealt with depends on which part of
         the documentation we're parsing right now:
-        * The body section: ._append_line is ._append_body_line
-        * An argument section: ._append_line is ._append_args_line
-        * A features section: ._append_line is ._append_features_line
-        * An additional section: ._append_line is ._append_various_line
+
+         * The body section: ._append_line is ._append_body_line
+         * An argument section: ._append_line is ._append_args_line
+         * A features section: ._append_line is ._append_features_line
+         * An additional section: ._append_line is ._append_various_line
         """
         line = line[1:]
         if not line:
-- 
2.26.2


