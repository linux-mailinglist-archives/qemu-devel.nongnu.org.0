Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7A1175EB1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 16:48:02 +0100 (CET)
Received: from localhost ([::1]:34386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8nIX-0001us-L1
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 10:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lvivier@redhat.com>) id 1j8nHO-0000zs-Du
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:46:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1j8nHN-0002BR-IY
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:46:50 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41070)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1j8nHN-00029V-EW
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583164009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDwRaIn7Ay42TCDFh3QkRR1FeP05yImhxsLAYbmezjE=;
 b=O8jb2UyL3f34m4SdK6p9wLqjVgw8nA+DWEBMzc2KsNi3EGJP+cJIrrjV7xxOvg2Ga7H0aI
 CMw+nFy9414ou0opDraeqK03yJxcwgEcXA1Lpon1dfJD08Vat1YYNl9CgD3Sy/5oAbJ3ai
 8eAqSIFDh/kfB3Xi/p+8r+aYekqBIWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-cxplN92oOhWxrUSUAubYbw-1; Mon, 02 Mar 2020 10:46:47 -0500
X-MC-Unique: cxplN92oOhWxrUSUAubYbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4642E8017CC;
 Mon,  2 Mar 2020 15:46:46 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-117-17.ams2.redhat.com [10.36.117.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F23995DA60;
 Mon,  2 Mar 2020 15:46:43 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] travis: enable tools build on OS X
Date: Mon,  2 Mar 2020 16:46:30 +0100
Message-Id: <20200302154630.45620-3-lvivier@redhat.com>
In-Reply-To: <20200302154630.45620-1-lvivier@redhat.com>
References: <20200302154630.45620-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we can build tools on OS X we should check we don't break build
when we submit new codes.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 .travis.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.travis.yml b/.travis.yml
index 9867272177d4..70a24bf2fc8b 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -273,6 +273,7 @@ jobs:
=20
     - name: "OSX Xcode 10.3"
       env:
+        - BASE_CONFIG=3D"--disable-docs --enable-tools"
         - CONFIG=3D"--target-list=3Di386-softmmu,ppc-softmmu,ppc64-softmmu=
,m68k-softmmu,x86_64-softmmu"
       os: osx
       osx_image: xcode10.3
--=20
2.24.1


