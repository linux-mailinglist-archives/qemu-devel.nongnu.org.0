Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAAC76461
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 13:28:00 +0200 (CEST)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqyOE-0004YN-Sk
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 07:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41791)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hqyNu-0003s6-Cd
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 07:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hqyNq-000857-Cz
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 07:27:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44914)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hqyNq-0007wo-77; Fri, 26 Jul 2019 07:27:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0FE0B59465;
 Fri, 26 Jul 2019 11:27:32 +0000 (UTC)
Received: from localhost (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2E7E1001B14;
 Fri, 26 Jul 2019 11:27:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 13:27:27 +0200
Message-Id: <20190726112728.20889-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 26 Jul 2019 11:27:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL for-4.1 0/1] s390x: vfio-ccw maintainership
 update
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

The following changes since commit bf8b024372bf8abf5a9f40bfa65eeefad23ff9=
88:

  Update version for v4.1.0-rc2 release (2019-07-23 18:28:08 +0100)

are available in the Git repository at:

  https://github.com/cohuck/qemu tags/s390x-20190726

for you to fetch changes up to 6ef2d01abf44fa86f2de4bcde3be9391259bf718:

  MAINTAINERS: vfio-ccw: Remove myself as the maintainer (2019-07-25 09:3=
6:14 +0200)

----------------------------------------------------------------
MAINTAINERS update for vfio-ccw

----------------------------------------------------------------

Farhan Ali (1):
  MAINTAINERS: vfio-ccw: Remove myself as the maintainer

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

--=20
2.20.1


