Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10FA31D0E5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:23:12 +0100 (CET)
Received: from localhost ([::1]:57454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5wF-0003Gx-LZ
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kL-0002oH-Uq
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kH-0004QB-JN
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613502649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZPTmJ8LNbLOv9fwAIwYBhRAogi9qA1B6gydG57uNUo=;
 b=WDHkf0P4f2QEUYavlbGlG3GmqKa3QqvUBv/G2MXjqgSuNBRGkYH2rRfVUwl9EM1I4TN6sW
 r9hC7eFk+ASpu2BeFFsDOHEsyaff/26Ez6tO3QvGMJmhjY957mBXT5D7pXL0T0JyIlFCCe
 x1spuASqmmGBavXaMl52sZX8XExYjHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-EJPPTYw0PqCcbMz7n5qhiA-1; Tue, 16 Feb 2021 14:10:46 -0500
X-MC-Unique: EJPPTYw0PqCcbMz7n5qhiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA7981846096;
 Tue, 16 Feb 2021 19:10:45 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A07955C1B4;
 Tue, 16 Feb 2021 19:10:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/10] qemu-options: update to show preferred boolean syntax
 for -vnc
Date: Tue, 16 Feb 2021 19:10:23 +0000
Message-Id: <20210216191027.595031-7-berrange@redhat.com>
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

The on|off syntax has been supported since -vnc switched to use
QemuOpts in commit 4db14629c38611061fc19ec6927405923de84f08

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index da0ddf8a3a..34be5a7a2d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2123,13 +2123,13 @@ SRST
     Following the display value there may be one or more option flags
     separated by commas. Valid options are
 
-    ``reverse``
+    ``reverse=on|off``
         Connect to a listening VNC client via a "reverse" connection.
         The client is specified by the display. For reverse network
         connections (host:d,``reverse``), the d argument is a TCP port
         number, not a display number.
 
-    ``websocket``
+    ``websocket=on|off``
         Opens an additional TCP listening port dedicated to VNC
         Websocket connections. If a bare websocket option is given, the
         Websocket port is 5700+display. An alternative port can be
@@ -2143,7 +2143,7 @@ SRST
         runs in unencrypted mode. If TLS credentials are provided, the
         websocket connection requires encrypted client connections.
 
-    ``password``
+    ``password=on|off``
         Require that password based authentication is used for client
         connections.
 
@@ -2180,7 +2180,7 @@ SRST
         on the fly while the VNC server is active. If missing, it will
         default to denying access.
 
-    ``sasl``
+    ``sasl=on|off``
         Require that the client use SASL to authenticate with the VNC
         server. The exact choice of authentication method used is
         controlled from the system / user's SASL configuration file for
@@ -2203,7 +2203,7 @@ SRST
         fly while the VNC server is active. If missing, it will default
         to denying access.
 
-    ``acl``
+    ``acl=on|off``
         Legacy method for enabling authorization of clients against the
         x509 distinguished name and SASL username. It results in the
         creation of two ``authz-list`` objects with IDs of
@@ -2213,13 +2213,13 @@ SRST
         This option is deprecated and should no longer be used. The new
         ``sasl-authz`` and ``tls-authz`` options are a replacement.
 
-    ``lossy``
+    ``lossy=on|off``
         Enable lossy compression methods (gradient, JPEG, ...). If this
         option is set, VNC client may receive lossy framebuffer updates
         depending on its encoding settings. Enabling this option can
         save a lot of bandwidth at the expense of quality.
 
-    ``non-adaptive``
+    ``non-adaptive=on|off``
         Disable adaptive encodings. Adaptive encodings are enabled by
         default. An adaptive encoding will try to detect frequently
         updated screen regions, and send updates in these regions using
@@ -2254,7 +2254,7 @@ SRST
         must be omitted, otherwise is must be present and specify a
         valid audiodev.
 
-    ``power-control``
+    ``power-control=on|off``
         Permit the remote client to issue shutdown, reboot or reset power
         control requests.
 ERST
-- 
2.29.2


