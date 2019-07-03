Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C95CE88
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 13:38:24 +0200 (CEST)
Received: from localhost ([::1]:51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiH79-000290-Cp
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 07:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hiH3M-0006G3-W8
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hiH3L-0001fA-Rz
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:34:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50000)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hiH3L-0001dt-Lx
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:34:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D9DC610C94
 for <qemu-devel@nongnu.org>; Tue,  2 Jul 2019 11:34:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-102.ams2.redhat.com
 [10.36.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACEB818226
 for <qemu-devel@nongnu.org>; Tue,  2 Jul 2019 11:34:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 226C21132ABF; Tue,  2 Jul 2019 13:34:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 13:34:10 +0200
Message-Id: <20190702113414.6896-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 02 Jul 2019 11:34:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/4] Build system patches for 2019-07-02
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

  git://repo.or.cz/qemu/armbru.git tags/pull-build-2019-07-02

for you to fetch changes up to b7f9b1b7fc9a00ab6e5f46555e87166533292576:

  Makefile: Reuse all's recursion machinery for clean and install (2019-0=
7-02 12:48:40 +0200)

----------------------------------------------------------------
Build system patches for 2019-07-02

----------------------------------------------------------------
Markus Armbruster (4):
      Makefile: Remove code to smooth transition to config.status
      Makefile: Drop bogus cleaning of $(ALL_SUBDIRS)/qemu-options.def
      Makefile: Rename targets for make recursion
      Makefile: Reuse all's recursion machinery for clean and install

 Makefile               | 73 +++++++++++++++++++++++---------------------=
------
 configure              |  6 ++---
 tests/Makefile.include |  5 ++--
 3 files changed, 40 insertions(+), 44 deletions(-)

--=20
2.21.0


