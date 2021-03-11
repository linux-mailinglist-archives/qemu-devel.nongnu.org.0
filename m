Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D583371AA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:48:43 +0100 (CET)
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJo2-0001xr-Ez
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJjX-0005uF-II
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJjV-000051-T2
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615463041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPKVZUDm59nOyHgfstHTf3KS/nqwcbJYL53kaAQc4mk=;
 b=GsseswmtjncKMComxh2jfTGn5EvuROFSzEqOP8Gpu4UgHgdPMPc5AsT8dYtSRnIF8y1liA
 rVpwgjrGznrMmJ3QNb8Zwg69kcgb5NhtqaSMIbiMhLa5KduBwhVd/N51pFxGbd4y3EosUP
 sbjx9diV/UVJhqeJegJlEp3wnTfrgfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-bmoL8NprO6O2qd_oYc8tig-1; Thu, 11 Mar 2021 06:43:59 -0500
X-MC-Unique: bmoL8NprO6O2qd_oYc8tig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 913F08030DB
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:43:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-85.ams2.redhat.com
 [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E26D360875;
 Thu, 11 Mar 2021 11:43:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] ui: deprecate "password" option for SPICE server
Date: Thu, 11 Mar 2021 11:43:43 +0000
Message-Id: <20210311114343.439820-4-berrange@redhat.com>
In-Reply-To: <20210311114343.439820-1-berrange@redhat.com>
References: <20210311114343.439820-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the new "password-secret" option, there is no reason to use the old
inecure "password" option with -spice, so it can be deprecated.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst | 8 ++++++++
 qemu-options.hx            | 4 ++++
 ui/spice-core.c            | 2 ++
 3 files changed, 14 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 241b28a521..e742c8d311 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -166,6 +166,14 @@ Using ``-M kernel-irqchip=off`` with x86 machine types that include a local
 APIC is deprecated.  The ``split`` setting is supported, as is using
 ``-M kernel-irqchip=off`` with the ISA PC machine type.
 
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
index 77bb834e37..48382a8a2a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1928,6 +1928,10 @@ SRST
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
index 7f0e005ca9..235d61f0c1 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -686,6 +686,8 @@ static void qemu_spice_init(void)
     } else {
         str = qemu_opt_get(opts, "password");
         if (str) {
+            warn_report("'password' option is deprecated and insecure, "
+                        "use 'password-secret' instead");
             password = g_strdup(str);
         }
     }
-- 
2.29.2


