Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D720124498
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 11:33:14 +0100 (CET)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihWdk-000375-RF
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 05:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihWbp-0001lJ-My
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:31:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihWbn-0008Kw-Pd
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:31:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51899
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihWbn-0008H3-Jn
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576665070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kORAgGltljUbJQe+Zm0MInnJsu1cF2wnvhKTXDKjwrw=;
 b=WdM1IpZ4w1Ws/yngkr68yw5freWeYfI5TjPqcc+AjeZq1BVwUTHbzGfW8mr3QX1fhxb5Xo
 iJTI8HDWS4hDhVOlWmaPhQxhSCyFccCRvKxlJEoM2EYFjI/BE35IkNMdCLNPHb2wFFw48J
 rEeD2h2uUAp7oSDuxMrg/fOGUc01Gb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-DbaMgIX1OlaMvvhUPMaoHQ-1; Wed, 18 Dec 2019 05:31:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3761C8017DF;
 Wed, 18 Dec 2019 10:31:08 +0000 (UTC)
Received: from thuth.com (ovpn-116-150.ams2.redhat.com [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE7E35C28C;
 Wed, 18 Dec 2019 10:31:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 2/7] tests/ptimer: Remove unnecessary inclusion of
 libqtest.h
Date: Wed, 18 Dec 2019 11:30:54 +0100
Message-Id: <20191218103059.11729-3-thuth@redhat.com>
In-Reply-To: <20191218103059.11729-1-thuth@redhat.com>
References: <20191218103059.11729-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: DbaMgIX1OlaMvvhUPMaoHQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ptimer-test is a unit test, not a qtest, so libqtest.h is not
required here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/ptimer-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index e16c30ce57..9176b96c1c 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -14,7 +14,6 @@
 #include "qemu/main-loop.h"
 #include "hw/ptimer.h"
=20
-#include "libqtest.h"
 #include "ptimer-test.h"
=20
 static bool triggered;
--=20
2.18.1


