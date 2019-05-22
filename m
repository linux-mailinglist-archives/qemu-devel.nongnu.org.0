Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB72661F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 16:43:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44483 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTSSw-0002Lf-MI
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 10:43:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hTSQ9-0000bu-7s
	for qemu-devel@nongnu.org; Wed, 22 May 2019 10:40:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hTSQ8-0005fq-CO
	for qemu-devel@nongnu.org; Wed, 22 May 2019 10:40:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hTSQ6-0005Ye-EU; Wed, 22 May 2019 10:40:42 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E46F30044CB;
	Wed, 22 May 2019 14:40:41 +0000 (UTC)
Received: from localhost (unknown [10.40.205.176])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16CFB605AE;
	Wed, 22 May 2019 14:40:38 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 22 May 2019 16:40:35 +0200
Message-Id: <20190522144037.29454-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 22 May 2019 14:40:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] block/io: Delay decrementing the
 quiesce_counter
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See patch 1 for the code-based explanation, and patch 2 for a case where
this bites in practice.


v2:
- Remove test artifacts that remained from testing the test
  (Sorry...)


git backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream pat=
ch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively

001/2:[----] [--] 'block/io: Delay decrementing the quiesce_counter'
002/2:[0004] [FC] 'iotests: Test cancelling a job and closing the VM'


Max Reitz (2):
  block/io: Delay decrementing the quiesce_counter
  iotests: Test cancelling a job and closing the VM

 block/io.c                 |  3 ++-
 tests/qemu-iotests/255     | 52 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/255.out | 24 ++++++++++++++++++
 3 files changed, 78 insertions(+), 1 deletion(-)

--=20
2.21.0


