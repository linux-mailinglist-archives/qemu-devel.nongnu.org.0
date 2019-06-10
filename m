Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0043BC06
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 20:51:15 +0200 (CEST)
Received: from localhost ([::1]:48948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haPNy-0002Vk-T2
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 14:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44695)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1haPHM-0007NZ-7m
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 14:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1haPHI-00027z-EZ
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 14:44:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44910)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1haPHC-00023q-MO
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 14:44:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4B9BE5D5E6
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 18:44:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-16.ams2.redhat.com
 [10.36.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECD0C60BF1;
 Mon, 10 Jun 2019 18:44:04 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, jasowang@redhat.com, eblake@redhat.com,
 armbru@redhat.com, laine@redhat.com
Date: Mon, 10 Jun 2019 19:43:58 +0100
Message-Id: <20190610184402.7090-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 10 Jun 2019 18:44:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/4] network announce;
 interface selection & IDs
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Laine asked for some extra features on the network announce support;

The first allows the announce timer to announce on a subset of the
interfaces.

The second allows there to be multiple timers, each with their own
parameters (including the interface list).

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

v3
  Support for multiple timers.

Dr. David Alan Gilbert (4):
  net/announce: Allow optional list of interfaces
  net/announce: Add HMP optional interface list
  net/announce: Add optional ID
  net/announce: Add HMP optional ID

 hmp-commands.hx         |  7 +++-
 hmp.c                   | 41 +++++++++++++++++++-
 hw/net/virtio-net.c     |  4 +-
 include/net/announce.h  |  8 +++-
 net/announce.c          | 83 ++++++++++++++++++++++++++++++++++-------
 net/trace-events        |  3 +-
 qapi/net.json           | 16 ++++++--
 tests/virtio-net-test.c |  2 +-
 8 files changed, 139 insertions(+), 25 deletions(-)

--=20
2.21.0


