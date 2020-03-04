Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB5179446
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 17:02:53 +0100 (CET)
Received: from localhost ([::1]:36186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9WU0-0004Rd-W7
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 11:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9WQu-00011e-GN
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:59:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9WQt-0007UX-F0
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:59:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48983
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9WQt-0007UB-BY
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583337579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/pxR4G7M5sY8JbJy+pRJ9uUKuiKsr648bTX9QJohaoQ=;
 b=MMXr41CU6ormSX44YE2At8vBBDK8JgMJo83g8FjC3++UOeoWV833B2pKRk6jlLAWdt0Btk
 3a99s6I03mZJpa2kltfU0ifmawqUXilUZDtHDXBbcp3coQnkH1Z6AY/UkFJduyhQ0yqzq+
 b7A5F4SBFHKmXcVIzh7twHoaN7GOfrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-3r8ICEBPMLOtXdj6EDPlIg-1; Wed, 04 Mar 2020 10:59:35 -0500
X-MC-Unique: 3r8ICEBPMLOtXdj6EDPlIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68AF218B5F6A;
 Wed,  4 Mar 2020 15:59:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D8AB5DA87;
 Wed,  4 Mar 2020 15:59:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B74E11386A6; Wed,  4 Mar 2020 16:59:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] qapi: Bye-bye Python 2
Date: Wed,  4 Mar 2020 16:59:28 +0100
Message-Id: <20200304155932.20452-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: mdroth@linux.vnet.ibm.com, philmd@redhat.com, jsnow@redhat.com,
 ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
* PATCH 3: Don't mess up indentation
* PATCH 4: Additionally clean up a pycodestyle-3 "E713 test for
  membership should be 'not in'"

Markus Armbruster (4):
  qapi: Inheriting from object is pointless with Python 3, drop
  qapi: Drop conditionals for Python 2
  qapi: Use super() now we have Python 3
  qapi: Brush off some (py)lint

 scripts/qapi/commands.py       |  6 +--
 scripts/qapi/common.py         |  6 +--
 scripts/qapi/error.py          |  4 +-
 scripts/qapi/events.py         |  4 +-
 scripts/qapi/expr.py           |  3 +-
 scripts/qapi/gen.py            | 27 ++++++-------
 scripts/qapi/introspect.py     |  6 +--
 scripts/qapi/parser.py         | 20 ++++-----
 scripts/qapi/schema.py         | 74 +++++++++++++++++-----------------
 scripts/qapi/source.py         |  4 +-
 scripts/qapi/types.py          |  4 +-
 scripts/qapi/visit.py          |  4 +-
 tests/qapi-schema/test-qapi.py |  6 +--
 13 files changed, 74 insertions(+), 94 deletions(-)

--=20
2.21.1


