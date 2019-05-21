Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9152581E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 21:18:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTAHp-0000bc-O2
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 15:18:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTAFp-0007kB-Kg
	for qemu-devel@nongnu.org; Tue, 21 May 2019 15:16:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTAFo-00009G-TE
	for qemu-devel@nongnu.org; Tue, 21 May 2019 15:16:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hTAFn-00007Z-0y; Tue, 21 May 2019 15:16:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13788309266D;
	Tue, 21 May 2019 19:16:45 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-63.ams2.redhat.com [10.36.117.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0274A600CC;
	Tue, 21 May 2019 19:16:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 21 May 2019 21:16:36 +0200
Message-Id: <20190521191638.32713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 21 May 2019 19:16:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] commit: Fix crash on job start with active
 I/O
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf (2):
  block: Drain source node in bdrv_replace_node()
  iotests: Test commit job start with concurrent I/O

 block.c                       |  7 +--
 tests/qemu-iotests/255        | 83 +++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/255.out    | 16 +++++++
 tests/qemu-iotests/group      |  1 +
 tests/qemu-iotests/iotests.py | 10 ++++-
 5 files changed, 113 insertions(+), 4 deletions(-)
 create mode 100755 tests/qemu-iotests/255
 create mode 100644 tests/qemu-iotests/255.out

--=20
2.20.1


