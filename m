Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6485E12421E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 09:44:44 +0100 (CET)
Received: from localhost ([::1]:51264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihUwl-0001oN-F7
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 03:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ihUX4-0006ns-Dt
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:18:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ihUX3-0003gZ-EP
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:18:10 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25613
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ihUX3-0003fq-Ax
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576657089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tVBYCCeRLVyWYxHGrpbDLXgoURGxLO3XIVAA0t0XFA=;
 b=CRhWS1zpWJ0GAc/ttsNQLhT4nzIrG1qzcioH6QXdEZUhYaNi6JujisqU4s9W1Zcj6+KEhh
 p8OEsPJjYfMcLfbLPMX+0KrTYvGx+oTZTIX4xc2f/lXfUXz/wkrP/gE/daCPlMDJVasXYr
 S0VtYPfRo3wkmgf0fxHIYzjJnrchJZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-FjvizVrEMsG5qtP2URbzKA-1; Wed, 18 Dec 2019 03:17:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0903810054E3;
 Wed, 18 Dec 2019 08:17:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC88468887;
 Wed, 18 Dec 2019 08:17:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5B1A41138613; Wed, 18 Dec 2019 09:17:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/35] crypto: Fix typo in QCryptoTLSSession's <example>
 comment
Date: Wed, 18 Dec 2019 09:16:49 +0100
Message-Id: <20191218081721.23520-4-armbru@redhat.com>
In-Reply-To: <20191218081721.23520-1-armbru@redhat.com>
References: <20191218081721.23520-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: FjvizVrEMsG5qtP2URbzKA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20191204093625.14836-3-armbru@redhat.com>
Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


