Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF8631FEF4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:48:24 +0100 (CET)
Received: from localhost ([::1]:42892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDApD-0008W0-6K
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lDAnD-00078F-54
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:46:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lDAnB-0007es-Br
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:46:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613760375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70YiwS+Mt/KT4H0sb13wx+Z0CHCB+Frf6Usm84JH6Oc=;
 b=MTIJHvRGcbpSDHgRkNJh+MxLpx5SS4Dtu5LMvd52Z5QgD1GBsj8CAxvC864KhpCkgViK8o
 LcjpSqGNDeC63Uvf+W2lanmSkW/eQEGcgoPAxGjRzY4v9KQBbhsrGxsBvulJrDh6E4zPyR
 a/lcrIgK6fv+oKZzWW4BhZR/9Q01RIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-_cco2SQnOxaBmpDHteINcg-1; Fri, 19 Feb 2021 13:46:13 -0500
X-MC-Unique: _cco2SQnOxaBmpDHteINcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E57CCC291
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 18:46:12 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-33.ams2.redhat.com
 [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EBFB19D9B;
 Fri, 19 Feb 2021 18:46:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] ui: deprecate "password" option for SPICE server
Date: Fri, 19 Feb 2021 18:45:55 +0000
Message-Id: <20210219184556.154972-4-berrange@redhat.com>
In-Reply-To: <20210219184556.154972-1-berrange@redhat.com>
References: <20210219184556.154972-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the new "password-secret" option, there is no reason to use the old
inecure "password" option with -spice, so it can be deprecated.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst | 8 ++++++++
 qemu-options.hx            | 4 ++++
 ui/spice-core.c            | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 2fcac7861e..57ff9f47cc 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -146,6 +146,14 @@ library enabled as a cryptography provider.
 Neither the ``nettle`` library, or the built-in cryptography provider are
 supported on FIPS enabled hosts.
 
+``-spice password=string`` (since 6.0)
+''''''''''''''''''''''''''''''''''''''
+
+This option is insecure because the SPICE password remains visible in
+the process listing. This is replaced by the new ``password-secret``
+option which lets the password be securely provided on the command
+line using a ``secret`` object instance.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/qemu-options.hx b/qemu-options.hx
index ff4ef3b708..4833bd59cf 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1926,6 +1926,10 @@ SRST
     ``password=<string>``
         Set the password you need to authenticate.
 
+        This option is deprecated and insecure because it leaves the
+        password visible in the process listing. Use ``password-secret``
+        instead.
+
     ``password-secret=<secret-id>``
         Set the ID of the ``secret`` object containing the password
         you need to authenticate.
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 353848b244..5e00e31457 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -685,6 +685,10 @@ static void qemu_spice_init(void)
         }
     } else {
         str = qemu_opt_get(opts, "password");
+        if (str) {
+            warn_report("'password' option is deprecated and insecure, "
+                        "use 'password-secret' instead");
+        }
         password = g_strdup(str);
     }
 
-- 
2.29.2


