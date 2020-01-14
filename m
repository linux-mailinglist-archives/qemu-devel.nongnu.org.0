Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614BF13B315
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 20:40:19 +0100 (CET)
Received: from localhost ([::1]:45182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irS2z-0000V0-Ta
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 14:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1irRyG-00034m-1m
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 14:35:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1irRyC-0007U2-5g
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 14:35:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32601
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1irRyC-0007TO-23
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 14:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579030519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21zXTpw9IH7Q2VKoQfjeXxCFhgCVnjN8u61s41vMk9s=;
 b=TJuym3L15Us5WVg2C1RhRb5u9Bj4QRTBQ+c3kt+eZs4+8F5jzMgl5ozxPG0gMQJI+MmV8p
 6RLj4bunHCBQrqA67v9ULf4fXsULYQex/0Nm+jGuuVi7wD8ufs0BNlpa8rBoIMk1sImrHL
 tq9T2WVK1cLUqBN2kYu5AvFAyEWl5lQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-c0kG0vC0MPOkzUUe0TQrNg-1; Tue, 14 Jan 2020 14:34:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E608E800D48;
 Tue, 14 Jan 2020 19:34:10 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A94E087EFE;
 Tue, 14 Jan 2020 19:34:08 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/13] block/crypto: rename two functions
Date: Tue, 14 Jan 2020 21:33:42 +0200
Message-Id: <20200114193350.10830-6-mlevitsk@redhat.com>
In-Reply-To: <20200114193350.10830-1-mlevitsk@redhat.com>
References: <20200114193350.10830-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: c0kG0vC0MPOkzUUe0TQrNg-1
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 John Snow <jsnow@redhat.com>
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
index ecf96a7a9b..0b37dae564 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -78,12 +78,12 @@ struct BlockCryptoCreateData {
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
@@ -96,11 +96,10 @@ static ssize_t block_crypto_write_func(QCryptoBlock *bl=
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


