Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D352218939C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 02:15:27 +0100 (CET)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jENIs-0002P1-Tq
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 21:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jENG6-0007TW-Ud
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 21:12:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1jENG6-0004in-0G
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 21:12:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:33173)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1jENG5-0004hP-Sd
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 21:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584493951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NvsIcJn+vDR+XVp29U5PoUNWI6fz3PjojaW3lFBTsCU=;
 b=FNa5LXeUgaRREFt8s1sEdwTjCNrMNDkRxjpB042F2xfjPv/mLWgnKhOtHE63yZqw2IfdA1
 obRMoqn9weO9uvv/sysR51/jNhcnMzLpf3hJ3+IXXMntsRJFjOamXO/cJz1bQdZrn5wPcs
 WzoX9e6+Ux0yEgXLGRUA5uGcBFoUByk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-Wglkl5ALPTWuiDcEsnk0Vg-1; Tue, 17 Mar 2020 21:12:29 -0400
X-MC-Unique: Wglkl5ALPTWuiDcEsnk0Vg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 336AC8017CC;
 Wed, 18 Mar 2020 01:12:28 +0000 (UTC)
Received: from localhost (ovpn-118-148.rdu2.redhat.com [10.10.118.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95D945C1BB;
 Wed, 18 Mar 2020 01:12:27 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/4] MAINTAINERS: add simplebench
Date: Tue, 17 Mar 2020 21:12:17 -0400
Message-Id: <20200318011217.2102748-5-ehabkost@redhat.com>
In-Reply-To: <20200318011217.2102748-1-ehabkost@redhat.com>
References: <20200318011217.2102748-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20200228071914.11746-5-vsementsov@virtuozzo.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7364af0d8b..9b462ef009 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2142,6 +2142,11 @@ F: python/qemu/*py
 F: scripts/*.py
 F: tests/*.py
=20
+Benchmark util
+M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+S: Maintained
+F: scripts/simplebench/
+
 QAPI
 M: Markus Armbruster <armbru@redhat.com>
 M: Michael Roth <mdroth@linux.vnet.ibm.com>
--=20
2.24.1


