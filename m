Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB8C11E815
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 17:21:30 +0100 (CET)
Received: from localhost ([::1]:50960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifnh3-0001qM-25
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 11:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ifneq-0008Nq-Ik
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 11:19:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ifnem-0000s4-UA
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 11:19:10 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27260
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ifnel-0000o6-0t
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 11:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUapvLhtCW9yCcoxtOXVvyvcUvyz8RqxZFiSUUVE8Pk=;
 b=QPTdr397sPg3KMHhU5wcon4BzWSvUJ0S/G9m1Kux+Qz57QDQ8yZLZlcG0Okr7tPcZ6hWLV
 Wweooyv0x66FEd9QQkE9qvxuDXCsTlGojVaIvvSSqYGEzzZ3DKnbIoix68CALFTSTCTHgW
 JUiw3Q43zl35ENKCYcLFCcsnqjLKvFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-PU46llMnMd-7rzggfX1j7w-1; Fri, 13 Dec 2019 11:19:04 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6C6E800EC0;
 Fri, 13 Dec 2019 16:19:02 +0000 (UTC)
Received: from localhost (ovpn-116-226.ams2.redhat.com [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DEF310013D9;
 Fri, 13 Dec 2019 16:18:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/16] vfio-ccw: Fix error message
Date: Fri, 13 Dec 2019 17:18:36 +0100
Message-Id: <20191213161851.24687-2-cohuck@redhat.com>
In-Reply-To: <20191213161851.24687-1-cohuck@redhat.com>
References: <20191213161851.24687-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: PU46llMnMd-7rzggfX1j7w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Eric Farman <farman@linux.ibm.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Boris Fiuczynski <fiuczy@linux.ibm.com>

Signed-off-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20191128143015.5231-1-fiuczy@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/vfio/ccw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 6863f6c69fd9..3b5520ae75a1 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -102,7 +102,7 @@ again:
         if (errno =3D=3D EAGAIN) {
             goto again;
         }
-        error_report("vfio-ccw: wirte I/O region failed with errno=3D%d", =
errno);
+        error_report("vfio-ccw: write I/O region failed with errno=3D%d", =
errno);
         ret =3D -errno;
     } else {
         ret =3D region->ret_code;
--=20
2.21.0


