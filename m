Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5FE124F10
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 18:24:06 +0100 (CET)
Received: from localhost ([::1]:58122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihd3N-0002JK-9I
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 12:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38541)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihd0R-0007qm-5b
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihd0P-0000XZ-SV
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46018
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihd0P-0000Tj-Cs
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576689660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ky3L34wejGcJOlarYpvmPgF6QEhFeFdZ1gZXpXoMAo=;
 b=Juq8jQrf6v5flZXkxL20QcbQfb44pwWOgvHqGQzAPHz1OxLPxYVA1+wpSpGD9fnJz1LBlr
 oMga6J7NaoF2UFG+Wi2dBPDOF8/f3Y/i1+YFCtFhy54r8w0EUuJy3HV4U/ND+0i9v3dd4l
 By3CSUUqr7yzpTuzMFWJXukq915dAAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-TtA3OU3bPdCFHfmAGQgMxQ-1; Wed, 18 Dec 2019 12:20:57 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8677718543A1;
 Wed, 18 Dec 2019 17:20:56 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EF871001281;
 Wed, 18 Dec 2019 17:20:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 03/14] hw/char/terminal3270: Explicit ignored
 QEMUChrEvent in IOEventHandler
Date: Wed, 18 Dec 2019 18:19:58 +0100
Message-Id: <20191218172009.8868-4-philmd@redhat.com>
In-Reply-To: <20191218172009.8868-1-philmd@redhat.com>
References: <20191218172009.8868-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: TtA3OU3bPdCFHfmAGQgMxQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit all the events ignored by this frontend, to silent the
following GCC warning:

    CC      s390x-softmmu/hw/char/terminal3270.o
  hw/char/terminal3270.c: In function =E2=80=98chr_event=E2=80=99:
  hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_EVENT=
_BREAK=E2=80=99 not handled in switch [-Werror=3Dswitch]
    156 |     switch (event) {
        |     ^~~~~~
  hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_EVENT=
_MUX_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
  hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_EVENT=
_MUX_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Add all missing enums

Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-s390x@nongnu.org
---
 hw/char/terminal3270.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
index 6859c1bcb2..2aab04fd4b 100644
--- a/hw/char/terminal3270.c
+++ b/hw/char/terminal3270.c
@@ -166,6 +166,11 @@ static void chr_event(void *opaque, int event)
         sch->curr_status.scsw.dstat =3D SCSW_DSTAT_DEVICE_END;
         css_conditional_io_interrupt(sch);
         break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0


