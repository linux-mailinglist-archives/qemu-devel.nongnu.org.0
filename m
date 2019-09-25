Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0BFBE3B2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 19:47:25 +0200 (CEST)
Received: from localhost ([::1]:55500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDBNo-0004HG-Ag
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 13:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53311)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iDBKm-0002WA-AM
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 13:44:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iDBKl-0002xH-7O
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 13:44:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39331)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iDBKi-0002vJ-NR; Wed, 25 Sep 2019 13:44:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 13040A44AC2;
 Wed, 25 Sep 2019 17:44:07 +0000 (UTC)
Received: from localhost (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2DB910018F8;
 Wed, 25 Sep 2019 17:44:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Block patches
Date: Wed, 25 Sep 2019 18:43:58 +0100
Message-Id: <20190925174400.8578-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Wed, 25 Sep 2019 17:44:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 240ab11fb72049d6373cbbec8d788f8e411a00=
bc:

  Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20190924' i=
nto staging (2019-09-24 15:36:31 +0100)

are available in the Git repository at:

  https://github.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to f9a7e3698a737ee75a7b0af34203303df982550f:

  virtio-blk: schedule virtio_notify_config to run on main context (2019-=
09-25 18:06:36 +0100)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Sergio Lopez (1):
  virtio-blk: schedule virtio_notify_config to run on main context

Vladimir Sementsov-Ogievskiy (1):
  util/ioc.c: try to reassure Coverity about qemu_iovec_init_extended

 hw/block/virtio-blk.c | 16 +++++++++++++++-
 util/iov.c            |  3 ++-
 2 files changed, 17 insertions(+), 2 deletions(-)

--=20
2.21.0


