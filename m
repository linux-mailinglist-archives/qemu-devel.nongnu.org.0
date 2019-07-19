Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3036E53A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 13:51:00 +0200 (CEST)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoRPf-0004Dh-8z
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 07:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hoRPJ-0003Oj-He
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 07:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hoRPI-0004Sd-JM
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 07:50:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52244)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hoRPI-0004QA-ET; Fri, 19 Jul 2019 07:50:36 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0027988319;
 Fri, 19 Jul 2019 11:50:34 +0000 (UTC)
Received: from localhost (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FEFD10190D5;
 Fri, 19 Jul 2019 11:50:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jul 2019 13:50:30 +0200
Message-Id: <20190719115031.16331-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 19 Jul 2019 11:50:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL for-4.1 0/1] one s390x fix/annotation
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0b18cfb8f1828c905139b54c8644b0d8f4aad8=
79:

  Update version for v4.1.0-rc1 release (2019-07-16 18:01:28 +0100)

are available in the Git repository at:

  https://github.com/cohuck/qemu tags/s390x-20190719

for you to fetch changes up to efac5ae420ca0644db9360861a1bf02d040afd18:

  s390x/pci: add some fallthrough annotations (2019-07-18 11:29:50 +0200)

----------------------------------------------------------------
Add missing fallthrough annotations.

----------------------------------------------------------------

Cornelia Huck (1):
  s390x/pci: add some fallthrough annotations

 hw/s390x/s390-pci-inst.c | 2 ++
 1 file changed, 2 insertions(+)

--=20
2.20.1


