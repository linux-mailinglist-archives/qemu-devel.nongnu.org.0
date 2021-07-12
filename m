Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D0B3C5D67
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:37:35 +0200 (CEST)
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2w7q-0002yZ-WB
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vaT-0000ma-GG
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vaR-0005to-Sg
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626094983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2pEfCj7tJ6O3ajy12njk3cgZ4W3wxtHAU7diBNQpVqo=;
 b=D+63ZimQFkMfoZPk5m8E+9YRYzyEIUuThoMR5HztDp5mKRdTQDlKKQwWjkQaZKXQxAaRf/
 NZ5LqmzseQpiHkSmvX+adU2iLK8yOBoHg/APmeyXRGzBxP+s9WQmllaaO4Rrxvs+aHf736
 UNGQBtlDSBjQ0cPGRwVUSFXLKnwcxzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-YZVIUYTHPwWdoepsmjdGxQ-1; Mon, 12 Jul 2021 09:03:02 -0400
X-MC-Unique: YZVIUYTHPwWdoepsmjdGxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DB3D800050;
 Mon, 12 Jul 2021 13:03:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-105.ams2.redhat.com
 [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 361D85C1D1;
 Mon, 12 Jul 2021 13:02:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/22] crypto: remove obsolete crypto test condition
Date: Mon, 12 Jul 2021 14:02:03 +0100
Message-Id: <20210712130223.1825930-3-berrange@redhat.com>
In-Reply-To: <20210712130223.1825930-1-berrange@redhat.com>
References: <20210712130223.1825930-1-berrange@redhat.com>
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we now require gcrypt >= 1.8.0, there is no need
to exclude the pbkdf test case.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/test-crypto-pbkdf.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/unit/test-crypto-pbkdf.c b/tests/unit/test-crypto-pbkdf.c
index c50fd639d2..43c417f6b4 100644
--- a/tests/unit/test-crypto-pbkdf.c
+++ b/tests/unit/test-crypto-pbkdf.c
@@ -229,10 +229,8 @@ static QCryptoPbkdfTestData test_data[] = {
     },
 
     /* non-RFC misc test data */
-#ifdef CONFIG_NETTLE
     {
-        /* empty password test.
-         * Broken with libgcrypt <= 1.5.0, hence CONFIG_NETTLE */
+        /* empty password test. */
         .path = "/crypto/pbkdf/nonrfc/sha1/iter2",
         .hash = QCRYPTO_HASH_ALG_SHA1,
         .iterations = 2,
@@ -244,7 +242,6 @@ static QCryptoPbkdfTestData test_data[] = {
                "\xbf\x03\xe1\x1c\x71\xca\x79\x4e\x07\x97",
         .nout = 20
     },
-#endif
     {
         /* Password exceeds block size test */
         .path = "/crypto/pbkdf/nonrfc/sha256/iter1200",
-- 
2.31.1


