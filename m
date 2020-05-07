Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B53B1C8B86
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 14:57:58 +0200 (CEST)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWg69-00047Y-Cu
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 08:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jWg2z-00077K-5e
 for qemu-devel@nongnu.org; Thu, 07 May 2020 08:54:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56517
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jWg2y-0002Y5-CU
 for qemu-devel@nongnu.org; Thu, 07 May 2020 08:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588856079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYbAH/LlXkVIXkztG5vCyXpUmpElz0YHwXi8vEsztGY=;
 b=TPtskMFGfovBlEDzvNP1TWsq5EyHdDjJbQ9kqSzd5iztVP+dCuRgkvh/wILXAoHNSVKC04
 IX7da1OPcWNDIWZ35Kyy2orUiUSYYHkylxz4nNsQDKwAYeSRaz2ziUAZDu9UgaIvCoMT9i
 vMX+O9OF2cD7BXJZukMSSRtJ3J7aNN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-lK01BE8dObiIudgLfNN3Vg-1; Thu, 07 May 2020 08:54:37 -0400
X-MC-Unique: lK01BE8dObiIudgLfNN3Vg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9745F107ACF2;
 Thu,  7 May 2020 12:54:36 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 908F2707BB;
 Thu,  7 May 2020 12:54:33 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/14] block/crypto: rename two functions
Date: Thu,  7 May 2020 15:54:06 +0300
Message-Id: <20200507125414.2151-7-mlevitsk@redhat.com>
In-Reply-To: <20200507125414.2151-1-mlevitsk@redhat.com>
References: <20200507125414.2151-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:56:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

rename the write_func to create_write_func, and init_func to create_init_fu=
nc.
This is preparation for other write_func that will be used to update the en=
cryption keys.

No functional changes

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 block/crypto.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/block/crypto.c b/block/crypto.c
index 61eed85de3..38ab0e6aa4 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -79,12 +79,12 @@ struct BlockCryptoCreateData {
 };
=20
=20
-static ssize_t block_crypto_write_func(QCryptoBlock *block,
-                                       size_t offset,
-                                       const uint8_t *buf,
-                                       size_t buflen,
-                                       void *opaque,
-                                       Error **errp)
+static ssize_t block_crypto_create_write_func(QCryptoBlock *block,
+                                              size_t offset,
+                                              const uint8_t *buf,
+                                              size_t buflen,
+                                              void *opaque,
+                                              Error **errp)
 {
     struct BlockCryptoCreateData *data =3D opaque;
     ssize_t ret;
@@ -97,11 +97,10 @@ static ssize_t block_crypto_write_func(QCryptoBlock *bl=
ock,
     return ret;
 }
=20
-
-static ssize_t block_crypto_init_func(QCryptoBlock *block,
-                                      size_t headerlen,
-                                      void *opaque,
-                                      Error **errp)
+static ssize_t block_crypto_create_init_func(QCryptoBlock *block,
+                                             size_t headerlen,
+                                             void *opaque,
+                                             Error **errp)
 {
     struct BlockCryptoCreateData *data =3D opaque;
=20
@@ -296,8 +295,8 @@ static int block_crypto_co_create_generic(BlockDriverSt=
ate *bs,
     };
=20
     crypto =3D qcrypto_block_create(opts, NULL,
-                                  block_crypto_init_func,
-                                  block_crypto_write_func,
+                                  block_crypto_create_init_func,
+                                  block_crypto_create_write_func,
                                   &data,
                                   errp);
=20
--=20
2.17.2


