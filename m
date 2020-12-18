Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB6B2DE277
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:13:06 +0100 (CET)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEd7-0003Tv-7X
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEb4-0001dx-Qp
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:10:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEb1-0001bL-LQ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m7YjE6Nqq0vyEEWPBLNf1cU5hU8TszmJo3sETgWuWbI=;
 b=jNdJTywmwzSUJxfQefP89dpdscis2JiSPvwOrpePaicQ4QtSkR7XVFWIdipF3yvH6WC1hW
 pcGWJyMjIyKWmkOnYATsyKK5PsIt9HoL14FKRcyMRcEVPpW8X63+y18il6Vo6FiVLeGCCU
 NbCaf0Y5l2LAofSak4waPkg7a870rFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-0DXF6W5dODeGA4WLq0xYLg-1; Fri, 18 Dec 2020 07:10:53 -0500
X-MC-Unique: 0DXF6W5dODeGA4WLq0xYLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9EC18049C3;
 Fri, 18 Dec 2020 12:10:51 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1B3E60C47;
 Fri, 18 Dec 2020 12:10:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/17] docs: generate qemu-storage-daemon-qmp-ref(7) man page
Date: Fri, 18 Dec 2020 13:10:28 +0100
Message-Id: <20201218121041.299788-5-kwolf@redhat.com>
In-Reply-To: <20201218121041.299788-1-kwolf@redhat.com>
References: <20201218121041.299788-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Although individual qemu-storage-daemon QMP commands are identical to
QEMU QMP commands, qemu-storage-daemon only supports a subset of QEMU's
QMP commands. Generate a manual page of just the commands supported by
qemu-storage-daemon so that users know exactly what is available in
qemu-storage-daemon.

Add an h1 heading in storage-daemon/qapi/qapi-schema.json so that
block-core.json is at the h2 heading level.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201209103802.350848-2-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/interop/conf.py                         |  2 ++
 docs/interop/index.rst                       |  1 +
 docs/interop/qemu-storage-daemon-qmp-ref.rst | 13 +++++++++++++
 docs/meson.build                             |  1 +
 storage-daemon/qapi/qapi-schema.json         |  3 +++
 5 files changed, 20 insertions(+)
 create mode 100644 docs/interop/qemu-storage-daemon-qmp-ref.rst

diff --git a/docs/interop/conf.py b/docs/interop/conf.py
index 2634ca3410..f4370aaa13 100644
--- a/docs/interop/conf.py
+++ b/docs/interop/conf.py
@@ -23,4 +23,6 @@ man_pages = [
      [], 7),
     ('qemu-qmp-ref', 'qemu-qmp-ref', 'QEMU QMP Reference Manual',
      [], 7),
+    ('qemu-storage-daemon-qmp-ref', 'qemu-storage-daemon-qmp-ref',
+     'QEMU Storage Daemon QMP Reference Manual', [], 7),
 ]
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index cd78d679d8..95d56495f6 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -20,6 +20,7 @@ Contents:
    qemu-ga
    qemu-ga-ref
    qemu-qmp-ref
+   qemu-storage-daemon-qmp-ref
    vhost-user
    vhost-user-gpu
    vhost-vdpa
diff --git a/docs/interop/qemu-storage-daemon-qmp-ref.rst b/docs/interop/qemu-storage-daemon-qmp-ref.rst
new file mode 100644
index 0000000000..caf9dad23a
--- /dev/null
+++ b/docs/interop/qemu-storage-daemon-qmp-ref.rst
@@ -0,0 +1,13 @@
+QEMU Storage Daemon QMP Reference Manual
+========================================
+
+..
+   TODO: the old Texinfo manual used to note that this manual
+   is GPL-v2-or-later. We should make that reader-visible
+   both here and in our Sphinx manuals more generally.
+
+..
+   TODO: display the QEMU version, both here and in our Sphinx manuals
+   more generally.
+
+.. qapi-doc:: storage-daemon/qapi/qapi-schema.json
diff --git a/docs/meson.build b/docs/meson.build
index bb8fe4c9e4..71641b4fe0 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -56,6 +56,7 @@ if build_docs
         'qemu-ga.8': (have_tools ? 'man8' : ''),
         'qemu-ga-ref.7': 'man7',
         'qemu-qmp-ref.7': 'man7',
+        'qemu-storage-daemon-qmp-ref.7': (have_tools ? 'man7' : ''),
     },
     'tools': {
         'qemu-img.1': (have_tools ? 'man1' : ''),
diff --git a/storage-daemon/qapi/qapi-schema.json b/storage-daemon/qapi/qapi-schema.json
index c6ad5ae1e3..28117c3aac 100644
--- a/storage-daemon/qapi/qapi-schema.json
+++ b/storage-daemon/qapi/qapi-schema.json
@@ -15,6 +15,9 @@
 
 { 'include': '../../qapi/pragma.json' }
 
+##
+# = Block devices
+##
 { 'include': '../../qapi/block-core.json' }
 { 'include': '../../qapi/block-export.json' }
 { 'include': '../../qapi/char.json' }
-- 
2.29.2


