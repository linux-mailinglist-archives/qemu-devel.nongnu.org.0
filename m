Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9FB1417DE
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 15:08:25 +0100 (CET)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isom0-0001W2-E2
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 09:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45311)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isokR-0000Bk-AY
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 09:06:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isokO-0007ZI-J0
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 09:06:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57433
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isokO-0007Yo-FV
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 09:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579356403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tpN4IRBHIRExpdzj4SxAzDbrcO2tKnut1MuvxDBCogA=;
 b=ToKRqFpeXbY5BlvcKBFZEw8YO8gMvGFSWpoM5KV9ZtYm13ZWeotw3zc/gp7KvaNrMlTlVP
 OD+rgT+PWONZ0zbv+f42iDzMkIKCa6Qz04+FInV1WXmkhZMXu8jv3U6/ClZ+c4GWULs6qT
 pQrGJ7t+J/TlkdWBpTOmYPgy5SHoNw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-chb9026XMdu-_Fs9hYtncQ-1; Sat, 18 Jan 2020 09:06:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34FE0100550E;
 Sat, 18 Jan 2020 14:06:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-59.brq.redhat.com [10.40.204.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 365CA5C1D4;
 Sat, 18 Jan 2020 14:06:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 2/6] Makefile: Clarify all the codebase requires qom/
 objects
Date: Sat, 18 Jan 2020 15:06:15 +0100
Message-Id: <20200118140619.26333-3-philmd@redhat.com>
In-Reply-To: <20200118140619.26333-1-philmd@redhat.com>
References: <20200118140619.26333-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: chb9026XMdu-_Fs9hYtncQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU user-mode also requires the qom/ objects, it is not only
used by "system emulation and qemu-img". As we will use a big
if() block, move it upper in the "Common libraries for tools
and emulators" section.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile.objs | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 7c1e50f9d6..5aae561984 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -2,6 +2,7 @@
 # Common libraries for tools and emulators
 stub-obj-y =3D stubs/
 util-obj-y =3D crypto/ util/ qobject/ qapi/
+qom-obj-y =3D qom/
=20
 chardev-obj-y =3D chardev/
=20
@@ -26,11 +27,6 @@ block-obj-m =3D block/
=20
 crypto-obj-y =3D crypto/
=20
-#######################################################################
-# qom-obj-y is code used by both qemu system emulation and qemu-img
-
-qom-obj-y =3D qom/
-
 #######################################################################
 # io-obj-y is code used by both qemu system emulation and qemu-img
=20
--=20
2.21.1


