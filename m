Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F872FA3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 15:13:43 +0200 (CEST)
Received: from localhost ([::1]:51588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqH5R-0005zM-Nc
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 09:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35277)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hqH4z-0005GS-Az
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 09:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hqH4y-0007tp-Db
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 09:13:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16226)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hqH4y-0007su-63
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 09:13:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 23F3C3082B5A
 for <qemu-devel@nongnu.org>; Wed, 24 Jul 2019 13:13:11 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-43.ams2.redhat.com
 [10.36.112.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D6B05C225
 for <qemu-devel@nongnu.org>; Wed, 24 Jul 2019 13:13:10 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jul 2019 15:13:06 +0200
Message-Id: <20190724131309.1378-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 24 Jul 2019 13:13:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/3] Fixes for QEMU 4.1.0-rc3
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 23da9e297b4120ca9702cabec91599a44255fe=
96:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-201=
90722' into staging (2019-07-22 15:16:48 +0100)

are available in the Git repository at:

  git://github.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 6baabe5cf8d42ce6bc542fb3ec0bfc10c0ee6c5e:

  docs: correct kconfig option (2019-07-24 11:21:59 +0200)

----------------------------------------------------------------
Two more bugfix patches + 1 doc fix.

----------------------------------------------------------------
Jan Kiszka (1):
      i386/kvm: Do not sync nested state during runtime

Marc-Andr=C3=A9 Lureau (1):
      docs: correct kconfig option

Zhengui li (1):
      virtio-scsi: fixed virtio_scsi_ctx_check failed when detaching scsi=
 disk

 docs/devel/kconfig.rst |  2 +-
 hw/scsi/virtio-scsi.c  |  7 +++++--
 target/i386/kvm.c      | 10 +++++-----
 3 files changed, 11 insertions(+), 8 deletions(-)
--=20
2.21.0


