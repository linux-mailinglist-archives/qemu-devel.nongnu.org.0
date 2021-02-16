Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80F331D0EE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:26:07 +0100 (CET)
Received: from localhost ([::1]:35736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5z5-00064n-1O
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kP-0002po-VK
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:11:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kN-0004Ri-CC
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613502653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NvS9JMx0xN3JD8dmM5g6yF3UCasMmjlH5eE0n3m1QT8=;
 b=Lg19sePOu6HpDpbNvPfI9TI1fwzo5XhUe4GL4PHYAD1+BlSL8qo3SG/C0qFc9K5PQ+RgXP
 rU1kaAytApuXF3ZAsz9tXMGtnEUxm1jxiUqcufu6x0nOXtCYkKClx8CkU740O+TdRBjLA6
 oZGoqUiwOfyicq2vXn30fx/9erc60qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-dF_LwkEJNSWpLRSV4jLb8A-1; Tue, 16 Feb 2021 14:10:50 -0500
X-MC-Unique: dF_LwkEJNSWpLRSV4jLb8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13F608030C2;
 Tue, 16 Feb 2021 19:10:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B92F25C1B4;
 Tue, 16 Feb 2021 19:10:47 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/10] docs: update to show preferred boolean syntax for -vnc
Date: Tue, 16 Feb 2021 19:10:25 +0000
Message-Id: <20210216191027.595031-9-berrange@redhat.com>
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
 docs/system/vnc-security.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/system/vnc-security.rst b/docs/system/vnc-security.rst
index ebca656d87..830f6acc73 100644
--- a/docs/system/vnc-security.rst
+++ b/docs/system/vnc-security.rst
@@ -44,7 +44,7 @@ the password all clients will be rejected.
 
 .. parsed-literal::
 
-   |qemu_system| [...OPTIONS...] -vnc :1,password -monitor stdio
+   |qemu_system| [...OPTIONS...] -vnc :1,password=on -monitor stdio
    (qemu) change vnc password
    Password: ********
    (qemu)
@@ -104,7 +104,7 @@ authentication to provide two layers of authentication for clients.
 
    |qemu_system| [...OPTIONS...] \
      -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=on \
-     -vnc :1,tls-creds=tls0,password -monitor stdio
+     -vnc :1,tls-creds=tls0,password=on -monitor stdio
    (qemu) change vnc password
    Password: ********
    (qemu)
@@ -128,7 +128,7 @@ can be launched with:
 
 .. parsed-literal::
 
-   |qemu_system| [...OPTIONS...] -vnc :1,sasl -monitor stdio
+   |qemu_system| [...OPTIONS...] -vnc :1,sasl=on -monitor stdio
 
 .. _vnc_005fsec_005fcertificate_005fsasl:
 
@@ -146,7 +146,7 @@ x509 options:
 
    |qemu_system| [...OPTIONS...] \
      -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=on \
-     -vnc :1,tls-creds=tls0,sasl -monitor stdio
+     -vnc :1,tls-creds=tls0,sasl=on -monitor stdio
 
 .. _vnc_005fsetup_005fsasl:
 
-- 
2.29.2


