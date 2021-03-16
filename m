Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F143033CD6E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 06:41:15 +0100 (CET)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM2SA-0007xh-Uz
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 01:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2PV-0006Cs-Hw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2PS-0004kI-1F
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615873104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnWvRmNfrXErde5y/FWQrJsa3RhhkW7Z5Kme47hvKZk=;
 b=OjYJYPzN6uGLKBO1T6EYW4OTBDqVycNHgzhhwMLFHcvHDhvdvdXCN6XSfePoD/apcBKC03
 xk3FYH+ROQytgmvWVXYJBgXXKt1qg6K/6N963W65QMiRvcZ1CDHrNSEsf/ovs+CbSakCYZ
 Puenv65xWazoEM0c0rwTSyjhwMIxK40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-WqyOsgV4NuOozzu8XDP2Xw-1; Tue, 16 Mar 2021 01:38:22 -0400
X-MC-Unique: WqyOsgV4NuOozzu8XDP2Xw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E21F1084C83;
 Tue, 16 Mar 2021 05:38:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBFC146;
 Tue, 16 Mar 2021 05:38:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3DDFA1800612; Tue, 16 Mar 2021 06:38:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] ui: deprecate "password" option for SPICE server
Date: Tue, 16 Mar 2021 06:38:05 +0100
Message-Id: <20210316053813.1719442-4-kraxel@redhat.com>
In-Reply-To: <20210316053813.1719442-1-kraxel@redhat.com>
References: <20210316053813.1719442-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

With the new "password-secret" option, there is no reason to use the old
inecure "password" option with -spice, so it can be deprecated.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210311114343.439820-4-berrange@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/spice-core.c            | 2 ++
 docs/system/deprecated.rst | 8 ++++++++
 qemu-options.hx            | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/ui/spice-core.c b/ui/spice-core.c
index b9d8aced91df..272d19b0c152 100644
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
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 5e3a31c12361..8cba672a7b4a 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -174,6 +174,14 @@ Input parameters that take a size value should only use a size suffix
 the value is hexadecimal.  That is, '0x20M' is deprecated, and should
 be written either as '32M' or as '0x2000000'.
 
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
index a98f8e84a29d..4da3f4f48c03 100644
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
-- 
2.29.2


