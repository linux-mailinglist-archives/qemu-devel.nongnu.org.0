Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7261244C5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 11:36:30 +0100 (CET)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihWgv-0007Zo-Hs
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 05:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihWbt-0001p2-4G
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:31:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihWbs-0000Fa-53
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:31:17 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54997
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihWbs-0000DY-07
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576665075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RH9IeDHzfaeZ6Cs/DQpi/Xmp0whC04MLlo9nB9zR0Yg=;
 b=AE4vaFiUomKOlsEM8iPQRQhTH39VODG/OJ2ktdmVGBoLN5CDllKY/Y7uQpyIADRuHvEw5o
 eG0zjJl5K2Z4xoJKbqBYxAlDFzs+TZqp/YkjZTKiqP+6mNmjn+NP26GLc9gu5NFxSbDBJN
 oD5rJM8J7WLavh/gr1pJJ31P9Yz/TII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-zNurTfR3NZmP9S7gmLaboQ-1; Wed, 18 Dec 2019 05:31:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F3E801E78;
 Wed, 18 Dec 2019 10:31:06 +0000 (UTC)
Received: from thuth.com (ovpn-116-150.ams2.redhat.com [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5230F5C28D;
 Wed, 18 Dec 2019 10:31:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 1/7] tests/Makefile: test-char does not need libqtest
Date: Wed, 18 Dec 2019 11:30:53 +0100
Message-Id: <20191218103059.11729-2-thuth@redhat.com>
In-Reply-To: <20191218103059.11729-1-thuth@redhat.com>
References: <20191218103059.11729-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: zNurTfR3NZmP9S7gmLaboQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to link the libqtest objects here.

Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index b381387048..16eb4aa7ba 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -538,7 +538,7 @@ tests/check-qlit$(EXESUF): tests/check-qlit.o $(test-ut=
il-obj-y)
 tests/check-qom-interface$(EXESUF): tests/check-qom-interface.o $(test-qom=
-obj-y)
 tests/check-qom-proplist$(EXESUF): tests/check-qom-proplist.o $(test-qom-o=
bj-y)
=20
-tests/test-char$(EXESUF): tests/test-char.o $(test-util-obj-y) $(qtest-obj=
-y) $(test-io-obj-y) $(chardev-obj-y) tests/socket-helpers.o
+tests/test-char$(EXESUF): tests/test-char.o $(test-util-obj-y) $(test-io-o=
bj-y) $(chardev-obj-y) tests/socket-helpers.o
 tests/test-coroutine$(EXESUF): tests/test-coroutine.o $(test-block-obj-y)
 tests/test-aio$(EXESUF): tests/test-aio.o $(test-block-obj-y)
 tests/test-aio-multithread$(EXESUF): tests/test-aio-multithread.o $(test-b=
lock-obj-y)
--=20
2.18.1


