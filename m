Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351E380F18
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:37:24 +0200 (CEST)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbkZ-0003Vs-KC
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhbei-0002vG-B4
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:31:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhbeg-0007ek-Jb
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621013478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0AqscuC0sCHNdnaq7GsvzkwtZ9TuDvo49dEJAQy1xE=;
 b=Jn8z4hFUxc9i8QnFuwRZrZNzKrNjhkOvd/ExWnL7tL4jf9JmtmqQQBivkZUlk1pksCugmg
 gCEkF82/veJcyk6jX2qLUw3oI4EZWuWB+XjzMYlfwzx8lQO29b7jrrgv+WaUhpuFyW8aYQ
 Gs3262/gof/EddYPxQlqdCf0elHS10k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-lrImU6OTM3mJXhWmfqg0dw-1; Fri, 14 May 2021 13:31:16 -0400
X-MC-Unique: lrImU6OTM3mJXhWmfqg0dw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E17118BA280
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 17:31:15 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACAF45C1C4;
 Fri, 14 May 2021 17:31:14 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] docs: recommend SCRAM-SHA-256 SASL mech instead of SHA-1
 variant
Date: Fri, 14 May 2021 18:31:09 +0100
Message-Id: <20210514173110.1397741-4-berrange@redhat.com>
In-Reply-To: <20210514173110.1397741-1-berrange@redhat.com>
References: <20210514173110.1397741-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SHA-256 variant better meats modern security expectations.
Also warn that the password file is storing entries in clear
text.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/vnc-security.rst |  7 ++++---
 qemu.sasl                    | 11 ++++++-----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/docs/system/vnc-security.rst b/docs/system/vnc-security.rst
index 830f6acc73..4c1769eeb8 100644
--- a/docs/system/vnc-security.rst
+++ b/docs/system/vnc-security.rst
@@ -168,7 +168,7 @@ used is drastically reduced. In fact only the GSSAPI SASL mechanism
 provides an acceptable level of security by modern standards. Previous
 versions of QEMU referred to the DIGEST-MD5 mechanism, however, it has
 multiple serious flaws described in detail in RFC 6331 and thus should
-never be used any more. The SCRAM-SHA-1 mechanism provides a simple
+never be used any more. The SCRAM-SHA-256 mechanism provides a simple
 username/password auth facility similar to DIGEST-MD5, but does not
 support session encryption, so can only be used in combination with TLS.
 
@@ -191,11 +191,12 @@ reasonable configuration is
 
 ::
 
-   mech_list: scram-sha-1
+   mech_list: scram-sha-256
    sasldb_path: /etc/qemu/passwd.db
 
 The ``saslpasswd2`` program can be used to populate the ``passwd.db``
-file with accounts.
+file with accounts. Note that the ``passwd.db`` file stores passwords
+in clear text.
 
 Other SASL configurations will be left as an exercise for the reader.
 Note that all mechanisms, except GSSAPI, should be combined with use of
diff --git a/qemu.sasl b/qemu.sasl
index fb8a92ba58..abdfc686be 100644
--- a/qemu.sasl
+++ b/qemu.sasl
@@ -19,15 +19,15 @@ mech_list: gssapi
 
 # If using TLS with VNC, or a UNIX socket only, it is possible to
 # enable plugins which don't provide session encryption. The
-# 'scram-sha-1' plugin allows plain username/password authentication
+# 'scram-sha-256' plugin allows plain username/password authentication
 # to be performed
 #
-#mech_list: scram-sha-1
+#mech_list: scram-sha-256
 
 # You can also list many mechanisms at once, and the VNC server will
 # negotiate which to use by considering the list enabled on the VNC
 # client.
-#mech_list: scram-sha-1 gssapi
+#mech_list: scram-sha-256 gssapi
 
 # Some older builds of MIT kerberos on Linux ignore this option &
 # instead need KRB5_KTNAME env var.
@@ -38,7 +38,8 @@ mech_list: gssapi
 # mechanism this can be commented out.
 keytab: /etc/qemu/krb5.tab
 
-# If using scram-sha-1 for username/passwds, then this is the file
+# If using scram-sha-256 for username/passwds, then this is the file
 # containing the passwds. Use 'saslpasswd2 -a qemu [username]'
-# to add entries, and 'sasldblistusers2 -f [sasldb_path]' to browse it
+# to add entries, and 'sasldblistusers2 -f [sasldb_path]' to browse it.
+# Note that this file stores passwords in clear text.
 #sasldb_path: /etc/qemu/passwd.db
-- 
2.31.1


