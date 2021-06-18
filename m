Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295C3AD5AA
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:11:48 +0200 (CEST)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNeN-0004Ta-Bb
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY7-0006rJ-Uz
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY2-00068I-JF
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Fd02lWW+xoCElybk9WGOMwGulh6FtsHQa7g39lmxjA=;
 b=Jlv/INAMRPoWEkisi1GW/1npqgl9zNFecwrQlmLtFozbLuvY2hkXmEnAKv7GFJFh4DLBHN
 ikkOH0GaYlYKSJyEv1Lv7FEV61gu+6qBcrSLiXxyEAiJvZpw4QACMo+jsOT04dzR5g1MHY
 vck8z7uO4wgVWEX0VYsnz7NZkG5NzUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-HXMhuMgAPkGWzJtKFRf_5w-1; Fri, 18 Jun 2021 19:05:12 -0400
X-MC-Unique: HXMhuMgAPkGWzJtKFRf_5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C012100C664;
 Fri, 18 Jun 2021 23:05:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A28F2101E249;
 Fri, 18 Jun 2021 23:05:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/72] scripts/qom-fuse: Add docstrings
Date: Fri, 18 Jun 2021 19:03:54 -0400
Message-Id: <20210618230455.2891199-12-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

The methods inherited from fuse don't need docstrings; that's up to
fusepy to handle.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210603003719.1321369-12-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-fuse | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 805e99c8ec..1fb3008a16 100755
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


