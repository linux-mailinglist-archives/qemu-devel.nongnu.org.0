Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4EE154E07
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:37:41 +0100 (CET)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izoqC-0005gz-Kw
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34943)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izobO-0002K0-6e
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:22:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izobN-0000Dk-6B
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:22:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56198
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izobN-0000Br-2A
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581024139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKX4t2pD/7hTJ4CHxaoLxA38QXOv0Zb3jODi3X/TVh8=;
 b=Gh9CKgdTtVo1/WBwX5+WQ3ujjaNsK4xq9DoC95peG7YbMeN1NH15vw3W+g9UfGcZv81Ya0
 xTmBoEVwI7Ai/9mCsLJJWEt5wmp1Zuop4+Y8KePqFiBSVaACVEdksjFs33Sh3IwTyyaF/6
 +tYKPD8sH0V5BdTp4wDaAv1IELX2U2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-iyRkfM0VOGuZ-rhVt_oexA-1; Thu, 06 Feb 2020 16:22:17 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C08E800D54;
 Thu,  6 Feb 2020 21:22:17 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37CB660BEC;
 Thu,  6 Feb 2020 21:22:12 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/46] scripts/minikconf: Explicit usage of Python 3
Date: Thu,  6 Feb 2020 22:19:26 +0100
Message-Id: <20200206211936.17098-37-philmd@redhat.com>
In-Reply-To: <20200206211936.17098-1-philmd@redhat.com>
References: <20200206211936.17098-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: iyRkfM0VOGuZ-rhVt_oexA-1
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200130163232.10446-7-philmd@redhat.com>
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


