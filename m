Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4223AD61B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:44:47 +0200 (CEST)
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luOAI-000797-R9
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZL-0000Po-Qi
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZB-0006pb-7T
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZb/C1BuL4NVC1HaC9w/1XVgEkkDUiTGKaqq75cJxR0=;
 b=Zqe1E+9Ewbz88FVbvNKid0iy3SnW0ZSaeOGGkKUeKpJLHQDTzxj01S8s1w74cupl1OwR1D
 oDmqcM3bgkVEZ1yFy8GaZUFAv1hFDESCwX3UcdPVwAaKUrAA5Y0d+rGizgl9VGac5IXdD6
 pn9BG8GNZqebB+d8cufrpD3Yo6wBhGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-QsHC1ETJME-atDbyDPXXxg-1; Fri, 18 Jun 2021 19:06:22 -0400
X-MC-Unique: QsHC1ETJME-atDbyDPXXxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6BDD1F759;
 Fri, 18 Jun 2021 23:06:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 200B41017CE5;
 Fri, 18 Jun 2021 23:06:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 66/72] scripts/qmp-shell: convert usage comment to docstring
Date: Fri, 18 Jun 2021 19:04:49 -0400
Message-Id: <20210618230455.2891199-67-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The nice usage comment should be a docstring instead of a comment, so
that it's visible from other python tooling.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-37-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 128 ++++++++++++++++++++++++------------------
 1 file changed, 72 insertions(+), 56 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 8d5845ab48..82fe16cff8 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -1,7 +1,5 @@
 #!/usr/bin/env python3
 #
-# Low-level QEMU shell on top of QMP.
-#
 # Copyright (C) 2009, 2010 Red Hat Inc.
 #
 # Authors:
@@ -10,60 +8,78 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 #
-# Usage:
-#
-# Start QEMU with:
-#
-# # qemu [...] -qmp unix:./qmp-sock,server
-#
-# Run the shell:
-#
-# $ qmp-shell ./qmp-sock
-#
-# Commands have the following format:
-#
-#    < command-name > [ arg-name1=arg1 ] ... [ arg-nameN=argN ]
-#
-# For example:
-#
-# (QEMU) device_add driver=e1000 id=net1
-# {u'return': {}}
-# (QEMU)
-#
-# key=value pairs also support Python or JSON object literal subset notations,
-# without spaces. Dictionaries/objects {} are supported as are arrays [].
-#
-#    example-command arg-name1={'key':'value','obj'={'prop':"value"}}
-#
-# Both JSON and Python formatting should work, including both styles of
-# string literal quotes. Both paradigms of literal values should work,
-# including null/true/false for JSON and None/True/False for Python.
-#
-#
-# Transactions have the following multi-line format:
-#
-#    transaction(
-#    action-name1 [ arg-name1=arg1 ] ... [arg-nameN=argN ]
-#    ...
-#    action-nameN [ arg-name1=arg1 ] ... [arg-nameN=argN ]
-#    )
-#
-# One line transactions are also supported:
-#
-#    transaction( action-name1 ... )
-#
-# For example:
-#
-#     (QEMU) transaction(
-#     TRANS> block-dirty-bitmap-add node=drive0 name=bitmap1
-#     TRANS> block-dirty-bitmap-clear node=drive0 name=bitmap0
-#     TRANS> )
-#     {"return": {}}
-#     (QEMU)
-#
-# Use the -v and -p options to activate the verbose and pretty-print options,
-# which will echo back the properly formatted JSON-compliant QMP that is being
-# sent to QEMU, which is useful for debugging and documentation generation.
+
+"""
+Low-level QEMU shell on top of QMP.
+
+usage: qmp-shell [-h] [-H] [-N] [-v] [-p] qmp_server
+
+positional arguments:
+  qmp_server            < UNIX socket path | TCP address:port >
+
+optional arguments:
+  -h, --help            show this help message and exit
+  -H, --hmp             Use HMP interface
+  -N, --skip-negotiation
+                        Skip negotiate (for qemu-ga)
+  -v, --verbose         Verbose (echo commands sent and received)
+  -p, --pretty          Pretty-print JSON
+
+
+Start QEMU with:
+
+# qemu [...] -qmp unix:./qmp-sock,server
+
+Run the shell:
+
+$ qmp-shell ./qmp-sock
+
+Commands have the following format:
+
+   < command-name > [ arg-name1=arg1 ] ... [ arg-nameN=argN ]
+
+For example:
+
+(QEMU) device_add driver=e1000 id=net1
+{'return': {}}
+(QEMU)
+
+key=value pairs also support Python or JSON object literal subset notations,
+without spaces. Dictionaries/objects {} are supported as are arrays [].
+
+   example-command arg-name1={'key':'value','obj'={'prop':"value"}}
+
+Both JSON and Python formatting should work, including both styles of
+string literal quotes. Both paradigms of literal values should work,
+including null/true/false for JSON and None/True/False for Python.
+
+
+Transactions have the following multi-line format:
+
+   transaction(
+   action-name1 [ arg-name1=arg1 ] ... [arg-nameN=argN ]
+   ...
+   action-nameN [ arg-name1=arg1 ] ... [arg-nameN=argN ]
+   )
+
+One line transactions are also supported:
+
+   transaction( action-name1 ... )
+
+For example:
+
+    (QEMU) transaction(
+    TRANS> block-dirty-bitmap-add node=drive0 name=bitmap1
+    TRANS> block-dirty-bitmap-clear node=drive0 name=bitmap0
+    TRANS> )
+    {"return": {}}
+    (QEMU)
+
+Use the -v and -p options to activate the verbose and pretty-print options,
+which will echo back the properly formatted JSON-compliant QMP that is being
+sent to QEMU, which is useful for debugging and documentation generation.
+"""
+
 import argparse
 import ast
 import json
-- 
2.31.1


