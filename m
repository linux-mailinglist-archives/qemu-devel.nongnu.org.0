Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5F14DF60
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 17:44:12 +0100 (CET)
Received: from localhost ([::1]:35908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixCvL-0007VU-8m
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 11:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50919)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixClQ-0000Jb-O8
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 11:33:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixClP-0000fq-J1
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 11:33:56 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42997
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixClO-0000bT-7Z
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 11:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580402032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dw8NwepkWDhCnzhcXnH6B6yzarVIN8Ea1I7bRL7rl+g=;
 b=CZQlyUS0VS+TgiXBaZmXxaAm/sBILaZWaHJwV15K1o5TcbZf8IQBoTtfrpLAr8lNZcVmdp
 Ou55Z5ijwe4eAVnWeKgrNemdhvlY/eZtvvIto0+kqYmU0Zu1zOMV+Jj4frIapY+Zy9IY9w
 NDegQzX0zwnURlrJ0LKawJo1b4opd1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-Z_2q7c9jPfef9qRLRR6kQA-1; Thu, 30 Jan 2020 11:33:48 -0500
X-MC-Unique: Z_2q7c9jPfef9qRLRR6kQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA07E107ACC7;
 Thu, 30 Jan 2020 16:33:46 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6B655E241;
 Thu, 30 Jan 2020 16:33:34 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] scripts/minikconf: Explicit usage of Python 3
Date: Thu, 30 Jan 2020 17:32:26 +0100
Message-Id: <20200130163232.10446-7-philmd@redhat.com>
In-Reply-To: <20200130163232.10446-1-philmd@redhat.com>
References: <20200130163232.10446-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, kvm@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the program search path to find the Python 3 interpreter.

Patch created manually after running:

  $ git grep -l 'if __name__.*__main__' \
      | xargs grep -LF '#!/usr/bin/env python3'

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 scripts/minikconf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/minikconf.py b/scripts/minikconf.py
index 40ae1989e1..377d6228b9 100644
--- a/scripts/minikconf.py
+++ b/scripts/minikconf.py
@@ -1,3 +1,4 @@
+#!/usr/bin/env python3
 #
 # Mini-Kconfig parser
 #
--=20
2.21.1


