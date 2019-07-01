Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77249265C3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 16:31:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTSGx-0008W7-92
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 10:31:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hTSEv-0007Uz-Re
	for qemu-devel@nongnu.org; Wed, 22 May 2019 10:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hTSEv-0004tv-2a
	for qemu-devel@nongnu.org; Wed, 22 May 2019 10:29:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36192)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hTSEt-0004ol-8h; Wed, 22 May 2019 10:29:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 277E981E14;
	Wed, 22 May 2019 14:29:01 +0000 (UTC)
Received: from localhost (unknown [10.40.205.176])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8018052C8;
	Wed, 22 May 2019 14:28:56 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 22 May 2019 16:28:52 +0200
Message-Id: <20190522142854.22983-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 22 May 2019 14:29:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] block/io: Delay decrementing the
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

Max Reitz (2):
  block/io: Delay decrementing the quiesce_counter
  iotests: Test cancelling a job and closing the VM

 block/io.c                 |  3 ++-
 tests/qemu-iotests/255     | 54 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/255.out | 24 +++++++++++++++++
 3 files changed, 80 insertions(+), 1 deletion(-)

--=20
2.21.0


