Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB58D4968A1
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:20:36 +0100 (CET)
Received: from localhost ([::1]:47672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB48x-0006QQ-VJ
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:20:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3ym-0000p5-PQ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:10:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yk-0005DE-UC
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642810202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SshM71Jpklre0pXZ2WkAr73ZmOyW4L9PGg1YM2fydoU=;
 b=ABzwtz0VcdTjyELOvps9BuoD3K+R2vVCn4i2CGRjAlUBLci8u4MafxgTUwmVrWDj1hRQMu
 RGVTBKbYyFiUXTVoz4Ii2/IrVtOiow0oNpDNdlfhZF2VyzuKr2fy9YJh0r3ejZtu1Qj3kS
 vPu3jOlN7xsfZpzGameLPGVAEQS9v0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-PAjm4lDmOEKwsZTxqR9MzA-1; Fri, 21 Jan 2022 19:09:59 -0500
X-MC-Unique: PAjm4lDmOEKwsZTxqR9MzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B28C814245;
 Sat, 22 Jan 2022 00:09:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 335C766E1B;
 Sat, 22 Jan 2022 00:09:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/17] python: move qmp-shell under the AQMP package
Date: Fri, 21 Jan 2022 19:09:28 -0500
Message-Id: <20220122000931.536322-15-jsnow@redhat.com>
In-Reply-To: <20220122000931.536322-1-jsnow@redhat.com>
References: <20220122000931.536322-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 python/README.rst                      | 2 +-
 python/qemu/{qmp => aqmp}/qmp_shell.py | 0
 python/setup.cfg                       | 2 +-
 scripts/qmp/qmp-shell                  | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename python/qemu/{qmp => aqmp}/qmp_shell.py (100%)

diff --git a/python/README.rst b/python/README.rst
index 9c1fceaee7..fcf74f69ea 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -59,7 +59,7 @@ Package installation also normally provides executable console scripts,
 so that tools like ``qmp-shell`` are always available via $PATH. To
 invoke them without installation, you can invoke e.g.:
 
-``> PYTHONPATH=~/src/qemu/python python3 -m qemu.qmp.qmp_shell``
+``> PYTHONPATH=~/src/qemu/python python3 -m qemu.aqmp.qmp_shell``
 
 The mappings between console script name and python module path can be
 found in ``setup.cfg``.
diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
similarity index 100%
rename from python/qemu/qmp/qmp_shell.py
rename to python/qemu/aqmp/qmp_shell.py
diff --git a/python/setup.cfg b/python/setup.cfg
index 04a41ef1a0..3fb18f845d 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -67,7 +67,7 @@ console_scripts =
     qom-tree = qemu.utils.qom:QOMTree.entry_point
     qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
     qemu-ga-client = qemu.utils.qemu_ga_client:main
-    qmp-shell = qemu.qmp.qmp_shell:main
+    qmp-shell = qemu.aqmp.qmp_shell:main
     aqmp-tui = qemu.aqmp.aqmp_tui:main [tui]
 
 [flake8]
diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 4a20f97db7..31b19d73e2 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import qmp_shell
+from qemu.aqmp import qmp_shell
 
 
 if __name__ == '__main__':
-- 
2.31.1


