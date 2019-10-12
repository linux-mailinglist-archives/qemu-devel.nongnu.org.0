Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E087DD4DD9
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 09:13:17 +0200 (CEST)
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJBaW-0003I6-Dz
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 03:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iJBZf-0002ro-4K
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 03:12:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iJBZc-0006L8-0R
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 03:12:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36346)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iJBZb-0006KY-RJ
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 03:12:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B41A89AC4;
 Sat, 12 Oct 2019 07:12:18 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-46.brq.redhat.com [10.40.204.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B002600D1;
 Sat, 12 Oct 2019 07:12:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Add a TILE-Gx section
Date: Sat, 12 Oct 2019 09:12:10 +0200
Message-Id: <20191012071210.13632-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Sat, 12 Oct 2019 07:12:18 +0000 (UTC)
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Chen Gang <gang.chen.5i5j@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TILE-Gx architecture was missing its section, add it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ca814850e..a3be0a4a31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -299,6 +299,11 @@ F: hw/sparc64/
 F: include/hw/sparc/sparc64.h
 F: disas/sparc.c
=20
+TILE-Gx CPUs
+M: Chen Gang <gang.chen.5i5j@gmail.com>
+S: Maintained
+F: target/tilegx/
+
 UniCore32 TCG CPUs
 M: Guan Xuetao <gxt@mprc.pku.edu.cn>
 S: Maintained
--=20
2.21.0


