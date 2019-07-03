Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3B5E324
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 13:50:24 +0200 (CEST)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hidmI-0006x8-EC
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 07:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43435)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hidjw-0005Aw-Df
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hidjv-0007hJ-7U
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:47:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hidjv-00078O-0q
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:47:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D55DE3082A6C
 for <qemu-devel@nongnu.org>; Wed,  3 Jul 2019 11:47:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-136.ams2.redhat.com
 [10.36.116.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A604983099
 for <qemu-devel@nongnu.org>; Wed,  3 Jul 2019 11:47:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3F6CA1132ABF; Wed,  3 Jul 2019 13:47:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 13:47:10 +0200
Message-Id: <20190703114714.4234-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 03 Jul 2019 11:47:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 0/4] Build system patches for 2019-07-02
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

The following changes since commit ab200dafc0e8a9925bb0ad0be478621f5f117c=
95:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request'=
 into staging (2019-07-02 10:17:54 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-build-2019-07-02-v2

for you to fetch changes up to 1338a4b72659ce08eacb9de0205fe16202a22d9c:

  Makefile: Reuse all's recursion machinery for clean and install (2019-0=
7-03 13:19:19 +0200)

----------------------------------------------------------------
Build system patches for 2019-07-02

v2:
* PATCH 3: Add compatibility gunk to keep make working across the rename

----------------------------------------------------------------
Markus Armbruster (4):
      Makefile: Remove code to smooth transition to config.status
      Makefile: Drop bogus cleaning of $(ALL_SUBDIRS)/qemu-options.def
      Makefile: Rename targets for make recursion
      Makefile: Reuse all's recursion machinery for clean and install

 Makefile               | 79 +++++++++++++++++++++++++-------------------=
------
 configure              |  6 ++--
 tests/Makefile.include |  5 ++--
 3 files changed, 46 insertions(+), 44 deletions(-)

--=20
2.21.0


