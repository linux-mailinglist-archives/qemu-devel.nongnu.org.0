Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D980308BAA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:42:37 +0100 (CET)
Received: from localhost ([::1]:41488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Xn2-0001R1-8D
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XJA-0003Qf-Kf
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XJ8-00075B-Bc
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPtgisoxsfLGdVEc2IMdhTz7S/zJCO018gB3xpDn0CU=;
 b=A/n2jKnk3zfDQQuYFBrzQhxWaObYITwg7Ri5AT88+6c3c5yw8nk7UqpS/gOPhIixB6/EyT
 sa6tGS/vwLGbpKTLKg48nhN+KPOkYvokSCdhymk5sC3XqXBAw2julr+LVVg5IvpoKiGGrG
 N9PQkbmmJpiSDE7M9FWDoBwUrNxDXGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-BlcBcGZOOtS-V6FUU2LWfw-1; Fri, 29 Jan 2021 12:11:38 -0500
X-MC-Unique: BlcBcGZOOtS-V6FUU2LWfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02FCD192D786;
 Fri, 29 Jan 2021 17:11:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08D526294D;
 Fri, 29 Jan 2021 17:11:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] Prefer 'on' | 'off' over 'yes' | 'no' for bool options
Date: Fri, 29 Jan 2021 17:10:55 +0000
Message-Id: <20210129171102.4109641-7-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
References: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update some docs and test cases to use 'on' | 'off' as the preferred
value for bool options.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/vnc-security.rst | 10 +++++-----
 include/authz/listfile.h     |  2 +-
 qemu-options.hx              |  4 ++--
 tests/qemu-iotests/233       |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/system/vnc-security.rst b/docs/system/vnc-security.rst
index 558e4faffc..ebca656d87 100644
--- a/docs/system/vnc-security.rst
+++ b/docs/system/vnc-security.rst
@@ -65,7 +65,7 @@ encrypted session.
 .. parsed-literal::
 
    |qemu_system| [...OPTIONS...] \
-     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=no \
+     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=off \
      -vnc :1,tls-creds=tls0 -monitor stdio
 
 In the above example ``/etc/pki/qemu`` should contain at least three
@@ -84,12 +84,12 @@ connecting. The server will request that the client provide a
 certificate, which it will then validate against the CA certificate.
 This is a good choice if deploying in an environment with a private
 internal certificate authority. It uses the same syntax as previously,
-but with ``verify-peer`` set to ``yes`` instead.
+but with ``verify-peer`` set to ``on`` instead.
 
 .. parsed-literal::
 
    |qemu_system| [...OPTIONS...] \
-     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=yes \
+     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=on \
      -vnc :1,tls-creds=tls0 -monitor stdio
 
 .. _vnc_005fsec_005fcertificate_005fpw:
@@ -103,7 +103,7 @@ authentication to provide two layers of authentication for clients.
 .. parsed-literal::
 
    |qemu_system| [...OPTIONS...] \
-     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=yes \
+     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=on \
      -vnc :1,tls-creds=tls0,password -monitor stdio
    (qemu) change vnc password
    Password: ********
@@ -145,7 +145,7 @@ x509 options:
 .. parsed-literal::
 
    |qemu_system| [...OPTIONS...] \
-     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=yes \
+     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=on \
      -vnc :1,tls-creds=tls0,sasl -monitor stdio
 
 .. _vnc_005fsetup_005fsasl:
diff --git a/include/authz/listfile.h b/include/authz/listfile.h
index 0a1e5bddd3..0b7fe72198 100644
--- a/include/authz/listfile.h
+++ b/include/authz/listfile.h
@@ -73,7 +73,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(QAuthZListFile,
  * The object can be created on the command line using
  *
  *   -object authz-list-file,id=authz0,\
- *           filename=/etc/qemu/myvm-vnc.acl,refresh=yes
+ *           filename=/etc/qemu/myvm-vnc.acl,refresh=on
  *
  */
 struct QAuthZListFile {
diff --git a/qemu-options.hx b/qemu-options.hx
index 9172d51659..d0410f0512 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -5027,7 +5027,7 @@ SRST
         Note the use of quotes due to the x509 distinguished name
         containing whitespace, and escaping of ','.
 
-    ``-object authz-listfile,id=id,filename=path,refresh=yes|no``
+    ``-object authz-listfile,id=id,filename=path,refresh=on|off``
         Create an authorization object that will control access to
         network services.
 
@@ -5072,7 +5072,7 @@ SRST
 
              # |qemu_system| \\
                  ... \\
-                 -object authz-simple,id=auth0,filename=/etc/qemu/vnc-sasl.acl,refresh=yes \\
+                 -object authz-simple,id=auth0,filename=/etc/qemu/vnc-sasl.acl,refresh=on \\
                  ...
 
     ``-object authz-pam,id=id,service=string``
diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index 7ce5764903..da150cd27b 100755
--- a/tests/qemu-iotests/233
+++ b/tests/qemu-iotests/233
@@ -84,7 +84,7 @@ echo
 echo "== check plain client to TLS server fails =="
 
 nbd_server_start_tcp_socket \
-    --object tls-creds-x509,dir=${tls_dir}/server1,endpoint=server,id=tls0,verify-peer=yes \
+    --object tls-creds-x509,dir=${tls_dir}/server1,endpoint=server,id=tls0,verify-peer=on \
     --tls-creds tls0 \
     -f $IMGFMT "$TEST_IMG" 2>> "$TEST_DIR/server.log"
 
@@ -129,7 +129,7 @@ echo "== check TLS with authorization =="
 nbd_server_stop
 
 nbd_server_start_tcp_socket \
-    --object tls-creds-x509,dir=${tls_dir}/server1,endpoint=server,id=tls0,verify-peer=yes \
+    --object tls-creds-x509,dir=${tls_dir}/server1,endpoint=server,id=tls0,verify-peer=on \
     --object "authz-simple,id=authz0,identity=CN=localhost,, \
       O=Cthulu Dark Lord Enterprises client1,,L=R'lyeh,,C=South Pacific" \
     --tls-authz authz0 \
-- 
2.29.2


