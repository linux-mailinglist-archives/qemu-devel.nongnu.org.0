Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6661C63
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 11:26:10 +0200 (CEST)
Received: from localhost ([::1]:39722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkPuR-0006GO-V3
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 05:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45753)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hkPss-0004xj-Bu
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 05:24:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hkPsq-0000ud-DC
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 05:24:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:3087)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hkPsq-0000tp-7f
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 05:24:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 800093099FC4
 for <qemu-devel@nongnu.org>; Mon,  8 Jul 2019 09:24:16 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88FAC2B1BA;
 Mon,  8 Jul 2019 09:24:13 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  8 Jul 2019 05:24:08 -0400
Message-Id: <20190708092410.11167-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 08 Jul 2019 09:24:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/2] tests: acpi: improve tests
 reproducability
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ChangeLog since v1:
  * fixup commit message in 2/2
  * pickup Reviewed-bys and repost as v3

series should help to make tests more reproducable and not depend
on IASL being installed. IASL will be required only is user needs
to get textual diff of mismatching files.


Igor Mammedov (2):
  tests: acpi: do not require IASL for dumping AML blobs
  tests: acpi: do not skip tests when IASL is not installed

 tests/bios-tables-test.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

--=20
2.18.1


