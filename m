Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D70614D38C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 00:22:36 +0100 (CET)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwwfL-00077g-NL
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 18:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwwYQ-0005pd-PB
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:15:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwwYP-0002Xo-Jq
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:15:26 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30710
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwwYP-0002XT-Fp
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580339725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FiGU6J8UEE9KUsba/BpstzIY8VJmHnlEl9mtOR+Uk54=;
 b=DZvIaT3PbqsScVbgbaIc6wFNiM4oCYUhz3Rxbql9Ooj7HTS7y3x4paDfAYrQAaPc2dSteC
 BLWNmfEiSs50mvMAZB3ebWrfGLL5zFfWTLAXRRJV6kBOLRWCeogOEnLr+t3hW73qN2RKJo
 fUdJw0CVUh8b/vDgkCACQJ+pUXkV5dY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-nXxhsgsoPjeQdvRMT2P0fg-1; Wed, 29 Jan 2020 18:15:23 -0500
X-MC-Unique: nXxhsgsoPjeQdvRMT2P0fg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CDFC800D48;
 Wed, 29 Jan 2020 23:15:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BBE15DA7E;
 Wed, 29 Jan 2020 23:15:17 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] scripts: Explicit usage of Python 3
Date: Thu, 30 Jan 2020 00:14:01 +0100
Message-Id: <20200129231402.23384-10-philmd@redhat.com>
In-Reply-To: <20200129231402.23384-1-philmd@redhat.com>
References: <20200129231402.23384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the program search path to find the Python 3 interpreter.

Patch created mechanically by running:

  $ sed -i "s,^#\!/usr/bin/\(env\ \)\?python$,#\!/usr/bin/env python3," \
      $(git grep -lF '#!/usr/bin/env python' | xargs grep -L 'if __name__=
.*__main__')

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 scripts/analyse-9p-simpletrace.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/analyse-9p-simpletrace.py b/scripts/analyse-9p-simpl=
etrace.py
index 710e01adba..f20050fddd 100755
--- a/scripts/analyse-9p-simpletrace.py
+++ b/scripts/analyse-9p-simpletrace.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # Pretty print 9p simpletrace log
 # Usage: ./analyse-9p-simpletrace <trace-events> <trace-pid>
 #
--=20
2.21.1


