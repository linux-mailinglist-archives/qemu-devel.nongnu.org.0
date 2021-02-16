Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01E931D0C4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:14:40 +0100 (CET)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5nz-0004XP-Nc
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kF-0002go-5s
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kC-0004PV-RM
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613502644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZcjZNiNBT2OvO6quvRwvgiDPHr3OJE9iZRkvT09iFu0=;
 b=XlwUMEiupHYvuvPkCsdqb4XpRa+EN5+D4Zy2rMbEAdzx6LKgIQsXAZ+vLZFz320xuEaUCr
 kLdH1sk7POtcStbD5coUTVqbGV1/Hnhnz5T7yFYA2Yqu5GzkGDZnqGGdm82PNLvUmWI4Bf
 p6TL5xGjOZeDQKNb//ppYY0yfX5pKWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-3U0JJmzoNFK4bvWA8DzoKA-1; Tue, 16 Feb 2021 14:10:42 -0500
X-MC-Unique: 3U0JJmzoNFK4bvWA8DzoKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 312E7C288;
 Tue, 16 Feb 2021 19:10:41 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77B045C1B4;
 Tue, 16 Feb 2021 19:10:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] qemu-options: update to show preferred boolean syntax
 for -spice
Date: Tue, 16 Feb 2021 19:10:20 +0000
Message-Id: <20210216191027.595031-4-berrange@redhat.com>
In-Reply-To: <20210216191027.595031-1-berrange@redhat.com>
References: <20210216191027.595031-1-berrange@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preferred syntax is to use "foo=on|off", rather than a bare
"foo" or "nofoo".

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 972ef412cc..bdf159c929 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1894,16 +1894,17 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "-spice [port=port][,tls-port=secured-port][,x509-dir=<dir>]\n"
     "       [,x509-key-file=<file>][,x509-key-password=<file>]\n"
     "       [,x509-cert-file=<file>][,x509-cacert-file=<file>]\n"
-    "       [,x509-dh-key-file=<file>][,addr=addr][,ipv4|ipv6|unix]\n"
+    "       [,x509-dh-key-file=<file>][,addr=addr]\n"
+    "       [,ipv4=on|off][,ipv6=on|off][,unix=on|off]\n"
     "       [,tls-ciphers=<list>]\n"
     "       [,tls-channel=[main|display|cursor|inputs|record|playback]]\n"
     "       [,plaintext-channel=[main|display|cursor|inputs|record|playback]]\n"
-    "       [,sasl][,password=<secret>][,disable-ticketing]\n"
+    "       [,sasl=on|off][,password=<secret>][,disable-ticketing=on|off]\n"
     "       [,image-compression=[auto_glz|auto_lz|quic|glz|lz|off]]\n"
     "       [,jpeg-wan-compression=[auto|never|always]]\n"
     "       [,zlib-glz-wan-compression=[auto|never|always]]\n"
-    "       [,streaming-video=[off|all|filter]][,disable-copy-paste]\n"
-    "       [,disable-agent-file-xfer][,agent-mouse=[on|off]]\n"
+    "       [,streaming-video=[off|all|filter]][,disable-copy-paste=on|off]\n"
+    "       [,disable-agent-file-xfer=on|off][,agent-mouse=[on|off]]\n"
     "       [,playback-compression=[on|off]][,seamless-migration=[on|off]]\n"
     "       [,gl=[on|off]][,rendernode=<file>]\n"
     "   enable spice\n"
@@ -1920,13 +1921,13 @@ SRST
         Set the IP address spice is listening on. Default is any
         address.
 
-    ``ipv4``; \ ``ipv6``; \ ``unix``
+    ``ipv4=on|off``; \ ``ipv6=on|off``; \ ``unix=on|off``
         Force using the specified IP version.
 
     ``password=<secret>``
         Set the password you need to authenticate.
 
-    ``sasl``
+    ``sasl=on|off``
         Require that the client use SASL to authenticate with the spice.
         The exact choice of authentication method used is controlled
         from the system / user's SASL configuration file for the 'qemu'
@@ -1940,13 +1941,13 @@ SRST
         data encryption preventing compromise of authentication
         credentials.
 
-    ``disable-ticketing``
+    ``disable-ticketing=on|off``
         Allow client connects without authentication.
 
-    ``disable-copy-paste``
+    ``disable-copy-paste=on|off``
         Disable copy paste between the client and the guest.
 
-    ``disable-agent-file-xfer``
+    ``disable-agent-file-xfer=on|off``
         Disable spice-vdagent based file-xfer between the client and the
         guest.
 
-- 
2.29.2


