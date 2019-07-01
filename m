Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709FC26527
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 15:52:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTRey-0001jO-Kc
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 09:52:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTRac-0006sG-AO
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTRab-0002ac-6s
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38074)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hTRaa-0002aB-W6
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5825B306C9F2
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 13:47:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27F982854E
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 13:47:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CCBD01138648; Wed, 22 May 2019 15:47:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 15:47:21 +0200
Message-Id: <20190522134726.19225-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 22 May 2019 13:47:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/5] Miscellaneous patches for 2019-05-22
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a4f667b6714916683408b983cfe0a615a72577=
5f:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190521-3' int=
o staging (2019-05-21 16:30:13 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-misc-2019-05-22

for you to fetch changes up to db3d11ee3f0cb851124830172f0a93c3d77a450a:

  cutils: Simplify how parse_uint() checks for whitespace (2019-05-22 15:=
00:04 +0200)

----------------------------------------------------------------
Miscellaneous patches for 2019-05-22

----------------------------------------------------------------
Markus Armbruster (5):
      qemu-bridge-helper: Fix misuse of isspace()
      tests/vhost-user-bridge: Fix misuse of isdigit()
      gdbstub: Reject invalid RLE repeat counts
      gdbstub: Fix misuse of isxdigit()
      cutils: Simplify how parse_uint() checks for whitespace

 gdbstub.c                 | 20 ++++++++++++--------
 qemu-bridge-helper.c      |  6 +++---
 tests/vhost-user-bridge.c |  3 ++-
 util/cutils.c             |  2 +-
 4 files changed, 18 insertions(+), 13 deletions(-)

--=20
2.17.2


