Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D0D2CD5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 16:50:08 +0200 (CEST)
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIZlX-0002kb-VZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 10:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52830)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iIZYF-0003u8-Tf
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 10:36:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iIZYE-0002GI-Tj
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 10:36:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57724)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iIZYE-0002G6-OI
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 10:36:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F298E801662;
 Thu, 10 Oct 2019 14:36:21 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B85A460BE1;
 Thu, 10 Oct 2019 14:36:10 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 15/15] MAINTAINERS: add microvm related files
Date: Thu, 10 Oct 2019 16:31:26 +0200
Message-Id: <20191010143125.67246-17-slp@redhat.com>
In-Reply-To: <20191010143125.67246-1-slp@redhat.com>
References: <20191010143125.67246-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Thu, 10 Oct 2019 14:36:22 +0000 (UTC)
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
Cc: ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>, mst@redhat.com,
 lersek@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new "Microvm" section under "X86 Machines" with the new files
related to this machine type.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ca814850e..dfdc4f9b57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1275,6 +1275,16 @@ F: include/hw/timer/hpet.h
 F: include/hw/timer/i8254*
 F: include/hw/timer/mc146818rtc*
=20
+Microvm
+M: Sergio Lopez <slp@redhat.com>
+M: Paolo Bonzini <pbonzini@redhat.com>
+S: Maintained
+F: docs/microvm.rst
+F: hw/i386/microvm.c
+F: include/hw/i386/microvm.h
+F: roms/qboot
+F: pc-bios/bios-microvm.bin
+
 Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
--=20
2.21.0


