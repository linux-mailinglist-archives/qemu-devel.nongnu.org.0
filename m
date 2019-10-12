Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BEDD4DCE
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 08:56:34 +0200 (CEST)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJBKL-0005mj-3v
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 02:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46901)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iJBIW-00046C-3m
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iJBIV-0006G1-6T
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:54:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40040)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iJBIT-0006Et-5L; Sat, 12 Oct 2019 02:54:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 53CBF3091740;
 Sat, 12 Oct 2019 06:54:36 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-46.brq.redhat.com [10.40.204.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 586F95D6C8;
 Sat, 12 Oct 2019 06:54:34 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] MAINTAINERS: Add hw/sd/ssi-sd.c in the SD section
Date: Sat, 12 Oct 2019 08:54:24 +0200
Message-Id: <20191012065426.10772-2-philmd@redhat.com>
In-Reply-To: <20191012065426.10772-1-philmd@redhat.com>
References: <20191012065426.10772-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Sat, 12 Oct 2019 06:54:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hw/sd/ssi-sd.c file is orphean, add it to the SD section.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ca814850e..47eae9fc46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1445,6 +1445,7 @@ S: Odd Fixes
 F: include/hw/sd/sd*
 F: hw/sd/core.c
 F: hw/sd/sd*
+F: hw/sd/ssi-sd.c
 F: tests/sd*
=20
 USB
--=20
2.21.0


