Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E3215FC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 11:09:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRYru-0005oX-Ar
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 05:09:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1hRYpS-0004QU-Qh
	for qemu-devel@nongnu.org; Fri, 17 May 2019 05:07:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1hRYpR-0003h2-TC
	for qemu-devel@nongnu.org; Fri, 17 May 2019 05:07:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1hRYpR-0003gG-Np
	for qemu-devel@nongnu.org; Fri, 17 May 2019 05:07:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC46BA404E;
	Fri, 17 May 2019 09:07:00 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-157.pek2.redhat.com
	[10.72.12.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7705660BE0;
	Fri, 17 May 2019 09:06:59 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Fri, 17 May 2019 17:06:53 +0800
Message-Id: <1558084017-15947-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 17 May 2019 09:07:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/4] Net patches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d8276573da58e8ce78dab8c46dd660efd664bc=
b7:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190510' into =
staging (2019-05-16 13:15:08 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 78e4f446d2569210a8558946b2321f9ff2ef47f6:

  net/colo-compare.c: Fix a crash in COLO Primary. (2019-05-17 17:00:12 +=
0800)

----------------------------------------------------------------

----------------------------------------------------------------
Chris Kenna (1):
      e1000: Never increment the RX undersize count register

Jason Wang (1):
      vhost_net: don't set backend for the uninitialized virtqueue

Lukas Straub (1):
      net/colo-compare.c: Fix a crash in COLO Primary.

Stefano Garzarella (1):
      net/slirp: fix the IPv6 prefix length error message

 hw/net/e1000.c             |  1 -
 hw/net/vhost_net.c         | 10 ++++++++++
 hw/virtio/virtio.c         |  5 +++++
 include/hw/virtio/virtio.h |  1 +
 net/colo-compare.c         |  3 +--
 net/slirp.c                |  3 ++-
 6 files changed, 19 insertions(+), 4 deletions(-)


