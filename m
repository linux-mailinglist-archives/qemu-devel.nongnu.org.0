Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904812924D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 10:01:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU596-0004zj-Fp
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 04:01:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hU56S-0003s8-AL
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:59:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hU56R-0003TG-E9
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:59:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50716)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1hU56P-0003NT-B2; Fri, 24 May 2019 03:58:57 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D0383E2AF;
	Fri, 24 May 2019 07:58:56 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-118.ams2.redhat.com
	[10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D50B81001DC0;
	Fri, 24 May 2019 07:58:49 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 09:58:45 +0200
Message-Id: <20190524075848.23781-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 24 May 2019 07:58:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/3] Update documentation and help related
 to the preallocation parameter
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

v2:
 - Patch 1: removed references to "file-win32" and "file-posix" in the
            block comment [Markus]
 - Patch 3: reworded commit message [Markus]

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


