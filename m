Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA293112930
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 11:21:35 +0100 (CET)
Received: from localhost ([::1]:36492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icRmm-0005yI-QE
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 05:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1icR5K-0007Bs-Gx
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1icR5E-000051-4j
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43854
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1icR5E-0008O5-02
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575452189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5LJs4qmj5nbhlefhQkW8UndCpDHWlAMIMigpcb7EAg=;
 b=Zc+RSxkLrKIl4vZWD8LabiseQC8WrYTZIttZRqahDaDHFJiw6ZMuw8XrJe9/FvNSC+EV4A
 vbCusAtIl0EPQwrGfkjwQrLtTITsf1ygyPUDNDhT00nauVfdAl8KD1HzwnlV+g62aXH55y
 DgEtVtxlysTwGoaHfAVwJvpjMr86B5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-bC-dmC6TOVy0UdIxbQmB1A-1; Wed, 04 Dec 2019 04:36:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36B69800D54
 for <qemu-devel@nongnu.org>; Wed,  4 Dec 2019 09:36:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 052C1600CD;
 Wed,  4 Dec 2019 09:36:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 888B511366CC; Wed,  4 Dec 2019 10:36:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/18] crypto: Fix typo in QCryptoTLSSession's <example>
 comment
Date: Wed,  4 Dec 2019 10:36:09 +0100
Message-Id: <20191204093625.14836-3-armbru@redhat.com>
In-Reply-To: <20191204093625.14836-1-armbru@redhat.com>
References: <20191204093625.14836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: bC-dmC6TOVy0UdIxbQmB1A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/crypto/tlssession.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
index e01e1a9dc2..15b9cef086 100644
--- a/include/crypto/tlssession.h
+++ b/include/crypto/tlssession.h
@@ -56,7 +56,7 @@
  *
  * static int mysock_run_tls(int sockfd,
  *                           QCryptoTLSCreds *creds,
- *                           Error *errp)
+ *                           Error **errp)
  * {
  *    QCryptoTLSSession *sess;
  *
--=20
2.21.0


