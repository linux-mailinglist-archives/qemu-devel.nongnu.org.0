Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8B35F494
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 10:30:00 +0200 (CEST)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hix7v-0003kO-1i
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 04:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54052)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hix5r-0002sI-Gd
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:27:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hix5q-0001dI-CG
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:27:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54442)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hix5p-0001cd-KD
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:27:50 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B6316307D913
 for <qemu-devel@nongnu.org>; Thu,  4 Jul 2019 08:27:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B7A559441;
 Thu,  4 Jul 2019 08:27:41 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Jul 2019 04:27:34 -0400
Message-Id: <20190704082736.25258-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 04 Jul 2019 08:27:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] tests: acpi: improve tests reproducability
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


series should help to make tests more reproducable and not depend
on IASL being installed. IASL will be required only is user needs
to get textual diff of mismatching files.

Igor Mammedov (2):
  tests: acpi: do not require IASL for dumping AML blobs
  tests: acpi: do not skip tests when IASL is not installed

 tests/bios-tables-test.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

-- 
2.18.1


