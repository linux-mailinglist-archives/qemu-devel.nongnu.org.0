Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB81191D80
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 00:26:02 +0100 (CET)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGsvp-00073M-3R
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 19:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jGss5-0007bx-Iz
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jGss4-0001xM-Jo
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:09 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:32243)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jGss4-0001x9-Fr
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585092128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBlrvEJ8xqqfwUeQmT8ygM/G2CccuaxkboBuGEOJf/Y=;
 b=GDH7f4ooyQ2G8t364v7AindP1Amp8bGd5veHQPlJsL49nbjR3V9EkcHRfbY3B5CpkReb5+
 xPw+ap7hWvjvK7fdLuXF+hmX28vrXU7uFgxs/r6K/7hrzsR5ic2zyP0le/gvwKdgbTJryd
 7Rg2ggksU6dowdP73rxQUBm8azF04Gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-cPGKpGdINp6S3J-JlNB_eQ-1; Tue, 24 Mar 2020 19:22:06 -0400
X-MC-Unique: cPGKpGdINp6S3J-JlNB_eQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82B631084435;
 Tue, 24 Mar 2020 23:21:52 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 637145D9C5;
 Tue, 24 Mar 2020 23:21:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 07/14] iotests: drop pre-Python 3.4 compatibility code
Date: Tue, 24 Mar 2020 19:20:56 -0400
Message-Id: <20200324232103.4195-8-jsnow@redhat.com>
In-Reply-To: <20200324232103.4195-1-jsnow@redhat.com>
References: <20200324232103.4195-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 philmd@redhat.com, armbru@redhat.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We no longer need to accommodate 3.4, drop this code.
(The lines were > 79 chars and it stood out.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 2a0e22a3db..c93c6b4557 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -359,12 +359,9 @@ def log(msg, filters=3D(), indent=3DNone):
     for flt in filters:
         msg =3D flt(msg)
     if isinstance(msg, (dict, list)):
-        # Python < 3.4 needs to know not to add whitespace when pretty-pri=
nting:
-        separators =3D (', ', ': ') if indent is None else (',', ': ')
         # Don't sort if it's already sorted
         do_sort =3D not isinstance(msg, OrderedDict)
-        print(json.dumps(msg, sort_keys=3Ddo_sort,
-                         indent=3Dindent, separators=3Dseparators))
+        print(json.dumps(msg, sort_keys=3Ddo_sort, indent=3Dindent))
     else:
         print(msg)
=20
--=20
2.21.1


