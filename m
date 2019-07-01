Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DCD2812E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 17:28:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTpeI-00077K-J9
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 11:28:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hTpYe-0002VR-3y
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hTpYd-0006LZ-6s
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:23:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48693)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1hTpYY-0006FI-0c; Thu, 23 May 2019 11:22:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19B603082E3F;
	Thu, 23 May 2019 15:22:54 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-222.ams2.redhat.com
	[10.36.117.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 359C84385;
	Thu, 23 May 2019 15:22:52 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 17:22:47 +0200
Message-Id: <20190523152250.106717-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 23 May 2019 15:22:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] Update documentation and help related to
 the preallocation parameter
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
Cc: Kevin Wolf <kwolf@redhat.com>, integration@gluster.org,
	qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following Markus' advice, I updated the documentation of preallocation
parameter in qapi/block-core.json adding default and allowed values (patc=
h 1).
I also updated the help related to BLOCK_OPT_PREALLOC in the QemuOptsList=
 of
file-posix (patch 2) and gluster (patch 3).

Stefano Garzarella (3):
  qapi/block-core: update documentation of preallocation parameter
  block/file-posix: update .help of BLOCK_OPT_PREALLOC option
  block/gluster: update .help of BLOCK_OPT_PREALLOC option

 qapi/block-core.json | 20 ++++++++++++++------
 block/file-posix.c   |  6 +++++-
 block/gluster.c      |  9 ++++++++-
 3 files changed, 27 insertions(+), 8 deletions(-)

--=20
2.20.1


