Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B788154E4A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:46:32 +0100 (CET)
Received: from localhost ([::1]:46718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izoyl-00038c-3w
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izobu-0003dP-9E
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:22:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izobt-00027T-Av
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:22:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35213
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izobt-00025M-6s
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581024172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7P7UzDgTiuYeGorUM6KwbMiFD8ja99mG9XrTpE1aCHM=;
 b=UMb7xC6KT6bqaMYKlArSOO4WWSVfB58JlKrdrmOiS8cqImkiEwVGYc/pQo0OQ6G+6IFg0O
 qxe3t+jIDuy5or+yZKu4wY1eFtqTsWKm+UfFSRrxvTQ893soOUINhyogh5WqdMvMPBEthJ
 f9FBwMj8ES97t55MNK2iNmJ53vQBQy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-yaDRab84OWWFednaMUHu2A-1; Thu, 06 Feb 2020 16:22:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5712910753F3
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 21:22:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C931360BEC;
 Thu,  6 Feb 2020 21:22:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/46] scripts/signrom: remove Python 2 support, add shebang
Date: Thu,  6 Feb 2020 22:19:33 +0100
Message-Id: <20200206211936.17098-44-philmd@redhat.com>
In-Reply-To: <20200206211936.17098-1-philmd@redhat.com>
References: <20200206211936.17098-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: yaDRab84OWWFednaMUHu2A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20200204160028.16211-1-pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 scripts/signrom.py | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/signrom.py b/scripts/signrom.py
index 313ee28a17..9be5dab1cf 100644
--- a/scripts/signrom.py
+++ b/scripts/signrom.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from __future__ import print_function
 #
 # Option ROM signing utility
@@ -44,14 +46,8 @@ fout.write(data)
=20
 checksum =3D 0
 for b in data:
-    # catch Python 2 vs. 3 differences
-    if isinstance(b, int):
-        checksum +=3D b
-    else:
-        checksum +=3D ord(b)
-checksum =3D (256 - checksum) % 256
+    checksum =3D (checksum - b) & 255
=20
-# Python 3 no longer allows chr(checksum)
 fout.write(struct.pack('B', checksum))
=20
 fin.close()
--=20
2.21.1


