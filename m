Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7EAA3573
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 13:12:20 +0200 (CEST)
Received: from localhost ([::1]:57990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3epG-0005F4-90
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 07:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1i3eks-0003bS-LR
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 07:07:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1i3eko-0001ji-Ey
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 07:07:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55308)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1i3eki-0001Uv-Uo; Fri, 30 Aug 2019 07:07:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 15549307D90E;
 Fri, 30 Aug 2019 11:07:30 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67B825D717;
 Fri, 30 Aug 2019 11:07:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Aug 2019 07:07:21 -0400
Message-Id: <20190830110723.15096-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 30 Aug 2019 11:07:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] tests: cpu-plug-test: fix x86 device_add
 cpu-foo test cases
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
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, dhildenb@redhat.com,
 ehabkost@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes bc1fb850a3 (vl.c deprecate incorrect CPUs topology) that introduced
regression.

Igor Mammedov (2):
  tests: add qtest_qmp_device_add_qdict() helper
  tests: cpu-plug-test: fix device_add for pc/q35 machines

 tests/libqtest.h      | 12 +++++++++
 tests/cpu-plug-test.c | 62 ++++++++++++++++++-------------------------
 tests/libqtest.c      | 29 +++++++++++++-------
 3 files changed, 57 insertions(+), 46 deletions(-)

-- 
2.18.1


