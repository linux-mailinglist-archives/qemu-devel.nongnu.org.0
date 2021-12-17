Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA7E47833A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:37:18 +0100 (CET)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my37V-0002yE-LF
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30O-00015N-8f
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30M-0000aA-D5
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639708193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnsxWxxsm8g50z6xf9ZVC3a3HJd7fXJYBrbq4puQtfg=;
 b=SaLKC1tVsYfncjS+xQH3GydAcXHR5B8O/DPRFB9Ora/xv3zD+qxvCwjaodrfKVJ0EbxljS
 /Sxoqiz0MLKqNkoSzZqxHv9eJzyKHmEgi1McRJ16ZQ+2+NGIbQ4QfmqyHkYnZKat6thuLf
 BDXPWQJ2mEpAQnb6goFsJUuNFX5RNrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-gjxzUAt5M9uaSXNWixk20g-1; Thu, 16 Dec 2021 21:29:46 -0500
X-MC-Unique: gjxzUAt5M9uaSXNWixk20g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE98E1808324;
 Fri, 17 Dec 2021 02:29:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDBB722DF5;
 Fri, 17 Dec 2021 02:29:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/9] scripts/qmp: Update 'qmp-shell' forwarder stub
Date: Thu, 16 Dec 2021 21:29:33 -0500
Message-Id: <20211217022939.279559-4-jsnow@redhat.com>
In-Reply-To: <20211217022939.279559-1-jsnow@redhat.com>
References: <20211217022939.279559-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The text here is slightly different than the text in other forwarder
stubs in this directory, because the only dependency needed here is
outside of the QEMU source tree entirely.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 4a20f97db7..1d30425547 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -1,11 +1,40 @@
 #!/usr/bin/env python3
 
-import os
 import sys
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import qmp_shell
+try:
+    from qemu.qmp import qmp_shell
+    _HAVE_QMP = True
+except ModuleNotFoundError:
+    _HAVE_QMP = False
 
+bold = "\033[1m"
+end = "\033[0m"
+cmd = 'qmp-shell'
 
-if __name__ == '__main__':
-    qmp_shell.main()
+EMSG = f"""
+{bold}'{sys.argv[0]}' is just a forwarder, and is not necessary.{end}
+
+However, the 'qemu.qmp' package is not installed.
+
+To use the '{cmd}' command directly from the installed package,
+install the python package and then add (for a --user install)
+~/.local/bin/ to $PATH if it isn't already. Then, you should have access
+to the '{cmd}' command.
+
+For more information, please see ../../python/README.rst.
+
+maybe:
+ > pip3 install --user qemu.qmp
+ > export PATH=$PATH:~/.local/bin/
+ > {cmd} --help
+
+Alternatively, after installing the qemu.qmp package, this forwarder
+will work again. However, it will eventually be removed. I apologize for
+the inconvenience!"""
+
+if not _HAVE_QMP:
+    print(EMSG, file=sys.stderr)
+    sys.exit(1)
+
+qmp_shell.main()
-- 
2.31.1


