Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF7F39972D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:46:35 +0200 (CEST)
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobVK-0007xe-JM
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMg-0004e4-Ua
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMf-0004hi-AV
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sr8cqmpnNLswHNJp+/rgvb1zWcAPkMO89Qs97X6XMLU=;
 b=gb0V5offxtmLFRElg7Sdd9ks9mVAm21jaLOEzIBLCX9Chbb22+owkr1pwztvVcp7PJ5bM5
 Pu6QME7OZkCGuxTcCO5ri6NCRu2dzOxMeDYCUU0WvFj+RyqoiXnBiB5stlOndlkrpBqIi7
 GEcNrKJUPrPZ5KPG6XDjVmUWnkcJaRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-x7Qj2u-XMaS8BWSomqM61Q-1; Wed, 02 Jun 2021 20:37:35 -0400
X-MC-Unique: x7Qj2u-XMaS8BWSomqM61Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3210A107ACC7;
 Thu,  3 Jun 2021 00:37:34 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7173310013D6;
 Thu,  3 Jun 2021 00:37:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/19] scripts/qom-fuse: Add docstrings
Date: Wed,  2 Jun 2021 20:37:11 -0400
Message-Id: <20210603003719.1321369-12-jsnow@redhat.com>
In-Reply-To: <20210603003719.1321369-1-jsnow@redhat.com>
References: <20210603003719.1321369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The methods inherited from fuse don't need docstrings; that's up to
fusepy to handle.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-fuse | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 805e99c8ecd..1fb3008a167 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -1,7 +1,19 @@
 #!/usr/bin/env python3
+"""
+QEMU Object Model FUSE filesystem tool
+
+This script offers a simple FUSE filesystem within which the QOM tree
+may be browsed, queried and edited using traditional shell tooling.
+
+This script requires the 'fusepy' python package.
+
+ENV:
+    QMP_SOCKET: Path to the QMP server socket
+
+Usage:
+    qom-fuse /mount/to/here
+"""
 ##
-# QEMU Object Model test tools
-#
 # Copyright IBM, Corp. 2012
 # Copyright (C) 2020 Red Hat, Inc.
 #
@@ -30,6 +42,7 @@ fuse.fuse_python_api = (0, 2)
 
 
 class QOMFS(Operations):
+    """QOMFS implements fuse.Operations to provide a QOM filesystem."""
     def __init__(self, qmp):
         self.qmp = qmp
         self.qmp.connect()
@@ -37,6 +50,7 @@ class QOMFS(Operations):
         self.ino_count = 1
 
     def get_ino(self, path):
+        """Get an inode number for a given QOM path."""
         if path in self.ino_map:
             return self.ino_map[path]
         self.ino_map[path] = self.ino_count
@@ -44,6 +58,7 @@ class QOMFS(Operations):
         return self.ino_map[path]
 
     def is_object(self, path):
+        """Is the given QOM path an object?"""
         try:
             self.qmp.command('qom-list', path=path)
             return True
@@ -51,6 +66,7 @@ class QOMFS(Operations):
             return False
 
     def is_property(self, path):
+        """Is the given QOM path a property?"""
         path, prop = path.rsplit('/', 1)
         if path == '':
             path = '/'
@@ -63,6 +79,7 @@ class QOMFS(Operations):
             return False
 
     def is_link(self, path):
+        """Is the given QOM path a link?"""
         path, prop = path.rsplit('/', 1)
         if path == '':
             path = '/'
-- 
2.31.1


