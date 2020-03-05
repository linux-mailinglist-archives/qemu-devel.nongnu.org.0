Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEF017A586
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 13:45:27 +0100 (CET)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9psT-00049l-RI
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 07:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9pqz-0002v8-J1
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:43:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9pqy-00008o-6F
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:43:53 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50744
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9pqy-000088-0g
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3oo/A+OJVujXn37JV3DVi1JndoV5Rig7njNLz5ThQ3Y=;
 b=NSXlH7CUucymqsxSm524dnlvAVPyQd5oR9HwrTmCBz8tRIr2puThlhuX/Octt6/pfPoq8R
 igZlVOen/OYQF43ImxRhJ/Ifr4awRy8PU8vpj1Uhhlhc8DquFOH1Pvm8FVgHg2RrHo1j9Q
 Zoxp5Z4q8LT0vp6URUuR6gF0hsBtXqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-5wvB6LfOONiGnB-y9KBdYg-1; Thu, 05 Mar 2020 07:43:49 -0500
X-MC-Unique: 5wvB6LfOONiGnB-y9KBdYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74FFE1085989
 for <qemu-devel@nongnu.org>; Thu,  5 Mar 2020 12:43:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46D256CE40
 for <qemu-devel@nongnu.org>; Thu,  5 Mar 2020 12:43:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C7FD211386A6; Thu,  5 Mar 2020 13:43:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] QAPI patches for 2020-03-05
Date: Thu,  5 Mar 2020 13:43:42 +0100
Message-Id: <20200305124346.22053-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

The following changes since commit abfa865014ab17941eb1fcb7cc2fa293a25843c4=
:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-=
20200303' into staging (2020-03-03 15:20:12 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2020-03-05

for you to fetch changes up to 8ec0e1a4e68781f1e512af47fd6ab46ec76326e8:

  qapi: Brush off some (py)lint (2020-03-05 09:24:11 +0100)

----------------------------------------------------------------
QAPI patches for 2020-03-05

----------------------------------------------------------------
Markus Armbruster (4):
      qapi: Inheriting from object is pointless with Python 3, drop
      qapi: Drop conditionals for Python 2
      qapi: Use super() now we have Python 3
      qapi: Brush off some (py)lint

 scripts/qapi/commands.py       |  6 ++--
 scripts/qapi/common.py         |  6 +---
 scripts/qapi/error.py          |  4 +--
 scripts/qapi/events.py         |  4 +--
 scripts/qapi/expr.py           |  3 +-
 scripts/qapi/gen.py            | 27 ++++++++-------
 scripts/qapi/introspect.py     |  6 ++--
 scripts/qapi/parser.py         | 20 ++++--------
 scripts/qapi/schema.py         | 74 ++++++++++++++++++++------------------=
----
 scripts/qapi/source.py         |  4 +--
 scripts/qapi/types.py          |  4 +--
 scripts/qapi/visit.py          |  4 +--
 tests/qapi-schema/test-qapi.py |  6 +---
 13 files changed, 74 insertions(+), 94 deletions(-)

--=20
2.21.1


