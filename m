Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A98FD8DAC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 12:17:40 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKgN8-0001wy-NS
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 06:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iKgKL-00005g-VS
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iKgKL-0000s2-1E
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:14:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39814)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iKgKK-0000ru-SL
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:14:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 20D441DA2;
 Wed, 16 Oct 2019 10:14:44 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 292E560605;
 Wed, 16 Oct 2019 10:14:40 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 15/15] MAINTAINERS: add microvm related files
Date: Wed, 16 Oct 2019 12:12:42 +0200
Message-Id: <20191016101241.24405-16-slp@redhat.com>
In-Reply-To: <20191016101241.24405-1-slp@redhat.com>
References: <20191016101241.24405-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 16 Oct 2019 10:14:44 +0000 (UTC)
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
 lersek@redhat.com, groug@kaod.org, kraxel@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new "microvm" section under "X86 Machines" with the new files
related to this machine type.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe4dc51b08..373538500f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1275,6 +1275,15 @@ F: include/hw/timer/hpet.h
 F: include/hw/timer/i8254*
 F: include/hw/timer/mc146818rtc*
=20
+microvm
+M: Sergio Lopez <slp@redhat.com>
+M: Paolo Bonzini <pbonzini@redhat.com>
+S: Maintained
+F: docs/microvm.rst
+F: hw/i386/microvm.c
+F: include/hw/i386/microvm.h
+F: pc-bios/bios-microvm.bin
+
 Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
--=20
2.21.0


