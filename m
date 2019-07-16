Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274146A1A1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 06:52:14 +0200 (CEST)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnFRj-0000wH-FX
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 00:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38191)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hnFRJ-0008Kq-9k
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 00:51:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hnFRI-00079T-4P
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 00:51:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52774)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hnFRH-00078k-Ui
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 00:51:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E2EBF83F3C
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 04:51:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F4E614C1
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 04:51:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2602711386A0; Tue, 16 Jul 2019 06:51:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 06:51:38 +0200
Message-Id: <20190716045141.21383-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 16 Jul 2019 04:51:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/3] Build system and documentation patches for
 2019-07-15
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

The following changes since commit 5ea8ec2fcf57cb9af24ad2cf17b4d64adb03af=
df:

  Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2019-07-=
15' into staging (2019-07-15 16:11:47 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-build-2019-07-15

for you to fetch changes up to 32481687e1a262a9ca0083f8e938d7b0614d823b:

  qemu-tech: Fix dangling @menu entries (2019-07-15 21:10:29 +0200)

----------------------------------------------------------------
Build system and documentation patches for 2019-07-15

----------------------------------------------------------------
Markus Armbruster (3):
      Makefile: Fix "make install" when "make all" needs work
      Makefile: Fix missing dependency of on qemu-tech.texi
      qemu-tech: Fix dangling @menu entries

 Makefile       | 4 +++-
 qemu-tech.texi | 3 ---
 2 files changed, 3 insertions(+), 4 deletions(-)

--=20
2.21.0


