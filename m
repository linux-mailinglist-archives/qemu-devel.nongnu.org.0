Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C27CE1868
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 12:57:47 +0200 (CEST)
Received: from localhost ([::1]:60328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNEKo-0006xq-5j
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 06:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iNDkQ-0005ai-O8
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:20:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iNDkO-00015b-LE
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:20:10 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33031
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iNDkM-00015H-Lz
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571826006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0Af9xttnP6T0tmusNckrvezjvKcSIWh1YYsIlikpwI0=;
 b=SXh5NbPFbIgdce6Yl/VEVKL0O7Wu/xTM0vW8qo0F+2/Y6rbjfht21S65ICO3EecdUIY0eV
 88cZr4tOCapcmTzNsCDdpg4BReLAF1BjwfBGSJs02T1EiJMAmXIqcm5MlnwabpbGw/YsWE
 X37uiX9jokBA0QWdV+fyh1VFwBDXWvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-wg7nenPCOUKzo5wLwgnwoQ-1; Wed, 23 Oct 2019 06:20:04 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBC01800D49
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 10:20:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 221981001B33;
 Wed, 23 Oct 2019 10:20:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4156917535; Wed, 23 Oct 2019 12:20:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] buildfix: update texinfo menu
Date: Wed, 23 Oct 2019 12:19:56 +0200
Message-Id: <20191023101956.19120-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: wg7nenPCOUKzo5wLwgnwoQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build error message:
qemu-doc.texi:34: node `Top' lacks menu item for `Recently removed features=
' despite being its Up target

Fixes: 3264ffced3d0 ("dirty-bitmaps: remove deprecated autoload parameter")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-doc.texi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 3c5022050f0f..3ddf5c0a6865 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -44,6 +44,7 @@
 * Security::
 * Implementation notes::
 * Deprecated features::
+* Recently removed features::
 * Supported build platforms::
 * License::
 * Index::
--=20
2.18.1


