Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237C7154D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 11:36:28 +0200 (CEST)
Received: from localhost ([::1]:40612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hprDe-0001J3-VL
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 05:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48319)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hprDM-0000ck-M9
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:36:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hprDL-0000u1-Kp
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:36:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34638)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hprDJ-0000sj-F1; Tue, 23 Jul 2019 05:36:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE8C03066779;
 Tue, 23 Jul 2019 09:36:04 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-56.brq.redhat.com [10.40.204.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3DF10027B9;
 Tue, 23 Jul 2019 09:36:00 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 11:35:56 +0200
Message-Id: <20190723093558.13700-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 23 Jul 2019 09:36:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 0/2] pflash-next patches for v4.1.0-rc2
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 23da9e297b4120ca9702cabec91599a44255fe=
96:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-201=
90722' into staging (2019-07-22 15:16:48 +0100)

are available in the Git repository at:

  https://gitlab.com/philmd/qemu.git tags/pflash-next-20190723

for you to fetch changes up to 124e4cfaa42bb5a14eec33ea47d3502b5f46eb33:

  hw/block/pflash_cfi02: Rewrite a fall through comment (2019-07-23 11:31=
:07 +0200)

----------------------------------------------------------------
One bugfix and silent a fallthru warning.

----------------------------------------------------------------
v2: Replace Laszlo's Regression-tested-by tag

Philippe Mathieu-Daud=C3=A9 (2):
  hw/block/pflash_cfi01: Add missing DeviceReset() handler
  hw/block/pflash_cfi02: Rewrite a fall through comment

 hw/block/pflash_cfi01.c | 19 +++++++++++++++++++
 hw/block/pflash_cfi02.c |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)

--=20
2.20.1


