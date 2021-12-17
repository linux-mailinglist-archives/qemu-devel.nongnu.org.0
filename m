Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90517478338
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:35:57 +0100 (CET)
Received: from localhost ([::1]:55098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my36C-0001PE-Eh
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:35:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30L-00014b-Dt
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30J-0000ZK-EK
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639708190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQIDG0zwPnY7AxEDzqogKAe/qQiSSgPEp0b879ful3k=;
 b=c7BSYNLOFpYtEbR9QdkkAlzd430bSLGdfgQ30jId++nD7VXEeq+K7j1S69JyLVl2b0LiLO
 IKO06YdhtUwz+86SKSNT2MG6vhD/os58U15hxfqxIrTpYc9/0DtEexIrUtCQRfsFMawTKL
 tELucduxBxgpvtDaxH8bL4aFp8t4qQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-fMsumbaROfmDgrCIneraaQ-1; Thu, 16 Dec 2021 21:29:47 -0500
X-MC-Unique: fMsumbaROfmDgrCIneraaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1588B5F9C5;
 Fri, 17 Dec 2021 02:29:46 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02D2622DF6;
 Fri, 17 Dec 2021 02:29:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/9] scripts/qmp: update remaining forwarder stubs
Date: Thu, 16 Dec 2021 21:29:34 -0500
Message-Id: <20211217022939.279559-5-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The text for each forwarder is largely the same, though the qom-fuse
stub instructs users to install the optional fuse dependency for the
qemu package.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qemu-ga-client | 40 ++++++++++++++++++++++++++++++++-----
 scripts/qmp/qom-fuse       | 40 ++++++++++++++++++++++++++++++++-----
 scripts/qmp/qom-get        | 40 ++++++++++++++++++++++++++++++++-----
 scripts/qmp/qom-list       | 40 ++++++++++++++++++++++++++++++++-----
 scripts/qmp/qom-set        | 40 ++++++++++++++++++++++++++++++++-----
 scripts/qmp/qom-tree       | 41 +++++++++++++++++++++++++++++++++-----
 6 files changed, 211 insertions(+), 30 deletions(-)

diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
index 56edd0234a..f9c4087a56 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/scripts/qmp/qemu-ga-client
@@ -1,11 +1,41 @@
 #!/usr/bin/env python3
 
-import os
 import sys
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.utils import qemu_ga_client
+try:
+    from qemu.utils import qemu_ga_client
+    _HAVE_DEPS = True
+except ModuleNotFoundError:
+    _HAVE_DEPS = False
 
+bold = "\033[1m"
+end = "\033[0m"
+cmd = 'qemu-ga-client'
 
-if __name__ == '__main__':
-    sys.exit(qemu_ga_client.main())
+EMSG = f"""
+{bold}'{sys.argv[0]}' is just a forwarder, and is not necessary.{end}
+
+However, there are missing dependencies to run this script.
+
+To use the '{cmd}' command directly from the installed package,
+install the python package and then add (for a --user install)
+~/.local/bin/ to $PATH if it isn't already. Then, you should have access
+to the '{cmd}' command.
+
+For more information, please see ../../python/README.rst.
+
+maybe:
+ > cd ../../python/
+ > pip3 install --user .
+ > export PATH=$PATH:~/.local/bin/
+ > {cmd} --help
+
+Alternatively, after installing the qemu package, this forwarder
+will work again. However, it will eventually be removed. I apologize for
+the inconvenience!"""
+
+if not _HAVE_DEPS:
+    print(EMSG, file=sys.stderr)
+    sys.exit(1)
+
+sys.exit(qemu_ga_client.main())
diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index d453807b27..e9edf01550 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -1,11 +1,41 @@
 #!/usr/bin/env python3
 
-import os
 import sys
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.utils.qom_fuse import QOMFuse
+try:
+    from qemu.utils.qom_fuse import QOMFuse
+    _HAVE_DEPS = True
+except ModuleNotFoundError:
+    _HAVE_DEPS = False
 
+bold = "\033[1m"
+end = "\033[0m"
+cmd = 'qom-fuse'
 
-if __name__ == '__main__':
-    sys.exit(QOMFuse.entry_point())
+EMSG = f"""
+{bold}'{sys.argv[0]}' is just a forwarder, and is not necessary.{end}
+
+However, there are missing dependencies to run this script.
+
+To use the '{cmd}' command directly from the installed package,
+install the python package and then add (for a --user install)
+~/.local/bin/ to $PATH if it isn't already. Then, you should have access
+to the '{cmd}' command.
+
+For more information, please see ../../python/README.rst.
+
+maybe:
+ > cd ../../python/
+ > pip3 install --user .[fuse]
+ > export PATH=$PATH:~/.local/bin/
+ > {cmd} --help
+
+Alternatively, after installing the qemu[fuse] package, this forwarder
+will work again. However, it will eventually be removed. I apologize for
+the inconvenience!"""
+
+if not _HAVE_DEPS:
+    print(EMSG, file=sys.stderr)
+    sys.exit(1)
+
+sys.exit(QOMFuse.entry_point())
diff --git a/scripts/qmp/qom-get b/scripts/qmp/qom-get
index 04ebe052e8..9fa3e1c270 100755
--- a/scripts/qmp/qom-get
+++ b/scripts/qmp/qom-get
@@ -1,11 +1,41 @@
 #!/usr/bin/env python3
 
-import os
 import sys
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.utils.qom import QOMGet
+try:
+    from qemu.utils.qom import QOMGet
+    _HAVE_DEPS = True
+except ModuleNotFoundError:
+    _HAVE_DEPS = False
 
+bold = "\033[1m"
+end = "\033[0m"
+cmd = 'qom-get'
 
-if __name__ == '__main__':
-    sys.exit(QOMGet.entry_point())
+EMSG = f"""
+{bold}'{sys.argv[0]}' is just a forwarder, and is not necessary.{end}
+
+However, there are missing dependencies to run this script.
+
+To use the '{cmd}' command directly from the installed package,
+install the python package and then add (for a --user install)
+~/.local/bin/ to $PATH if it isn't already. Then, you should have access
+to the '{cmd}' command.
+
+For more information, please see ../../python/README.rst.
+
+maybe:
+ > cd ../../python/
+ > pip3 install --user .
+ > export PATH=$PATH:~/.local/bin/
+ > {cmd} --help
+
+Alternatively, after installing the qemu package, this forwarder
+will work again. However, it will eventually be removed. I apologize for
+the inconvenience!"""
+
+if not _HAVE_DEPS:
+    print(EMSG, file=sys.stderr)
+    sys.exit(1)
+
+sys.exit(QOMGet.entry_point())
diff --git a/scripts/qmp/qom-list b/scripts/qmp/qom-list
index 853b85a8d3..6c6e4074e9 100755
--- a/scripts/qmp/qom-list
+++ b/scripts/qmp/qom-list
@@ -1,11 +1,41 @@
 #!/usr/bin/env python3
 
-import os
 import sys
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.utils.qom import QOMList
+try:
+    from qemu.utils.qom import QOMList
+    _HAVE_DEPS = True
+except ModuleNotFoundError:
+    _HAVE_DEPS = False
 
+bold = "\033[1m"
+end = "\033[0m"
+cmd = 'qom-list'
 
-if __name__ == '__main__':
-    sys.exit(QOMList.entry_point())
+EMSG = f"""
+{bold}'{sys.argv[0]}' is just a forwarder, and is not necessary.{end}
+
+However, there are missing dependencies to run this script.
+
+To use the '{cmd}' command directly from the installed package,
+install the python package and then add (for a --user install)
+~/.local/bin/ to $PATH if it isn't already. Then, you should have access
+to the '{cmd}' command.
+
+For more information, please see ../../python/README.rst.
+
+maybe:
+ > cd ../../python/
+ > pip3 install --user .
+ > export PATH=$PATH:~/.local/bin/
+ > {cmd} --help
+
+Alternatively, after installing the qemu package, this forwarder
+will work again. However, it will eventually be removed. I apologize for
+the inconvenience!"""
+
+if not _HAVE_DEPS:
+    print(EMSG, file=sys.stderr)
+    sys.exit(1)
+
+sys.exit(QOMList.entry_point())
diff --git a/scripts/qmp/qom-set b/scripts/qmp/qom-set
index 06820feec4..bcdee0e2d5 100755
--- a/scripts/qmp/qom-set
+++ b/scripts/qmp/qom-set
@@ -1,11 +1,41 @@
 #!/usr/bin/env python3
 
-import os
 import sys
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.utils.qom import QOMSet
+try:
+    from qemu.utils.qom import QOMSet
+    _HAVE_DEPS = True
+except ModuleNotFoundError:
+    _HAVE_DEPS = False
 
+bold = "\033[1m"
+end = "\033[0m"
+cmd = 'qom-set'
 
-if __name__ == '__main__':
-    sys.exit(QOMSet.entry_point())
+EMSG = f"""
+{bold}'{sys.argv[0]}' is just a forwarder, and is not necessary.{end}
+
+However, there are missing dependencies to run this script.
+
+To use the '{cmd}' command directly from the installed package,
+install the python package and then add (for a --user install)
+~/.local/bin/ to $PATH if it isn't already. Then, you should have access
+to the '{cmd}' command.
+
+For more information, please see ../../python/README.rst.
+
+maybe:
+ > cd ../../python/
+ > pip3 install --user .
+ > export PATH=$PATH:~/.local/bin/
+ > {cmd} --help
+
+Alternatively, after installing the qemu package, this forwarder
+will work again. However, it will eventually be removed. I apologize for
+the inconvenience!"""
+
+if not _HAVE_DEPS:
+    print(EMSG, file=sys.stderr)
+    sys.exit(1)
+
+sys.exit(QOMSet.entry_point())
diff --git a/scripts/qmp/qom-tree b/scripts/qmp/qom-tree
index 760e172277..c9c1247f18 100755
--- a/scripts/qmp/qom-tree
+++ b/scripts/qmp/qom-tree
@@ -1,11 +1,42 @@
 #!/usr/bin/env python3
 
-import os
 import sys
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.utils.qom import QOMTree
+try:
+    from qemu.utils.qom import QOMTree
+    _HAVE_DEPS = True
+except ModuleNotFoundError:
+    _HAVE_DEPS = False
 
+bold = "\033[1m"
+end = "\033[0m"
+cmd = 'qom-tree'
 
-if __name__ == '__main__':
-    sys.exit(QOMTree.entry_point())
+EMSG = f"""
+{bold}'{sys.argv[0]}' is just a forwarder, and is not necessary.{end}
+
+However, there are missing dependencies to run this script.
+
+To use the '{cmd}' command directly from the installed package,
+install the python package and then add (for a --user install)
+~/.local/bin/ to $PATH if it isn't already. Then, you should have access
+to the '{cmd}' command.
+
+For more information, please see ../../python/README.rst.
+
+maybe:
+ > cd ../../python/
+ > pip3 install --user .
+ > export PATH=$PATH:~/.local/bin/
+ > {cmd} --help
+
+Alternatively, after installing the qemu package, this forwarder
+will work again. However, it will eventually be removed. I apologize for
+the inconvenience!"""
+
+if not _HAVE_DEPS:
+    print(EMSG, file=sys.stderr)
+    sys.exit(1)
+
+sys.exit(QOMTree.entry_point())
+k
-- 
2.31.1


