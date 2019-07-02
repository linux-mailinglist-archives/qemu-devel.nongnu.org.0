Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361CA5D149
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 16:14:29 +0200 (CEST)
Received: from localhost ([::1]:53764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiJYC-0000iG-24
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 10:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hiJRo-0004tW-Df
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 10:07:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hiJRn-0002xW-Gv
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 10:07:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60294)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hiJRn-0002wd-Ae
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 10:07:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4B725C05168F
 for <qemu-devel@nongnu.org>; Tue,  2 Jul 2019 14:07:50 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F42C7D5CF;
 Tue,  2 Jul 2019 14:07:49 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 10:07:43 -0400
Message-Id: <20190702140745.27767-1-imammedo@redhat.com>
In-Reply-To: <CAFEAcA8Jnh=tu8s08Fu6n0sSmJJuVOx7YxyTR_ni5yW3DdMFkQ@mail.gmail.com>
References: <CAFEAcA8Jnh=tu8s08Fu6n0sSmJJuVOx7YxyTR_ni5yW3DdMFkQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 02 Jul 2019 14:07:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] fix memory-less numa configuration and
 switch to memdev syntax in tests
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 1/2 permits to use memory-less numa nodes when memdev is used as backend
     so it would be possible to replace 'mem' in tests with 'memdev'
 2/2 replaces legacy 'mem' option with memdev in 'make check' tests
     which removes deprecation warnings during tests

patches should apply on top of
  [PULL v2 00/29] Machine and x86 queue, 2019-06-28

CC: Eduardo Habkost <ehabkost@redhat.com> (maintainer:NUMA)
CC: Thomas Huth <thuth@redhat.com> (maintainer:qtest)
CC: Laurent Vivier <lvivier@redhat.com> (maintainer:qtest)
CC: Paolo Bonzini <pbonzini@redhat.com> (reviewer:qtest)

Igor Mammedov (2):
  numa: allow memory-less nodes when using memdev as backend
  tests: use -numa memdev option in tests instead of legacy 'mem' option

 numa.c                   | 19 +++++++-----------
 tests/bios-tables-test.c | 40 ++++++++++++++++++++++++++-----------
 tests/numa-test.c        | 43 +++++++++++++++++++++++++++++-----------
 3 files changed, 66 insertions(+), 36 deletions(-)

-- 
2.18.1


