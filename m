Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB21C14D37C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 00:19:55 +0100 (CET)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwwck-0003C6-NM
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 18:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwwXl-0004cA-S1
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:14:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwwXk-0001Hq-S6
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:14:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25418
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwwXk-0001GB-ME
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580339684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ck1hpiil48puAQFI444xAOElQhSLUYW1bnxHBheztD8=;
 b=Ybtr94ByQKuFwPqfmF0ex85fCZ3AtSVN2Vi6itiwR33+e7lezYr4lmKSALn+fzKkU6NHIU
 23CghY/wdOczSJDOoBMqkcGE73CIcW7IhTjbvD0xudfvxFUgBNcO94sv3ad6YyMjX8UNyv
 iO6H9jBUwBZKyYIsnc2W8qY6VXQld8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-3q8-I8TFPOaIkgN9UdKcjg-1; Wed, 29 Jan 2020 18:14:42 -0500
X-MC-Unique: 3q8-I8TFPOaIkgN9UdKcjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0C86477;
 Wed, 29 Jan 2020 23:14:40 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 123CE5E241;
 Wed, 29 Jan 2020 23:14:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] scripts/minikconf: Explicit usage of Python 3
Date: Thu, 30 Jan 2020 00:13:56 +0100
Message-Id: <20200129231402.23384-5-philmd@redhat.com>
In-Reply-To: <20200129231402.23384-1-philmd@redhat.com>
References: <20200129231402.23384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Patch created manually after running:

  $ git grep -l 'if __name__.*__main__' | xargs grep -LF '#!/usr/bin/env =
python3'

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
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


