Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E64AEAC07
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 10:00:13 +0100 (CET)
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQ6JP-0007Ld-Hb
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 05:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iQ6DD-00015h-Jt
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 04:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iQ6DB-0001xm-Pg
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 04:53:46 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60978
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iQ6DB-0001v9-GM
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 04:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572512024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuZgXvlwMzLuDvpGw9CQ8n6GULhWbjwRy5OX5k+F+6I=;
 b=T7ClRLVp8fP+vHS9lnHbsMrxcPrEub2OsNob1GxUNzK/imEc/eolKyzym1XXLYK9wgvYcL
 Ye0OHRfYfmOJHG0317/fII+WNQXYLg7V3NxMN2Z45ulECev++0mdHpF7Rl30Ys2SZoHGTm
 IVEDKid+yWeyOInQBD3u1za5zoLL/T0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-7Avr_16tMLim60-DPURpcg-1; Thu, 31 Oct 2019 04:53:42 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A36781A334
 for <qemu-devel@nongnu.org>; Thu, 31 Oct 2019 08:53:41 +0000 (UTC)
Received: from lupin.home.kraxel.org (ovpn-116-222.ams2.redhat.com
 [10.36.116.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E37841001B23;
 Thu, 31 Oct 2019 08:53:38 +0000 (UTC)
Received: by lupin.home.kraxel.org (Postfix, from userid 1000)
 id 80E226114A3F; Thu, 31 Oct 2019 09:53:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/4] tests/vm: update netbsd to version 8.1
Date: Thu, 31 Oct 2019 09:53:06 +0100
Message-Id: <20191031085306.28888-5-kraxel@redhat.com>
In-Reply-To: <20191031085306.28888-1-kraxel@redhat.com>
References: <20191031085306.28888-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 7Avr_16tMLim60-DPURpcg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/vm/netbsd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index d1bccccfd0..33779402dd 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -22,7 +22,7 @@ class NetBSDVM(basevm.BaseVM):
     name =3D "netbsd"
     arch =3D "x86_64"
=20
-    link =3D "https://cdn.netbsd.org/pub/NetBSD/NetBSD-8.0/images/NetBSD-8=
.0-amd64.iso"
+    link =3D "https://cdn.netbsd.org/pub/NetBSD/NetBSD-8.1/images/NetBSD-8=
.1-amd64.iso"
     size =3D "20G"
     pkgs =3D [
         # tools
--=20
2.18.1


